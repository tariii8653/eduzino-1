package com.edu.zino.exception;

public class ReviewException extends RuntimeException{
	public ReviewException(String msg) {
		super(msg);
	}
	
	public ReviewException(String msg, Throwable e) {
		super(msg, e);
	}
}