package edu.ssafy.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.board.dto.Board;

@Repository("BoardRepositoryImplMyBatis")
public class BoardRepositoryImplMyBatis implements BoardRepository{
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(Board b) {
		session.insert("boardMap.insert", b);
	}

	@Override
	public void update(Board b) {
		session.update("boardMap.insert", b);
	}

	@Override
	public void delete(int seq) {
		session.delete("boardMap.delete", seq);
	}

	@Override
	public Board get(int seq) {
		return session.selectOne("boardMap.selectOne", seq);
	}

	@Override
	public void check(int seq) {
		session.update("boardMap.check", seq);
	}

	@Override
	public List<Board> list() {
		return session.selectList("boardMap.selectList");
	}

	@Override
	public List<Board> getByKeyword(String keyword) {
		return session.selectList("boardMap.selectByKeyword", keyword);
	}

	@Override
	public List<Board> getById(String id) {
		return session.selectList("boardMap.selectById", id);
	}

}
