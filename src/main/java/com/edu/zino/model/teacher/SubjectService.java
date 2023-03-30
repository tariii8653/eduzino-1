package com.edu.zino.model.teacher;

import java.util.List;
import java.util.Map;

import com.edu.zino.domain.Goal;
import com.edu.zino.domain.Requirement;
import com.edu.zino.domain.Section;
import com.edu.zino.domain.Subject;


public interface SubjectService {
	public List selectAllByTeacher(int teacher_idx);
	public void insert(Subject subject);
	
	/* 학습목표 및 요구사항 관련 */
	public Map<String,List> selectGoalAndRequirement(int subject_idx);
	public void regist(Subject subject);//goal-requirement의 regist
	public void update(Subject subject, String filePath);
	public Subject selectToDetail(int subject_idx);
	public List<Section> selectSection(int subject_idx);
	public void registSectionList(List<Section> sectionList);
	public List<Subject> selectAllByTeacherAccess(int teacher_idx);
	public Subject select(int subject_idx);
	public Subject selectSummary(int subject_idx);
	public void delete(int subject_idx);
	public void subjectRequest(int subject_idx);
	public void updateAccess(Subject subject);
	public Map<String, Object> selectAllAccessList(int page);
	public Map<String, Object> selectAllPermissionRequestList(int page);
	public void updatePermission(int subject_idx);
	public List<Subject> selectAllByTopCategory(int top_category_idx);
}
