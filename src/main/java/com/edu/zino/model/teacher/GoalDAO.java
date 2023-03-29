package com.edu.zino.model.teacher;

import java.util.List;

import com.edu.zino.domain.Goal;
import com.edu.zino.domain.Subject;

public interface GoalDAO {
	public void insert(Goal goal);
	public List<Goal> selectAllBySubject(int subject_idx);
	public void deleteBySubject(int subject_idx);
}
