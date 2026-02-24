package casting03;

public class Dog extends Animal {
	public Dog(String name, int age) {
		super(name, age);
	}

	@Override
	public void crying() {
		System.out.println("멍멍");
	}
	
	public void walk() {
		System.out.println("산책가자!!");
	}
}
