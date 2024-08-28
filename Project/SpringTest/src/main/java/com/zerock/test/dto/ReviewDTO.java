package com.zerock.test.dto;

import java.util.Date;

public class ReviewDTO {
	
	private int idx;
    private String id;          
    private int shopId;         
    private double rating;      
    private String content;     
    private Date reviewDate;
    private int other_shopid;
    private String other_shopImg;

   
    public ReviewDTO() {
    }

   
    public ReviewDTO(String id, int shopId, double rating, String content, Date reviewDate, int idx, int other_shopid, String other_shopImg) {
        this.id = id;
        this.shopId = shopId;
        this.rating = rating;
        this.content = content;
        this.reviewDate = reviewDate;
        this.idx = idx;
        this.other_shopid = other_shopid;
        this.other_shopImg = other_shopImg;
    }

    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public int getOther_shopid() {
		return other_shopid;
	}


	public void setOther_shopid(int other_shopid) {
		this.other_shopid = other_shopid;
	}


	public String getOther_shopImg() {
		return other_shopImg;
	}


	public void setOther_shopImg(String other_shopImg) {
		this.other_shopImg = other_shopImg;
	}




    
}
