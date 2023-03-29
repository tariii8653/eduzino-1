package com.edu.zino.model.teacher;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.Requirement;
import com.edu.zino.domain.Subject;
import com.edu.zino.exception.RequirementException;

@Repository
public class MybatisRequirementDAO implements RequirementDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(Requirement requirement) throws RequirementException{
		int result = sqlSessionTemplate.insert("Requirement.insert", requirement);
		if(result <1) {
			throw new RequirementException("요구사항 등록 실패");
		}
	}

	@Override
	public List<Requirement> selectAllBySubject(int subject_idx) {
		return sqlSessionTemplate.selectList("Requirement.selectAllBySubject", subject_idx);
	}

	@Override
	public void deleteBySubject(int subject_idx) throws RequirementException{
		sqlSessionTemplate.delete("Requirement.deleteBySubject", subject_idx);
	}

}
