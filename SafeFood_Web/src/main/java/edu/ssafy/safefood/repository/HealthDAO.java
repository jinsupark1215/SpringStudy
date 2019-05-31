package edu.ssafy.safefood.repository;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Health;

public interface HealthDAO {
	public ArrayList<Health> getList();
	public ArrayList<Health> getListbyFood(String food);
	public ArrayList<Health> getListbyNumber(int num);
	public ArrayList<Health> getListBody();
	public ArrayList<Health> getListHealth();
	public ArrayList<Health> getListMental();
}
