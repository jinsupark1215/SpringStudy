package edu.ssafy.safefood.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.repository.ZZimDAO;

@Service("ZZimServiceImpl")
public class ZZimServiceImpl implements ZZimService {
	@Autowired
	private ZZimDAO zzimDAO;

	@Override
	public boolean addZZim(String id, int code) {
		try {
			zzimDAO.addZZim(id, code);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delZZim(String id, int code) {
		try {
			zzimDAO.delZZim(id, code);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Set<Integer> getZZimList(String id) {
		try {
			ArrayList<Integer> list = zzimDAO.getList(id);
			if(list == null) {
				return null;
			} else {
				Set<Integer> zzimList = new HashSet<Integer>();
				for(Integer i : list) {
					zzimList.add(i);
				}
				return zzimList;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
