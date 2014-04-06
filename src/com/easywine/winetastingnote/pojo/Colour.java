package com.easywine.winetastingnote.pojo;

import java.util.List;


/**
 * 
 *@company 颜色
 *@ClassName Colour
 *@author mf-luozg 
 *@date 2014年3月8日下午1:56:32
 */
@SuppressWarnings("serial")
public class Colour extends ClassifyBase{
	
	private List<Colour> sub_color;

	public List<Colour> getSub_color() {
		return sub_color;
	}

	public void setSub_color(List<Colour> sub_color) {
		this.sub_color = sub_color;
	}

}
