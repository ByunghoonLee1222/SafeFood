package com.ssafy.model.dto;

import java.io.Serializable;

public class Eat implements Serializable {
	private int no;
	private String id;
	private int code;
	private String order_date;
	private int amount;
	
	public Eat() {}

	public Eat(int no, String id, int code, String order_date, int amount) {
		super();
		this.no = no;
		this.id = id;
		this.code = code;
		this.order_date = order_date;
		this.amount = amount;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	
}
