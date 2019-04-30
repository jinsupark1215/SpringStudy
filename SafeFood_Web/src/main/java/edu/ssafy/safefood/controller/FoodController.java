package edu.ssafy.safefood.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

	@ExceptionHandler(Exception.class)
	public String exception(Exception e, HttpServletRequest req) {
		req.setAttribute("msg", "에러 발생\n사용에 불편을 드려죄송합니다.");
		return "error";
	}

	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String search(HttpServletRequest req) {
		String searchCondition = req.getParameter("searchCondition");
		String searchWord = req.getParameter("searchWord");
		if (searchCondition == null || searchCondition.equals("") || searchWord == null || searchWord.equals("")) {
			req.setAttribute("list", foodService.getList());
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
			req.setAttribute("list", tmp);
		}
		return "foodInfo";
	}

	@RequestMapping(value = "/goFoodInfo", method = { RequestMethod.GET, RequestMethod.POST })
	private String goFoodInfo(HttpServletRequest req) {
		ArrayList<Food> tmp = foodService.getList();
		req.setAttribute("list", tmp);
		return "foodInfo";
	}

	@RequestMapping(value = "/detail", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView detail(ModelAndView mav,@RequestParam("code")String code, HttpSession session) {
		String id = (String) session.getAttribute("id");
		StringBuilder sb = new StringBuilder();
		String[] temp = null;
		Member m = memService.getInfo(id);

		if (m != null) {
			temp = m.getAllergy().split(", ");
		}
		
		if (temp == null) {
			System.out.println("알레르기없음, 로그인없음");
		} else {
			if (!temp[0].equals("알레르기 정보 없음")) {
				String mat = foodService.getList().get(Integer.parseInt(code) - 1).getMaterial();
				for (String aller : temp) {
					if (mat.contains(aller)) {
						sb.append(aller + " ");
					}
				}
			}
		}
		mav.addObject("food", foodService.getList().get(Integer.parseInt(code) - 1));
		mav.addObject("allergy", sb.toString());
		mav.setViewName("detail");
		return mav;
	}
}
