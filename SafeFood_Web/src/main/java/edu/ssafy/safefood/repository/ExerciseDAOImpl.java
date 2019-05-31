package edu.ssafy.safefood.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Exercise;

@Repository("ExerciseDAOImpl")
public class ExerciseDAOImpl implements ExerciseDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public ArrayList<Exercise> getList() throws Exception {
		List<Exercise> list = session.selectList("exeMap.selectList");
		return (ArrayList<Exercise>) list;
	}
}