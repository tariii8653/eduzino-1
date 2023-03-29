package com.edu.zino.model.teacher;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.Section;
import com.edu.zino.exception.SectionException;

@Repository
public class MybatisSectionDAO implements SectionDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(Section section) throws SectionException{
		int result = sqlSessionTemplate.insert("Section.insert", section);
		if(result < 1) {
			throw new SectionException("섹션 등록 실패");
		}
	}
	
	@Override
	public List<Section> selectIndexBySubject(int subject_idx) {
		return sqlSessionTemplate.selectList("Section.selectIndexBySubject", subject_idx);
	}
	

	@Override
	public List<Section> selectBySubject(int subject_idx) {
		return sqlSessionTemplate.selectList("Section.selectBySubject", subject_idx);
	}

	@Override
	public void deleteBySubject(int subject_idx) {
		sqlSessionTemplate.delete("Section.deleteBySubject", subject_idx);
	}


}
