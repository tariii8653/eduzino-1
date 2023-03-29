package com.edu.zino.exception;

public class MovieException extends RuntimeException{
	
	public MovieException(String msg) {
		super(msg);
	}
	
	public MovieException(String msg,Throwable e) {
		super(msg,e);
	}
}
