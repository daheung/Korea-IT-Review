package com.koreait.model;

public class UserDTO {
	// 객체 지향적으로 사용자 정보를 하나로 묶기 위함
	// UserDTO는 데이터만 가지고 있는 역할
	// 계층간 전달을 위해(Controller -> DAO 등)
	
	// Field: 이름, 나이, 아이디, 비밀번호 데이터만 보관
	private String name;
	private int age;
	private String id;
	private String password;
	
	@Override
	public String toString() {
		return "UserDTO [name=" + name + ", age=" + age + ", id=" + id + ", password=" + password + "]";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	
}
