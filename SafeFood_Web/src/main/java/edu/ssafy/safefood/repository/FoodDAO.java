package edu.ssafy.safefood.repository;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Food;

public interface FoodDAO {
	public ArrayList<Food> getList();

	public ArrayList<Food> getSearchList(int type, String searchWord);
	
	public Food getFood(int code);
}
