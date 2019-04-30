package edu.ssafy.safefood.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Food;

@Repository("FoodDAOImpl")
public class FoodDAOImpl implements FoodDAO {
	@Autowired
	private SqlSession session;

	@Override
	public ArrayList<Food> getList() {
		List<Food> list = session.selectList("foodMapper.selectList");
		return (ArrayList<Food>) list;
	}

	@Override
	public ArrayList<Food> getSearchList(int type, String searchWord) {
		List<Food> list = new ArrayList<Food>();
		
		try {
			if (type == 1) { // 제품명으로 검색
				list = session.selectList("foodMapper.searchByName", "%" + searchWord + "%");
			} else if (type == 2) { // 제조사로 검색
				list = session.selectList("foodMapper.searchByMaker", "%" + searchWord + "%");
			} else if (type == 3) { // 재료로 검색
				list = session.selectList("foodMapper.searchByMaterial", "%" + searchWord + "%");
			}

			if (list.isEmpty()) {
				return null;
			} else {
				return (ArrayList<Food>) list;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Food getFood(int code) {
		return session.selectOne("foodMapper.getFood", code);
	}
}
