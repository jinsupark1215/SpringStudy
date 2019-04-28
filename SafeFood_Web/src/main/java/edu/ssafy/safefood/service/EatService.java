package edu.ssafy.safefood.service;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Eat;

public interface EatService {
	/** 섭취리스트 가져오기 */
	public ArrayList<Eat> getEat(String id);

	/** 섭취정보 추가 */
	public boolean add(String id, Eat eat);

	/** 섭취정보 수정 */
	public boolean update(String id, Eat eat);

	/** 섭취정보 삭제 */
	public boolean delete(String id, Eat eat);
}