package edu.ssafy.safefood.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Board;

@Repository("BoardDAOImpl")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession session;

	@Override
	public void insert(Board b) throws Exception {
		session.insert("boardMap.insert", b);
	}

	@Override
	public void update(Board b) throws Exception {
		session.update("boardMap.update", b);
	}

	@Override
	public void delete(int seq) throws Exception {
		session.delete("boardMap.delete", seq);
	}

	@Override
	public Board get(int seq) throws Exception {
		return session.selectOne("boardMap.selectOne", seq);
	}

	@Override
	public List<Board> list() throws Exception {
		return session.selectList("boardMap.selectList");
	}

}
