package edu.ssafy.board.repository;

import java.util.List;

import edu.ssafy.board.dto.Member;

public interface MemberRepository {
	public void insert(Member m);
	public void update(Member m);
	public void delete(String id);
	public List<Member> list();
	public Member get(String id);
	public Member logIn(String id, String pw);
}