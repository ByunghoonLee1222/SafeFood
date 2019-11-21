package com.ssafy.model.service;

import java.util.List;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.PageBean;

public interface FoodService {
	public Food search(String type, String condition);
	public List<Food> searchAll(PageBean bean);
	public void add(Food food);
	public void update(Food food);
	public void remove(String code);
	public String alerSearch(String content);
}
