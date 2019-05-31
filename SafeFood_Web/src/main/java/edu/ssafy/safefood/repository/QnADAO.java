package edu.ssafy.safefood.repository;

import java.util.List;

import edu.ssafy.safefood.dto.QnA;

public interface QnADAO {
	public void insert(QnA q) throws Exception;
	
	public void update(QnA q) throws Exception;
	
	public void delete(int seq) throws Exception;

	public List<QnA> list() throws Exception;
	
	public void answer(QnA q) throws Exception;
	
	public void watch(int seq) throws Exception;
	
	public int getCnt(int seq) throws Exception;
	
	public void delAns(int seq) throws Exception;
}
