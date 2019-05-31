package edu.ssafy.safefood.service;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Food;
import edu.ssafy.safefood.dto.FreSearch;

public interface FoodService {

	public ArrayList<Food> getList();

	public ArrayList<Food> search(int type, String searchWord);
	
	public Food getFood(int code);
	
	public ArrayList<FreSearch> getFreSearchList();
	
}
