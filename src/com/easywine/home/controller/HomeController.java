package com.easywine.home.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.easywine.home.service.HomeService;
import com.easywine.util.SessionUtil;

@Controller
@RequestMapping("")
public class HomeController {
	
	@Resource(name="homeService")
	private HomeService homeService;

	@RequestMapping("")
	public String portalPage( HttpServletRequest request,  HttpServletResponse response, 
			Model model ){
		model.addAttribute("menuId", 0);
		return "frontviews/easywine/portal";
	}
	
	@RequestMapping("exitSys")
	public String exitSysPortalPage( HttpServletRequest request,  HttpServletResponse response){
		SessionUtil.clearCurrentUser(request, response);
		return "redirect:/";
	}
	
	@RequestMapping("tosignin")
	public String signinPage( Model model , Integer menuId){
		model.addAttribute( "menuId", menuId );
		return "frontviews/easywine/sign-in";
	}
	
	@RequestMapping("aboutus")
	public String aboutusPage( Model model ){
//		List<Menu> list = homeService.findProjectMenuList();
//		model.addAttribute("menus", list);
		model.addAttribute("menu_index", 1);
		return "frontviews/easywine/about";
	}
	
	@RequestMapping("blog")
	public String blogPage( Model model ){
//		List<Menu> list = homeService.findProjectMenuList();
//		model.addAttribute("menus", list);
		model.addAttribute("menu_index", 3);
		return "frontviews/easywine/blog";
	}

	@RequestMapping("contact")
	public String contactPage( Model model ){
//		List<Menu> list = homeService.findProjectMenuList();
//		model.addAttribute("menus", list);
		model.addAttribute("menu_index", 4);
		return "frontviews/easywine/contact";
	}
	
	@RequestMapping("joinus")
	public String joinusPage( Model model ){
//		List<Menu> list = homeService.findProjectMenuList();
//		Map<String , Object> resMap = homeService.findAddProjectSelectOption();
//		model.addAttribute("menus", list);
//		model.addAttribute("resMap", resMap);
		model.addAttribute("menu_index", 5);
		return "frontviews/easywine/joinus";
	}
	
	/**
	 * 
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月4日上午1:39:49.
	 *@param type( 由 parent_id, current_type_id ， 如 ：2,6)
	 */
	@RequestMapping("object")
	public String objectPage( Model model, @RequestParam String type ){
//		List<Menu> list = homeService.findProjectMenuList();
//		model.addAttribute("menus", list);
		model.addAttribute("menu_index", 2);
		return "frontviews/easywine/object-list";
	}
	
	
}