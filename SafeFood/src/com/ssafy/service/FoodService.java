package com.ssafy.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public interface FoodService {
	
	public List<Food> searchAll(FoodPageBean bean);
	public Food search(int code) throws SQLException;
	public List<Food> searchBest();
	public List<Food> searchBestIndex();	
}
