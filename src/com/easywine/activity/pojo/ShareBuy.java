package com.easywine.activity.pojo;

import java.math.BigDecimal;

public class ShareBuy extends Activitiy{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7755377828540634731L;
	private BigDecimal bookingPrice;
	private BigDecimal actualPrice;
	private int minBuyNum;
	private int maxBuyNum;
	private int effectiveNum;
	private int activityGoodsNum;
	
	public ShareBuy() {

	}
	public BigDecimal getBookingPrice() {
		return bookingPrice;
	}
	public void setBookingPrice(BigDecimal bookingPrice) {
		this.bookingPrice = bookingPrice;
	}
	public BigDecimal getActualPrice() {
		return actualPrice;
	}
	public void setActualPrice(BigDecimal actualPrice) {
		this.actualPrice = actualPrice;
	}
	public int getMinBuyNum() {
		return minBuyNum;
	}
	public void setMinBuyNum(int minBuyNum) {
		this.minBuyNum = minBuyNum;
	}
	public int getMaxBuyNum() {
		return maxBuyNum;
	}
	public void setMaxBuyNum(int maxBuyNum) {
		this.maxBuyNum = maxBuyNum;
	}
	public int getEffectiveNum() {
		return effectiveNum;
	}
	public void setEffectiveNum(int effectiveNum) {
		this.effectiveNum = effectiveNum;
	}
	public int getActivityGoodsNum() {
		return activityGoodsNum;
	}
	public void setActivityGoodsNum(int activityGoodsNum) {
		this.activityGoodsNum = activityGoodsNum;
	}
	
	
	
	
}
