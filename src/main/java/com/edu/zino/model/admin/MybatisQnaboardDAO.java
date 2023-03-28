package com.edu.zino.model.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.Qnaboard;
import com.edu.zino.exception.QnaboardException;

@Repository
public class MybatisQnaboardDAO implements QnaboardDAO{
	
		@Autowired
		private SqlSessionTemplate sqlSessionTemplate;
		
	@Override
	public List selectAll() {
	
		return sqlSessionTemplate.selectList("Qnaboard.selectAll");
	}

	@Override
	public Qnaboard select(int qnaboard_idx) {
	
		return sqlSessionTemplate.selectOne("Qnaboard.select",qnaboard_idx);
	}

	@Override
	public void insert(Qnaboard qnaboard) throws QnaboardException{
		int result=sqlSessionTemplate.insert("Qnaboard.insert",qnaboard);
		if(result<1) {
			throw new QnaboardException("qna 등록 실패");
		}
		
	}

	@Override
	public void update(Qnaboard qnaboard) throws QnaboardException{
		int result=sqlSessionTemplate.update("Qnaboard.update",qnaboard);
		if(result<1) {
			throw new QnaboardException("qna 수정 실패");
		}
		
	}

	@Override
	public void delete(int qnaboard_idx) throws QnaboardException{
		int result=sqlSessionTemplate.delete("Qnaboard.delete",qnaboard_idx);
		if(result<1) {
			throw new QnaboardException("qna 삭제 실패");
			
		}
		
	}

}
