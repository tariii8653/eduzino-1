package com.edu.zino.model.teacher;

import java.util.List;

import com.edu.zino.domain.Section;

public interface SectionDAO {
	public void insert(Section section);
	public List<Section> selectIndexBySubject(int subject_idx);
	public List<Section> selectBySubject(int subject_idx);
	public void deleteBySubject(int subject_idx);
}
