package edu.ssafy.board.service;

import java.util.List;

import edu.ssafy.board.dto.Member;

public interface MemberService {
	public void insert(String id, String pw, String name, String addr);
	public void update(String id, String pw, String name, String addr);
	public void delete(String id);
	public List<Member> list();
	public Member get(String id);
	public Member logIn(String id, String pw);
}