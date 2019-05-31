package edu.ssafy.safefood.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.FreSearch;

@Repository("FreSearchDAOImpl")
public class FreSearchDAOImpl implements FreSearchDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public ArrayList<FreSearch> getFreSearch(){
		// TODO Auto-generated method stub
		List<FreSearch> list = session.selectList("freSearchMapper.selectFreSearchList");
		return (ArrayList<FreSearch>)list;
	}

	@Override
	public void add(String searchWord) throws Exception {
		// TODO Auto-generated method stub
		try {
			if(session.update("freSearchMapper.addCount", searchWord) == 0) {
				session.insert("freSearchMapper.addFreSearch", searchWord);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
