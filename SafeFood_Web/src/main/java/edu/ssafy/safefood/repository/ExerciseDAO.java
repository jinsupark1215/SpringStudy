package edu.ssafy.safefood.repository;

import java.util.ArrayList;

import edu.ssafy.safefood.dto.Exercise;

public interface ExerciseDAO {
	public ArrayList<Exercise> getList() throws Exception;
}
