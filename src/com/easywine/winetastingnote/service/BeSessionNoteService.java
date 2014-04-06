package com.easywine.winetastingnote.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.easywine.project.pojo.Project;
import com.easywine.project.pojo.ProjectAttr;
import com.easywine.user.pojo.User;
import com.easywine.util.base.TableBase;
import com.easywine.winetastingnote.dao.BeSessionNoteDao;
import com.easywine.winetastingnote.pojo.ClassifyBase;
import com.easywine.winetastingnote.pojo.Item;
import com.easywine.winetastingnote.pojo.ItemImg;
import com.easywine.winetastingnote.pojo.Note;
import com.easywine.winetastingnote.util.UpORDownLoadPicUtil;

@Service("beSessionNoteService")
public class BeSessionNoteService {
	
	@Autowired
	private BeSessionNoteDao beSessionNoteDao;

	public Map<String, Object> findObjectFormSelectOption() {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		List<ClassifyBase> clarities = beSessionNoteDao.findObjectAttrByTypeId( 4 );// 澄清度属性
		resMap.put("clarities", clarities);
		
		List<ClassifyBase> colorIntensities =  beSessionNoteDao.findObjectAttrByTypeId( 5 );// 颜色强度属性
		resMap.put("colorIntensities", colorIntensities);
		
		List<ClassifyBase> conditions =  beSessionNoteDao.findObjectAttrByTypeId( 6 );// 状态属性
		resMap.put("conditions", conditions);
		
		List<ClassifyBase> intensities =  beSessionNoteDao.findObjectAttrByTypeId( 7 );// 浓郁度属性
		resMap.put("intensities", intensities);
		
		List<ClassifyBase> sweetness =  beSessionNoteDao.findObjectAttrByTypeId( 8 );// 甜度属性
		resMap.put("sweetness", sweetness);
		
		List<ClassifyBase> acidities = beSessionNoteDao.findObjectAttrByTypeId( 9 );// 酸度属性
		resMap.put("acidities", acidities);
		
		List<ClassifyBase> tannins = beSessionNoteDao.findObjectAttrByTypeId( 10 );// 单宁属性
		resMap.put("tannins", tannins);
		
		List<ClassifyBase> bodies = beSessionNoteDao.findObjectAttrByTypeId( 11 );// 酒体属性
		resMap.put("bodies", bodies);
		
//		List<ClassifyBase> relishs = beSessionNoteDao.findObjectAttrByTypeId( 12 );// 香味，风味属性
//		resMap.put("relishs", relishs);
		
		List<ClassifyBase> aftertasts = beSessionNoteDao.findObjectAttrByTypeId( 13 );// 回味属性
		resMap.put("aftertasts", aftertasts);
		
		List<ClassifyBase> qualities = beSessionNoteDao.findObjectAttrByTypeId( 14 );// 品质属性
		resMap.put("qualities", qualities);
		
//		List<ClassifyBase> colours = beSessionNoteDao.findObjectAttrByTypeId( 15 );// 颜色属性
//		resMap.put("colours", colours);
		
		
		
		return resMap;
	}

	public List<TableBase> findTableSelectArea() {
		List<TableBase> lists = beSessionNoteDao.findTableSelectArea();
		return lists;
	}

	public List<TableBase> findTableSelectManufacturer() {
		List<TableBase> lists = beSessionNoteDao.findTableSelectManufacturer();
		return lists;
	}

	public List<TableBase> selectGrapePage() {
		List<TableBase> lists = beSessionNoteDao.selectGrapePage();
		return lists;
	}

	public List<TableBase> selectColourPage() {
		List<TableBase> lists = beSessionNoteDao.selectColourPage();
		return lists;
	}

	public List<TableBase> selectRelishPage() {
		List<TableBase> lists = beSessionNoteDao.selectRelishPage();
		return lists;
	}

	public String saveTestwineNote(User user, ProjectAttr attr) throws Exception {
		if( attr == null ){
			throw new Exception(" note info is not find  ");
		}
		try{
			if( attr.getManufacturer_id() ==null  ){
				Integer m_id = beSessionNoteDao.findManufacturerExist( attr.getManufacturer_name() );
				if( m_id == null ){
					Integer id = beSessionNoteDao.insertManufacturer( attr.getManufacturer_name() );
					attr.setManufacturer_id( id );
				}else{
					attr.setManufacturer_id(m_id);
				}
			}
			
			//添加  产品
			String psql = "INSERT INTO object( manufacturer_id, year, object_name, object_code, producing_area_id ) VALUES ( ?,?,?,?,? )";
			Integer project_id =  beSessionNoteDao.insertProject(  psql , attr );
			
			// 添加 笔记下的  酒种类
			String isql = "INSERT INTO note_project_relation( project_id, note_id ) VALUES ( ?, ? )";
			Integer relation_id =  beSessionNoteDao.insertTestwineNoteItem( isql, attr.getNote_id() , project_id );
			
			//添加  价钱
			if( null == attr.getPrice_visible_type() ){
				attr.setPrice_visible_type(0);
			}
			attr.setRelation_id(relation_id);
			String csql = "INSERT INTO price( price_cost, price_market, relation_id, type ) VALUES( ?, ?, ?, ? )";
			beSessionNoteDao.insetTestwineNoteItemPrice( csql ,  attr );
			
			//添加具体属性
			String asql = "INSERT INTO object_attribute( relation_id, grape_id, acidity_id, colour_id, aftertast_id, intensity_id, condition_id , body_id, relish_id, quality_id, tannin_id, sweetness_id, color_intensity_id, clarity_id , des , date ) "
					+ " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			beSessionNoteDao.insetTestwineNoteItemAttr( asql ,  attr );
		}catch(Exception e){
			throw new Exception( e.getMessage() );
		}
		return null;
	}

