package edu.ssafy.board.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.ssafy.board.dto.Member;
import edu.ssafy.board.repository.MemberRepository;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	@Qualifier("MemberRepositoryImplDataSource")
	private MemberRepository memRepo;

	@Override
	public void insert(String id, String pw, String name, String addr) {
		System.out.println(id + " " + pw + " " + name + " " + addr);
		logger.info("MemberServiceImpl", "insert");
		memRepo.insert(new Member(id, pw, name, addr));
	}

	@Override
	public void update(String id, String pw, String name, String addr) {
		memRepo.update(new Member(id, pw, name, addr));
	}

	@Override
	public void delete(String id) {
		memRepo.delete(id);
	}

	@Override
	public List<Member> list() {
		return memRepo.list();
	}

	@Override
	public Member get(String id) {
		return memRepo.get(id);
	}

	@Override
	public Member logIn(String id, String pw) {
		return memRepo.logIn(id, pw);
	}

}