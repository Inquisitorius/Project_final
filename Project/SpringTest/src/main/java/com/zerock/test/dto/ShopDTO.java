package com.zerock.test.dto;


public class ShopDTO {
	private int shop_id;
	private String shop_owner;
	private String shop_name;
	private String shop_img;
	private double shop_star;
	private String shop_info;
	
	public ShopDTO() {}
	
	public ShopDTO(int shop_id, String shop_owner, String shop_name, String shop_img, double shop_star, String shop_info) {
		super();
		this.shop_id = shop_id;
		this.shop_name = shop_name;
		this.shop_img = shop_img;
		this.shop_star = shop_star;
		this.shop_info = shop_info;
	}

	public int getShop_id() {
		return shop_id;
	}

	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}

	public String getShop_owner() {
		return shop_owner;
	}

	public void setShop_owner(String shop_owner) {
		this.shop_owner = shop_owner;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_img() {
		return shop_img;
	}

	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}

	public double getShop_star() {
		return shop_star;
	}

	public void setShop_star(double shop_star) {
		this.shop_star = shop_star;
	}

	public String getShop_info() {
		return shop_info;
	}

	public void setShop_info(String shop_info) {
		this.shop_info = shop_info;
	}
}
