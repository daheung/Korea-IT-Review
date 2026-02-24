package t_day34_kyg;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.function.BiFunction;
import java.lang.reflect.Method;

@FunctionalInterface
interface VarArgsFunction<T> {
    T apply(Object... args);
}

public class Main {
	public static void main(String[] args) {
		//	main 메소드
		//	==============================
		//	  스마트 학교 관리 시스템
		//	==============================
		//	[1단계] 학생 성적 관리
		//	[2단계] 전화번호부 관리
		//
		//
		//	최종 출력 예시
		//	==============================
		//	  스마트 학교 관리 시스템
		//	==============================
		//
		//	=== [1단계] 학생 성적 관리 ===
		//	이름: 이영희 | 국어: 95 | 영어: 92 | 수학: 98 | 총점: 285 | 평균: 95.0 | 등급: 우수
		//	이름: 홍길동 | 국어: 90 | 영어: 85 | 수학: 92 | 총점: 267 | 평균: 89.0 | 등급: 일반
		//	[예외 발생] 점수는 0~100 사이여야 합니다.
		//
		//	=== [2단계] 전화번호부 ===
		//	추가 완료: 홍길동 - 010-1234-5678
		//	[예외 발생] 이미 존재하는 연락처입니다.
		//	검색 결과: 홍길동 → 010-1234-5678
		//	[예외 발생] 존재하지 않는 연락처입니다.
		//	--- 전체 연락처 ---
		//	김민수 : 010-9999-8888
		//	홍길동 : 010-1234-5678
		StudentManager stuManager = new StudentManager();
		try {
			stuManager.addStudent(new Student("이영희", 95, 92, 98));
		} catch (Exception e) { printErrFmt(e.getMessage()); }
		
		try {
			stuManager.addStudent(new Student("홍길동", 90, 85, 92));
		} catch (Exception e) { printErrFmt(e.getMessage()); }
				
		PhoneBook phoneBook = new PhoneBook();
		
		System.out.println("==============================");
		System.out.println("  스마트 학교 관리 시스템");
		System.out.println("==============================\n");
		
		System.out.println("=== [1단계] 학생 성적 관리 ===");
		stuManager.printAllStudents();
		
		try {
			stuManager.addStudent(new Student("Error", -1, -1, -1));
		} catch (Exception e) { printErrFmt(e.getMessage()); }
				
		System.out.println();
		System.out.println("=== [2단계] 전화번호부 ===");
		
		final String name = "홍길동";
		final String phone = "010-1234-5678";
		
		invoke((VarArgsFunction<Void>)(Object... varArgs) -> { phoneBook.add((String)varArgs[0], (String)varArgs[1]); return null; }, new Object[] { name, phone });
		invoke((VarArgsFunction<Void>)(Object... varArgs) -> { phoneBook.add((String)varArgs[0], (String)varArgs[1]); return null; }, new Object[] { name, phone });
		invoke((VarArgsFunction<Void>)(Object... varArgs) -> { phoneBook.search((String)varArgs[0]); return null; }, new Object[] { name });
		invoke((VarArgsFunction<Void>)(Object... varArgs) -> { phoneBook.search((String)varArgs[0]); return null; }, new Object[] { "홍길똥" });
		
		stuManager.printGradeStatistics();
		stuManager.printSortedByAverageDesc();
	}
	
	private static void printErrFmt(String err) {
		System.err.println("[예외 발생] " + err);
	}
	
	private static void invoke(VarArgsFunction<Void> func, Object... args) {
		try {			
			func.apply(args);
		} catch (Exception e) {
			System.err.println("[예외 발생] " + e.getMessage());
		}
	}
 }
