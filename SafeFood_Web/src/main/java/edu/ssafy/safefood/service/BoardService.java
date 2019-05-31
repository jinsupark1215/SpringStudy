package edu.ssafy.safefood.service;

import java.util.List;

import edu.ssafy.safefood.dto.Board;

public interface BoardService {
	public boolean insert(String title, String content);

	public boolean update(int seq, String title, String content);

	public boolean delete(int seq);

	public Board get(int seq);

	public List<Board> list();
}