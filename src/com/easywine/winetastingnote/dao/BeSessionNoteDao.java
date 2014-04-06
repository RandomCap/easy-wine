package com.easywine.winetastingnote.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.easywine.project.pojo.Project;
import com.easywine.project.pojo.ProjectAttr;
import com.easywine.util.base.TableBase;
import com.easywine.winetastingnote.pojo.ClassifyBase;
import com.easywine.winetastingnote.pojo.Item;
import com.easywine.winetastingnote.pojo.ItemImg;
import com.easywine.winetastingnote.pojo.Note;
import com.mysql.jdbc.Statement;

@Repository("beSessionNoteDao")
public class BeSessionNoteDao {
	
	@Autowired
	private JdbcTemplate obectAttrjdbcTemplate;

	public List<ClassifyBase> findObjectAttrByTypeId( int type ) {
		List<ClassifyBase> lists = new ArrayList<ClassifyBase>();
		String sql = "SELECT css.* FROM classify_and_attribute  cs "
				+ "LEFT JOIN classify_and_attribute css ON cs.classify_id = css.parent_id "
				+ "WHERE cs.classify_type = "+type;
		lists = obectAttrjdbcTemplate.query(sql, new RowMapper<ClassifyBase>(){

			public ClassifyBase mapRow(ResultSet res, int arg1)
					throws SQLException {
				ClassifyBase base = new ClassifyBase();
				base.setClassify_id(res.getInt("classify_id"));
				base.setClassify_name(res.getString("classify_name"));
				base.setClassify_ename(res.getString("classify_ename"));
				base.setParent_id(res.getInt("parent_id"));
				return base;
			}
			
		});
		
		return lists;
	}

	public List<TableBase> findTableSelectArea() {
		List<TableBase> lists = new ArrayList<TableBase>();
		String sql = "SELECT pa.producing_area_id AS id, CONCAT(paa.producing_area_name,\" : \",pa.producing_area_name) AS name FROM producing_area pa LEFT JOIN producing_area paa ON pa.parent_id = paa.producing_area_id WHERE pa.parent_id != 0 ORDER BY pa.parent_id ";
		lists = obectAttrjdbcTemplate.query(sql, new RowMapper<TableBase>(){

			public TableBase mapRow(ResultSet res, int arg1)
					throws SQLException {
				TableBase base = new TableBase();
				base.setId(res.getInt("id"));
				base.setName(res.getString("name"));
				return base;
			}
			
		});
		
		return lists;
	}

	public List<TableBase> findTableSelectManufacturer() {
		List<TableBase> lists = new ArrayList<TableBase>();
		String sql = "SELECT * FROM manufacturer";
		lists = obectAttrjdbcTemplate.query(sql, new RowMapper<TableBase>(){

			public TableBase mapRow(ResultSet res, int arg1)
					throws SQLException {
				TableBase base = new TableBase();
				base.setId(res.getInt("manufacturer_id"));
				base.setName(res.getString("manufacturer_name"));
				return base;
			}});
		return lists;
	}

	public List<TableBase> selectGrapePage() {
		List<TableBase> lists = new ArrayList<TableBase>();
		String sql = "SELECT g.grape_id AS id, CONCAT(ge.grape_name,\" : \", g.grape_name) AS name FROM grape g LEFT JOIN grape ge ON g.parent_id = ge.grape_id WHERE g.parent_id != 0 ORDER BY g.parent_id ";
		lists = obectAttrjdbcTemplate.query(sql, new RowMapper<TableBase>(){

			public TableBase mapRow(ResultSet res, int arg1)
					throws SQLException {
				TableBase base = new TableBase();
				base.setId(res.getInt("id"));
				base.setName(res.getString("name"));
				return base;
			}
		});
		return lists;
	}

