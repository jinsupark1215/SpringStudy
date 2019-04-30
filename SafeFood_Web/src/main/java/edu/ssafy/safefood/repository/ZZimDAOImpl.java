package edu.ssafy.safefood.repository;

import java.util.ArrayList;
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
	public void addZZim(String id, int code) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code", code);
		session.insert("zzim.add", map);
	}

	@Override
	public void delZZim(String id, int code) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code", code);
		session.delete("zzim.delete", map);
	}

	@Override
	public ArrayList<Integer> getList(String id) throws Exception {
		List<Integer> list = new ArrayList<Integer>();
		list = session.selectList("zzim.selectList", id);
		if(list.isEmpty()) {
			return null;
		} else {
			return (ArrayList<Integer>) list;
		}
	}

}
