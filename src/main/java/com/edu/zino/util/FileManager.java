package com.edu.zino.util;

import org.springframework.stereotype.Component;

@Component
public class FileManager {

	//주문번호 생성시 필요한 메서드
	public String getRealTime() {
		return Long.toString(System.currentTimeMillis());
	}
}
