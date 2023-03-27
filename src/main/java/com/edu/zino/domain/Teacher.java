package com.edu.zino.domain;

import lombok.Data;

@Data
public class Teacher{
	private int teacher_idx;//강사번호
	
	private Member member;
}
