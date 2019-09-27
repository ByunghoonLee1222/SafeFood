package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.ssafy.util.DBUtil;
import com.ssafy.util.FoodSaxParser;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public class FoodDaoImpl implements FoodDao {

	public FoodDaoImpl() {
//		try {
//			loadData();
//		} catch (SQLException e) {
//
//			e.printStackTrace();
//		}

	}

	/**
	 * 식품 영양학 정보와 식품 정보를 xml 파일에서 읽어온다.
	 * 
	 * @throws SQLException
	 */
	public void loadData() throws SQLException {
		FoodSaxParser fsp = new FoodSaxParser();
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			con = DBUtil.getConnection();
			String sql = " insert into food(code,name,supportpereat,calory,carbo,protein"
					+ ",fat,sugar,natrium,chole,fattyacid,transfat,maker,material,img,allergy) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
			stmt = con.prepareStatement(sql);
			for (Food food : fsp.getFoods()) {
//				System.out.println(food);
				int idx = 1;
				stmt.setInt(idx++, food.getCode());
				stmt.setString(idx++, food.getName());
				stmt.setDouble(idx++, food.getSupportpereat());
				stmt.setDouble(idx++, food.getCalory());
				stmt.setDouble(idx++, food.getCarbo());
				stmt.setDouble(idx++, food.getProtein());
				stmt.setDouble(idx++, food.getFat());
				stmt.setDouble(idx++, food.getSugar());
				stmt.setDouble(idx++, food.getNatrium());
				stmt.setDouble(idx++, food.getChole());
				stmt.setDouble(idx++, food.getFattyacid());
				stmt.setDouble(idx++, food.getTransfat());
				stmt.setString(idx++, food.getMaker());
				stmt.setString(idx++, food.getMaterial());
				stmt.setString(idx++, food.getImg());
				stmt.setString(idx++, food.getAllergy());
				stmt.executeUpdate();
			}
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(con);
		}

		// FoodNutritionSaxPaser를 이용하여 Food 데이터들을 가져온다
		// 가져온 Food 리스트 데이터를 DB에 저장한다.

	}

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)의 개수를 반환. web에서 구현할 내용. web에서 페이징 처리시
	 * 필요
	 * 
	 * @param bean 검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 개수
	 * @throws SQLException
	 */
	public int foodCount(FoodPageBean bean) throws SQLException {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int cnt = 0;
		try {
			con = DBUtil.getConnection();
			String sql = " select * from food where " +bean.getKey()+ " like concat('%',?,'%')";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, bean.getWord());
			rs = stmt.executeQuery();
			if (rs.next()) {
				cnt++;
			}

		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(con);
		}
		return cnt;
	}

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)를 검색해서 반환.
	 * 
	 * @param bean 검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 * @throws SQLException
	 */
	public List<Food> searchAll(FoodPageBean bean) throws SQLException {
		List<Food> finds = new LinkedList<Food>();
		if (bean != null) {
			String key = bean.getKey();
			String word = bean.getWord();
			if (!key.equals("all") && word != null && !word.trim().equals("")) {

				Connection con = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				try {
					con = DBUtil.getConnection();
					String sql = " select * from food where " +bean.getKey()+ " like concat('%',?,'%')";
					stmt = con.prepareStatement(sql);
					int idx = 1;
					stmt.setString(idx++, word);
					rs = stmt.executeQuery();
					while (rs.next()) {
						finds.add(new Food(rs.getInt("code"), rs.getString("name"), rs.getDouble("supportpereat"),
								rs.getDouble("calory"), rs.getDouble("carbo"), rs.getDouble("protein"),
								rs.getDouble("fat"), rs.getDouble("sugar"), rs.getDouble("natrium"),
								rs.getDouble("chole"), rs.getDouble("fattyacid"), rs.getDouble("transfat"),
								rs.getString("maker"), rs.getString("material"), rs.getString("img"),
								rs.getString("allergy")));
					}
				} finally {
					DBUtil.close(rs);
					DBUtil.close(stmt);
					DBUtil.close(con);
				}
			} else if (key.equals("all") || word == "") {
				Connection con = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				try {
					con = DBUtil.getConnection();
					String sql = " select * from food";
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
					while (rs.next()) {
						finds.add(new Food(rs.getInt("code"), rs.getString("name"), rs.getDouble("supportpereat"),
								rs.getDouble("calory"), rs.getDouble("carbo"), rs.getDouble("protein"),
								rs.getDouble("fat"), rs.getDouble("sugar"), rs.getDouble("natrium"),
								rs.getDouble("chole"), rs.getDouble("fattyacid"), rs.getDouble("transfat"),
								rs.getString("maker"), rs.getString("material"), rs.getString("img"),
								rs.getString("allergy")));
					}
				} finally {
					DBUtil.close(rs);
					DBUtil.close(stmt);
					DBUtil.close(con);
				}
			}
		}
		return finds;
	}
	
	
	
	

	/**
	 * 식품 코드에 해당하는 식품정보를 검색해서 반환.
	 * 
	 * @param code 검색할 식품 코드
	 * @return 식품 코드에 해당하는 식품 정보, 없으면 null이 리턴됨
	 * @throws SQLException
	 */
	public Food search(int code) throws SQLException {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			String sql = " select * from food where code = ? ";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, code);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return new Food(rs.getInt("code"), rs.getString("name"), rs.getDouble("supportpereat"),
						rs.getDouble("calory"), rs.getDouble("carbo"), rs.getDouble("protein"), rs.getDouble("fat"),
						rs.getDouble("sugar"), rs.getDouble("natrium"), rs.getDouble("chole"),
						rs.getDouble("fattyacid"), rs.getDouble("transfat"), rs.getString("maker"),
						rs.getString("material"), rs.getString("img"), rs.getString("allergy"));
			}
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(con);
		}
		return null;
	}

	/**
	 * 가장 많이 검색한 Food 정보 리턴하기 web에서 구현할 내용.
	 * 
	 * @return
	 */
	public List<Food> searchBest() {
		return null;
	}

	public List<Food> searchBestIndex() {
		return null;
	}

	public static void main(String[] args) throws SQLException {
		FoodDaoImpl dao = new FoodDaoImpl();
		dao.loadData();
//		System.out.println(dao.search(1));
		System.out.println("===========================material로 검색=================================");
		print(dao.searchAll(new FoodPageBean("material", "감자전분", null, 0)));
		System.out.println("===========================maker로 검색=================================");
		print(dao.searchAll(new FoodPageBean("maker", "빙그레", null, 0)));
		System.out.println("===========================name으로 검색=================================");
		print(dao.searchAll(new FoodPageBean("name", "라면", null, 0)));
		System.out.println("============================================================");
		print(dao.searchAll(null));
		System.out.println("============================================================");
	}

	public static void print(List<Food> foods) {
		for (Food food : foods) {
			System.out.println(food);
		}
	}
}
