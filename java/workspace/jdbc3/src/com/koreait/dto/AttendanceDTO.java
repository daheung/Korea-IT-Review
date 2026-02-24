package com.koreait.dto;

public class AttendanceDTO {
	/**
	 * 	CREATE TABLE tbl_attendance (
	 * 		att_number	NUMBER,
	 * 		stu_number 	NUMBER 	 NOT NULL,
	 * 		att_adate	DATE 	 NOT NULL,
	 * 		att_status	CHAR(20) NOT NULL,
	 *
	 * 		CONSTRAINT pk_att PRIMARY KEY (att_number),
	 * 		CONSTRAINT fk_att FOREIGN KEY (stu_number) REFERENCES tbl_student(stu_number);
	 * 	);
	 */
	
	private int attNumber;
	private int stuNumber;
	private String attDate;
	private String attStatus;
	
	public int getAttNumber() {
		return attNumber;
	}
	public void setAttNumber(int attNumber) {
		this.attNumber = attNumber;
	}
	public int getStuNumber() {
		return stuNumber;
	}
	public void setStuNumber(int stuNumber) {
		this.stuNumber = stuNumber;
	}
	public String getAttDate() {
		return attDate;
	}
	public void setAttDate(String attDate) {
		this.attDate = attDate;
	}
	public String getAttStatus() {
		return attStatus;
	}
	public void setAttStatus(String attStatus) {
		this.attStatus = attStatus;
	}
}
