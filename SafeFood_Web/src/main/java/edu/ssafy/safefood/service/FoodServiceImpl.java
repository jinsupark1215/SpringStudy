package edu.ssafy.safefood.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.dto.Food;
import edu.ssafy.safefood.dto.FreSearch;
import edu.ssafy.safefood.repository.FoodDAO;
import edu.ssafy.safefood.repository.FreSearchDAO;

@Service("FoodServiceImpl")
public class FoodServiceImpl implements FoodService {
	@Autowired
	private FoodDAO dao;
	
	@Autowired
	private FreSearchDAO fdao;

	@Override
	public ArrayList<Food> getList() {
		try {
			return dao.getList();
		} catch (Exception e) {
			System.out.println("getList 에러");
			return null;
		}
	}

	@Override
	public ArrayList<Food> search(int type, String searchWord) {
		// TODO Auto-generated method stub
		ArrayList<Food> list = null;
		try {
			list = dao.getSearchList(type, searchWord);
			if(list != null) {
				fdao.add(searchWord);
			}
			return list;
		} catch (Exception e) {
			System.out.println("searchList 에러");
			return null;
		}
	}

	@Override
	public Food getFood(int code) {
		return dao.getFood(code);
	}

	@Override
	public ArrayList<FreSearch> getFreSearchList() {
		// TODO Auto-generated method stub
		return fdao.getFreSearch();
	}

}