	public List<TableBase> selectColourPage() {
		List<TableBase> lists = new ArrayList<TableBase>();
		String sql = "SELECT ca.classify_id AS id , CONCAT(caa.classify_name , \" : \" , ca.classify_name) AS name FROM classify_and_attribute ca LEFT JOIN classify_and_attribute caa ON ca.parent_id = caa.classify_id LEFT JOIN classify_and_attribute caaa ON caaa.classify_id = caa.parent_id WHERE caaa.classify_type = 15 ORDER BY ca.parent_id ";
		lists = obectAttrjdbcTemplate.query(sql, new RowMapper<TableBase>(){

			public TableBase mapRow(ResultSet res, int arg1)
					throws SQLException {
				TableBase base = new TableBase();
				base.setId(res.getInt("id"));
				base.setName(res.getString("name"));
				return base;
			}
		});
		return lists;
	}

	public List<TableBase> selectRelishPage() {
		List<TableBase> lists = new ArrayList<TableBase>();
		String sql = "SELECT ca.classify_id AS id , CONCAT(caa.classify_name , \" : \" , ca.classify_name) AS name FROM classify_and_attribute ca LEFT JOIN classify_and_attribute caa ON ca.parent_id = caa.classify_id LEFT JOIN classify_and_attribute caaa ON caaa.classify_id = caa.parent_id WHERE caaa.classify_type = 12 ORDER BY ca.parent_id ";
		lists = obectAttrjdbcTemplate.query(sql, new RowMapper<TableBase>(){

			public TableBase mapRow(ResultSet res, int arg1)
					throws SQLException {
				TableBase base = new TableBase();
				base.setId(res.getInt("id"));
				base.setName(res.getString("name"));
				return base;
			}
		});
		return lists;
	}

	public Integer findManufacturerExist(String name) {
		List<Integer> ids = null;
		String sql = "SELECT manufacturer_id FROM manufacturer WHERE manufacturer_name =  ' " + name+" ' " ;
		ids = obectAttrjdbcTemplate.queryForList( sql, Integer.class );
		if( ids == null  || ids.size() < 1){
			return null;
		}else{
			return ids.get(0);
		}
		
	}

