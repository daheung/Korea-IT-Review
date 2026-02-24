package com.koreait.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Scanner;
import java.util.stream.Stream;

import oracle.jdbc.driver.DBConversion;

//사용자 데이터를 메모리에 저장하고 조회하는 기능
//List<UserDTO>를 사용하여 정보를 저장

//UserDAO 클래스는 메모리에 사용자 정보를 저장하고 회원가입/로그인 시 조회
public class UserDAO {
	// ArrayList 객체 userList 생성
	private List<UserDTO> userList = new ArrayList<>();
	private Scanner sc = new Scanner(System.in);
	
	public List<UserDTO> insertInitialUsers(UserDTO... users) {
		this.userList.addAll(Arrays.asList(users));
		return this.userList;
	}
	
	// 회원가입 메소드
	public List<UserDTO> join(UserDTO userDTO) {
		System.out.println("아이디입력 : ");
		userDTO.setId(sc.nextLine());
		for (UserDTO u : userList) {
			if (u.getId().equals(userDTO.getId())) {
				return userList; // 리스트에 저장된 아이디와 지금 회원가입하려는 아이디가 같다 => 중복된 아이디를 의미
			}
		}
		System.out.println("비밀번호 입력 : ");
		userDTO.setPassword(sc.nextLine());
		System.out.println("이름 입력 : ");
		userDTO.setName(sc.nextLine());
		System.out.println("나이 입력 : ");
		userDTO.setAge(sc.nextInt());
		sc.nextLine();
		userList.add(userDTO);
		return userList; // 성공
	}

	// 로그인 메소드
	public boolean login(String id, String password) {
		for (UserDTO u : this.userList) {
			final boolean bIsSameID = u.getId().equals(id);
			final boolean bIsSamePassword = u.getPassword().equals(password);
			if (bIsSameID && bIsSamePassword) {
				return true;
			}
		}
		
		return false;
	}
	
	// 아이디 중복확인 메소드
	public boolean checkDupID(String userID) {
		for (UserDTO u : this.userList) {
			final boolean bIsDuplicatedID = u.getId().equals(userID);
			if (bIsDuplicatedID) {
				return true;
			}
		}
		
		return false;
	}
	
	// 비밀번호 찾기 메소드(기존비밀번호 일치 시에만 새로운 비밀번호로 변경되도록)
	public boolean changePassword(String curID, String curPassword, String newPassword) {
		for (int iter = 0; iter < this.userList.size(); ++iter) {
			final UserDTO userDTO = this.userList.get(iter);
			final boolean bIsSameID 	  = userDTO.getId().equals(curID);
			final boolean bIsSamePassword = userDTO.getPassword().equals(curPassword);
			if (bIsSameID && bIsSamePassword) {
				userDTO.setPassword(newPassword);
				this.userList.set(iter, userDTO);
				return true;
			}
		}
		
		return false;
	}
	
	// 회원 1명 조회 메소드
	public Optional<UserDTO> selectUser(String userID) {
		for (UserDTO u : this.userList) {
			final boolean bIsDuplicatedID = u.getId().equals(u.getId());
			if (bIsDuplicatedID) {
				return Optional.<UserDTO>ofNullable(u);
			}
		}
		
		return Optional.<UserDTO>ofNullable(null);
	}
	
	// 모든 회원 조회 메소드
	public Optional<List<UserDTO>> selectUsers() {
		return Optional.<List<UserDTO>>ofNullable(this.userList);
	}
	
	// 회원 탈퇴 메소드(아이디, 비밀번호, 이름 일치시에만 삭제 되도록)
	public Optional<UserDTO> dropUser(String userID, String userPassword, String userName) {
		for (int iter = 0; iter < this.userList.size(); ++iter) {
			final UserDTO userDTO = this.userList.get(iter);
			final boolean bIsSameID 	  = userDTO.getId().equals(userID);
			final boolean bIsSamePassword = userDTO.getPassword().equals(userPassword);
			final boolean bIsSameName	  = userDTO.getName().equals(userName);
			if (bIsSameID && bIsSamePassword && bIsSameName) {
				final UserDTO target = this.userList.remove(iter);
				return Optional.<UserDTO>ofNullable(target);
			}
		}
		
		return Optional.<UserDTO>ofNullable(null);
	}

}
