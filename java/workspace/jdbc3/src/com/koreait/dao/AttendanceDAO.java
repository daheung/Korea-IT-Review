package com.koreait.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.koreait.dto.AttendanceDTO;
import com.koreait.dto.StudentDTO;

/*
 * AttendanceDAO 역할
 * - 출석 테이블에 접근해서 SQL 실행
 * - 출결 등록(INSERT)
 * - 학생 + 출결(SELECT JOIN)
 * 
 * */
public class AttendanceDAO {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	
	/**
	 * 출결등록
	 * - 출석 번호는 시퀀스로 생성
	 * - 학번은 학생 테이블의 학번을 참조하는 FK라서 반드시 존재해야한다(NOT NULL)
	 * - 날짜는 YYYY-MM-DD 문자열을 Date로 변환해서 넣는다
	 */
	public boolean registerAttendance(AttendanceDTO attendance) {
		String query = "INSERT INTO tbl_attendance \r\n"
				+ "VALUES (seq_atte.nextval, ?, ?, ?)";
		int result = 0;
		
		connection = DBConnector.getConnection();
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt   (0, attendance.getStuNumber());
			preparedStatement.setDate  (1, Date.valueOf(attendance.getAttDate()));
			preparedStatement.setString(2, attendance.getAttStatus());
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("AttendanceDAO::registerAttendance function failed due to sql error.");
			e.printStackTrace();
		} finally {
			this.release();
		}
		
		return true;
	}
	
	/** 
	 * join 조회
	 *  - 학생(이름, 전공) + 출결정보(날짜, 상태) 한번에 보기 위해 join 사용
	 * 
	 * 반환값 List<String>
	 */
	public List<String> selectAttendance() {
		String query = "SELECT s.stu_number, s.stu_name, s.stu_major, a.att_adate, a.att_status \r\n"
				+ "FROM tbl_student s \r\n"
				+ "INNER JOIN tbl_attendance a \r\n"
				+ "	ON s.stu_number = a.stu_number";
		List<String> stuList = new ArrayList<String>();
		
		connection = DBConnector.getConnection();
		try {
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				String row = 
						resultSet.getInt   ("stu_number") + ", " + 
						resultSet.getString("stu_name"  ) + ", " +
						resultSet.getString("stu_major" ) + ", " +
						resultSet.getString("att_adate" ) + ", " +
						resultSet.getString("att_status");
				stuList.add(row);
			}
		} catch (SQLException e) {
			System.err.println("AttendanceDAO::selectAttendance function failed due to sql error.");
			e.printStackTrace();
		} finally {
			this.release();
		}
		
		return stuList;
	}
	
	private void release() {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			System.err.println("StudentDAO::release function failed. Cannot disconnect Oracle database interface.");
			e.printStackTrace();
		}
	}
}
