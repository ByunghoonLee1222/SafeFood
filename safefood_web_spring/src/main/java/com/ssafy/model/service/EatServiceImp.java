package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.EatDAO;
import com.ssafy.model.dao.FoodDAO;
import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.EatException;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodException;
import com.ssafy.model.dto.PageBean;
import com.ssafy.util.PageUtility;

@Service
public class EatServiceImp implements EatService {
	@Autowired
	private EatDAO dao;
	
	public EatServiceImp() {};
		
	public EatServiceImp(EatDAO dao) {
		super();
		this.dao = dao;
	}

	public EatDAO getDao() {
		return dao;
	}

	public void setDao(EatDAO dao) {
		this.dao = dao;
	}

	public Eat search(String type, String txt) {
		Eat eat = null;
		try {
			if(type.equals("name")) {
				eat = dao.searchById(txt);
			}else if(type.equals("meterial")) {
				eat = dao.searchByMaterial(txt);
			}else if(type.equals("code")) {
				eat = dao.searchByCode(txt);
			}
			if(eat == null) {
				throw new EatException("등록되지 않은 식품입니다.");
			}else {
			   return eat;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new EatException();
		}
	}

	public List<Eat> searchAll(PageBean bean) {
		
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
			throw new EatException();
		}
	}

	public void add(Eat eat) {
		try {
			dao.insert(eat);

		} catch (SQLException e) {
			e.printStackTrace();
			throw new EatException();
		}
	}

	public void remove(String no) {
		try {
			dao.delete(Integer.parseInt(no));
		} catch (Exception e) {
			e.printStackTrace();
			throw new EatException("섭취 삭제 중 오류 발생");
		}
	}

}