	public Integer insertManufacturer(final String name) {
		final String sql = "INSERT INTO manufacturer (manufacturer_name) VALUES ( ? )";
		KeyHolder keyHolder = new GeneratedKeyHolder();  
		obectAttrjdbcTemplate.update(new PreparedStatementCreator() {

			public PreparedStatement createPreparedStatement(Connection connection)
					throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS); 
				ps.setString(1, name);  
				return ps;
			} 
		}, keyHolder);
		
		return keyHolder.getKey().intValue();

	}

	public Integer insertProject(final String sql,final ProjectAttr attr) {
		KeyHolder keyHolder = new GeneratedKeyHolder();  
		obectAttrjdbcTemplate.update(new PreparedStatementCreator() {
			//"INSERT INTO object( manufacturer_id, year, object_name, object_code, producing_area_id ) VALUES ( ?,?,?,?,? )"
			public PreparedStatement createPreparedStatement(Connection connection)
					throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS); 

				ps.setInt(1, attr.getManufacturer_id());  
				ps.setString(2, attr.getYear());  
				ps.setString(3, attr.getWine_name());  
				ps.setString(4, attr.getGrape_code());  
				ps.setInt(5, attr.getProducing_area_id());  

				return ps;
			} 
		}, keyHolder);
		
		return keyHolder.getKey().intValue();
	}

	public Integer insertTestwineNoteItem(final String sql , final Integer note_id, final Integer project_id) {
		KeyHolder keyHolder = new GeneratedKeyHolder();  
		obectAttrjdbcTemplate.update(new PreparedStatementCreator() {
			//"INSERT INTO note_project_relation( project_id, note_id ) VALUES ( ?, ? )"
			public PreparedStatement createPreparedStatement(Connection connection)
					throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS); 

				ps.setInt(1, project_id);  
				ps.setInt(2, note_id );  

				return ps;
			} 
		}, keyHolder);
		
		return keyHolder.getKey().intValue();
	}

	public void insetTestwineNoteItemPrice(String sql, final ProjectAttr attr) {
		obectAttrjdbcTemplate.update(sql, new PreparedStatementSetter() {
			//"INSERT INTO price( price_cost, price_market, relation_id, type ) VALUES( ?, ?, ?, ? )"
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setBigDecimal(1, attr.getPrice_cost());
				ps.setBigDecimal(2, attr.getPrice_market());
				ps.setInt(3, attr.getRelation_id());
				ps.setInt(4, attr.getPrice_visible_type());
			} 
		} );
	}

	public void insetTestwineNoteItemAttr(String sql, final ProjectAttr attr) {
		
		obectAttrjdbcTemplate.update(sql, new PreparedStatementSetter() {
			
			//"INSERT INTO object_attribute( relation_id, grape_id, acidity_id,  colour_id, 
			//aftertast_id, intensity_id, condition_id , body_id, relish_id, quality_id, tannin_id, 
			//sweetness_id, color_intensity_id, clarity_id , des , date ) "
			//"VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )"
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, attr.getRelation_id());
				ps.setInt(2, attr.getGrape_id());
				ps.setInt(3, attr.getAcidity_id());
				ps.setInt(4, attr.getColour_id());
				ps.setInt(5, attr.getAftertast_id());
				ps.setInt(6, attr.getIntensity_id());
				ps.setInt(7, attr.getCondition_id());
				ps.setInt(8, attr.getBody_id());
				ps.setInt(9, attr.getRelish_id());
				ps.setInt(10, attr.getQuality_id());
				ps.setInt(11, attr.getTannin_id());
				ps.setInt(12, attr.getSweetness_id());
				ps.setInt(13, attr.getColorIntensity_id());
				ps.setInt(14, attr.getClarity_id());
				ps.setString(15, attr.getDes());
				ps.setString(16, attr.getDate());
			}
			
		});
	}

	public List<Note> findOwnAndAllVisibleTestingwineNote(Integer id) {
		List<Note> list = new ArrayList<Note>();
		String sql = "SELECT n.note_id AS noteId, n.note_title AS noteTitle, n.create_date AS createDate, u.`name` AS userName , n.type AS noteType FROM note n LEFT JOIN user_note_relation unr ON n.note_id = unr.note_id LEFT JOIN `user` u ON unr.user_id = u.id WHERE (n.type = 1 AND u.id != "+id+") OR u.id = "+id +"  ORDER BY n.create_date DESC";
		list = obectAttrjdbcTemplate.query(sql, new RowMapper<Note>(){

			public Note mapRow(ResultSet res, int arg1) throws SQLException {
				Note note = new Note();
				note.setNoteId( res.getInt("noteId") );
				note.setNoteTitle( res.getString("noteTitle") );
				note.setCreateTime( res.getString("createDate") );
				note.setUserName( res.getString("userName") );
				note.setNoteType(res.getInt("noteType"));
				return note;
			}
		});
		for (int i = 0; i < list.size(); i++) {
			String csql = "SELECT COUNT(*) FROM note_project_relation WHERE note_id =  " + list.get(i).getNoteId() ;
			list.get(i).setItemCount( obectAttrjdbcTemplate.queryForInt(csql));
		}
		return list;
	}

	public List<Item> findTestingwineNoteItemsByNoteId(Integer noteId) {
		List<Item> items = new ArrayList<Item>();
		String sql = "SELECT n.note_id AS noteId , n.note_title AS noteTitle, o.object_id AS itemId, o.object_ename AS itemName, oa.date AS crateDate, oa.des AS des , m.manufacturer_name AS itemManufacturer, CONCAT( pa.producing_area_name ,\"-\", paa.producing_area_name) AS itemArea FROM note n LEFT JOIN note_project_relation np ON n.note_id = np.note_id LEFT JOIN object o ON np.project_id = o.object_id LEFT JOIN object_attribute oa ON oa.relation_id = np.relation_id  LEFT JOIN manufacturer m ON m.manufacturer_id = o.manufacturer_id LEFT JOIN producing_area pa ON pa.producing_area_id = o.producing_area_id LEFT JOIN producing_area paa ON pa.parent_id = paa.producing_area_id  WHERE n.note_id =  " + noteId ; 
		items = obectAttrjdbcTemplate.query(sql, new RowMapper<Item>(){

			public Item mapRow(ResultSet res, int arg1) throws SQLException {
				Item item = new Item();
				item.setItemId(res.getInt("itemId"));
				item.setItemName(res.getString("itemName"));
				item.setNoteId(res.getInt("noteId"));
				item.setNoteName(res.getString("noteTitle"));
				item.setCrateDate(res.getString("crateDate"));
				item.setDes(res.getString("des"));
				item.setItemManufacturer(res.getString("itemManufacturer"));
				item.setItemArea(res.getString("itemArea"));
				return item;
			}
			
		});
		return items;
	}

	public Project findTestingwineNoteItemDetailByNoteAndItemId(String sql) {
		Project project = new Project();
		project = obectAttrjdbcTemplate.queryForObject(sql, new RowMapper<Project>(){

			public Project mapRow(ResultSet res, int arg1) throws SQLException {
				Project p = new Project();
				
				p.setRelation_id(res.getInt("relation_id"));
				p.setGrape_code(res.getString("grape_code"));
				p.setWine_name(res.getString("wine_name"));
				p.setManufacturer_name(res.getString("manufacturer_name"));
				p.setGrapeName(res.getString("grape_name"));
				p.setYear(res.getString("year"));
				p.setDate(res.getString("date"));
				p.setPrice_cost(res.getBigDecimal("price_cost"));
				p.setPrice_market(res.getBigDecimal("price_market"));
				p.setPrice_visible_type(res.getInt("price_visible_type"));
				p.setAcidityName(res.getString("acidityName"));
				p.setAftertastName(res.getString("aftertastName"));
				p.setIntensityName(res.getString("intensityName"));
				p.setConditionName(res.getString("conditionName"));
				p.setBodyName(res.getString("bodyName"));
				p.setQualityName(res.getString("qualityName"));
				p.setTanninName(res.getString("tanninName"));
				p.setSweetnessName(res.getString("sweetnessName"));
				p.setColorIntensityName(res.getString("sweetnessName"));
				p.setClarityName(res.getString("clarityName"));
				p.setColourName(res.getString("colourName"));
				p.setRelishName(res.getString("relishName"));
				p.setDes(res.getString("des"));
				return p;
			}
		
		});
		
		if(project != null){
			String isql = "SELECT photo_id AS photoId , photo_name AS photoName, photo_url AS photoUrl, photo_des AS photoDes FROM photo WHERE relation_id = "+project.getRelation_id()+" AND photo_type = 0;";
			List<ItemImg> imgs = new ArrayList<ItemImg>();
			imgs = obectAttrjdbcTemplate.query(isql, new RowMapper<ItemImg>(){

				public ItemImg mapRow(ResultSet rs, int arg1)
						throws SQLException {
					ItemImg img = new ItemImg();
					img.setPhotoId(rs.getInt("photoId"));
					img.setPhotoName(rs.getString("photoName"));
					img.setPhotoUrl(rs.getString("photoUrl"));
					img.setPhotoDes(rs.getString("photoDes"));
					return img;
				}
			});
			
			project.setItemImgs(imgs);
		}
		
		return project;
	}

	public Integer addMote( final String sql, final Integer userId, final String noteName,
			final Integer isOpen) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		obectAttrjdbcTemplate.update(new PreparedStatementCreator() {

			public PreparedStatement createPreparedStatement(Connection connection)
					throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS); 
				
				ps.setString(1, noteName);
				ps.setInt(2, isOpen);
				
				return ps;
			}
		}, keyHolder);
		final int noteId = keyHolder.getKey().intValue();
		String rsql = "INSERT INTO user_note_relation( user_id, note_id ) VALUES ( ?, ? )";
		obectAttrjdbcTemplate.update(rsql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, userId);
				ps.setInt(2, noteId );
			} 
		});
		return noteId;
	}

	public void addNoteCoverPhoto(String isql, final ItemImg img) {
		obectAttrjdbcTemplate.update(isql, new PreparedStatementSetter() {
			//INSERT INTO photo( relation_id, photo_url, photo_name ) VALUES ( ?, ?, ? )
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setInt(1, img.getRelationId());
				ps.setString(2, img.getPhotoUrl());
				ps.setString(3, img.getPhotoName());
				
			}
			
		});
	}

	
	
	

}
