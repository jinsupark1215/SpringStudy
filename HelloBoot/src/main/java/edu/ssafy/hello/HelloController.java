package edu.ssafy.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	@RequestMapping("/hello")
	public @ResponseBody Member Hello() {
		return new Member("홍길동", 21);
	}
	
	@RequestMapping("/html")
	public String getHtml() {
		System.out.println("getHTML");
		return "index";
	}

	@RequestMapping("/jsp")
	public String getJSP() {
		System.out.println("getJSP");
		return "index";
	}
	
}