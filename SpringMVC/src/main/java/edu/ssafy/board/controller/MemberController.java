package edu.ssafy.board.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ssafy.board.dto.Member;
import edu.ssafy.board.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private Cookie c;

	@Autowired
	private MemberService memSer;

	@RequestMapping("")
	public ModelAndView home(ModelAndView m) {
		m.addObject("msg", "member 화이팅");
		m.setViewName("result");
		return m;
	}
	
	@ExceptionHandler(Exception.class)
	public String exception(Exception e) {
		System.out.println("MyException");
		return "error";
	}

//	@RequestMapping("/insert")
//	public ModelAndView insert(Member mem, ModelAndView m) {
//		logger.info("MemberController", "insert");
//		String id = req.getParameter("id");
//		String pw = req.getParameter("pw");
//		String name = req.getParameter("name");
//		String addr = req.getParameter("addr");
//		memSer.insert(id, pw, name, addr);
//
//		System.out.println(mem.toString());
//		m.addObject("msg", "쉬는시간");
//		m.setViewName("result");
//		return m;
//	}

	@RequestMapping("/insert")
	public ModelAndView insert(HttpServletRequest req, ModelAndView m,
			@RequestParam(value="id", required = true, defaultValue = "id") String id,
			@RequestParam(value="pw") String pw,
			@RequestParam(value="name") String name,
			@RequestParam(value="addr") String addr) {
//		String id = req.getParameter("id");
//		String pw = req.getParameter("pw");
//		String name = req.getParameter("name");
//		String addr = req.getParameter("addr");
		memSer.insert(id, pw, name, addr);

		m.addObject("msg", "쉬는시간");
		m.setViewName("result");
		return m;
	}

	@RequestMapping("/signUp")
	public ModelAndView signUp(HttpServletRequest req, HttpServletResponse res, ModelAndView m,
			@RequestParam(value="id") String id,
			@RequestParam(value="pwd") String pw,
			@RequestParam(value="name") String name,
			@RequestParam(value="addr") String addr) {
//		String id = req.getParameter("id");
//		String pw = req.getParameter("pwd");
//		String name = req.getParameter("name");
//		String addr = req.getParameter("addr");

		Member mem = memSer.get(id);

		if (mem == null) {
			memSer.insert(id, pw, name, addr);
			c = new Cookie("id", id);
			res.addCookie(c);
			m.setViewName("redirect:result");
		} else {
			req.setAttribute("msg", "해당 아이디는 이미 존재합니다.");
			m.setViewName("error");
		}
		return m;
	}

	@RequestMapping("/result")
	public String result(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		String id;

		if (cookies != null) {
			for (Cookie cook : cookies) {
				if (cook.getName().equals("id")) {
					id = cook.getValue();
					Member m = memSer.get(id);
					System.out.println(m.getId() + "의 이름 : " + m.getName());
					request.setAttribute("msg", m.getName() + "님 회원가입을 환영합니다.");
					cook.setMaxAge(0);
					response.addCookie(cook);
					break;
				}
			}
		}
		return "result";
	}

	@RequestMapping("logIn")
	public String login(HttpServletRequest req, HttpSession session) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pwd");
		
		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		session = req.getSession();

		if (memSer.logIn(id, pw) != null) {
			session.setAttribute("id", id);
			return "redirect:../";
		} else {
			req.setAttribute("msg", "아이디 또는 패스워드가 다릅니다");
			return "error";
		}
	}

	@RequestMapping("logOut")
	public String logOut(HttpServletRequest req, HttpSession session) {
		session = req.getSession();
		session.invalidate();
		return "redirect:../";
	}

	@RequestMapping("mypage")
	public String mypage(HttpServletRequest req, HttpSession session) {
		session = req.getSession();
		String id = (String) session.getAttribute("id");
		Member m = memSer.get(id);
		
		String name = m.getName();
		String addr = m.getAddr();
		
		req.setAttribute("id", id);
		req.setAttribute("name", name);
		req.setAttribute("addr", addr);
		return "myPage";
	}
	
	@RequestMapping("list")
	public String list(HttpServletRequest req) {
		System.out.println("리스트 들어옴");
		ArrayList<Member> list = (ArrayList<Member>) memSer.list();
		req.setAttribute("list", list);
		return "memberList";
	}

	@RequestMapping("update")
	public String update(HttpServletRequest req, HttpSession session) {
		session = req.getSession();
		String id = (String) session.getAttribute("id");
		Member m = memSer.get(id);

		String pw = req.getParameter("pwd");
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");

		if (pw != "") {
			m.setPw(pw);
		}
		if (name != "") {
			m.setName(name);
		}
		if (addr != "") {
			m.setAddr(addr);
		}
		
		pw = m.getPw();
		name = m.getName();
		addr = m.getAddr();
		
		memSer.update(id, pw, name, addr);
		
		return "redirect:mypage";
	}
	
	@RequestMapping("goUpdate")
	public String update() {
		return "update";
	}

	@RequestMapping("delete")
	public String delete(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		String id = (String) session.getAttribute("id");
		String name = memSer.get(id).getName();
		c = new Cookie("name", name);
		memSer.delete(id);
		res.addCookie(c);
		session.invalidate();

		return "redirect:delResult";
	}

	@RequestMapping("delResult")
	public String delResult(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		String name;

		if (cookies != null) {
			for (Cookie cook : cookies) {
				if (cook.getName().equals("name")) {
					name = cook.getValue();
					request.setAttribute("msg", name + "님 정상적으로 탈퇴되었습니다.");
					cook.setMaxAge(0);
					response.addCookie(cook);
					break;
				}
			}
		}
		return "result";
	}

	@RequestMapping("/goSignUp")
	public String goSignUpPage() {
		return "signUp";
	}

}
