package com.easywine.winetastingnote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easywine.winetastingnote.dao.NoSessionNoteDao;
import com.easywine.winetastingnote.pojo.Note;

@Service("noSessionNoteService")
public class NoSessionNoteService {
	
	@Autowired
	private NoSessionNoteDao noSessionNoteDao;

	public List<Note> findAllVisibleTestingwineNote() {
		return noSessionNoteDao.findAllVisibleTestingwineNote();
	}

}
