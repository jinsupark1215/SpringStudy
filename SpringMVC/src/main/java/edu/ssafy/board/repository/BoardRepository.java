package edu.ssafy.board.repository;

import java.util.List;

import edu.ssafy.board.dto.Board;

public interface BoardRepository {
	public void insert(Board b);

	public void update(Board b);

	public void delete(int seq);
	
	public Board get(int seq);
	
	public void check(int seq);

	public List<Board> list();

	public List<Board> getByKeyword(String keyword);

	public List<Board> getById(String id);
}