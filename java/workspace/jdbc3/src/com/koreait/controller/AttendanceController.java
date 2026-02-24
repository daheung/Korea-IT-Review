package com.koreait.controller;

import java.util.List;

import com.koreait.dao.AttendanceDAO;
import com.koreait.dao.StudentDAO;
import com.koreait.dto.AttendanceDTO;
import com.koreait.dto.StudentDTO;
import com.koreait.view.AttendanceView;

/**
 * Controller 역할
 * 
 * - 프로그램 흐름(메뉴 반복) 담당
 * - view에서 입력받고 DAO 호출해서 DB 처리
 * - 결과를 다시 view로 출력
 * 
 */
public class AttendanceController {
	private AttendanceView view = new AttendanceView();
	private StudentDAO stuDAO = new StudentDAO();
	private AttendanceDAO attDAO = new AttendanceDAO();
	
	public void run() {
		while (true) {
			int menu = view.menu();
			
			switch (menu) {
			case 0  : {
				System.out.println("프로그램을 종료합니다.");
				return;
			}
			case 1  : insertStudent();
			case 2  : selectStudent();
			case 3 	: insertAttendance();
			case 4  : selectStudent();
			default :
				throw new IllegalArgumentException("Unexpected value: " + menu);
			}
		}
	}
	
	private void insertStudent() {
		StudentDTO stuDTO = new StudentDTO();
		boolean result = stuDAO.createStudent(stuDTO.getStuName(), stuDTO.getStuMajor());
		if (result ) {
			System.out.println("학생 등록 성공");
		} else {
			System.out.println("학생 등록 실패");
		}
	}
	
	private void insertAttendance() {
		AttendanceDTO attDTO = view.inputAtt();
		if (!stuDAO.checkStudent(attDTO.getStuNumber())) {
			view.msg("없는 학번입니다");
			return;
		}
		
		boolean result = attDAO.registerAttendance(attDTO);
		if (result) {
			view.msg(null);
		}
		
		if (result ) {
			System.out.println("출결 등록 성공");
		} else {
			System.out.println("출결 등록 실패");
		}
	}

	private void selectStudent() {
	   List<String> list = attDAO.selectAttendance();
	   view.printJoin(list);
	}
}
