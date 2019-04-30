package edu.ssafy.safefood.service;

import java.util.Set;

public interface ZZimService {
	public boolean addZZim(String id, int code);

	public boolean delZZim(String id, int code);

	public Set<Integer> getZZimList(String id);
}
