package com.zerock.test.dto;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ChatRoom4 {
	
	private int room_id;
	private String room_name;
	private int product_idx;
	private String seller_id;
	private String sender;
	private String room_stauts;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp created_at;
	
	private int shop_id;
	private String products_name;
	private String products_status;
	private int products_price;
	private String products_location;
	private String products_img1;
	private int like_count;
	private String shop_img;
	private String profileImg;
	
	private int idx;
	private String shop_owner;
	private String seller_shop_img;
	private String sender_shop_img;
	private String shop_name;
	
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getRoom_stauts() {
		return room_stauts;
	}
	public void setRoom_stauts(String room_stauts) {
		this.room_stauts = room_stauts;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public int getShop_id() {
		return shop_id;
	}
	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}
	public String getProducts_name() {
		return products_name;
	}
	public void setProducts_name(String products_name) {
		this.products_name = products_name;
	}
	public String getProducts_status() {
		return products_status;
	}
	public void setProducts_status(String products_status) {
		this.products_status = products_status;
	}
	public int getProducts_price() {
		return products_price;
	}
	public void setProducts_price(int products_price) {
		this.products_price = products_price;
	}
	public String getProducts_location() {
		return products_location;
	}
	public void setProducts_location(String products_location) {
		this.products_location = products_location;
	}
	public String getProducts_img1() {
		return products_img1;
	}
	public void setProducts_img1(String products_img1) {
		this.products_img1 = products_img1;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getShop_img() {
		return shop_img;
	}
	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getShop_owner() {
		return shop_owner;
	}
	public void setShop_owner(String shop_owner) {
		this.shop_owner = shop_owner;
	}
	public String getSeller_shop_img() {
		return seller_shop_img;
	}
	public void setSeller_shop_img(String seller_shop_img) {
		this.seller_shop_img = seller_shop_img;
	}
	public String getSender_shop_img() {
		return sender_shop_img;
	}
	public void setSender_shop_img(String sender_shop_img) {
		this.sender_shop_img = sender_shop_img;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	

}
