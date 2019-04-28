package edu.ssafy.safefood.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.dto.Eat;
import edu.ssafy.safefood.repository.EatDAO;

@Service("EatServiceImpl")
public class EatServiceImpl implements EatService {
	@Autowired
	@Qualifier("EatDAOImpl")
	private EatDAO dao;

	@Override
	public ArrayList<Eat> getEat(String id) {
		try {
			return dao.getEat(id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean add(String id, Eat eat) {
		try {
			if (dao.add(id, eat)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean update(String id, Eat eat) {
		try {
			if (dao.update(id, eat)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean delete(String id, Eat eat) {
		try {
			if (dao.delete(id, eat)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

}