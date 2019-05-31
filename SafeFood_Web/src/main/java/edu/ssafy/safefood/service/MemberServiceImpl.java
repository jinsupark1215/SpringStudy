package edu.ssafy.safefood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.dto.Member;
import edu.ssafy.safefood.repository.MemberDAO;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("MemberDAOImpl")
	private MemberDAO dao;

	@Override
	public boolean add(String id, String pw, String name, String addr, String phone, String allergy, char gender, String birth) {
		try {
			dao.add(new Member(id, pw, name, addr, phone, allergy, gender, birth));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public String logIn(String id, String pw) {
		try {
			return dao.logIn(id, pw);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean update(Member m) {
		try {
			dao.update(m);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(String id, String pw) {
		try {
			dao.delete(id, pw);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Member getInfo(String id) {
		try {
			return dao.getInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Member findPw(String id, String name, String phone) {
		try {
			return dao.findPw(id, name, phone);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}