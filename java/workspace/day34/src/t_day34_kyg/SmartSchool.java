package t_day34_kyg;

public class SmartSchool {
	//	SmartSchool => main메소드
	//
	//	① STUDENT 클래스 요구사항
	//	① STUDENT 클래스 요구사항
	//	필드 : NAME(STRING), KOREAN(INT), ENGLISH(INT), MATH(INT)
	//	생성자 : 전체 필드 초기화
	//	메서드
	//	getTotal() : 국어 + 영어 + 수학 합계 반환
	//	getAverage() : 평균 반환 (소수점 첫째 자리까지)
	//	getGrade() : 평균 90 이상이면 "우수", 미만이면 "일반" 반환
	//	toString() : 아래 형식으로 출력
	//
	//	이름: 홍길동 | 국어: 90 | 영어: 85 | 수학: 92 | 총점: 267 | 평균: 89.0 | 등급: 일반
	//
	//	예외처리
	//	각 점수가 0 미만이거나 100 초과이면 IllegalArgumentException 발생
	//	메시지 : "점수는 0~100 사이여야 합니다."
	//
	//	② PhoneBook 클래스 요구사항
	//	HashMap<String, String> 사용 (이름 - 전화번호)
	//	구현 메서드
	//	add(String name, String phone) : 연락처 추가, 이미 존재하면 예외 발생
	//	search(String name) : 이름으로 검색, 없으면 예외 발생
	//	delete(String name) : 삭제 메소드, 없는 이름이면 예외 발생
	//	printAll() : 이름 기준 오름차순 정렬 후 전체 출력
	//
	//	예외처리
	//	중복 추가 시 : "이미 존재하는 연락처입니다."
	//	없는 이름 검색/삭제 시 : "존재하지 않는 연락처입니다."
	//	이름 또는 전화번호가 null이거나 빈 문자열이면 : "이름과 전화번호를 입력하세요."
}
