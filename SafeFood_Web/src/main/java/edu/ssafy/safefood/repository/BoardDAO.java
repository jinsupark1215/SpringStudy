package edu.ssafy.safefood.repository;

import java.util.List;

import edu.ssafy.safefood.dto.Board;

public interface BoardDAO {
	public void insert(Board b) throws Exception;

	public void update(Board b) throws Exception;

	public void delete(int seq) throws Exception;

	public Board get(int seq) throws Exception;

	public List<Board> list() throws Exception;
}