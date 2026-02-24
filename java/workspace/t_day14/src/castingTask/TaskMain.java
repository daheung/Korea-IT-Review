package castingTask;

public class TaskMain {
	public static void main(String[] args) {
		Person teacher = new Teacher("선생님");
		Person student = new Student("학생", true);
		Person employee = new Employee("직장인");
		
		teacher.introduce();
		((Teacher)teacher).teach();
		
		student.introduce();
		((Student)student).study();
		
		employee.introduce();
		((Employee)employee).work();
		
		TaskMain.printInfo(teacher);
		TaskMain.printInfo(student);
		TaskMain.printInfo(employee);
	}
	
	static void printInfo(Person inPerson) {
		if ( inPerson instanceof Teacher ) {
			((Teacher)inPerson).teach();
		}
		
		if ( inPerson instanceof Student ) {
			((Student)inPerson).study();
		}
		
		if ( inPerson instanceof Employee ) {
			((Employee)inPerson).work();
		}
	}
}
