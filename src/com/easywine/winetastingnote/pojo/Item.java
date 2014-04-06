package com.easywine.winetastingnote.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Item implements Serializable{

	private Integer itemId;
	private Integer noteId;
	private String noteName;
	private String itemName;
	private String crateDate;
	private String des;
	private String itemArea;
	private String itemManufacturer;
	
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public Integer getNoteId() {
		return noteId;
	}
	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}
	public String getNoteName() {
		return noteName;
	}
	public void setNoteName(String noteName) {
		this.noteName = noteName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getCrateDate() {
		return crateDate;
	}
	public void setCrateDate(String crateDate) {
		this.crateDate = crateDate;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getItemArea() {
		return itemArea;
	}
	public void setItemArea(String itemArea) {
		this.itemArea = itemArea;
	}
	public String getItemManufacturer() {
		return itemManufacturer;
	}
	public void setItemManufacturer(String itemManufacturer) {
		this.itemManufacturer = itemManufacturer;
	}
	
}
