package ex08;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Student[] students = new Student[3];
		
		System.out.println("학생 수를 입력하세요: 3");
		
		int count = 0;
		while (count < 3) {
			try {
				System.out.printf("[%d번째 학생 정보 입력]\n", (count + 1));
				System.out.print("이름 : ");
				String name = sc.nextLine();
				System.out.print("전공 : ");
				String major = sc.nextLine();
			
				System.out.print("Java 점수 : ");
				int javaScore = sc.nextInt(); sc.nextLine();
				System.out.print("DBMS 점수 : ");
				int dbmsScore = sc.nextInt(); sc.nextLine();
				System.out.print("HTML 점수 : ");
				int htmlScore = sc.nextInt(); sc.nextLine();
				
				students[count] = new Student(name, major, javaScore, dbmsScore, htmlScore);
				++count;
			} catch (InputMismatchException e) {
				System.out.println("다시 입력해주세요.");
				continue;
			} catch (Exception e) {
				System.out.println("다시 입력해주세요.");
				continue;
			}
		}
		
		System.out.println();
		System.out.println();
		System.out.println();
		
		for (int iter = 0; iter < count; ++iter) {
			Student student = students[iter];
			
			System.out.printf("이름 : %s\n", student.getName());
			System.out.printf("전공 : %s\n", student.getMajor().getKoreanName());
			
			System.out.printf("Java : %d\n", student.getJavaScore());
			System.out.printf("DBMS : %d\n", student.getDbmsScore());
			System.out.printf("HTML : %d\n", student.getHtmlScore());
			
			System.out.printf("총점 : %d\n", student.getTotalScore());
			System.out.printf("이름 : %d\n", student.getAverageScore());
			
			boolean bIsNotLast = iter != count - 1;
			if ( bIsNotLast ) {				
				System.out.println("---------------------");
			}
		}
		
		
		sc.close();
	}
}
