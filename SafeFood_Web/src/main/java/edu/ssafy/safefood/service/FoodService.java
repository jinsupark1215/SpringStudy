package edu.ssafy.safefood.service;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Food;

public interface FoodService {

	public ArrayList<Food> getList();

	public ArrayList<Food> search(int type, String searchWord);
}
