package com.edu.zino.domain;

import lombok.Data;

@Data
public class SubCategory {
	private int sub_category_idx;
	private String sub_name;//소분류명
	private MidCategory mid_category;//중분류
}
