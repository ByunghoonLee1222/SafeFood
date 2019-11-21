package com.ssafy.model.dto;

public class FoodException extends RuntimeException {
	public FoodException() {
		super("음식 정보 처리 중 오류 발생");
	}
	public FoodException(String msg) {
		super(msg);
	}
}
