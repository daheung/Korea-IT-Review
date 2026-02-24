package com.koreait.dto;

public class StudentDTO {
	/**
	 * 	CREATE TABLE tbl_student (	
	 * 		stu_number 	NUMBER,	
	 * 		stu_name	VARCHAR(128) NOT NULL,
	 * 		stu_major 	VARCHAR(128) NOT NULL,
	 * 	
	 * 		CONSTRAINT pk_stu PRIMARY KEY (stu_number)
	 * 	);
	 */
	
	private int stuNumber;
	private String stuName;
	private String stuMajor;
	
	public final int getStuNumber() {
		return stuNumber;
	}
	public final void setStuNumber(int stuNumber) {
		this.stuNumber = stuNumber;
	}
	public final String getStuName() {
		return stuName;
	}
	public final void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public final String getStuMajor() {
		return stuMajor;
	}
	public final void setStuMajor(String stuMajor) {
		this.stuMajor = stuMajor;
	}
}
