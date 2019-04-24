package edu.ssafy.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping("")
	public String home(Model m) {
		m.addAttribute("msg", "board Controller 에요");
		return "result";
	}
}