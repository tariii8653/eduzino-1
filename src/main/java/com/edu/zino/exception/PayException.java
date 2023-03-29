package com.edu.zino.exception;

public class PayException extends RuntimeException{
	
	public PayException(String msg) {
		super(msg);
	}
	public PayException(String msg, Throwable e) {
		super(msg,e);
	}
}
