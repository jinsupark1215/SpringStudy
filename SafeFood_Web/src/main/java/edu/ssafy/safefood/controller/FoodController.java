package edu.ssafy.safefood.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.ssafy.safefood.dto.Food;
import edu.ssafy.safefood.dto.Member;
import edu.ssafy.safefood.service.FoodServiceImpl;
import edu.ssafy.safefood.service.MemberServiceImpl;

@Controller
@RequestMapping("/food")
public class FoodController {
	@Autowired
	private FoodServiceImpl foodService;
	@Autowired
	private MemberServiceImpl memService;

	public void process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		action = action.replaceFirst("/food", "");
		String url = "";

		try {
			if (action != null) {
				if (action.startsWith("Info.do")) {
					String searchCondition = request.getParameter("searchCondition");
					String searchWord = request.getParameter("searchWord");
					if (searchCondition == null || searchCondition.equals("") || searchWord == null
							|| searchWord.equals("")) {
						url = "foodInfo.jsp";
						request.setAttribute("list", foodService.getList());
					} else {
						int type = 0;
						if (searchCondition.equals("name")) {
							type = 1;
						} else if (searchCondition.equals("maker")) {
							type = 2;
						} else if (searchCondition.equals("material")) {
							type = 3;
						}
						ArrayList<Food> tmp = foodService.search(type, searchWord);
						url = "foodInfo.jsp";
						request.setAttribute("list", tmp);
					}

				} else if (action.startsWith("Detail.do")) {
					url = "detail.jsp";
					HttpSession session = request.getSession();
					String id = (String) session.getAttribute("id");
					String code = request.getParameter("code");
					StringBuilder sb = new StringBuilder();
					String[] temp = null;
					Member m = memService.getInfo(id);

					if (m != null) {
						temp = m.getAllergy().split(", ");
					}
					if (temp == null) {
						System.out.println("알레르기없음, 로그인없음");
					} else {
						if (temp[0].equals("알레르기 정보 없음")) {
						} else {
							String mat = foodService.getList().get(Integer.parseInt(code) - 1).getMaterial();
							for (String aller : temp) {
								if (mat.contains(aller)) {
									sb.append(aller + " ");
								}
							}
						}
					}
					request.setAttribute("food", foodService.getList().get(Integer.parseInt(code) - 1));
					request.setAttribute("allergy", sb.toString());
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
		}

	}

}
