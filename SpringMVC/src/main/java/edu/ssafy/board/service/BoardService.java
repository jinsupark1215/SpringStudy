package edu.ssafy.board.service;

import java.util.List;

import edu.ssafy.board.dto.Board;

public interface BoardService {
	public void insert(String title, String writer, String content);

	public void update(int seq, String title, String content);

	public void delete(int seq);
	
	public Board get(int seq);

	public List<Board> list();

	public List<Board> getByKeyword(String keyword);

	public List<Board> getById(String id);

}