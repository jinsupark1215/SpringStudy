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
	public boolean add(Member m) {
		try {
			if (dao.add(m)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public String logIn(String id, String pw) {
		try {
			return dao.logIn(id, pw);
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public boolean update(Member m) {
		try {
			if (dao.update(m)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean delete(String id, String pw) {
		try {
			if (dao.delete(id, pw)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Member getInfo(String id) {
		try {
			return dao.getInfo(id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Member findPw(String id, String name, String phone) {
		try {
			return dao.findPw(id, name, phone);
		} catch (Exception e) {
			return null;
		}
	}
}