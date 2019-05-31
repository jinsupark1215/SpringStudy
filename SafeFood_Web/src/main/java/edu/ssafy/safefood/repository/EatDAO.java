package edu.ssafy.safefood.repository;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Eat;
import edu.ssafy.safefood.dto.Food;

public interface EatDAO {
	/** 섭취리스트 가져오기 */
	public ArrayList<Eat> getEat(String id) throws Exception;
	
	/** 섭취정보 추가 */
	public void add(String id, Eat eat) throws Exception;
	
	/** 섭취정보 수정 */
	public void update(String id, Eat eat) throws Exception;
	
	/** 섭취정보 삭제 */
	public void delete(String id, Eat eat) throws Exception;
	
	/** 기간설정해서 섭취리스트 가져오기 */
	public ArrayList<Eat> getDetail(String id, String start, String end) throws Exception;
	
	/** 가장 많이 섭취된 음식의 리스트 */
	public ArrayList<Eat> bestEat(String start, String end) throws Exception;
	
	/** 현재 사용자에게 가장 적합한 음식 추천 */
	public ArrayList<Food> recommend(int kcal) throws Exception;
}
