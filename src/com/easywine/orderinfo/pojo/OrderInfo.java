package com.easywine.orderinfo.pojo;

import java.io.Serializable;

public class OrderInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8698506823694838734L;
	private Integer orderInfoId;
	private Integer orderId;
	//添加时间，用户填写
	private long infoAddTime;
	private String orderInfoDesc;
	//信息产生时间，系统生成
	private long addTime;
	
	public OrderInfo() {

	}
	public Integer getOrderInfoId() {
		return orderInfoId;
	}
	public void setOrderInfoId(Integer orderInfoId) {
		this.orderInfoId = orderInfoId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public long getInfoAddTime() {
		return infoAddTime;
	}
	public void setInfoAddTime(long infoAddTime) {
		this.infoAddTime = infoAddTime;
	}
	public String getOrderInfoDesc() {
		return orderInfoDesc;
	}
	public void setOrderInfoDesc(String orderInfoDesc) {
		this.orderInfoDesc = orderInfoDesc;
	}
	public long getAddTime() {
		return addTime;
	}
	public void setAddTime(long addTime) {
		this.addTime = addTime;
	}

}
