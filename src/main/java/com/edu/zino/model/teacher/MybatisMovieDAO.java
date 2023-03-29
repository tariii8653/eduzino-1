package com.edu.zino.model.teacher;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.Movie;
import com.edu.zino.domain.Section;
import com.edu.zino.exception.MovieException;

@Repository
public class MybatisMovieDAO implements MovieDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(Movie movie) throws MovieException{
		int result = sqlSessionTemplate.insert("Movie.insert", movie);
		if(result<1) {
			throw new MovieException("커리큘럼 등록 실패");
		}
	}

	@Override
	public List<Movie> selectBySection(int section_idx) {
		return sqlSessionTemplate.selectList("Movie.selectBySection",section_idx);
	}

	@Override
	public void deleteBySection(List<Section> sectionList) {
		sqlSessionTemplate.delete("Movie.deleteBySection", sectionList);
	}
	

}
