package edu.ssafy.safefood.controller;

import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.ssafy.safefood.dto.Member;
import edu.ssafy.safefood.service.MemberServiceImpl;

@Controller
@RequestMapping(value = "/member", method = { RequestMethod.GET, RequestMethod.POST })
public class MemberController {
	@Autowired
	private ZZimController zc;
	@Autowired
	private MemberServiceImpl memService;
	private HttpSession session;
	private Cookie c;

	@RequestMapping(value = "/resetPw", method = { RequestMethod.GET, RequestMethod.POST })
	private String resetPW(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");
		System.out.println("id = " + id);
		System.out.println("pwd = " + pw);

		Member m = memService.getInfo(id);

		if (m != null) {
			m.setPw(pw);
			memService.update(m);
			request.setAttribute("msg", "비밀번호가 재설정 되었습니다.");
			return "result";
		} else {
			request.setAttribute("msg", "회원 정보 없음");
			return "error";
		}
	}

	@RequestMapping(value = "/findPW", method = { RequestMethod.GET, RequestMethod.POST })
	private String findPW(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		Member m = memService.findPw(id, name, phone);

		if (m != null) {
			System.out.println("정보있음");
			request.setAttribute("id", id);
			return "resetPW";
		} else {
			System.out.println("정보없음");
			request.setAttribute("msg", "회원 정보 없음");
			return "error";
		}
	}

	@RequestMapping(value = "/update", method = { RequestMethod.GET, RequestMethod.POST })
	private String goUpdatePage(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Member m = memService.getInfo(id);

		if (m != null) {
			request.setAttribute("allergy", m.getAllergy());
			return "update";
		} else {
			request.setAttribute("msg", "회원 정보 없음");
			return "error";
		}
	}

	@RequestMapping(value = "/result", method = { RequestMethod.GET, RequestMethod.POST })
	private String result(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		String id;

		if (cookies != null) {
			for (Cookie cook : cookies) {
				if (cook.getName().equals("id")) {
					id = cook.getValue();
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
	private String mypage(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Member m = memService.getInfo(id);

		if (m != null) {
			request.setAttribute("id", m.getId());
			request.setAttribute("name", m.getName());
			request.setAttribute("addr", m.getAddr());
			request.setAttribute("phone", m.getPhone());
			request.setAttribute("allergy", m.getAllergy());
			return "myPage";
		} else {
			request.setAttribute("msg", "로그인 정보 없음");
			return "error";
		}
	}

	@RequestMapping(value = "/regist", method = { RequestMethod.GET, RequestMethod.POST })
	private String save(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
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

		if (memService.getInfo(id) == null) {
			if (memService.add(new Member(id, pw, name, addr, phone, allergy))) {
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
	private String delete(HttpServletRequest request, HttpServletResponse response) {
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
	private String logout(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
		session.invalidate();
		return "redirect:../";
	}

	@RequestMapping(value = "/updateInfo", method = { RequestMethod.GET, RequestMethod.POST })
	private String update(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
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
		return "redirect:mypage";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	private String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");
		session = request.getSession();

		if (memService.logIn(id, pw) != null) {
			session.setAttribute("id", id);

			Member m = memService.getInfo(id);

			Set<Integer> set = zc.getZZimList(id);

			session.setAttribute("allergy", m.getAllergy());
			session.setAttribute("zzimlist", set);

			System.out.println("zzimlist 확인 : " + set.contains(1));
			System.out.println(set.toString());
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