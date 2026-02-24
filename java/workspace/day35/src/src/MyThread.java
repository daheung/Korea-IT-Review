package src;

public class MyThread extends Thread {
	String str;

	public MyThread(String str) {
		super();
		this.str = str;
	}
	
	@Override
	public void run() {
		for (int i = 0; i < 10; ++i) {
			try {
				Thread.sleep(500);
				System.out.println(str);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(str + "쓰레드 종료");
	}
}
