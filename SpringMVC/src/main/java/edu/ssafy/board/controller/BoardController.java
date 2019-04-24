package edu.ssafy.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.ssafy.exception.MyException;

@Controller
@RequestMapping("/board")
public class BoardController {

	@ExceptionHandler(MyException.class)
	public String exceptionMethod(MyException e) {
		e.trace();
		return "";
	}
	
	@ExceptionHandler(Exception.class)
	public String exception(Exception e) {
		e.printStackTrace();
		return "error";
	}

	@RequestMapping("")
	public String home(Model m) {
		m.addAttribute("msg", "board Controller 에요");
		return "result";
	}

	@RequestMapping("/result")
	public void result(Model m) {
		m.addAttribute("msg", "뭐가 나올까");
	}
}