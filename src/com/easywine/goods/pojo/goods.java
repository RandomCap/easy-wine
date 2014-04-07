package com.easywine.goods.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Description 商品表
 * @author sence
 *
 */
public class goods implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3848362724821336421L;
	private Integer goodsId;
	private String goodsName;
	private String goodsSn;
	private String goodsAdword;
	private String goodsPic;
	private String goodsDesc;
	private BigDecimal goodsPrice;
	private BigDecimal shopPrice;
	private BigDecimal goodsPromotionPrice;
	private int isSale;
	private long addTime;
	private long saleTime;
	private long lastModifyTime;
	private int viewNumber;
	private int categoryId;
	
	
	
	public goods() {

	}
	
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsSn() {
		return goodsSn;
	}
	public void setGoodsSn(String goodsSn) {
		this.goodsSn = goodsSn;
	}
	public String getGoodsAdword() {
		return goodsAdword;
	}
	public void setGoodsAdword(String goodsAdword) {
		this.goodsAdword = goodsAdword;
	}
	public String getGoodsPic() {
		return goodsPic;
	}
	public void setGoodsPic(String goodsPic) {
		this.goodsPic = goodsPic;
	}
	public String getGoodsDesc() {
		return goodsDesc;
	}
	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}
	public BigDecimal getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(BigDecimal goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public BigDecimal getShopPrice() {
		return shopPrice;
	}
	public void setShopPrice(BigDecimal shopPrice) {
		this.shopPrice = shopPrice;
	}
	public BigDecimal getGoodsPromotionPrice() {
		return goodsPromotionPrice;
	}
	public void setGoodsPromotionPrice(BigDecimal goodsPromotionPrice) {
		this.goodsPromotionPrice = goodsPromotionPrice;
	}
	public int getIsSale() {
		return isSale;
	}
	public void setIsSale(int isSale) {
		this.isSale = isSale;
	}
	public long getAddTime() {
		return addTime;
	}
	public void setAddTime(long addTime) {
		this.addTime = addTime;
	}
	public long getSaleTime() {
		return saleTime;
	}
	public void setSaleTime(long saleTime) {
		this.saleTime = saleTime;
	}
	public long getLastModifyTime() {
		return lastModifyTime;
	}
	public void setLastModifyTime(long lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}
	public int getViewNumber() {
		return viewNumber;
	}
	public void setViewNumber(int viewNumber) {
		this.viewNumber = viewNumber;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
	
	
	
	
}
