package edu.ssafy.safefood.service;

import edu.ssafy.safefood.dto.Member;

public interface MemberService {
	/** 멤버 추가 */
	public boolean add(Member m);

	/** 로그인 */
	public String logIn(String id, String pw);

	/** 회원정보 조회 */
	public Member getInfo(String id);

	/** 정보 수정 */
	public boolean update(Member m);

	/** 삭제(탈퇴) */
	public boolean delete(String id, String pw);

	/** 비밀번호 찾기 */
	public Member findPw(String id, String name, String phone);
}