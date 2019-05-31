package edu.ssafy.safefood.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Health;

@Repository("HealthDAOImpl")
public class HealthDAOImpl implements HealthDAO {

	@Autowired
	private SqlSession session;

	@Override
	public ArrayList<Health> getList() {
		List<Health> list = session.selectList("health.selectList");
		return (ArrayList<Health>) list;
	}

	@Override
	public ArrayList<Health> getListbyFood(String food) {
		// TODO Auto-generated method stub
		List<Health> list = session.selectList("health.selectListfromFood", "%"+food+"%");
		return (ArrayList<Health>) list;
	}

	@Override
	public ArrayList<Health> getListbyNumber(int num) {
		List<Health> list = session.selectList("health.selectListbyNumber", num);
		return (ArrayList<Health>) list;
	}
	
	@Override
	public ArrayList<Health> getListBody() {
		List<Health> list = session.selectList("health.selectListbody");
		return (ArrayList<Health>) list;
	}
	@Override
	public ArrayList<Health> getListHealth() {
		List<Health> list = session.selectList("health.selectListhealth");
		return (ArrayList<Health>) list;
	}
	@Override
	public ArrayList<Health> getListMental() {
		List<Health> list = session.selectList("health.selectListmental");
		return (ArrayList<Health>) list;
	}

}
