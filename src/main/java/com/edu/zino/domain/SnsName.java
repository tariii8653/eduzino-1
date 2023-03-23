package com.edu.zino.domain;

import lombok.Data;

@Data
public class SnsName {
	private int snsName_idx;
	private String snsType; //0:구글	1:네이버 2:카카오
}
