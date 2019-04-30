package edu.ssafy.safefood.repository;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Eat;

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
	
	public ArrayList<Eat> bestEat(String start, String end) throws Exception;
}
