package edu.ssafy.safefood.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.repository.ZZimDAO;

@Service("ZZimServiceImpl")
public class ZZimServiceImpl implements ZZimService {
	@Autowired
	private ZZimDAO zzimDAO;

	@Override
	public void addZZim(String id, int code) {
		// TODO Auto-generated method stub
		zzimDAO.addZZim(id, code);
	}

	@Override
	public void delZZim(String id, int code) {
		// TODO Auto-generated method stub
		zzimDAO.delZZim(id, code);
	}

	@Override
	public Set<Integer> getZZimList(String id) {
		// TODO Auto-generated method stub
//		return zzimDAO.getList(id);
		return null;
	}

}
