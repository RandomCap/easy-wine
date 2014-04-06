package com.easywine.util.base;

import java.io.Serializable;

@SuppressWarnings("serial")
public class TableBase implements Serializable{
	
	private Integer id;
	private String name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
