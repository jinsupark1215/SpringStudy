package edu.ssafy.safefood.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.ssafy.safefood.dto.QnA;
import edu.ssafy.safefood.service.QnAServiceImpl;

@Controller
@RequestMapping(value = "/qna", method = { RequestMethod.GET, RequestMethod.POST })
public class QnaController {

	@Autowired
	private QnAServiceImpl qnaSer;

	@RequestMapping(value = "/header")
	public String header() {
		return "header";
	}

	@RequestMapping(value = "/getList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<QnA> getList() {
		ArrayList<QnA> list = (ArrayList<QnA>) qnaSer.list();
		return list;
	}

	@RequestMapping(value = "/loginCheck", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String loginCheck(HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "";
		} else {
			return id;
		}
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody String insert(HttpSession session, @RequestBody Map<String, Object> map) {
		String writer = (String) session.getAttribute("id");
		String title = (String) map.get("title");
		String question = (String) map.get("question");

		if (qnaSer.insert(title, writer, question)) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "/delQna/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delQna(@PathVariable String id) {
		int seq = Integer.parseInt(id);

		if (qnaSer.delete(seq)) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "/addCnt", method = RequestMethod.PUT)
	public @ResponseBody int addCnt(@RequestBody Map<String, Object> map) {
		int seq = (Integer) map.get("seq");

		int ans = qnaSer.watch(seq);
		if (ans >= 0)
			return ans;
		return -1;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public @ResponseBody String update(@RequestBody Map<String, Object> map) {
		int seq = (Integer) map.get("seq");
		String title = (String) map.get("title");
		String question = (String) map.get("question");

		if (qnaSer.update(seq, title, question)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/answer", method = RequestMethod.PUT)
	public @ResponseBody String answer(@RequestBody Map<String, Object> map) {
		int seq = (Integer) map.get("seq");
		String answer = (String) map.get("answer");

		System.out.println("seq = " + seq);
		System.out.println("answer = " + answer);

		if (qnaSer.answer(seq, answer)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/delAns/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String delAns(@PathVariable String id) {
		int seq = Integer.parseInt(id);

		if (qnaSer.delAns(seq)) {
			return "success";
		} else {
			return "fail";
		}
	}
}
