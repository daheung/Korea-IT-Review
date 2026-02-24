package memory;

public class Heap {
	public static void main(String[] args) {
		int[] number = { 1, 2, 3, 4, 5 };
		System.out.println(number);
		
		MyClass refVar = new MyClass();
		refVar.myMethod();
	}
}

class MyClass {
	public void myMethod() {
		System.out.println("MyClass의 myMethod 호출");
	}
}