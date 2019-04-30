package edu.ssafy.safefood.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

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
import edu.ssafy.safefood.service.FoodServiceImpl;
import edu.ssafy.safefood.service.ZZimServiceImpl;

@Controller
@RequestMapping("/zzim")
public class ZZimController {
	@Autowired
	private ZZimServiceImpl zzimService;
	@Autowired
	private FoodServiceImpl foodService;

	@ExceptionHandler(Exception.class)
	public String exception(Exception e, HttpServletRequest req) {
		req.setAttribute("msg", "에러 발생\n사용에 불편을 드려죄송합니다.");
		return "error";
	}

	@RequestMapping(value = "/del", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView delzzim(ModelAndView mav, @RequestParam("code")int code, HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			mav.addObject("msg", "로그인 정보가 없습니다.");
			mav.setViewName("error");
			return mav;
		} else {
			if (zzimService.delZZim(id, code)) {
				session.setAttribute("zzimlist", zzimService.getZZimList(id));
				String flag = req.getParameter("flag");
				if (flag == null) {
					System.out.println("안에서 추가");
					mav.setViewName("redirect:../food/detail?code=" + code);
					return mav;
				} else {
					System.out.println("밖에서 추가");
					mav.setViewName("redirect:../food/goFoodInfo");
					return mav;
				}
			} else {
				mav.addObject("msg", "찜 정보 저장 중 오류가 발생했습니다.");
				mav.setViewName("error");
				return mav;
			}
		}
	}

	@RequestMapping(value = "/add", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView addzzim(ModelAndView mav, @RequestParam("code")int code, HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			mav.addObject("msg", "로그인 정보가 없습니다.");
			mav.setViewName("error");
			return mav;
		} else {
			if (zzimService.addZZim(id, code)) {
				session.setAttribute("zzimlist", zzimService.getZZimList(id));
				String flag = req.getParameter("flag");
				if (flag == null) {
					mav.setViewName("redirect:../food/detail?code=" + code);
					return mav;
				} else {
					mav.setViewName("redirect:../food/goFoodInfo");
					return mav;
				}
			} else {
				mav.addObject("msg", "찜 정보 저장 중 오류가 발생했습니다.");
				mav.setViewName("error");
				return mav;
			}
		}
	}

	@RequestMapping(value = "/myZZim", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView myZZim(ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			mav.addObject("msg", "로그인 정보가 없습니다.");
			mav.setViewName("error");
			return mav;
		} else {
			Set<Integer> zzim = zzimService.getZZimList(id);
			if (zzim == null) {
				mav.addObject("msg", "찜 정보가 없습니다.");
				mav.setViewName("error");
				return mav;
			}

			ArrayList<Food> list = foodService.getList();
			Set<Food> zzimList = new HashSet<Food>();
			double calory = 0, carbo = 0, protein = 0, fat = 0, sugar = 0, natrium = 0, chole = 0, fattyacid = 0,
					transfat = 0;
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

			mav.addObject("zzimList", zzimList);
			mav.addObject("calory", calory);
			mav.addObject("carbo", carbo);
			mav.addObject("protein", protein);
			mav.addObject("fat", fat);
			mav.addObject("sugar", sugar);
			mav.addObject("natrium", natrium);
			mav.addObject("chole", chole);
			mav.addObject("fattyacid", fattyacid);
			mav.addObject("transfat", transfat);
			mav.setViewName("myZZim");
			return mav;
		}
	}

}
