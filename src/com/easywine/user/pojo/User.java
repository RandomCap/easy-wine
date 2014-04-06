package com.easywine.user.pojo;

import java.io.Serializable;
import java.util.Date;

import com.easywine.util.DateUtil;
import com.easywine.util.base.Constants;

/**
 * 
 *@company 
 *@ClassName User
 *@author mf-luozg 
 *@date 2014年3月10日下午11:12:52
 */
@SuppressWarnings("serial")
public class User implements Serializable{
	
	
	private Integer id;
	private String name;
	private Integer gender;
	private Date birthday;
	private Integer status;
	private Date create_date;
	private String phone;
	private String email;
	private Integer qq;
	private String login_name;
	
	private String str_birthday;
	private String str_create_date;
	
	
	
	public String getStr_birthday() {
		str_birthday = birthday==null?"":DateUtil.dateFormatString(birthday, Constants.YYMMDD);
		return str_birthday;
	}
	public String getStr_create_date() {
		str_create_date = create_date==null?"":DateUtil.dateFormatString(create_date, Constants.YYMMDD_HHmmss_24);
		return str_create_date;
	}
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
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getQq() {
		return qq;
	}
	public void setQq(Integer qq) {
		this.qq = qq;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
}
