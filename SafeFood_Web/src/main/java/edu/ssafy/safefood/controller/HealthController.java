package edu.ssafy.safefood.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.ssafy.safefood.dto.Health;
import edu.ssafy.safefood.service.HealthService;

@Controller
@RequestMapping("/health")
public class HealthController {
	
	@Autowired
	private HealthService ser;
	
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, HttpServletRequest req) {
		req.setAttribute("msg", "에러 발생\n사용에 불편을 드려죄송합니다.");
		return "error";
	}

	@RequestMapping(value = "/check", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView select(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		
		ArrayList<Health> body = ser.getListBody();
		ArrayList<Health> mental = ser.getListMental();
		ArrayList<Health> health = ser.getListHealth();
		
		mav.addObject("bodyList",body);
		mav.addObject("mentalList",mental);
		mav.addObject("healthList",health);
		
		mav.setViewName("healthcare");
		return mav;
	}
}
