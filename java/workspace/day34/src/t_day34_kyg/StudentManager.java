package t_day34_kyg;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.NameAlreadyBoundException;

public class StudentManager {
	private ArrayList<Student> students = new ArrayList<Student>();
	
	public void addStudent(Student student) throws Exception {
		if (this.find(student) != -1) {
			throw new Exception("이미 존재하는 학생입니다.");
		}
		
		this.students.add(student);
	}
	
	public void removeStudent(Student student) throws Exception {
		int targetIndex = this.find(student);
		if (targetIndex != -1) {
			throw new Exception("존재하지 않는 학생입니다.");
		}
		
		this.students.remove(targetIndex);
	}

	public String printAllStudents() {
		String printFmt = "";
		for (int index = 0; index < this.students.size(); ++index) {
			String stuStr = this.students.get(index).toString();
			printFmt += stuStr;
			
			System.out.println(stuStr);
		}
		
		return printFmt;
	}
	
	public void printSortedByAverageDesc() {
		this.students.stream()
			.sorted(Comparator.comparing(Student::getAverage).reversed())
			.forEach((student) -> System.out.println(student));
	}
	
	public void printGradeStatistics() {
		Map<String, Integer> gradePerStudents = new HashMap<String, Integer>() {{
			put("A", 0); put("B", 0);
			put("C", 0); put("D", 0);
			put("F", 0);
		}};
		
		students.forEach((stu) -> {
			final String key = stu.getGrade();
			final int numStudent = gradePerStudents.get(key);
			
			gradePerStudents.put(key, numStudent + 1);
		});
		
		gradePerStudents.forEach((key, value) -> {
			System.out.printf("%s : %d명\n", key, value);
		});
	}
	
	private int find(Student student) {
		for (int index = 0; index < this.students.size(); ++index) {
			if (student.getName() == students.get(index).getName()) {
				return index;
			}
		}
		
		return -1;
	}
}
