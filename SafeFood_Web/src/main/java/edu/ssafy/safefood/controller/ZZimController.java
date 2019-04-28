package edu.ssafy.safefood.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.ssafy.safefood.dto.Food;
import edu.ssafy.safefood.service.FoodServiceImpl;
import edu.ssafy.safefood.service.ZZimServiceImpl;

@Controller
@RequestMapping("/zzim")
public class ZZimController {
	@Autowired
	private ZZimServiceImpl zzimService;
	@Autowired
	private FoodServiceImpl foodService;
	private HttpSession session;

	public Set<Integer> getZZimList(String id) {
		System.out.println("getZZimlist");

		return zzimService.getZZimList(id);
	}

	public void process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		action = action.replaceFirst("/zzim.", "");
		String url = "";
		System.out.println("action = " + action);

		try {
			url = "redirect:foodInfo.do";
			if (action != null) {
				if (action.startsWith("add.do")) {
					addzzim(request, response);
				} else if (action.startsWith("del.do")) {
					delzzim(request, response);
				} else if (action.startsWith("myZZim.do")) {
					url = myZZim(request, response);
				}
			}
			if (url.startsWith("redirect")) {
				url = url.substring(url.indexOf(":") + 1);
				response.sendRedirect(url);
			} else {
				System.out.println(url);
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

	private void delzzim(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("delZZim");
		session = request.getSession();
		int code = Integer.parseInt(request.getParameter("code"));
		String id = (String) session.getAttribute("id");
		zzimService.delZZim(id, code);
		session.setAttribute("zzimlist", getZZimList(id));

	}

	private void addzzim(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("addZZim");
		session = request.getSession();
		int code = Integer.parseInt(request.getParameter("code"));
		String id = (String) session.getAttribute("id");
		zzimService.addZZim(id, code);
		session.setAttribute("zzimlist", getZZimList(id));

	}

	private String myZZim(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MyZZim");
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		System.out.println(id);
		Set<Integer> zzim = getZZimList(id);
		System.out.println(zzim.toString());
		ArrayList<Food> list = foodService.getList();
		Set<Food> zzimList = new HashSet<Food>();

		double calory = 0, carbo = 0, protein = 0, fat = 0, sugar = 0, natrium = 0, chole = 0, fattyacid = 0,
				transfat = 0;

		if (id != null) {
			for (Food f : list) {
				if (zzim.contains(f.getCode())) {
					zzimList.add(f);
					calory += f.getCalory();
					carbo += f.getCarbo();
					protein += f.getProtein();
					fat += f.getFat();
					sugar += f.getSugar();
					natrium += f.getNatrium();
					chole += f.getChole();
					fattyacid += f.getFattyacid();
					transfat += f.getTransfat();
				}
			}

			if (zzimList.isEmpty()) {
				System.out.println("섭취정보없음");
				request.setAttribute("msg", "섭취 정보 없음");
				return "/WEB-INF/view/error.jsp";
			} else {
				System.out.println("리퀘스트에 넣기");
				request.setAttribute("zzimList", zzimList);
				request.setAttribute("calory", calory);
				request.setAttribute("carbo", carbo);
				request.setAttribute("protein", protein);
				request.setAttribute("fat", fat);
				request.setAttribute("sugar", sugar);
				request.setAttribute("natrium", natrium);
				request.setAttribute("chole", chole);
				request.setAttribute("fattyacid", fattyacid);
				request.setAttribute("transfat", transfat);
				return "/WEB-INF/view/myZZim.jsp";
			}
		} else {
			request.setAttribute("msg", "로그인 정보 없음");
			return "/WEB-INF/view/error.jsp";
		}
	}

}
