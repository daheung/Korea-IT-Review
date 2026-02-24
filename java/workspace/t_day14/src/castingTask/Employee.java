package castingTask;

public class Employee extends Person {
	public Employee(String inName) {
		super(inName);
	}
	
	public void work() {
		System.out.println("업무를 처리중입니다.");
	}
	
	@Override
	public void introduce()	{
		System.out.println("저의 이름은 " + this.getName() + "이고 회사원입니다.");
	}
}
