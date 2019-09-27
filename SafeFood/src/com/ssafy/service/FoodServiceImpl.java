package com.ssafy.service;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import com.ssafy.dao.FoodDao;
import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public class FoodServiceImpl implements FoodService{
	private FoodDao dao;
	private String[] allergys={"대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"};

	public FoodServiceImpl() {
		 dao =new FoodDaoImpl();
	}
	public List<Food> searchAll(FoodPageBean bean) {
		try {
			return dao.searchAll(bean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	public Food search(int code) {
		//  code에  맞는 식품 정보를 검색하고, 검색된 식품의 원재료에 알레르기 성분이 있는지 확인하여 Food 정보에 입력한다.
		try {
			Food f = dao.search(code);
			String metarial = f.getMaterial();
			String alle = "";
			for (int i = 0; i < allergys.length; i++) {
				if (metarial.contains(allergys[i])) {
					alle += allergys[i] + " ";
				}
			}
			f.setAllergy(alle);
			return f;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	public List<Food> searchBest() {
		return dao.searchBest();
	}
	public List<Food> searchBestIndex() {
		return dao.searchBestIndex();
	}
}
