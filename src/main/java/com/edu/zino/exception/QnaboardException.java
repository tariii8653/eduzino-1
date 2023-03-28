package com.edu.zino.exception;

public class QnaboardException extends RuntimeException{
	
	public QnaboardException(String msg) {
		super(msg);
	}
	
	public QnaboardException(String msg,Throwable e) {
		super(msg,e);
	}
}
