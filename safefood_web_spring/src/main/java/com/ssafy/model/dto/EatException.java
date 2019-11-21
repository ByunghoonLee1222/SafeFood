package com.ssafy.model.dto;

public class EatException extends RuntimeException {
	public EatException() {
		super("섭취 정보 처리 중 오류 발생");
	}
	public EatException(String msg) {
		super(msg);
	}
}
