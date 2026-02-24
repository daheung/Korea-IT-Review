package castingTask;

public class Person {
	private String name;
	private int age;
	private String birthday;
	
	public Person(String inName) {
		this.name = inName;
	}
	
	public void introduce() {
		System.out.println(this.name + ", " + this.age + "입니다.");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
}
