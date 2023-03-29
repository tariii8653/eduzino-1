package com.edu.zino.exception;

public class RequirementException extends RuntimeException{
	
	public RequirementException(String msg) {
		super(msg);
	}
	
	public RequirementException(String msg,Throwable e) {
		super(msg,e);
	}
}
