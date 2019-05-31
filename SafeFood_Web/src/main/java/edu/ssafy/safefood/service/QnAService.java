package edu.ssafy.safefood.service;

import java.util.List;

import edu.ssafy.safefood.dto.QnA;

public interface QnAService {
	public boolean insert(String title, String writer, String question);

	public boolean update(int seq, String title, String question);
	
	public boolean delete(int seq);
	
	public List<QnA> list();
	
	public boolean answer(int seq, String answer);
	
	public int watch(int seq);
	
	public boolean delAns(int seq);
}