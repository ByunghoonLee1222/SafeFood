package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.PageBean;

public interface EatService {
	public Eat search(String type, String condition);
	public List<Eat> searchAll(PageBean bean);
	public void add(Eat eat);
	public void remove(String no);
}
