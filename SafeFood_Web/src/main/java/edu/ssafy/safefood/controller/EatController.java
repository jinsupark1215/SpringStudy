package edu.ssafy.safefood.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	private HttpSession session;

	public void process(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getServletPath();
		String url = "/index.jsp";
		System.out.println("action = " + action);

		try {
			if (action != null) {
				if (action.endsWith("addFood.do")) {
					url = addFood(request, response);
				} else if (action.endsWith("delFood.do")) {
					url = delFood(request, response);
				} else if (action.endsWith("")) {
					url = myEat(request, response);
				}
			}

			if (url.startsWith("redirect")) {
				url = url.substring(url.indexOf(":") + 1);
				response.sendRedirect(url);
			} else {
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			url = "/WEB-INF/view/error.jsp";
			try {
				request.getRequestDispatcher(url).forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	private String myEat(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null) {
			request.setAttribute("msg", "로그인 정보가 없습니다.");
			return "/WEB-INF/view/error.jsp";
		} else {
			String name = memService.getInfo(id).getName();
			ArrayList<Eat> eatten = eatService.getEat(id);
			TreeMap<Food, Integer> eatList = new TreeMap<Food, Integer>();
			double calory = 0, carbo = 0, protein = 0, fat = 0, sugar = 0, natrium = 0, chole = 0, fattyacid = 0,
					transfat = 0;

			if (eatten == null) {
				request.setAttribute("msg", "섭취 정보 없음");
				return "/WEB-INF/view/error.jsp";
			} else {
				for (Food f : foodService.getList()) {
					for (Eat e : eatten) {
						if (f.getCode() == e.getCode()) {
							int count = e.getCount();
							eatList.put(f, count);
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
					}
				}

				request.setAttribute("name", name);
				request.setAttribute("eatList", eatList);
				request.setAttribute("calory", calory);
				request.setAttribute("carbo", carbo);
				request.setAttribute("protein", protein);
				request.setAttribute("fat", fat);
				request.setAttribute("sugar", sugar);
				request.setAttribute("natrium", natrium);
				request.setAttribute("chole", chole);
				request.setAttribute("fattyacid", fattyacid);
				request.setAttribute("transfat", transfat);
				return "/WEB-INF/view/myEat.jsp";
			}
		}
	}

	private String delFood(HttpServletRequest request, HttpServletResponse response) {

		return null;
	}

	private String addFood(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null) {
			request.setAttribute("msg", "로그인 정보가 없습니다.");
			return "/WEB-INF/view/error.jsp";
		} else {
			int code = Integer.parseInt(request.getParameter("code"));
			int quan = Integer.parseInt(request.getParameter("quan"));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String today = df.format(date);
			String flag = request.getParameter("flag");

			ArrayList<Eat> eatList = eatService.getEat(id);

			int eatCode, eatCount;
			String eatDate;

			if (eatList == null) { // 섭취 정보가 없으면
				if (eatService.add(id, new Eat(code, quan, today))) {
					if (flag == null) {
						return "redirect:/foodDetail.do?code=" + code;
					} else {
						return "redirect:/foodInfo.do";
					}
				} else {
					request.setAttribute("msg", "섭취정보 저장 중 오류가 발생했습니다.");
					return "/WEB-INF/view/error.jsp";
				}
			} else { // 섭취 정보가 있으면
				boolean eatten = false;

				for (Eat eat : eatList) {
					eatCode = eat.getCode();
					eatCount = eat.getCount();
					eatDate = eat.getDate();

					if (eatCode == code && eatDate.equals(today)) {
						if (eatService.update(id, new Eat(code, eatCount + quan, eatDate))) {
							eatten = true;
							break;
						} else {
							request.setAttribute("msg", "섭취정보 저장 중 오류가 발생했습니다.");
							return "/WEB-INF/view/error.jsp";
						}
					}
				}

				if (eatten) { // 같은날에 먹은적이 있으면
					if (flag == null) {
						return "redirect:/foodDetail.do?code=" + code;
					} else {
						return "redirect:/foodInfo.do";
					}
				} else { // 같은날에 먹은적이 없으면
					if (eatService.add(id, new Eat(code, quan, today))) {
						if (flag == null) {
							return "redirect:/foodDetail.do?code=" + code;
						} else {
							return "redirect:/foodInfo.do";
						}
					} else {
						request.setAttribute("msg", "섭취정보 저장 중 오류가 발생했습니다.");
						return "/WEB-INF/view/error.jsp";
					}
				}
			}
		}
	}
}