	public List<Note> findOwnAndAllVisibleTestingwineNote(Integer id) {
		return beSessionNoteDao.findOwnAndAllVisibleTestingwineNote( id );
	}

	public List<Item> findTestingwineNoteItemsByNoteId(Integer noteId) {
		return beSessionNoteDao.findTestingwineNoteItemsByNoteId( noteId );
	}

	public Project findTestingwineNoteItemDetailByNoteAndItemId(Integer noteId,
			Integer itemId) {
		String sql = "SELECT npr.relation_id AS relation_id, "+
							"o.object_code AS grape_code,"+
							"o.object_name AS wine_name,"+
							"m.manufacturer_name AS manufacturer_name,"+
							"CONCAT(gp.grape_name,\" : \",g.grape_name) AS grape_name,"+
							"o.`year` AS `year`,"+
							"oa.date AS date,"+
							"oa.des AS des,"+
							"pc.price_cost AS price_cost,"+
							"pc.price_market AS price_market,"+
							"pc.type AS price_visible_type,"+
							"c1.classify_name AS acidityName,"+
							"c2.classify_name AS aftertastName,"+
							"c3.classify_name AS intensityName,"+
							"c4.classify_name AS conditionName,"+
							"c5.classify_name AS bodyName,"+
							"c7.classify_name AS qualityName,"+
							"c8.classify_name AS tanninName,"+
							"c9.classify_name AS sweetnessName,"+
							"c10.classify_name AS colorIntensityName,"+
							"c11.classify_name AS clarityName,"+
							"CONCAT(c12p.classify_name,\" : \",c12.classify_name) AS colourName,"+
							"CONCAT(c13p.classify_name,\" : \",c13.classify_name) AS relishName "+
							"FROM note_project_relation npr "+
							"LEFT JOIN object o ON npr.project_id = o.object_id "+
							"LEFT JOIN note n ON n.note_id = npr.note_id "+
							"LEFT JOIN manufacturer m ON m.manufacturer_id = o.manufacturer_id "+
							"LEFT JOIN producing_area pa ON o.producing_area_id = pa.producing_area_id "+
							"LEFT JOIN producing_area paa ON pa.parent_id = paa.producing_area_id "+
							"LEFT JOIN object_attribute oa ON npr.relation_id = oa.relation_id AND oa.data_type = 0 "+
							"LEFT JOIN grape g ON oa.grape_id = g.grape_id "+
							"LEFT JOIN grape gp ON g.parent_id = gp.grape_id "+
							"LEFT JOIN classify_and_attribute c1 ON oa.acidity_id = c1.classify_id "+
							"LEFT JOIN classify_and_attribute c2 ON oa.aftertast_id = c2.classify_id "+
							"LEFT JOIN classify_and_attribute c3 ON oa.intensity_id = c3.classify_id "+
							"LEFT JOIN classify_and_attribute c4 ON oa.condition_id = c4.classify_id "+
							"LEFT JOIN classify_and_attribute c5 ON oa.body_id = c5.classify_id "+
							"LEFT JOIN classify_and_attribute c7 ON oa.quality_id = c7.classify_id "+
							"LEFT JOIN classify_and_attribute c8 ON oa.tannin_id = c8.classify_id "+
							"LEFT JOIN classify_and_attribute c9 ON oa.sweetness_id = c9.classify_id "+
							"LEFT JOIN classify_and_attribute c10 ON oa.color_intensity_id = c10.classify_id "+
							"LEFT JOIN classify_and_attribute c11 ON oa.clarity_id = c11.classify_id "+
							"LEFT JOIN classify_and_attribute c12 ON oa.colour_id = c12.classify_id "+
							"LEFT JOIN classify_and_attribute c12p ON c12.parent_id = c12p.classify_id "+
							"LEFT JOIN classify_and_attribute c13 ON oa.relish_id = c13.classify_id "+
							"LEFT JOIN classify_and_attribute c13p ON c13.parent_id = c13p.classify_id "+
							"LEFT JOIN price pc ON npr.relation_id = pc.relation_id AND pc.data_type = 0 "+
							"WHERE npr.note_id = "+noteId+" AND npr.project_id = "+itemId;
		return beSessionNoteDao.findTestingwineNoteItemDetailByNoteAndItemId( sql );
	}

	public void addNote( HttpServletRequest request, Integer userId, String noteName, Integer isOpen,
			CommonsMultipartFile picName) {
		String  sql = "INSERT INTO note ( note_title, create_date, type ) VALUES( ?, CURRENT_DATE , ? )";
		Integer id = beSessionNoteDao.addMote( sql, userId,  noteName , isOpen );
		ItemImg img = UpORDownLoadPicUtil.uploadImg(request, picName, "photo", id);
		String isql = "INSERT INTO photo( relation_id, photo_url, photo_name ) VALUES ( ?, ?, ? )";
		beSessionNoteDao.addNoteCoverPhoto( isql , img );
	}

}












