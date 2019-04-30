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
import edu.ssafy.safefood.dto.Food;
import edu.ssafy.safefood.service.EatServiceImpl;
import edu.ssafy.safefood.service.FoodServiceImpl;
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

	@ExceptionHandler(Exception.class)
	public String exception(Exception e, HttpServletRequest req) {
		req.setAttribute("msg", "에러 발생. 사용에 불편을 드려죄송합니다.");
		return "error";
	}
	
	@RequestMapping(value = "/bestEat", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView bestEat(ModelAndView mav, HttpServletRequest req) {
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		ArrayList<Eat> eatten;
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
		
		mav.addObject("eatList", eatList);
		mav.setViewName("bestEat");
		return mav;
	}

	@RequestMapping(value = "/myEat", method = { RequestMethod.GET, RequestMethod.POST })
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

	@RequestMapping(value = "/delete", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView delFood(ModelAndView mav, @RequestParam("code") int code, @RequestParam("date") String date,
			HttpSession session) {
		String id = (String) session.getAttribute("id");

		if (eatService.delete(id, code, date)) {
			mav.setViewName("redirect:myEat");
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
}