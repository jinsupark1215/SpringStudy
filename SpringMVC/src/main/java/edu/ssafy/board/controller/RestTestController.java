package edu.ssafy.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.ssafy.board.dto.Board;
import edu.ssafy.board.dto.Member;
import edu.ssafy.board.service.MemberService;

@RestController
@RequestMapping("/rest")
public class RestTestController {
	
	@Autowired
	private MemberService memSer;

//	method의 return type 앞에 @ResponseBody를 붙여서 json 형태로 내려보낼 수 있다.

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public Board getBoard() {
		System.out.print("GET ");
		Board b = new Board();
		b.setContent("content");
		b.setCnt(1);
		b.setRegDate("2019-05-02");
		b.setSeq(1);
		b.setTitle("GET 방식");
		b.setWriter("writer");
		return b;
	}

	@RequestMapping(value="/board/{id}", method = RequestMethod.POST)
	public Board postBoard(@PathVariable String id) {
		System.out.println("POST : " + id);
		Board b = new Board();
		b.setContent("content");
		b.setCnt(2);
		b.setRegDate("2019-05-02");
		b.setSeq(2);
		b.setTitle("POST 방식");
		b.setWriter(id);
		return b;
	}

	@RequestMapping(value="/board/{id}", method = RequestMethod.DELETE)
	public Board deleteBoard(@PathVariable String id) {
		System.out.println("DELETE : " + id);
		Board b = new Board();
		b.setContent("content");
		b.setCnt(2);
		b.setRegDate("2019-05-02");
		b.setSeq(2);
		b.setTitle("DELETE 방식");
		b.setWriter(id);
		return b;
	}
	
	@RequestMapping(value="/board/{id}", method = RequestMethod.PUT)
	public Board putBoard(@PathVariable String id) {
		System.out.println("PUT : " + id);
		Board b = new Board();
		b.setContent("content");
		b.setCnt(2);
		b.setRegDate("2019-05-02");
		b.setSeq(2);
		b.setTitle("PUT 방식");
		b.setWriter(id);
		return b;
	}
	
	@RequestMapping(value="/logIn/{id}/{pw}", method = RequestMethod.POST)
	public String logIn(@PathVariable String id, @PathVariable String pw, HttpSession session) {
		Member mem = memSer.logIn(id, pw);
		
		if(mem != null) {
			session.setAttribute("id", id);
			return id;
		} else {
			return "";
		}
	}
	
	@RequestMapping(value="/getList", method = RequestMethod.GET)
	public List<Member> getList(){
		return memSer.list();
	}

}