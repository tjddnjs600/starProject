package com.myweb.domain;


public class LocVO {
	private String place;
	private String region;
	private String width;
	private String height;
	
	public LocVO() {}
	
	public LocVO(String place, String region, String width, String height) {
		this.place = place;
		this.region = region;
		this.width = width;
		this.height = height;
	}

	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}

	@Override
	public String toString() {
		return "LocVO [place=" + place + ", region=" + region + ", width=" + width + ", height=" + height + "]";
	}
	
	
}