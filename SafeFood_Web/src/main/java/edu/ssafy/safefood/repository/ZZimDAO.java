package edu.ssafy.safefood.repository;

import java.util.List;
import java.util.Set;

public interface ZZimDAO {
	public void addZZim(String id, int code);

	public void delZZim(String id, int code);

	public List<Integer> getList(String id);
}
