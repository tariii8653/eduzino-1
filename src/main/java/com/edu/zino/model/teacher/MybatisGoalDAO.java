package com.edu.zino.model.teacher;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.Goal;
import com.edu.zino.domain.Subject;
import com.edu.zino.exception.GoalException;

@Repository
public class MybatisGoalDAO implements GoalDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(Goal goal) throws GoalException{
		int result = sqlSessionTemplate.insert("Goal.insert",goal);
		if(result < 1) {
			throw new GoalException("학습목표 등록 실패");
		}
	}

	@Override
	public List<Goal> selectAllBySubject(int subject_idx) {
		return sqlSessionTemplate.selectList("Goal.selectAllBySubject", subject_idx);
	}

	@Override
	public void deleteBySubject(int subject_idx) throws GoalException{
		int result = sqlSessionTemplate.insert("Goal.deleteBySubject",subject_idx);
	}

}
