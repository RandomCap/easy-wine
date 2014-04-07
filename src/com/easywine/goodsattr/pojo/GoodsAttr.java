package com.easywine.goodsattr.pojo;

import java.io.Serializable;
/**
 * 
 * @author sence
 *
 */
public class GoodsAttr implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6348943305651148862L;
	private Integer goodsAttrId;
	private String goodsAttrName;
	private String goodsAttrValue;
	private Integer goodsId;
	private String goodsAttrSn;
	private String goodsAttrUnit;
	
	public GoodsAttr() {

	}
	
	public Integer getGoodsAttrId() {
		return goodsAttrId;
	}
	public void setGoodsAttrId(Integer goodsAttrId) {
		this.goodsAttrId = goodsAttrId;
	}
	public String getGoodsAttrName() {
		return goodsAttrName;
	}
	public void setGoodsAttrName(String goodsAttrName) {
		this.goodsAttrName = goodsAttrName;
	}
	public String getGoodsAttrValue() {
		return goodsAttrValue;
	}
	public void setGoodsAttrValue(String goodsAttrValue) {
		this.goodsAttrValue = goodsAttrValue;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsAttrSn() {
		return goodsAttrSn;
	}
	public void setGoodsAttrSn(String goodsAttrSn) {
		this.goodsAttrSn = goodsAttrSn;
	}
	public String getGoodsAttrUnit() {
		return goodsAttrUnit;
	}
	public void setGoodsAttrUnit(String goodsAttrUnit) {
		this.goodsAttrUnit = goodsAttrUnit;
	}
	
	
	
}
