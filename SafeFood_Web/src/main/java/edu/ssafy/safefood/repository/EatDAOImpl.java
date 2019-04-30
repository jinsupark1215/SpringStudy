package edu.ssafy.safefood.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Eat;

@Repository("EatDAOImpl")
public class EatDAOImpl implements EatDAO {
	@Autowired
	private SqlSession session;

	@Override
	public ArrayList<Eat> getEat(String id) throws Exception {
		List<Eat> eat = new ArrayList<Eat>();
		eat = session.selectList("eatMapper.selectList", id);
		if (eat.isEmpty()) {
			return null;
		} else {
			return (ArrayList<Eat>) eat;
		}
	}

	@Override
	public void add(String id, Eat eat) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("id", id);
		map.put("eat", eat);

		session.insert("eatMapper.add", map);
	}

	@Override
	public void delete(String id, Eat eat) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("eat", eat);
		
		session.delete("eatMapper.delete", map);
	}

	@Override
	public void update(String id, Eat eat) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("id", id);
		map.put("eat", eat);

		session.insert("eatMapper.update", map);
	}

	@Override
	public ArrayList<Eat> getDetail(String id, String start, String end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		List<Eat> eat = new ArrayList<Eat>();
		eat = session.selectList("eatMapper.getDetail", map);
		if (eat.isEmpty()) {
			return null;
		} else {
			return (ArrayList<Eat>) eat;
		}
	}

	@Override
	public ArrayList<Eat> bestEat(String start, String end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<Eat> eat = new ArrayList<Eat>();
		eat = session.selectList("eatMapper.bestEat", map);
		if (eat.isEmpty()) {
			return null;
		} else {
			return (ArrayList<Eat>) eat;
		}
	}

}