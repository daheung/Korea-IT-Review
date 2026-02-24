package castingTask;

public class Teacher extends Person {
	public Teacher(String inName) {
		super(inName);
	}
	
	public void teach() {
		System.out.println(this.getName() + "이 가르칩니다.");
	}
	
	@Override
	public void introduce() {
		System.out.println("저는 선생님입니다.");
	}
}
