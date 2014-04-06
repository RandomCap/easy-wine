package com.easywine.winetastingnote.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ItemImg implements Serializable{

	
	
	private Integer photoId;
	private String photoUrl;
	private String photoName;
	private String photoDes;
	private Integer relationId;
	
	public Integer getPhotoId() {
		return photoId;
	}
	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getPhotoDes() {
		return photoDes;
	}
	public void setPhotoDes(String photoDes) {
		this.photoDes = photoDes;
	}
	public Integer getRelationId() {
		return relationId;
	}
	public void setRelationId(Integer relationId) {
		this.relationId = relationId;
	}
}
