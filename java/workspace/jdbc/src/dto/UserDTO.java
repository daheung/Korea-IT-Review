package dto;

public class UserDTO {
//	CREATE TABLE tbl_user (
//			user_number NUMBER,							정수형
//			user_id		VARCHAR2(128),					문자열
//			user_pw		VARCHAR2(128),					문자열
//			user_name	VARCHAR2(128),					문자열
//			user_age	NUMBER,							정수형
//			user_gender CHAR(1) DEFAULT 'M' NOT NULL,	문자열
//			user_birth	DATE,							문자열
//			
//			CONSTRAINT pk_user PRIMARY KEY (user_number)
//		);
//	
//	DTO는 데이터를 전송하기 위한 목적으로 사용된다
//	다른 기능은 넣지 않는다.
//	컬럼을 필드로 바꿀 때 카멜 표기법으로 작성한다.
//	모든 필드의 접근 제한자는 private로 작성한다.
	private int userNumber;
	private String userId;
	private String userPw;
	private String userName;
	private int userAge;
	private String userGender;
	private String userBirth;
	
//	1. 모든 필드의 getter/setter를 만든다.
//	 => 객제체 저장된 값을 유연하게 수정하고 싶은 경우
//	2. setter를 만들지 않고 생성자를 필드로 초기화한다.
//	 => 객체제 저장된 값을 수정하지 못하게 막고싶은 경우
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	
//	객체제 저장된 값을 편하게 확인하기 위해 toString()을 재정의한다.
	@Override
	public String toString() {
		return "UserDTO [toString()=" + super.toString() + "]";
	}
}
