package com.edu.zino.exception;

public class SectionException extends RuntimeException{
	
	public SectionException(String msg) {
		super(msg);
	}
	
	public SectionException(String msg,Throwable e) {
		super(msg,e);
	}
}
