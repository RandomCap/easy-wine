package com.easywine.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.easywine.login.service.LoginService;
import com.easywine.user.pojo.User;
import com.easywine.util.SessionUtil;


@Controller
@RequestMapping("")
public class LoginController {
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@Required
	@RequestMapping("loginSys")
	public ModelAndView loginSys( HttpServletRequest request, HttpServletResponse response,
			String username, String userpwd){
		ModelMap modelMap = new ModelMap();
		try{
			User user = loginService.doLoginSys( username, userpwd );
			if( user !=null ){
				SessionUtil.setCurrentUser(request, response, user);
				modelMap.put("user", user);
				modelMap.put("success", 1);
			}else{
				modelMap.put("success", 0);
			}
		}catch(Exception e){
			modelMap.put("success", 0);
			e.printStackTrace();	
		}
		return new ModelAndView( new MappingJacksonJsonView(), modelMap );
	}
	
	//***********   注册    ********************
	
	@RequestMapping("validate/isUsernameEngaged")
	public ModelAndView isUsernameEngaged( String username ){
		ModelMap modelMap = new ModelMap();
		try{
			loginService.isUsernameEngaged( username );
			modelMap.put("success", 1);
		}catch(Exception e){
			modelMap.put("success", 0);
			e.printStackTrace();
		}
		return new ModelAndView( new MappingJacksonJsonView(), modelMap );
	}
	
	@RequestMapping("validate/isEmailEngaged")
	public ModelAndView isEmailEngaged( String email ){
		ModelMap modelMap = new ModelMap();
		try{
			loginService.isEmailEngaged( email );
			modelMap.put("success", 1);
		}catch(Exception e){
			modelMap.put("success", 0);
			e.printStackTrace();
		}
		return new ModelAndView( new MappingJacksonJsonView(), modelMap );
	}
	@RequestMapping("validate/isMobileEngaged")
	public ModelAndView isMobileEngaged( String mobile ){
		ModelMap modelMap = new ModelMap();
		try{
			loginService.isMobileEngaged( mobile );
			modelMap.put("success", 1);
		}catch(Exception e){
			modelMap.put("success", 0);
			e.printStackTrace();
		}
		return new ModelAndView( new MappingJacksonJsonView(), modelMap );
	}
	@RequestMapping("signin")
	public ModelAndView signin( HttpServletRequest request, HttpServletResponse response,
			User user, String loginpwd){
		ModelMap modelMap = new ModelMap();
		try{
			User u = loginService.signin( user , loginpwd);
			SessionUtil.setCurrentUser(request, response, u);
			modelMap.put("success", 1);
		}catch(Exception e){
			modelMap.put("success", 0);
			e.printStackTrace();
		}
		return new ModelAndView( new MappingJacksonJsonView(), modelMap );
	}
	
}
