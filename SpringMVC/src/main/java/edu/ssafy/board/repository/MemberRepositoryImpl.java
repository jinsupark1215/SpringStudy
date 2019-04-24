package edu.ssafy.board.repository;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import edu.ssafy.board.dto.Member;

@Repository("MemberRepositoryImpl")
public class MemberRepositoryImpl implements MemberRepository {
	private static final Logger logger = LoggerFactory.getLogger(MemberRepositoryImpl.class);
	ArrayList<Member> list = new ArrayList<Member>();

	@Override
	public void insert(Member m) {
		logger.info("MemberRepository", "insert");
		list.add(m);
		System.out.println("방금 저장된 애 " + list.get(0));
	}

	@Override
	public void update(Member m) {
		for (Member mem : list) {
			if (mem.getId().equals(m.getId())) {
				list.remove(mem);
				break;
			}
		}
		list.add(m);
	}

	@Override
	public void delete(String id) {
		for (Member mem : list) {
			if (mem.getId().equals(id)) {
				list.remove(mem);
				break;
			}
		}
	}

	@Override
	public List<Member> list() {
		return list;
	}

	@Override
	public Member get(String id) {
		for (Member mem : list) {
			if (mem.getId().equals(id)) {
				return mem;
			}
		}
		return null;
	}

	@Override
	public Member logIn(String id, String pw) {
		for (Member mem : list) {
			if (mem.getId().equals(id) && mem.getPw().equals(pw)) {
				return mem;
			}
		}
		return null;
	}

}
