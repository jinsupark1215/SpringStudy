package edu.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.dto.Board;
import edu.ssafy.safefood.repository.BoardDAO;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;

	@Override
	public boolean insert(String title, String content) {
		try {
			dao.insert(new Board(title, content));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(int seq, String title, String content) {
		try {
			dao.update(new Board(seq, title, content));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(int seq) {
		try {
			dao.delete(seq);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Board get(int seq) {
		try {
			return dao.get(seq);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Board> list() {
		try {
			return dao.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}