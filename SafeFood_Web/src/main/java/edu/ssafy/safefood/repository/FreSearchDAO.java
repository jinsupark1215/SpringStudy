package edu.ssafy.safefood.repository;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.FreSearch;

public interface FreSearchDAO {
	
	/** 자주 검색한 식품명 가져오기 */
	public ArrayList<FreSearch> getFreSearch();
	
	/** 멤버가 검색한 식품명들 조회수 추가 */
	public void add(String searchWord) throws Exception;
	
}
