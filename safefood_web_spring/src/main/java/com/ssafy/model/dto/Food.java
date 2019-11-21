package com.ssafy.model.dto;

import java.io.Serializable;

public class Food implements Serializable {
	private int code;
	private String name;
	private String maker;
	private String material;
	private String image;
	private String serving_wt;
	private String nutr_cont1;
	private String nutr_cont2;
	private String nutr_cont3;
	private String nutr_cont4;
	private String nutr_cont5;
	private String nutr_cont6;
	private String nutr_cont7;
	private String nutr_cont8;
	private String nutr_cont9;
	private int bgn_year;
	private String animal_plant;
	private int searchCnt;
	public Food() {}
	
	public Food(int code, String name, String maker, String material, String image, String serving_wt, String nutr_cont1,
			String nutr_cont2, String nutr_cont3, String nutr_cont4, String nutr_cont5, String nutr_cont6,
			String nutr_cont7, String nutr_cont8, String nutr_cont9, int bgn_year, String animal_plant) {
		super();
		this.code = code;
		this.name = name;
		this.maker = maker;
		this.material = material;
		this.image = image;
		this.serving_wt = serving_wt;
		this.nutr_cont1 = nutr_cont1;
		this.nutr_cont2 = nutr_cont2;
		this.nutr_cont3 = nutr_cont3;
		this.nutr_cont4 = nutr_cont4;
		this.nutr_cont5 = nutr_cont5;
		this.nutr_cont6 = nutr_cont6;
		this.nutr_cont7 = nutr_cont7;
		this.nutr_cont8 = nutr_cont8;
		this.nutr_cont9 = nutr_cont9;
		this.bgn_year = bgn_year;
		this.animal_plant = animal_plant;
	}
	
	public Food(String name, String maker, String material, String image, String serving_wt, String nutr_cont1,
			String nutr_cont2, String nutr_cont3, String nutr_cont4, String nutr_cont5, String nutr_cont6,
			String nutr_cont7, String nutr_cont8, String nutr_cont9, int bgn_year, String animal_plant) {
		super();
		this.name = name;
		this.maker = maker;
		this.material = material;
		this.image = image;
		this.serving_wt = serving_wt;
		this.nutr_cont1 = nutr_cont1;
		this.nutr_cont2 = nutr_cont2;
		this.nutr_cont3 = nutr_cont3;
		this.nutr_cont4 = nutr_cont4;
		this.nutr_cont5 = nutr_cont5;
		this.nutr_cont6 = nutr_cont6;
		this.nutr_cont7 = nutr_cont7;
		this.nutr_cont8 = nutr_cont8;
		this.nutr_cont9 = nutr_cont9;
		this.bgn_year = bgn_year;
		this.animal_plant = animal_plant;
	}

	
	public Food(int code, String name, String maker, String material, String image, String serving_wt,
			String nutr_cont1, String nutr_cont2, String nutr_cont3, String nutr_cont4, String nutr_cont5,
			String nutr_cont6, String nutr_cont7, String nutr_cont8, String nutr_cont9, int bgn_year,
			String animal_plant, int searchCnt) {
		super();
		this.code = code;
		this.name = name;
		this.maker = maker;
		this.material = material;
		this.image = image;
		this.serving_wt = serving_wt;
		this.nutr_cont1 = nutr_cont1;
		this.nutr_cont2 = nutr_cont2;
		this.nutr_cont3 = nutr_cont3;
		this.nutr_cont4 = nutr_cont4;
		this.nutr_cont5 = nutr_cont5;
		this.nutr_cont6 = nutr_cont6;
		this.nutr_cont7 = nutr_cont7;
		this.nutr_cont8 = nutr_cont8;
		this.nutr_cont9 = nutr_cont9;
		this.bgn_year = bgn_year;
		this.animal_plant = animal_plant;
		this.searchCnt = searchCnt;
	}

	public int getSearchCnt() {
		return searchCnt;
	}

	public void setSearchCnt(int searchCnt) {
		this.searchCnt = searchCnt;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getServing_wt() {
		return serving_wt;
	}

	public void setServing_wt(String serving_wt) {
		this.serving_wt = serving_wt;
	}

	public String getNutr_cont1() {
		return nutr_cont1;
	}

	public void setNutr_cont1(String nutr_cont1) {
		this.nutr_cont1 = nutr_cont1;
	}

	public String getNutr_cont2() {
		return nutr_cont2;
	}

	public void setNutr_cont2(String nutr_cont2) {
		this.nutr_cont2 = nutr_cont2;
	}

	public String getNutr_cont3() {
		return nutr_cont3;
	}

	public void setNutr_cont3(String nutr_cont3) {
		this.nutr_cont3 = nutr_cont3;
	}

	public String getNutr_cont4() {
		return nutr_cont4;
	}

	public void setNutr_cont4(String nutr_cont4) {
		this.nutr_cont4 = nutr_cont4;
	}

	public String getNutr_cont5() {
		return nutr_cont5;
	}

	public void setNutr_cont5(String nutr_cont5) {
		this.nutr_cont5 = nutr_cont5;
	}

	public String getNutr_cont6() {
		return nutr_cont6;
	}

	public void setNutr_cont6(String nutr_cont6) {
		this.nutr_cont6 = nutr_cont6;
	}

	public String getNutr_cont7() {
		return nutr_cont7;
	}

	public void setNutr_cont7(String nutr_cont7) {
		this.nutr_cont7 = nutr_cont7;
	}

	public String getNutr_cont8() {
		return nutr_cont8;
	}

	public void setNutr_cont8(String nutr_cont8) {
		this.nutr_cont8 = nutr_cont8;
	}

	public String getNutr_cont9() {
		return nutr_cont9;
	}

	public void setNutr_cont9(String nutr_cont9) {
		this.nutr_cont9 = nutr_cont9;
	}

	public int getBgn_year() {
		return bgn_year;
	}

	public void setBgn_year(int bgn_year) {
		this.bgn_year = bgn_year;
	}

	public String getAnimal_plant() {
		return animal_plant;
	}

	public void setAnimal_plant(String animal_plant) {
		this.animal_plant = animal_plant;
	}

	@Override
	public String toString() {
		return "Food [code=" + code + ", name=" + name + ", maker=" + maker + ", material=" + material + ", image="
				+ image + ", serving_wt=" + serving_wt + ", nutr_cont1=" + nutr_cont1 + ", nutr_cont2=" + nutr_cont2
				+ ", nutr_cont3=" + nutr_cont3 + ", nutr_cont4=" + nutr_cont4 + ", nutr_cont5=" + nutr_cont5
				+ ", nutr_cont6=" + nutr_cont6 + ", nutr_cont7=" + nutr_cont7 + ", nutr_cont8=" + nutr_cont8
				+ ", nutr_cont9=" + nutr_cont9 + ", bgn_year=" + bgn_year + ", animal_plant=" + animal_plant + "]";
	}
}
