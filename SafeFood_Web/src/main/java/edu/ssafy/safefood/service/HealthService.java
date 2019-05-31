package edu.ssafy.safefood.service;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Health;

public interface HealthService {
	public ArrayList<Health> getList();
	
	public ArrayList<Health> getListbyFood(String food);
	
	public ArrayList<Health> getListbyNumber(int num);
	public ArrayList<Health> getListBody();
	public ArrayList<Health> getListHealth();
	public ArrayList<Health> getListMental();
}
