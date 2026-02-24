package t_day34_kyg;

public class Student {
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
	// 	이름: 홍길동 | 국어: 90 | 영어: 85 | 수학: 92 | 총점: 267 | 평균: 89.0 | 등급: 일반
	//
	//	예외처리
	//	각 점수가 0 미만이거나 100 초과이면 IllegalArgumentException 발생
	//	메시지 : "점수는 0~100 사이여야 합니다."
	
	private String name;
	private int korean;
	private int english;
	private int math;

	public Student(String name, int korean, int english, int math) throws IllegalArgumentException {
		super();
		
		final boolean bIsInvalidAnyScore = 
				!(0 <= korean 	&& korean 	<= 100) ||
				!(0 <= english 	&& english 	<= 100) ||
				!(0 <= math 	&& math 	<= 100);
		
		if (bIsInvalidAnyScore) {
			throw new IllegalArgumentException("점수는 0~100 사이여야 합니다.");
		}
		
		this.name = name;
		this.korean = korean;
		this.english = english;
		this.math = math;
	}
	
	public String getName() {
		return this.name;
	}
	
	public int getTotal() {
		final int totalScore = this.korean + this.english + this.math;
		return totalScore;
	}
	
	public float getAverage() {
		final int totalScore = this.getTotal();
		return Math.round(totalScore * 10) / 10 / 3;
	}
	
	public String getGrade() {
		if (this.getAverage() >= 90) {
			return "A";
		}
		
		if (this.getAverage() >= 80) {
			return "B";
		}
		
		if (this.getAverage() >= 70) {
			return "C";
		}
		
		if (this.getAverage() >= 60) {
			return "D";
		}
		
		return "F";
	}
	

	@Override
	public String toString() {
		final String fmtStr = String.format("이름: %s | 국어: %02d | 영어: %02d | 수학: %02d | 총점: %03d | 평균: %.01f | 등급: %s",
				this.name, this.korean, this.english, this.math, this.getTotal(), this.getAverage(), this.getGrade());
		return fmtStr;
	}
	
}

