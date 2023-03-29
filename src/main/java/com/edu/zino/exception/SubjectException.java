package com.edu.zino.exception;

public class SubjectException extends RuntimeException{
	
	public SubjectException(String msg) {
		super(msg);
	}
	
	public SubjectException(String msg,Throwable e) {
		super(msg,e);
	}
}
