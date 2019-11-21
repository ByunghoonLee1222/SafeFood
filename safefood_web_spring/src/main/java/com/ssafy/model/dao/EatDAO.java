package com.ssafy.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.PageBean;

@Mapper
public interface EatDAO {
	public Eat searchById(String id)	throws SQLException;
	public Eat searchByMaterial(String material)	throws SQLException;
	public Eat searchByCode(String code)	throws SQLException;
	public List<Eat> searchAll(PageBean bean)	throws SQLException;
	public void insert(Eat eat)		throws SQLException;
	public void update(Eat eat)	throws SQLException;
	public void delete(int no)	throws SQLException;
	public int count(PageBean bean) throws SQLException;
}
