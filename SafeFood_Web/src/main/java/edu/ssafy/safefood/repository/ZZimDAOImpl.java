package edu.ssafy.safefood.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ZZimDAOImpl")
public class ZZimDAOImpl implements ZZimDAO {
	@Autowired
	private SqlSession session;
	@Override
	public void addZZim(String id, int code) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code", code);
	
		session.insert("zzim.insert",map);
	}

	@Override
	public void delZZim(String id, int code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code", code);
	
		session.delete("zzim.delete",map);
	}

	@Override
	public List<Integer> getList(String id) {	
		return session.selectList("zzim.selectList", id);
	}

}
