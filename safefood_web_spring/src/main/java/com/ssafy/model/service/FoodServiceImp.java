package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.FoodDAO;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodException;
import com.ssafy.model.dto.PageBean;
import com.ssafy.util.PageUtility;

@Service
public class FoodServiceImp implements FoodService {
	@Autowired
	private FoodDAO dao;
	
	private String[] allergys = new String[] {"대두","땅콩","우유","게","새우","참치","연어","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"};
	
	public FoodServiceImp() {};
		
	public FoodServiceImp(FoodDAO dao) {
		super();
		this.dao = dao;
	}

	public FoodDAO getDao() {
		return dao;
	}

	public void setDao(FoodDAO dao) {
		this.dao = dao;
	}

	public Food search(String type, String txt) {
		Food food = null;
		try {
			if(type.equals("name")) {
				food = dao.searchByName(txt);
			}else if(type.equals("meterial")) {
				food = dao.searchByMaterial(txt);
			}else if(type.equals("code")) {
				food = dao.searchByCode(txt);
			}
			if(food == null) {
				throw new FoodException("등록되지 않은 식품입니다.");
			}else {
		
			   return food;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	public List<Food> searchAll(PageBean bean) {
		
		try {
			int total = dao.count(bean);
			PageUtility bar = new PageUtility(bean.getInterval()
											, total
											, bean.getPageNo()
											, "/images/");
			bean.setPageLink(bar.getPageBar());
			return dao.searchAll(bean);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	public void add(Food food) {
		try {
			Food find = search("name", food.getName());
			if(find != null) {
				throw new FoodException("이미 등록된 식품입니다.");
			}else {
				dao.insert(food);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	public void update(Food food) {
		try {
			Food find = search("name", food.getName());
			if(find == null) {
				throw new FoodException("수정할 식품 정보가 없습니다.");
			}else {
				System.out.println(food.getName()+"업데이트 중");
				dao.update(food);
			}
		} catch (SQLException e) {
			throw new FoodException();
		}
	}

	public void remove(String code) {

	}
	
	@Override
	public String alerSearch(String content) {
		StringBuilder sb = new StringBuilder();
		char[] C = content.toCharArray();
		int CLength = C.length;
		
		for(String a : allergys) {
			char[] A = a.toCharArray();
			int ALength = A.length;
			int[] fail = new int[ALength];
			for (int i = 1,j=0; i < ALength; i++) {
				while(j>0 && A[i] !=A[j]) {
					j = fail[j-1];
				}
				if(A[i] == A[j]) fail[i] = ++j;
			}
			for( int i = 0,j = 0; i <CLength; i++) {
				while(j>0 && C[i] != A[j]) {
					j = fail[j-1];
				}
				if(C[i] == A[j]) {
					if(j == ALength-1) {
						if(sb.length() == 0)
							sb.append(a);
						else
							sb.append(","+a);
						break;
					}else {
						j++;
					}
				}
		}
		}
		return sb.toString();
	}

}
