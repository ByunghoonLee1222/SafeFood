package com.ssafy.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.PageBean;

@Mapper
public interface FoodDAO {
	public Food searchByName(String name)	throws SQLException;
	public Food searchByMaterial(String material)	throws SQLException;
	public Food searchByCode(String code)	throws SQLException;
	public List<Food> searchAll(PageBean bean)	throws SQLException;
	public void insert(Food food)		throws SQLException;
	public void update(Food food)	throws SQLException;
	public void delete(int code)	throws SQLException;
	public int count(PageBean bean) throws SQLException;
//	public void updatecount(String keyword, String name, int count)	throws SQLException;
}
