
class AClass {
	public int i;

	public AClass(int newInt) {
		super();
		this.i = newInt;
	}
}

public class Test {
	public static void main(String[] args) {		
		AClass aClass = new AClass(10);
		
		Runnable r1 = createRunnable(aClass);
		Runnable r2 = createRunnable(aClass);
		
		r1.run();
		r2.run();
		System.out.println(aClass + ", value : " + aClass.i);
	}
	
	private static Runnable createRunnable(AClass aClass) {
		return new Runnable() {
			@Override
			public void run() {
				setAClass(aClass);	
				aClass.i = 19;
				System.out.println(aClass + ", value : " + aClass.i);
			}
		};
	}
	
	private static void setAClass(AClass aClass) {
		aClass = new AClass(20);
//		aClass.i = 20;
	}
}
