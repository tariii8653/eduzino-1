package com.edu.zino.model.admin;

import java.util.List;

import com.edu.zino.domain.Qnaboard;

public interface QnaboardService {
	public List selectAll();
	public Qnaboard select(int qnaboard_idx);
	public void insert(Qnaboard qnaboard);
	public void update(Qnaboard qnaboard);
	public void delete(int qnaboard_idx);
}
