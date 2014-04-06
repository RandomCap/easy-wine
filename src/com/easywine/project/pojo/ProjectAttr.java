package com.easywine.project.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

@SuppressWarnings("serial")
public class ProjectAttr implements Serializable{

	
	private Integer attribute_id;
	private Integer relation_id;
	private Integer note_id;
	private Integer grape_id; 			//品种
	private Integer acidity_id;			//酸度
	private Integer climate_id;
	private Integer colour_id;				//颜色
	private Integer aftertast_id;			//回味
	private Integer intensity_id;			//浓郁度
	private Integer condition_id; 		//状态
	private Integer body_id;				//酒体
	private Integer relish_id;				//香味
	private Integer quality_id;			//品质
	private Integer tannin_id;			//单宁
	private Integer sweetness_id;		//甜度
	private Integer colorIntensity_id;	//颜色强度
	private Integer clarity_id; 			//澄清度
	private String des;						//酒评
	private String date;						//品尝日期
	
	private String grape_code;			//葡萄酒编号
	private String wine_name;			//葡萄酒名称
	private Integer producing_area_id;//国家/产区
	private Integer manufacturer_id;//生产商
	private String manufacturer_name;//生产商
	private String year;						//年份
	private BigDecimal price_cost;		//入手价
	private BigDecimal price_market;	//市场价
	private Integer price_visible_type;//入手价 是否可见
	
	public Integer getNote_id() {
		return note_id;
	}
	public void setNote_id(Integer note_id) {
		this.note_id = note_id;
	}
	public Integer getAttribute_id() {
		return attribute_id;
	}
	public void setAttribute_id(Integer attribute_id) {
		this.attribute_id = attribute_id;
	}
	public Integer getRelation_id() {
		return relation_id;
	}
	public void setRelation_id(Integer relation_id) {
		this.relation_id = relation_id;
	}
	public Integer getGrape_id() {
		return grape_id;
	}
	public void setGrape_id(Integer grape_id) {
		this.grape_id = grape_id;
	}
	public Integer getAcidity_id() {
		return acidity_id;
	}
	public void setAcidity_id(Integer acidity_id) {
		this.acidity_id = acidity_id;
	}
	public Integer getClimate_id() {
		return climate_id;
	}
	public void setClimate_id(Integer climate_id) {
		this.climate_id = climate_id;
	}
	public Integer getColour_id() {
		return colour_id;
	}
	public void setColour_id(Integer colour_id) {
		this.colour_id = colour_id;
	}
	public Integer getAftertast_id() {
		return aftertast_id;
	}
	public void setAftertast_id(Integer aftertast_id) {
		this.aftertast_id = aftertast_id;
	}
	public Integer getIntensity_id() {
		return intensity_id;
	}
	public void setIntensity_id(Integer intensity_id) {
		this.intensity_id = intensity_id;
	}
	public Integer getCondition_id() {
		return condition_id;
	}
	public void setCondition_id(Integer condition_id) {
		this.condition_id = condition_id;
	}
	public Integer getBody_id() {
		return body_id;
	}
	public void setBody_id(Integer body_id) {
		this.body_id = body_id;
	}
	public Integer getRelish_id() {
		return relish_id;
	}
	public void setRelish_id(Integer relish_id) {
		this.relish_id = relish_id;
	}
	public Integer getQuality_id() {
		return quality_id;
	}
	public void setQuality_id(Integer quality_id) {
		this.quality_id = quality_id;
	}
	public Integer getTannin_id() {
		return tannin_id;
	}
	public void setTannin_id(Integer tannin_id) {
		this.tannin_id = tannin_id;
	}
	public Integer getSweetness_id() {
		return sweetness_id;
	}
	public void setSweetness_id(Integer sweetness_id) {
		this.sweetness_id = sweetness_id;
	}
	public Integer getColorIntensity_id() {
		return colorIntensity_id;
	}
	public void setColorIntensity_id(Integer colorIntensity_id) {
		this.colorIntensity_id = colorIntensity_id;
	}
	public Integer getClarity_id() {
		return clarity_id;
	}
	public void setClarity_id(Integer clarity_id) {
		this.clarity_id = clarity_id;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getGrape_code() {
		return grape_code;
	}
	public void setGrape_code(String grape_code) {
		this.grape_code = grape_code;
	}
	public String getWine_name() {
		return wine_name;
	}
	public void setWine_name(String wine_name) {
		this.wine_name = wine_name;
	}
	public Integer getProducing_area_id() {
		return producing_area_id;
	}
	public void setProducing_area_id(Integer producing_area_id) {
		this.producing_area_id = producing_area_id;
	}
	public Integer getManufacturer_id() {
		return manufacturer_id;
	}
	public void setManufacturer_id(Integer manufacturer_id) {
		this.manufacturer_id = manufacturer_id;
	}
	public String getManufacturer_name() {
		return manufacturer_name;
	}
	public void setManufacturer_name(String manufacturer_name) {
		this.manufacturer_name = manufacturer_name;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public BigDecimal getPrice_cost() {
		return price_cost;
	}
	public void setPrice_cost(BigDecimal price_cost) {
		this.price_cost = price_cost;
	}
	public BigDecimal getPrice_market() {
		return price_market;
	}
	public void setPrice_market(BigDecimal price_market) {
		this.price_market = price_market;
	}
	public Integer getPrice_visible_type() {
		return price_visible_type;
	}
	public void setPrice_visible_type(Integer price_visible_type) {
		this.price_visible_type = price_visible_type;
	}
}
