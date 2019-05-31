package edu.ssafy.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.dto.QnA;
import edu.ssafy.safefood.repository.QnADAO;

@Service("QnAServiceImpl")
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADAO dao;

	@Override
	public boolean insert(String title, String writer, String question) {
		try {
			dao.insert(new QnA(title, writer, question));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean update(int seq, String title, String question) {
		try {
			dao.update(new QnA(seq, title, question));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean delete(int seq) {
		try {
			dao.delete(seq);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<QnA> list() {
		try {
			return dao.list();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean answer(int seq, String answer) {
		try {
			dao.answer(new QnA(seq, answer));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public int watch(int seq) {
		try {
			System.out.println("service seq = " + seq);
			dao.watch(seq);	
			return dao.getCnt(seq);
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public boolean delAns(int seq) {
		try {
			dao.delAns(seq);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
