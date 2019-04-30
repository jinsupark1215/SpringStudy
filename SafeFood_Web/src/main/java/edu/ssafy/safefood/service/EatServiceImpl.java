package edu.ssafy.safefood.service;

import java.util.ArrayList;
import java.util.List;

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
		List<Eat> list;
		try {
			list = dao.getEat(id);
			if (list.isEmpty()) {
				return null;
			} else {
				return (ArrayList<Eat>) list;
			}
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean add(String id, int code, int count, String date) {
		try {
			dao.add(id, new Eat(code, count, date));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean update(String id, int code, int count, String date) {
		try {
			dao.update(id, new Eat(code, count, date));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean delete(String id, int code, String date) {
		try {
			dao.delete(id, new Eat(code, date));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public ArrayList<Eat> getDetail(String id, String start, String end) {
		List<Eat> list;
		try {
			list = dao.getDetail(id, start, end);
			if (list.isEmpty()) {
				return null;
			} else {
				return (ArrayList<Eat>) list;
			}
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public ArrayList<Eat> bestEat(String start, String end) {
		List<Eat> list;
		try {
			list = dao.bestEat(start, end);
			if (list.isEmpty()) {
				return null;
			} else {
				return (ArrayList<Eat>) list;
			}
		} catch (Exception e) {
			return null;
		}
	}

}