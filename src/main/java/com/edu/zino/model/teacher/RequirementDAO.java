package com.edu.zino.model.teacher;


import java.util.List;

import com.edu.zino.domain.Requirement;
import com.edu.zino.domain.Subject;

public interface RequirementDAO {
	public void insert(Requirement requirement);
	public List<Requirement> selectAllBySubject(int subject_idx);
	public void deleteBySubject(int subject_idx);
}
