package edu.ssafy.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.ssafy.board.dto.Board;
import edu.ssafy.board.repository.BoardRepository;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired
	@Qualifier("BoardRepositoryImplMyBatis")
	private BoardRepository repo;

	@Override
	public void insert(String title, String writer, String content) {
		System.out.println(title + " " + writer + " " + content);
		repo.insert(new Board(title, writer, content));
	}

	@Override
	public void update(int seq, String title, String content) {
		repo.update(new Board(seq, title, content));
	}

	@Override
	public void delete(int seq) {
		repo.delete(seq);
	}

	@Override
	public List<Board> list() {
		return repo.list();
	}

	@Override
	public List<Board> getByKeyword(String keyword) {
		return repo.getByKeyword(keyword);
	}

	@Override
	public List<Board> getById(String id) {
		return repo.getById(id);
	}

	@Override
	public Board get(int seq) {
		return repo.get(seq);
	}

	@Override
	public void check(int seq) {
		repo.check(seq);
	}
}