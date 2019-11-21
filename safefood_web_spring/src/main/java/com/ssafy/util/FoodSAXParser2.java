package com.ssafy.util;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.ssafy.model.dto.Food;;

public class FoodSAXParser2 {
	static class FoodHandler extends DefaultHandler{
		private Food food;
		private List<Food> foods;
		private String data;
		
		public FoodHandler() {
			foods = new ArrayList<Food>();
		}
		
		public List<Food> getFoods(){
			return foods;
		}
		
		public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
			if(qName.equals("item")) {
				food = new Food();
				foods.add(food);
			}
		}
		
		public void characters(char[] ch, int start, int length) throws SAXException {
			data = new String(ch, start, length);
		}
		
		public void endElement(String uri, String localName, String qName) throws SAXException {
			if(qName.equals("DESC_KOR")) {
				food.setName(data);
			}else if(qName.equals("SERVING_WT")) {
				food.setServing_wt(data);
			}else if(qName.equals("NUTR_CONT1")) {
				food.setNutr_cont1(data);
			}else if(qName.equals("NUTR_CONT2")) {
				food.setNutr_cont2(data);
			}else if(qName.equals("NUTR_CONT3")) {
				food.setNutr_cont3(data);
			}else if(qName.equals("NUTR_CONT4")) {
				food.setNutr_cont4(data);
			}else if(qName.equals("NUTR_CONT5")) {
				food.setNutr_cont5(data);
			}else if(qName.equals("NUTR_CONT6")) {
				food.setNutr_cont6(data);
			}else if(qName.equals("NUTR_CONT7")) {
				food.setNutr_cont7(data);
			}else if(qName.equals("NUTR_CONT8")) {
				food.setNutr_cont8(data);
			}else if(qName.equals("NUTR_CONT9")) {
				food.setNutr_cont9(data);
			}else if(qName.equals("BGN_YEAR")) {
				food.setBgn_year(Integer.parseInt(data));
			}else if(qName.equals("ANIMAL_PLANT")) {
				food.setAnimal_plant(data);
			}
		}
	}
	
	public static List<Food> getFoods(String url){
		try {
			SAXParserFactory fac = SAXParserFactory.newInstance();
			SAXParser parser = fac.newSAXParser();
			FoodHandler handler = new FoodHandler();
			parser.parse(url, handler );
			return handler.getFoods();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
