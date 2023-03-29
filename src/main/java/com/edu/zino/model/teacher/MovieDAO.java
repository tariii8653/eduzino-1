package com.edu.zino.model.teacher;

import java.util.List;

import com.edu.zino.domain.Movie;
import com.edu.zino.domain.Section;

public interface MovieDAO {
	public void insert(Movie movie);
	public List<Movie> selectBySection(int section_idx);
	public void deleteBySection(List<Section> originList);

}
