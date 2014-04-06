package com.easywine.login.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easywine.login.dao.LoginDao;
import com.easywine.user.pojo.User;
import com.easywine.util.MD5Util;


@Service("loginService")
public class LoginService {
	
	@Autowired
	private LoginDao loginDao;

	public User doLoginSys(String username, String userpwd) throws Exception {
		if( username ==null || userpwd == null){
			throw new Exception(" username or userpwd is not find ");
		}
		String sql = "SELECT * FROM `user` WHERE (login_name = \""+username.trim()+"\" OR email = \""+username.trim()+"\" OR phone = \""+username.trim()+"\") AND `status` = 0  AND login_pwd = \"" +MD5Util.getStringMD5(userpwd)+"\"";
		try{
			User user = loginDao.findUserByLoginnameOrEmailAndPwd( sql );
			return user;
		}catch(Exception e){
			throw new Exception( e.getMessage() );
		}
	}

	public void isUsernameEngaged(String username)throws Exception{
		String sql = "SELECT id FROM `user` WHERE `name` = '"+username+"' AND `status` = 0";
		List<Integer> us = loginDao.findUserByNameOrEmailOrPhone( sql );
		if( us != null && us.size() > 0){
			throw new Exception(" the username is usered ");
		}
	}

	public void isEmailEngaged(String email)throws Exception {
		String sql = "SELECT id FROM `user` WHERE email = '"+email+"' AND `status` = 0";
		List<Integer> us = loginDao.findUserByNameOrEmailOrPhone( sql );
		if( us != null && us.size() > 0){
			throw new Exception(" the username is usered ");
		}
	}

	public void isMobileEngaged(String mobile)throws Exception {
		String sql = "SELECT id FROM `user` WHERE phone = '"+mobile+"' AND `status` = 0";
		List<Integer> us = loginDao.findUserByNameOrEmailOrPhone( sql );
		if( us != null && us.size() > 0){
			throw new Exception(" the username is usered ");
		}
	}

	public User signin(User user, String loginpwd) {
		user.setCreate_date(new Date());
		user.setStatus(0);
		user.setGender( 0 );
		String sql = "INSERT INTO `user`( name, gender, status, create_date , phone , email , login_name, login_pwd ) "
				+ "VALUES(?,?,?, CONCAT(CURRENT_DATE , \" \", CURRENT_TIME ) ,?,?,?,?)";
		Integer id = loginDao.insertNewUser( sql , user , MD5Util.getStringMD5(loginpwd) );
		user.setId(id);
		return user;
	}

}
