package edu.ssafy.safefood.service;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Eat;
import edu.ssafy.safefood.dto.Food;

public interface EatService {
	/** 섭취리스트 가져오기 */
	public ArrayList<Eat> getEat(String id);

	/** 섭취정보 추가 */
	public boolean add(String id, int code, int count, String date);

	/** 섭취정보 수정 */
	public boolean update(String id, int code, int count, String date);

	/** 섭취정보 삭제 */
	public boolean delete(String id, int code, String date);
	
	public ArrayList<Eat> getDetail(String id, String start, String end);
	
	public ArrayList<Eat> bestEat(String start, String end);
	
	/** 현재 사용자에게 가장 적합한 음식 추천 */
	public ArrayList<Food> recommend(int kcal) throws Exception;
}