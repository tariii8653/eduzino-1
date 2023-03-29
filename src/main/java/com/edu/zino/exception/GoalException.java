package com.edu.zino.exception;

public class GoalException extends RuntimeException{
	
	public GoalException(String msg) {
		super(msg);
	}
	
	public GoalException(String msg,Throwable e) {
		super(msg,e);
	}
}
