package src;

public class MyThread2 implements Runnable {
	@Override
	public void run() {
		String name = Thread.currentThread().getName();
		
		for (int i = 0; i < 10; ++i) {
			System.out.println(name);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println(name + "쓰레드 종료");
	}
}
