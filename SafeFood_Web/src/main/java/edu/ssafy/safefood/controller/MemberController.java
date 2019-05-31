package edu.ssafy.safefood.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ssafy.safefood.dto.Member;
import edu.ssafy.safefood.service.MemberServiceImpl;

@Controller
@RequestMapping(value = "/member", method = { RequestMethod.GET, RequestMethod.POST })
public class MemberController {
	@Autowired
	private MemberServiceImpl memService;
	
	private Cookie c;
	
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, HttpServletRequest req) {
		req.setAttribute("msg", "에러 발생\n사용에 불편을 드려죄송합니다.");
		return "error";
	}

	@RequestMapping(value = "/resetPw", method = { RequestMethod.POST })
	private ModelAndView resetPW(ModelAndView mav, @RequestParam("id")String id, @RequestParam("pwd")String pw) {
		Member m = memService.getInfo(id);

		if (m != null) {
			m.setPw(pw);
			memService.update(m);
			mav.addObject("msg", "비밀번호가 재설정 되었습니다.");
			mav.setViewName("result");
		} else {
			mav.addObject("msg", "회원 정보가 없습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	@RequestMapping(value = "/findPW", method = { RequestMethod.POST })
	private ModelAndView findPW(@RequestParam("id")String id, @RequestParam("name")String name, @RequestParam("phone")String phone, ModelAndView mav) {
		Member m = memService.findPw(id, name, phone);

		if (m != null) {
			mav.addObject("id", id);
			mav.setViewName("resetPW");
		} else {
			mav.addObject("msg", "회원 정보가 없습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	@RequestMapping(value = "/update", method = { RequestMethod.POST })
	private ModelAndView goUpdatePage(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member m = memService.getInfo(id);

		if (m != null) {
			req.setAttribute("allergy", m.getAllergy());
			mav.setViewName("update");
		} else {
			mav.addObject("msg", "회원 정보가 없습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	@RequestMapping(value = "/result", method = { RequestMethod.GET, RequestMethod.POST })
	private String result(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		String id;

		if (cookies != null) {
			for (Cookie cook : cookies) {
				if (cook.getName().equals("id")) {
					id = cook.getValue();
					System.out.println("cookie에 있는 id = " + id);
					Member m = memService.getInfo(id);
					request.setAttribute("msg", m.getName() + "님 회원가입을 환영합니다.");
					cook.setMaxAge(0);
					response.addCookie(cook);
					break;
				} else {
					request.setAttribute("msg", "정상적으로 탈퇴되었습니다.");
				}
			}
		}
		return "result";
	}

	@RequestMapping(value = "/mypage", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView mypage(ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member m = memService.getInfo(id);

		if (m != null) {
			mav.addObject("id", m.getId());
			mav.addObject("name", m.getName());
			mav.addObject("birth", m.getBirth());
			if(m.getGender() == 'M') {
				mav.addObject("gender", "남성");
			} else if(m.getGender() == 'F') {
				mav.addObject("gender", "여성");
			}
			mav.addObject("addr", m.getAddr());
			mav.addObject("phone", m.getPhone());
			mav.addObject("allergy", m.getAllergy());
			mav.setViewName("myPage");
		} else {
			mav.addObject("msg", "로그인 정보가 없습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	@RequestMapping(value = "/regist", method = { RequestMethod.GET, RequestMethod.POST })
	private String save(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		char gender = request.getParameter("gender").charAt(0);
		String birth = request.getParameter("birth");
		String[] allergies = (String[]) request.getParameterValues("allergy");
		
		StringBuilder sb = new StringBuilder();
		if (allergies == null) {
			allergies = new String[] { "" };
		}

		for (int i = 0; i < allergies.length - 1; i++) {
			sb.append(allergies[i]).append(", ");
		}
		sb.append(allergies[allergies.length - 1]);

		String allergy = sb.toString();

		if (memService.getInfo(id) == null) {
			if (memService.add(id, pw, name, addr, phone, allergy, gender, birth)) {
				c = new Cookie("id", id);
				response.addCookie(c);
				return "redirect:result";
			} else {
				request.setAttribute("msg", "저장오류");
				return "error";
			}
		} else {
			request.setAttribute("msg", "이미 등록된 아이디입니다.");
			return "error";
		}
	}

	@RequestMapping(value = "/delete", method = { RequestMethod.GET, RequestMethod.POST })
	private String delete(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");

		if (memService.logIn(id, pw) == null) {
			request.setAttribute("msg", "아이디 또는 패스워드가 다릅니다");
			return "error";
		} else {
			if (memService.delete(id, pw)) {
				session.invalidate();
				return "redirect:result";
			} else {
				request.setAttribute("msg", "삭제오류");
				return "error";
			}
		}
	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	private String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.invalidate();
		return "redirect:../";
	}

	@RequestMapping(value = "/updateInfo", method = { RequestMethod.GET, RequestMethod.POST })
	private String update(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member m = memService.getInfo(id);

		String pw = request.getParameter("pwd");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String[] allergies = (String[]) request.getParameterValues("allergy");
		StringBuilder sb = new StringBuilder();
		if (allergies == null) {
			allergies = new String[] { "" };
		}
		for (int i = 0; i < allergies.length - 1; i++) {
			sb.append(allergies[i]).append(", ");
		}
		sb.append(allergies[allergies.length - 1]);

		String allergy = sb.toString();

		if (pw != "") {
			m.setPw(pw);
		}
		if (name != "") {
			m.setName(name);
		}
		if (addr != "") {
			m.setAddr(addr);
		}
		if (phone != "") {
			m.setPhone(phone);
		}
		m.setAllergy(allergy);
		memService.update(m);
		session.setAttribute("allergy", m.getAllergy());
		return "redirect:mypage";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	private String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");

		if (memService.logIn(id, pw) != null) {
			session.setAttribute("id", id);
			System.out.println("getInfo 전임");
			Member m = memService.getInfo(id);

			System.out.println("알러지 설정 전임");
//			session.setAttribute("allergy", m.getAllergy());
			System.out.println("login에서 redirect 전임");
			return "redirect:../";
		} else {
			request.setAttribute("msg", "아이디 또는 패스워드가 다릅니다");
			return "error";
		}
	}

	@RequestMapping(value = "/delPage", method = { RequestMethod.GET, RequestMethod.POST })
	private String delPage() {
		return "delPage";
	}

	@RequestMapping(value = "/goFindPW", method = { RequestMethod.GET, RequestMethod.POST })
	private String findPwPage() {
		return "FindPW";
	}

	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	private String signup() {
		return "signUp";
	}

	@RequestMapping(value = "/goLogin", method = { RequestMethod.GET, RequestMethod.POST })
	private String goLogin() {
		return "login";
	}

}