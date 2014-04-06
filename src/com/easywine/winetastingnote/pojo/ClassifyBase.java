package com.easywine.winetastingnote.pojo;

import java.io.Serializable;


/**
 * 
 *@company 父类
 *@ClassName ClassifyBase
 *@author mf-luozg 
 *@date 2014年3月8日下午12:25:50
 */
@SuppressWarnings("serial")
public class ClassifyBase implements Serializable{
	
	
	private Integer classify_id;
	private String classify_name;
	private String classify_ename;
	private Integer classify_type; 
	private Integer parent_id;
	private Integer level;
	
	public Integer getClassify_id() {
		return classify_id;
	}
	public void setClassify_id(Integer classify_id) {
		this.classify_id = classify_id;
	}
	public String getClassify_name() {
		return classify_name;
	}
	public void setClassify_name(String classify_name) {
		this.classify_name = classify_name;
	}
	public String getClassify_ename() {
		return classify_ename;
	}
	public void setClassify_ename(String classify_ename) {
		this.classify_ename = classify_ename;
	}
	public Integer getClassify_type() {
		return classify_type;
	}
	public void setClassify_type(Integer classify_type) {
		this.classify_type = classify_type;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
}
