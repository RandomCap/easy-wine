package com.easywine.category.pojo;

import java.io.Serializable;

public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2300812239464331019L;

	private Integer categoryId;
	private String categoryName;
	private String categorySn;
	private String categoryDesc;
	
	
	public Category() {
		
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategorySn() {
		return categorySn;
	}
	public void setCategorySn(String categorySn) {
		this.categorySn = categorySn;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	
	
	
}
