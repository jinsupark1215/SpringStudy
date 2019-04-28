package edu.ssafy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestController {
	
	public void process(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getServletPath();
		String url = "/index.jsp";
		System.out.println("action = " + action);

		try {
			if (action != null) {
				if (action.endsWith("login.do")) {
					url = login(request, response);
				} else if (action.endsWith("updateInfo.do")) {
					url = update(request, response);
				} else if (action.endsWith("logout.do")) {
					url = logout(request, response);
				} else if (action.endsWith("delete.do")) {
					url = delete(request, response);
				} else if (action.endsWith("regist.do")) {
					url = save(request, response);
				} else if (action.endsWith("mypage.do")) {
					url = mypage(request, response);
				} else if (action.endsWith("update.do")) {
					url = goUpdatePage(request, response);
				} else if (action.endsWith("delPage.do")) {
					url = "/WEB-INF/view/delPage.jsp";
				} else if (action.endsWith("result.do")) {
					url = result(request, response);
				} else if (action.endsWith("goFindPW.do")) {
					url = "/WEB-INF/view/FindPW.jsp";
				} else if (action.endsWith("findPW.do")) {
					url = findPW(request, response);
				} else if (action.endsWith("resetPw.do")) {
					url = resetPW(request, response);
				}

			}

			if (url.startsWith("redirect")) {
				url = url.substring(url.indexOf(":") + 1);
				response.sendRedirect(url);
			} else {
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			url = "/WEB-INF/view/error.jsp";
			try {
				request.getRequestDispatcher(url).forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
}
