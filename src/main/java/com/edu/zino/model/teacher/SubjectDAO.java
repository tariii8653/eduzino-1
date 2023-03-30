package com.edu.zino.model.teacher;

import java.util.List;
import java.util.Map;

import com.edu.zino.domain.Subject;

public interface SubjectDAO {
	public List selectAllByTeacher(int teacher_idx);
	public void insert(Subject subject);
	public void updateAddFile(Subject subject);
	public Subject selectToDetail(int subject_idx);
	public String selectFilename(int subject_idx);
	public List<Subject> selectAllByTeacherAccess(int teacher_idx);
	public Subject select(int subject_idx);
	public Subject selectSummary(int subject_idx);
	public void delete(int subject_idx);
	public void subjectRequest(int subject_idx);
	public void updateAccess(Subject subject);
	public List<Subject> selectAllAccessList(Map<String, Object> map);
	public int selectAllAccessRecoard();
	public List<Subject> selectAllPermissionRequestList(Map<String, Object> map);
	public void updatePermission(int subject_idx);
	public List<Subject> selectAllByTopCategory(int top_category_idx);
	public void updatePermissionReject(int subject_idx);
}
