package com.edu.zino.model.teacher;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.Subject;
import com.edu.zino.exception.SubjectException;


@Repository
public class MybatisSubjectDAO implements SubjectDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAllByTeacher(int teacher_idx) {
		return sqlSessionTemplate.selectList("Subject.selectAllByTeacher", teacher_idx);
	}

	@Override
	public void insert(Subject subject) throws SubjectException{
		int result = sqlSessionTemplate.insert("Subject.insert",subject);
		if(result < 1) {
			throw new SubjectException("강의 생성 실패");
		}
	}

	@Override
	public void updateAddFile(Subject subject) throws SubjectException{
		int result = sqlSessionTemplate.update("Subject.updateAddFile", subject);
		if(result < 1) {
			throw new SubjectException("강의 생성 실패");
		}
	}

	@Override
	public Subject selectToDetail(int subject_idx) {
		return sqlSessionTemplate.selectOne("Subject.selectToDetail",subject_idx);
	}

	@Override
	public String selectFilename(int subject_idx) {
		return sqlSessionTemplate.selectOne("Subject.selectFilename",subject_idx);
	}

	@Override
	public List<Subject> selectAllByTeacherAccess(int teacher_idx) {
		return sqlSessionTemplate.selectList("Subject.selectAllByTeacherAccess", teacher_idx);
	}

	@Override
	public Subject select(int subject_idx) {
		return sqlSessionTemplate.selectOne("Subject.select",subject_idx);
	}
	


}
