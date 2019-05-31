package edu.ssafy.safefood.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.ssafy.safefood.dto.FreSearch;
import edu.ssafy.safefood.service.FoodService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private EatController ec;

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Locale locale, Model model, HttpServletRequest req) {
		ArrayList<FreSearch> tmp2 = foodService.getFreSearchList();
		
		req.setAttribute("freList", tmp2);
		
/* for carosel */
		req.setAttribute("bestEatList", ec.bestEat());
/* end here */
		return "index";
	}
}
