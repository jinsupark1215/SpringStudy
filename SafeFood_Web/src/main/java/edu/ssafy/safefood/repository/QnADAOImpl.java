package edu.ssafy.safefood.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.QnA;

@Repository("QnADAOImpl")
public class QnADAOImpl implements QnADAO{
	
	@Autowired
	private SqlSession session;

	@Override
	public void insert(QnA q) throws Exception {
		session.insert("qnaMap.insert", q);
	}

	@Override
	public void update(QnA q) throws Exception {
		session.update("qnaMap.update", q);
	}

	@Override
	public void delete(int seq) throws Exception {
		session.delete("qnaMap.delete", seq);
	}

	@Override
	public List<QnA> list() throws Exception {
		return session.selectList("qnaMap.selectList");
	}

	@Override
	public void answer(QnA q) throws Exception {
		session.update("qnaMap.answer", q);
	}

	@Override
	public void watch(int seq) throws Exception {
		session.update("qnaMap.watch", seq);
		
	}

	@Override
	public int getCnt(int seq) throws Exception {
		return session.selectOne("qnaMap.getCnt", seq);
	}

	@Override
	public void delAns(int seq) throws Exception {
		session.update("qnaMap.delAns", seq);
	}

}
