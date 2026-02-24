package abstractTest01;

public class AbstractTest {
	public static void main(String[] args) {
		ClassA clsA = new ClassA();
		System.out.println(clsA);
		clsA.method1();
		
		ClassC c = new ClassC();
		c.method2();
	}
}
