package edu.ssafy.safefood.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.ssafy.safefood.dto.Exercise;
import edu.ssafy.safefood.repository.ExerciseDAO;

@Service("ExerciseServiceImpl")
public class ExerciseServiceImpl implements ExerciseService{
	@Autowired
	@Qualifier("ExerciseDAOImpl")
	private ExerciseDAO dao;
	
	@Override
	public ArrayList<Exercise> getList() {
		List<Exercise> list;
		try {
			list = dao.getList();
			return (ArrayList<Exercise>) list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}