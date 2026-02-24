package src;

public class MyThreadTest {
	public static void main(String[] args) {
		MyThread t1 = new MyThread("#");
		MyThread t2 = new MyThread("*");
		
		t1.start();
		t2.start();
		
		for (int i = 0; i < 10; ++i) {
			System.out.println(Thread.currentThread().getName());
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
