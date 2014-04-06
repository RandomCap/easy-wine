package com.easywine.winetastingnote.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.easywine.winetastingnote.pojo.Note;


@Repository("noSessionNoteDao")
public class NoSessionNoteDao {
	
	@Autowired
	private JdbcTemplate noSessionNotejdbcTemplate;

	public List<Note> findAllVisibleTestingwineNote() {
		List<Note> list = new ArrayList<Note>();
		String sql = "SELECT n.note_id AS noteId, n.note_title AS noteTitle, n.create_date AS createDate, u.`name` AS userName, n.type AS noteType FROM note n LEFT JOIN user_note_relation unr ON n.note_id = unr.note_id LEFT JOIN `user` u ON unr.user_id = u.id WHERE n.type = 1  ORDER BY n.create_date DESC ";
		list = noSessionNotejdbcTemplate.query(sql, new RowMapper<Note>(){

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
			list.get(i).setItemCount( noSessionNotejdbcTemplate.queryForInt(csql));
		}
		return list;
	}

}
