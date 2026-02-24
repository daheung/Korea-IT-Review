package com.koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.koreait.dto.StudentDTO;

/**
 * 학생 CRUD
 * StudentDAO 역할
 * - 학생 테이블(TBL_STUDENT)에 접근해서 SQL을 실행한다
 * - INSERT / SELECT / UPDATE / DELETE DB 작업만 담당한다
 * - Scanner 입력, System.out 출력은 절대 하지 않는다(View에서 담당)
 */
public class StudentDAO {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	
	/**
	 * 학생 등록 : INSERT
	 * - 시퀀스를 이용해 STU_NUMBER [PK] 를 자동 생성한다
	 * - 이름, 전공 사용자 입력을 받아서 ?에 바인딩한다
	 * 
	 * 반환 값
	 * boolean true /false
	 * int 1(삽입된 행 1개) / 0 (실패)
	 * 
	 */
	public boolean createStudent(String stuName, String stuMajor) {
		String query = "INSERT INTO tbl_student \r\n"
				+ "VALUES (seq_student.nextval, ?, ?)";
		int result = 0;
		
		connection = DBConnector.getConnection();
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(0, stuName);
			preparedStatement.setString(1, stuMajor);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("StudentDAO::createStudent function failed due to sql error.");
			e.printStackTrace();
		} finally {
			this.release();
		}
		
		return result > 0;
	}
	
	/** 
	 * 학생 전체 조회
	 * - tbl_student 테이블의 전체 데이터를 리스트로 반환한다
	 * 
	 * 반환값 
	 * 데이터가 있으면 : StudentDTO 가 담긴 List
	 * 데이터가 없으면 : 빈 리스트로 반환(null로 주지 않는다)
	 * 
	 */
	public List<StudentDTO> getStudents() {
		String query = "SELECT stu_number, stu_name, stu_major \r\n"
				+ "FROM tbl_student";
		List<StudentDTO> stuList = new ArrayList<StudentDTO>();
		
		connection = DBConnector.getConnection();
		try {
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			do {
				StudentDTO stuDTO = new StudentDTO();
				stuDTO.setStuNumber(resultSet.getInt(0));
				stuDTO.setStuName  (resultSet.getString(1));
				stuDTO.setStuMajor (resultSet.getString(2));
				stuList.add(stuDTO);
			} while(resultSet.next());
		} catch (SQLException e) {
			System.err.println("StudentDAO::getStudents function failed due to sql error.");
			e.printStackTrace();
		} finally {
			this.release();
		}
		
		return stuList;
	}
	
	/**   
	 * 학번 존재 확인
	 * - 출결 등록 전에 학생이 존재하는지 체크해서 FK 오류 예방
	 * 반환값 boolean
	 * 존재하면 true
	 * 없으면 false
	 */
	public boolean checkStudent(int stuNumber) {
		String query = "SELECT stu_number \r\n"
				+ "FROM tbl_student \r\n"
				+ "WHERE stu_number = ?";
		
		connection = DBConnector.getConnection();
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(0, stuNumber);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.err.println("StudentDAO::checkStudent function failed due to sql error.");
			e.printStackTrace();
		} finally {
			this.release();
		}
		
		return false;
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
