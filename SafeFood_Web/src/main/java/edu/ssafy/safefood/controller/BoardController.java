package edu.ssafy.safefood.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ssafy.safefood.dto.Board;
import edu.ssafy.safefood.service.BoardServiceImpl;

@Controller
@RequestMapping(value = "/board", method = { RequestMethod.GET, RequestMethod.POST })
public class BoardController {

	@Autowired
	private BoardServiceImpl boardSer;

	@ExceptionHandler(Exception.class)
	public String exception(Exception e) {
		e.printStackTrace();
		return "error";
	}

	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mav, @RequestParam("seq")int seq) {
		Board b = boardSer.get(seq);
		mav.addObject("board", b);
		mav.setViewName("boardDetail");
		return mav;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mav, @RequestParam("seq")int seq, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id.equals("admin")) {
			mav.setViewName("redirect:list");
			boardSer.delete(seq);
			return mav;
		} else {
			mav.addObject("msg", "삭제는 관리자만 가능합니다.");
			mav.setViewName("error");
			return mav;
		}
	}

	@RequestMapping("/goUpdate")
	public ModelAndView goUpdate(ModelAndView mav, @RequestParam("seq")int seq, HttpSession session) {
		Board b = boardSer.get(seq);
		String id = (String) session.getAttribute("id");

		if (id.equals("admin")) {
			mav.addObject("board", b);
			mav.setViewName("boardUpdate");
			return mav;
		} else {
			mav.addObject("msg", "수정은 관리자만 가능합니다.");
			mav.setViewName("error");
			return mav;
		}
	}

	@RequestMapping("/list")
	public String list(HttpServletRequest req) {
		ArrayList<Board> list = (ArrayList<Board>) boardSer.list();
		req.setAttribute("list", list);
		return "boardList";
	}

	@RequestMapping("/goRegist")
	public ModelAndView goRegist(ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null || !id.equals("admin")) {
			mav.addObject("msg", "공지사항은 관리자만 등록이 가능합니다.");
			mav.setViewName("error");
			return mav;
		} else {
			mav.setViewName("mkBoard");
			return mav;
		}
	}

	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mav, @RequestParam("seq")int seq, @RequestParam("title")String title, @RequestParam("content")String content) {
		System.out.println(seq);
		System.out.println(title);
		System.out.println(content);
		if(boardSer.update(seq, title, content)) {
			mav.setViewName("redirect:detail?seq="+seq);
			return mav;
		} else {
			mav.addObject("msg", "공지사항 등록 중 에러가 발생했습니다.");
			mav.setViewName("error");
			return mav;
		}
	}

	@RequestMapping("/regist")
	public ModelAndView regist(ModelAndView mav, @RequestParam("title")String title, @RequestParam("content")String content) {
		if(boardSer.insert(title, content)) {
			mav.setViewName("redirect:list");
			return mav;
		} else {
			mav.addObject("msg", "공지사항 등록 중 에러가 발생했습니다.");
			mav.setViewName("error");
			return mav;
		}
	}
	
	
	
}