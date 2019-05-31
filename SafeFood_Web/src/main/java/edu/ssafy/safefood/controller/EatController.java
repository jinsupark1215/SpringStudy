package edu.ssafy.safefood.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ssafy.safefood.dto.Eat;
import edu.ssafy.safefood.dto.Exercise;
import edu.ssafy.safefood.dto.Food;
import edu.ssafy.safefood.dto.Health;
import edu.ssafy.safefood.dto.Member;
import edu.ssafy.safefood.service.EatServiceImpl;
import edu.ssafy.safefood.service.ExerciseServiceImpl;
import edu.ssafy.safefood.service.FoodServiceImpl;
import edu.ssafy.safefood.service.HealthService;
import edu.ssafy.safefood.service.MemberServiceImpl;

@Controller
@RequestMapping(value = "/eat", method = { RequestMethod.GET, RequestMethod.POST })
public class EatController {
	@Autowired
	private EatServiceImpl eatService;
	@Autowired
	private MemberServiceImpl memService;
	@Autowired
	private FoodServiceImpl foodService;
	@Autowired
	private ExerciseServiceImpl exeService;
	
	@Autowired
	private HealthService hservice;

	private int[][] daypernutrition = {{'M',470,55,160,50,1500,300,15,2},{'F',370,50,130,50,1500,300,15,2}};
	
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, HttpServletRequest req) {
		req.setAttribute("msg", "에러 발생. 사용에 불편을 드려죄송합니다.");
		return "error";
	}

	/* for Carosel */
	public TreeMap<Eat, Food> bestEat() {
		TreeMap<Eat, Food> eatList = new TreeMap<Eat, Food>();
		ArrayList<Eat> eatten = eatService.bestEat(null, null);

		for (Eat e : eatten) {
			Food f = foodService.getFood(e.getCode());
			eatList.put(e, f);
		}

		return eatList;
	}
	/* end here. */

	@RequestMapping(value = "/bestEat")
	private ModelAndView bestEat(ModelAndView mav, HttpServletRequest req) {
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		ArrayList<Eat> eatten;
//		System.out.println(start + " " + end);
		eatten = eatService.bestEat(start, end);
		if (eatten == null) {
			mav.addObject("msg", "섭취 정보가 없습니다.");
			mav.setViewName("error");
			return mav;
		}

		TreeMap<Eat, Food> eatList = new TreeMap<Eat, Food>();

		for (Eat e : eatten) {
			Food f = foodService.getFood(e.getCode());
			eatList.put(e, f);
		}

		if (start != null && end != null) {
			mav.addObject("start", start);
			mav.addObject("end", end);
		}
		mav.addObject("eatList", eatList);
		mav.setViewName("bestEat");
		return mav;
	}
	

	@RequestMapping(value = "/myEat")
	private ModelAndView myEat(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id");
		String start = req.getParameter("start");
		String end = req.getParameter("end");

		if (id == null) {
			mav.addObject("msg", "로그인 정보가 없습니다.");
			mav.setViewName("error");
			return mav;
		} else {
			String name = memService.getInfo(id).getName();
			ArrayList<Eat> eatten;
			if (start == null && end == null) {
				eatten = eatService.getEat(id);
				if (eatten == null) {
					mav.addObject("msg", "섭취 정보가 없습니다.");
					mav.setViewName("error");
					return mav;
				}
			} else {
				eatten = eatService.getDetail(id, start, end);
				mav.addObject("start", start);
				mav.addObject("end", end);
				if (eatten == null) {
					mav.addObject("msg", "해당기간 섭취 정보가 없습니다.");
					mav.setViewName("error");
					return mav;
				}
			}

			TreeMap<Eat, Food> eatList = new TreeMap<Eat, Food>();
			double calory = 0, carbo = 0, protein = 0, fat = 0, sugar = 0, natrium = 0, chole = 0, fattyacid = 0,
					transfat = 0;

			for (Eat e : eatten) {
				Food f = foodService.getFood(e.getCode());
				int count = e.getCount();
				eatList.put(e, f);

				calory += f.getCalory() * count;
				carbo += f.getCarbo() * count;
				protein += f.getProtein() * count;
				fat += f.getFat() * count;
				sugar += f.getSugar() * count;
				natrium += f.getNatrium() * count;
				chole += f.getChole() * count;
				fattyacid += f.getFattyacid() * count;
				transfat += f.getTransfat() * count;
			}

			mav.addObject("name", name);
			mav.addObject("eatList", eatList);
			mav.addObject("calory", calory);
			mav.addObject("carbo", carbo);
			mav.addObject("protein", protein);
			mav.addObject("fat", fat);
			mav.addObject("sugar", sugar);
			mav.addObject("natrium", natrium);
			mav.addObject("chole", chole);
			mav.addObject("fattyacid", fattyacid);
			mav.addObject("transfat", transfat);
			mav.setViewName("myEat");
			return mav;
		}
	}
	

	@RequestMapping(value = "/delete", method = { RequestMethod.POST })
	private ModelAndView delFood(ModelAndView mav, @RequestParam("code") int code, @RequestParam("date") String date, @RequestParam("today") String flag, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println("flag = "+flag);

		if (eatService.delete(id, code, date)) {
			if(flag.equals("yes")) {
				mav.setViewName("redirect:today");
			} else {
				mav.setViewName("redirect:myEat");
			}
			return mav;
		} else {
			mav.addObject("msg", "섭취 정보 삭제 중 오류가 발생했습니다.");
			mav.setViewName("error");
			return mav;
		}
	}

	@RequestMapping(value = "/addFood", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView addFood(ModelAndView mav, @RequestParam("code") int code, @RequestParam("quan") int quan,
			HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			mav.addObject("msg", "로그인 정보가 없습니다.");
			mav.setViewName("error");
			return mav;
		} else {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String today = df.format(date);
			String flag = req.getParameter("flag");

			ArrayList<Eat> eatList = eatService.getEat(id);

			int eatCode, eatCount;
			String eatDate;

			if (eatList == null) { // 섭취 정보가 없으면
				if (eatService.add(id, code, quan, today)) {
					if (flag == null) {
						mav.setViewName("redirect:../food/detail?code=" + code);
						return mav;
					} else {
						mav.setViewName("redirect:../food/goFoodInfo");
						return mav;
					}
				} else {
					mav.addObject("msg", "섭취정보 저장 중 오류가 발생했습니다.");
					mav.setViewName("error");
					return mav;
				}
			} else { // 섭취 정보가 있으면
				boolean eatten = false;

				for (Eat eat : eatList) {
					eatCode = eat.getCode();
					eatCount = eat.getCount();
					eatDate = eat.getDate();

					if (eatCode == code && eatDate.equals(today)) {
						if (eatService.update(id, code, eatCount + quan, eatDate)) {
							eatten = true;
							break;
						} else {
							mav.addObject("msg", "섭취정보 저장 중 오류가 발생했습니다.");
							mav.setViewName("error");
							return mav;
						}
					}
				}

				if (eatten) { // 같은날에 먹은적이 있으면
					if (flag == null) {
						mav.setViewName("redirect:../food/detail?code=" + code);
						return mav;
					} else {
						mav.setViewName("redirect:../food/goFoodInfo");
						return mav;
					}
				} else { // 같은날에 먹은적이 없으면
					if (eatService.add(id, code, quan, today)) {
						if (flag == null) {
							mav.setViewName("redirect:../food/detail?code=" + code);
							return mav;
						} else {
							mav.setViewName("redirect:../food/goFoodInfo");
							return mav;
						}
					} else {
						mav.addObject("msg", "섭취정보 저장 중 오류가 발생했습니다.");
						mav.setViewName("error");
						return mav;
					}
				}
			}
		}
	}

	@RequestMapping("/today")
	private ModelAndView getToday(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = df.format(date);

		if (id == null) {
			mav.addObject("msg", "로그인 정보가 없습니다.");
			mav.setViewName("error");
			return mav;
		} else {
			Member mem = memService.getInfo(id);
			ArrayList<Eat> eatten;
			eatten = eatService.getDetail(id, today, today);
			if (eatten == null) {
				mav.addObject("msg", "오늘 섭취하신 정보가 없습니다.");
				mav.setViewName("error");
				return mav;
			}

			TreeMap<Eat, Food> eatList = new TreeMap<Eat, Food>();
			double calory = 0, carbo = 0, protein = 0, fat = 0, sugar = 0, natrium = 0, chole = 0, fattyacid = 0, transfat = 0;

			for (Eat e : eatten) {
				Food f = foodService.getFood(e.getCode());
				int count = e.getCount();
				eatList.put(e, f);

				calory += f.getCalory() * count;
				carbo += f.getCarbo() * count;
				protein += f.getProtein() * count;
				fat += f.getFat() * count;
				sugar += f.getSugar() * count;
				natrium += f.getNatrium() * count;
				chole += f.getChole() * count;
				fattyacid += f.getFattyacid() * count;
				transfat += f.getTransfat() * count;
			}

			int kpd = mem.getKpd();
			long percentage = Math.round((calory / kpd) * 100);
			mav.addObject("name", mem.getName());
			mav.addObject("percentage", percentage);
			mav.addObject("kpd", kpd);
			
			/**
			 * daypernutrition
			 *  {{'M',470,55,160,25,1500,300,15,2},{'F',370,50,130,25,1500,300,15,2}};
			 */
			 
			if(mem.getGender() == 'M') {
				mav.addObject("carbo_per", Math.round(( carbo/ daypernutrition[1][1] )* 100));
				mav.addObject("prot_per", Math.round(( protein/ daypernutrition[1][2] )* 100));
				mav.addObject("fat_per", Math.round(( fat/ daypernutrition[1][3] )* 100));
				mav.addObject("sugar_per", Math.round(( sugar/ daypernutrition[1][4] )* 100));
				mav.addObject("nat_per", Math.round(( natrium/ daypernutrition[1][5] )* 100));
				mav.addObject("chole_per", Math.round(( chole/ daypernutrition[1][6] )* 100));
				mav.addObject("fatty_per", Math.round(( fattyacid/ daypernutrition[1][7] )* 100));
				mav.addObject("trans_per", Math.round(( transfat/ daypernutrition[1][8] )* 100));
				mav.addObject("carbo_pd",daypernutrition[1][1]);
				mav.addObject("prot_pd",daypernutrition[1][2]);
				mav.addObject("fat_pd",daypernutrition[1][3]);
				mav.addObject("sugar_pd",daypernutrition[1][4]);
				mav.addObject("nat_pd",daypernutrition[1][5]);
				mav.addObject("chole_pd",daypernutrition[1][6]);
				mav.addObject("fatty_pd",daypernutrition[1][7]);
				mav.addObject("trans_pd",daypernutrition[1][8]);
				
				
			}else {
				mav.addObject("carbo_per", Math.round(( carbo/ daypernutrition[2][1] )* 100));
				mav.addObject("prot_per", Math.round(( protein/ daypernutrition[2][2] )* 100));
				mav.addObject("fat_per", Math.round(( fat/ daypernutrition[2][3] )* 100));
				mav.addObject("sugar_per", Math.round(( sugar/ daypernutrition[2][4] )* 100));
				mav.addObject("nat_per", Math.round(( natrium/ daypernutrition[2][5] )* 100));
				mav.addObject("chole_per", Math.round(( chole/ daypernutrition[2][6] )* 100));
				mav.addObject("fatty_per", Math.round(( fattyacid/ daypernutrition[2][7] )* 100));
				mav.addObject("trans_per", Math.round(( transfat/ daypernutrition[2][8] )* 100));
				mav.addObject("carbo_pd",daypernutrition[2][1]);
				mav.addObject("prot_pd",daypernutrition[2][2]);
				mav.addObject("fat_pd",daypernutrition[2][3]);
				mav.addObject("sugar_pd",daypernutrition[2][4]);
				mav.addObject("nat_pd",daypernutrition[2][5]);
				mav.addObject("chole_pd",daypernutrition[2][6]);
				mav.addObject("fatty_pd",daypernutrition[2][7]);
				mav.addObject("trans_pd",daypernutrition[2][8]);
			}
			
			mav.addObject("eatList", eatList);
			mav.addObject("calory", Math.round(calory));
			mav.addObject("carbo", Math.round(100*carbo)/100);
			mav.addObject("protein", Math.round(100*protein)/100);
			mav.addObject("fat", Math.round(100*fat)/100);
			mav.addObject("sugar", Math.round(100*sugar)/100);
			mav.addObject("natrium", Math.round(100*natrium)/100);
			mav.addObject("chole", Math.round(100*chole)/100);
			mav.addObject("fattyacid", Math.round(100*fattyacid)/100);
			mav.addObject("transfat", Math.round(100*transfat)/100);
			mav.setViewName("today");
			
			ArrayList<Health> hlist = hservice.getListHealth();
			//체지방
			mav.addObject("fat_care",hlist.get(2));
			//당류
			mav.addObject("sugar_care",hlist.get(0));
			//나트륨
			mav.addObject("nat_care",hlist.get(7));
			//콜레스테롤
			mav.addObject("chole_care",hlist.get(1));
			//포화지방산
			mav.addObject("fatty_care",hlist.get(5));
			
			if(percentage > 100) {
				ArrayList<Exercise> exeList = exeService.getList();
				mav.addObject("exeList", exeList);
			} else {
				try {
					ArrayList<Food> list = eatService.recommend((kpd - (int)Math.round(calory)));
					String[] allergies = mem.getAllergy().split(", ");
					
					ArrayList<Food> recoList = new ArrayList<Food>();

					boolean flag;
					String mate;
					for(Food f : list) {
						flag = true;
						mate = f.getMaterial();
						for(String aller : allergies) {
							if(mate.contains(aller)) {
								flag = false;
								break;
							}
						}
						if(flag) {
							recoList.add(f);
							if(recoList.size() >= 5) {
								break;
							}
						}
					}
					mav.addObject("recoList", recoList);
				} catch (Exception e) {
					e.printStackTrace();
					mav.addObject("msg", "이용에 불편을 드려 죄송합니다.");
					mav.setViewName("error");
				}
			}
			
			return mav;
		}
	}
}