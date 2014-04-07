package com.easywine.activity.pojo;

import java.io.Serializable;

/**
 * 
 * @author sence
 *
 */
public class Activitiy implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4443457983363197473L;
	private Integer activityId;
	private String activityName;
	private long activityStartTime;
	private long activityDuration;
	private String activityDesc;
	
	public Activitiy() {

	}
	public Integer getActivityId() {
		return activityId;
	}
	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public long getActivityStartTime() {
		return activityStartTime;
	}
	public void setActivityStartTime(long activityStartTime) {
		this.activityStartTime = activityStartTime;
	}
	public long getActivityDuration() {
		return activityDuration;
	}
	public void setActivityDuration(long activityDuration) {
		this.activityDuration = activityDuration;
	}
	public String getActivityDesc() {
		return activityDesc;
	}
	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}
	
}
