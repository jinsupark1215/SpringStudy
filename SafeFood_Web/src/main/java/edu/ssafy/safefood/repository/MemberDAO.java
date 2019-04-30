package edu.ssafy.safefood.repository;

import edu.ssafy.safefood.dto.Member;

public interface MemberDAO {
	/** 멤버 추가 */
	public void add(Member m) throws Exception;

	/** 로그인 */
	public String logIn(String id, String pw) throws Exception;

	/** 회원정보 조회 */
	public Member getInfo(String id) throws Exception;

	/** 정보 수정 */
	public void update(Member m) throws Exception;

	/** 삭제(탈퇴) */
	public void delete(String id, String pw) throws Exception;

	/** 비밀번호 찾기 */
	public Member findPw(String id, String name, String phone) throws Exception;
}