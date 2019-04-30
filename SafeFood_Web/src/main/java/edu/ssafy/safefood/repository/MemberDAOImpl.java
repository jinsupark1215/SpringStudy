package edu.ssafy.safefood.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Member;

@Repository("MemberDAOImpl")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession session;

	@Override
	public void add(Member m) throws Exception {
		session.insert("mem.add", m);
	}

	@Override
	public String logIn(String id, String pw) throws Exception {
		return session.selectOne("mem.login", new Member(id, pw));
	}

	@Override
	public void update(Member m) throws Exception {
		session.update("mem.update", m);
	}

	@Override
	public void delete(String id, String pw) throws Exception {
		String checkId = logIn(id, pw);
		if (checkId == null) {
			return;
		}
		session.delete("mem.delete", checkId);
	}

	@Override
	public Member getInfo(String id) throws Exception {
		return session.selectOne("mem.getInfo", id);
	}

	@Override
	public Member findPw(String id, String name, String phone) throws Exception {
		return session.selectOne("mem.findPw", new Member(id, name, phone));
	}
}