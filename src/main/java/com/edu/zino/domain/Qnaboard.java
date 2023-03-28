package com.edu.zino.domain;

import lombok.Data;

@Data
public class Qnaboard {
	private int qnaboard_idx;
	private String qnaboard_title;
	private String qnaboard_content;
	private String qnaboard_regdate;
	private Target target;
	private Admin admin;
}
