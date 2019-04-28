package edu.ssafy.safefood.service;

import java.util.Set;

public interface ZZimService {
	public void addZZim(String id, int code);

	public void delZZim(String id, int code);

	public Set<Integer> getZZimList(String id);
}
