package com.easywine.project.pojo;

import java.io.Serializable;
import java.util.List;

import com.easywine.winetastingnote.pojo.ItemImg;

@SuppressWarnings("serial")
public class Project extends ProjectAttr implements Serializable{

	
	private String noteName;
	private String grapeName;			//品种
	private String acidityName;			//酸度
	private String climateName;
	private String colourName;				//颜色
	private String aftertastName;			//回味
	private String intensityName;			//浓郁度
	private String conditionName; 		//状态
	private String bodyName;				//酒体
	private String relishName;				//香味
	private String qualityName;			//品质
	private String tanninName;			//单宁
	private String sweetnessName;		//甜度
	private String colorIntensityName;	//颜色强度
	private String clarityName; 			//澄清度
	
	private List<ItemImg> itemImgs;

	public String getNoteName() {
		return noteName;
	}

	public void setNoteName(String noteName) {
		this.noteName = noteName;
	}

	public String getGrapeName() {
		return grapeName;
	}

	public void setGrapeName(String grapeName) {
		this.grapeName = grapeName;
	}

	public String getAcidityName() {
		return acidityName;
	}

	public void setAcidityName(String acidityName) {
		this.acidityName = acidityName;
	}

	public String getClimateName() {
		return climateName;
	}

	public void setClimateName(String climateName) {
		this.climateName = climateName;
	}

	public String getColourName() {
		return colourName;
	}

	public void setColourName(String colourName) {
		this.colourName = colourName;
	}

	public String getAftertastName() {
		return aftertastName;
	}

	public void setAftertastName(String aftertastName) {
		this.aftertastName = aftertastName;
	}

	public String getIntensityName() {
		return intensityName;
	}

	public void setIntensityName(String intensityName) {
		this.intensityName = intensityName;
	}

	public String getConditionName() {
		return conditionName;
	}

	public void setConditionName(String conditionName) {
		this.conditionName = conditionName;
	}

	public String getBodyName() {
		return bodyName;
	}

	public void setBodyName(String bodyName) {
		this.bodyName = bodyName;
	}

	public String getRelishName() {
		return relishName;
	}

	public void setRelishName(String relishName) {
		this.relishName = relishName;
	}

	public String getQualityName() {
		return qualityName;
	}

	public void setQualityName(String qualityName) {
		this.qualityName = qualityName;
	}

	public String getTanninName() {
		return tanninName;
	}

	public void setTanninName(String tanninName) {
		this.tanninName = tanninName;
	}

	public String getSweetnessName() {
		return sweetnessName;
	}

	public void setSweetnessName(String sweetnessName) {
		this.sweetnessName = sweetnessName;
	}

	public String getColorIntensityName() {
		return colorIntensityName;
	}

	public void setColorIntensityName(String colorIntensityName) {
		this.colorIntensityName = colorIntensityName;
	}

	public String getClarityName() {
		return clarityName;
	}

	public void setClarityName(String clarityName) {
		this.clarityName = clarityName;
	}

	public List<ItemImg> getItemImgs() {
		return itemImgs;
	}

	public void setItemImgs(List<ItemImg> itemImgs) {
		this.itemImgs = itemImgs;
	}
}
