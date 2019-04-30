package edu.ssafy.safefood.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.dto.Food;
import edu.ssafy.safefood.repository.FoodDAO;

@Service("FoodServiceImpl")
public class FoodServiceImpl implements FoodService {
	@Autowired
	private FoodDAO dao;

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
		try {
			return dao.getSearchList(type, searchWord);
		} catch (Exception e) {
			System.out.println("searchList 에러");
			return null;
		}
	}

	@Override
	public Food getFood(int code) {
		return dao.getFood(code);
	}

}
