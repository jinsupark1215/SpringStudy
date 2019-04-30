package edu.ssafy.safefood.repository;

import java.util.ArrayList;

public interface ZZimDAO {
	public void addZZim(String id, int code) throws Exception;

	public void delZZim(String id, int code) throws Exception;

	public ArrayList<Integer> getList(String id) throws Exception;
}
