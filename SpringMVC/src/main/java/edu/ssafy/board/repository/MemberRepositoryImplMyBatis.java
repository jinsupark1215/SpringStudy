package edu.ssafy.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.board.dto.Member;

@Repository("MemberRepositoryImplMyBatis")
public class MemberRepositoryImplMyBatis implements MemberRepository {
	@Autowired
	private SqlSession session;

	@Override
	public void insert(Member m) {
		session.insert("mem.insert", m);
	}

	@Override
	public void update(Member m) {
		session.update("mem.update", m);
	}

	@Override
	public void delete(String id) {
		session.delete("mem.delete", id);
	}

	@Override
	public List<Member> list() {
		return session.selectList("mem.selectList");
	}

	@Override
	public Member get(String id) {
		return session.selectOne("mem.selectOne", id);
	}

	@Override
	public Member logIn(String id, String pw) {
		return session.selectOne("mem.login", new Member(id,pw));
	}

}
