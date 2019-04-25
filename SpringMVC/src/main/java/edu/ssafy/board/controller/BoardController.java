package edu.ssafy.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.ssafy.board.dto.Board;
import edu.ssafy.board.service.BoardService;
import edu.ssafy.exception.MyException;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardSer;

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

//	@RequestMapping("/result")
//	public void result(Model m) {
//		m.addAttribute("msg", "뭐가 나올까");
//	}

	@RequestMapping("/result")
	public String result(HttpServletRequest req) {
		req.setAttribute("msg", "게시글이 등록되었습니다.");
		return "result";
	}

	@RequestMapping("/search")
	public String search(HttpServletRequest req) {
		String category = req.getParameter("class").trim();
		String keyword = req.getParameter("searchArea").trim();
		System.out.println("category = " + category + " keyword = " + keyword);
		ArrayList<Board> list = new ArrayList<Board>();
		
		if(category.equals("작성자")) {
			System.out.println("작성자로 검색");
			list = (ArrayList<Board>) boardSer.getById(keyword);
		} else if (category.equals("제목")) {
			System.out.println("제목으로 검색");
			list = (ArrayList<Board>) boardSer.getByKeyword(keyword);
		}
		
		if (list.isEmpty()) {
			req.setAttribute("msg", "검색 결과가 없습니다.");
			return "error";
		} else {
			req.setAttribute("list", list);
			return "boardList";
		}
	}

	@RequestMapping("/detail")
	public String detail(HttpServletRequest req) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		Board b = boardSer.get(seq);
		req.setAttribute("seq", seq);
		req.setAttribute("title", b.getTitle());
		req.setAttribute("writer", b.getWriter());
		req.setAttribute("content", b.getContent());
		req.setAttribute("regdate", b.getRegDate());
		req.setAttribute("cnt", b.getCnt());
		return "boardDetail";
	}

	@RequestMapping("/delete")
	public String delete(HttpServletRequest req, HttpSession session) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		Board b = boardSer.get(seq);
		String writer = b.getWriter();
		String id = (String) session.getAttribute("id");

		if (writer.equals(id)) { // 작성자가 같으면
			boardSer.delete(seq);
			return "redirect:delResult";
		} else {
			req.setAttribute("msg", "삭제는 작성자만 가능합니다.");
			return "error";
		}
	}

	@RequestMapping("/delResult")
	public String delResult(HttpServletRequest req) {
		req.setAttribute("msg", "게시글이 삭제되었습니다.");
		return "result";
	}

	@RequestMapping("/modResult")
	public String modResult(HttpServletRequest req) {
		req.setAttribute("msg", "게시글이 수정되었습니다.");
		return "result";
	}

	@RequestMapping("/goUpdate")
	public String goUpdate(HttpServletRequest req, HttpSession session) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		Board b = boardSer.get(seq);
		String writer = b.getWriter();
		String id = (String) session.getAttribute("id");

		if (writer.equals(id)) {
			req.setAttribute("seq", seq);
			req.setAttribute("title", b.getTitle());
			req.setAttribute("content", b.getContent());
			return "boardUpdate";
		} else {
			req.setAttribute("msg", "수정은 작성자만 가능합니다.");
			return "error";
		}
	}

	@RequestMapping("/list")
	public String list(HttpServletRequest req) {
		System.out.println("게시판 리스트");
		ArrayList<Board> list = (ArrayList<Board>) boardSer.list();
		req.setAttribute("list", list);
		return "boardList";
	}

	@RequestMapping("/goRegist")
	public String goRegist(HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) { // 로그인 안하면 등록 못함
			req.setAttribute("msg", "로그인 정보가 없습니다.");
			return "error";
		} else {
			return "mkBoard";
		}
	}

	@RequestMapping("/update")
	public String update(HttpServletRequest req) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		System.out.println("title = " + title);
		System.out.println("content = " + content);

		boardSer.update(seq, title, content);
		return "redirect:modResult";
	}

	@RequestMapping("/regist")
	public String regist(HttpServletRequest req, HttpSession session) {
		String title = req.getParameter("title");
		String writer = (String) session.getAttribute("id");
		String content = req.getParameter("content");

		System.out.println("title = " + title);
		System.out.println("writer = " + writer);
		System.out.println("content = " + content);

		boardSer.insert(title, writer, content);
		return "redirect:result";
	}
}