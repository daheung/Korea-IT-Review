package castingTask;

public class Student extends Person {
	private boolean stu;
	
	public Student(String inName, boolean inStu) {
		super(inName);
		
		this.stu = inStu;
	}
	
	public void study() {
		System.out.println(this.getName() + "이 공부합니다.");
	}
	
	@Override
	public void introduce() {
		System.out.println(this.getName() + "은 학생입니다.");
	}
}
