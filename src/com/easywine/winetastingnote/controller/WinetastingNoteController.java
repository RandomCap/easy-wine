package com.easywine.winetastingnote.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.easywine.project.pojo.Project;
import com.easywine.project.pojo.ProjectAttr;
import com.easywine.user.pojo.User;
import com.easywine.util.SessionUtil;
import com.easywine.util.base.TableBase;
import com.easywine.winetastingnote.pojo.Item;
import com.easywine.winetastingnote.pojo.Note;
import com.easywine.winetastingnote.service.BeSessionNoteService;
import com.easywine.winetastingnote.service.NoSessionNoteService;


@Controller
@RequestMapping("note")
public class WinetastingNoteController {
	
	
	@Resource(name="noSessionNoteService")
	private NoSessionNoteService noSessionNoteService;
	
	@Resource(name="beSessionNoteService")
	private BeSessionNoteService beSessionNoteService;
	
	
	
	@RequestMapping("addNoteIn")
	public ModelAndView addNoteIn( HttpServletRequest request , Model model , 
			Integer userId, String noteName , Integer isOpen , 
			@RequestParam(value="picName",required = false) CommonsMultipartFile picName){
		ModelMap modelMap = new ModelMap();
		try{
			beSessionNoteService.addNote( request, userId, noteName, isOpen , picName);
			modelMap.put("success", 1);
		}catch(Exception e){
			modelMap.put("success", 0);
			e.printStackTrace();
		}
		return new ModelAndView( new MappingJacksonJsonView(), modelMap );
	}
	
	/**
	 * 添加笔记页面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月19日下午11:56:19.
	 */
	@RequestMapping("addNote")
	public String addNotePage( HttpServletRequest request , Model model  ){
		User user = SessionUtil.getCurrenUser(request);
		model.addAttribute("userId", user.getId());
		return "frontviews/easywine/note/add-note";
	}
	
	/**
	 *  笔记元素  详细信息页面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月18日上午12:49:54.
	 */
	@RequestMapping("noteItemdetail")
	public String noteItemdetailPage( HttpServletRequest request , Model model , 
			Integer noteId, Integer itemId ){
		Project project = beSessionNoteService.findTestingwineNoteItemDetailByNoteAndItemId( noteId, itemId );
		model.addAttribute("project", project);
		model.addAttribute("noteId", noteId);
		return "frontviews/easywine/note/note-item-detail";
	}
	
	/**
	 *  瓶酒笔记 元素列表页面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月13日上午1:01:35.
	 */
	@RequestMapping("noteItemsList")
	public String noteItemListPage( HttpServletRequest request , Model model , Integer noteId ){
		User user = SessionUtil.getCurrenUser(request);
		List<Item> items = beSessionNoteService.findTestingwineNoteItemsByNoteId( noteId );
		if( items !=null && items.size() > 0 ){
			model.addAttribute("noteName", items.get(0).getNoteName());
		}
		model.addAttribute("noteId", noteId);
		model.addAttribute("user", user);
		model.addAttribute("items", items);
		return "frontviews/easywine/note/note-item-list";
	}
	
	/**
	 * 保存  瓶酒笔记 元素属性
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月9日上午1:00:00.
	 */
	@RequestMapping("saveTestwineNote")
	public String saveTestwineNote( HttpServletRequest request , Model model, ProjectAttr attr ){
		String msg = "";
		User user = SessionUtil.getCurrenUser(request);
		try{
			msg = beSessionNoteService.saveTestwineNote( user , attr );
		}catch(Exception e){
			model.addAttribute("msg", msg);
			e.printStackTrace();
		}
		return "redirect:/testing_note_items_"+attr.getNote_id()+".html";
	}
	
	/**
	 * 选着 香味 页面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月9日上午12:59:16.
	 */
	@RequestMapping("selectRelish")
	public String selectRelishPage( Model model ){
		List<TableBase> relishs = beSessionNoteService.selectRelishPage();
		model.addAttribute("relishs", relishs);
		return "frontviews/easywine/note/showselectrelish";
	}
	/**
	 * 选着 颜色 页面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月9日下午10:57:06.
	 */
	@RequestMapping("selectColour")
	public String selectColourPage( Model model ){
		List<TableBase> colours = beSessionNoteService.selectColourPage();
		model.addAttribute("colours", colours);
		return "frontviews/easywine/note/showselectcolour";
	}
	/**
	 * 
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月9日下午10:57:02.
	 */
	@RequestMapping("selectGrape")
	public String selectGrapePage( Model model ){
		List<TableBase> grapes = beSessionNoteService.selectGrapePage();
		model.addAttribute("grapes", grapes);
		return "frontviews/easywine/note/showselectgrape";
	}
	/**
	 * 选着 生产厂商 页面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月9日下午9:29:36.
	 */
	@RequestMapping("selectManufacturer")
	public String selectManufacturerPage( Model model ){
		List<TableBase> manufacturers = beSessionNoteService.findTableSelectManufacturer();
		model.addAttribute("manufacturers", manufacturers);
		return "frontviews/easywine/note/showselectmanufacturer";
	}
	
	/**
	 *  选着 国家地区页面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月9日下午9:29:18.
	 */
	@RequestMapping("selectArea")
	public String selectAreaPage( Model model ){
		List<TableBase> areas = beSessionNoteService.findTableSelectArea();
		model.addAttribute("areas", areas);
		return "frontviews/easywine/note/showselectarea";
	}
	
	/**
	 * 添加 品酒笔记的表单一面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月9日下午6:52:38.
	 */
	@RequestMapping("addNoteItem")
	public String wineTastingNotePage( Model model , Integer noteId){
		Map<String , Object> resMap = beSessionNoteService.findObjectFormSelectOption();
		model.addAttribute("noteId", noteId);
		model.addAttribute("resMap", resMap);
		return "frontviews/easywine/note/add-note-item";
	}
	
	/**
	 * 品酒笔记主页面
	 *@description 此方法描述的是：
	 *@author mf-luozg 
	 *@version 2014年3月12日上午1:00:44.
	 */
	@RequestMapping("main_note")
	public String mainNotePage( HttpServletRequest request , Model model , Integer menuId){
		User user = SessionUtil.getCurrenUser(request);
		List<Note> notes =new ArrayList<Note>();
		if( null != user ){
			notes = beSessionNoteService.findOwnAndAllVisibleTestingwineNote( user.getId() );
		}else{
			notes = noSessionNoteService.findAllVisibleTestingwineNote();
		}
		SessionUtil.setTemporaryVariable(request, "menuId", menuId);
		model.addAttribute("user", user);
		model.addAttribute("notes", notes);
		return "frontviews/easywine/note/main-note-list";
	}
}
