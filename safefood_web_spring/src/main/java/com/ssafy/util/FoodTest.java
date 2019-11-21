//package com.ssafy.util;
//
//import java.util.List;
//
//import com.ssafy.model.dto.Food;
//import com.ssafy.model.service.FoodService;
//import com.ssafy.model.service.FoodServiceImp;
//
//public class FoodTest {
//
//	public static void main(String[] args) {
//		List<Food> foods = FoodSAXParser.getFoods("WebContent/data/foodInfo.xml");
//
//		FoodService foodService = new FoodServiceImp();
//		
//		// food 테이블에 파싱해서 넣기
//		for(Food temp : foods) {
//			foodService.add(temp);
//		}
//		
//		// food 테이블 아이템 조회
////		for(Food temp : foodService.searchAll()) {
////			System.out.println(temp);
////		}
//		
//		foods = FoodSAXParser2.getFoods("WebContent/data/FoodNutritionInfo.xml");
//		
//		for(Food temp : foods) {
//			System.out.println(temp);
//			foodService.update(temp);
//		}
//		
//	}
//
//}
