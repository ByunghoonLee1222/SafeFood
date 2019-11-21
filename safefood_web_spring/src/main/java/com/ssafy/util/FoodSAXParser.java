package com.ssafy.util;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.ssafy.model.dto.Food;;

public class FoodSAXParser {
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
			if(qName.equals("food")) {
				food = new Food();
				foods.add(food);
			}
		}
		
		public void characters(char[] ch, int start, int length) throws SAXException {
			data = new String(ch, start, length);
		}
		
		public void endElement(String uri, String localName, String qName) throws SAXException {
			if(qName.equals("name")) {
				food.setName(data);
			}else if(qName.equals("maker")) {
				food.setMaker(data);
			}else if(qName.equals("material")) {
				food.setMaterial(data);
			}else if(qName.equals("image")) {
				food.setImage(data);
			}else if(qName.equals("code")) {
				food.setCode(Integer.parseInt(data));
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
