package edu.ssafy.safefood.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.dto.Health;
import edu.ssafy.safefood.repository.HealthDAO;

@Service("HealthServiceImpl")
public class HealthServiceImpl implements HealthService {

	@Autowired
	private HealthDAO hdao;
	
	@Override
	public ArrayList<Health> getList() {
		// TODO Auto-generated method stub
		try {
			return hdao.getList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<Health> getListbyFood(String food) {
		// TODO Auto-generated method stub
		return hdao.getListbyFood(food);
	}

	@Override
	public ArrayList<Health> getListbyNumber(int num) {
		// TODO Auto-generated method stub
		return hdao.getListbyNumber(num);
	}
	
	@Override
	public ArrayList<Health> getListBody() {
		// TODO Auto-generated method stub
		return hdao.getListBody();
	}

	@Override
	public ArrayList<Health> getListHealth() {
		// TODO Auto-generated method stub
		return hdao.getListHealth();
	}

	@Override
	public ArrayList<Health> getListMental() {
		// TODO Auto-generated method stub
		return hdao.getListMental();
	}

}
