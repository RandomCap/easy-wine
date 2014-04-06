package com.easywine.winetastingnote.pojo;

import java.util.List;


/**
 * 
 *@company 香气风味
 *@ClassName Relish
 *@author mf-luozg 
 *@date 2014年3月8日下午2:23:37
 */
@SuppressWarnings("serial")
public class Relish extends ClassifyBase{

	
	private List<Relish> relishs;

	public List<Relish> getRelishs() {
		return relishs;
	}

	public void setRelishs(List<Relish> relishs) {
		this.relishs = relishs;
	}
	
}
