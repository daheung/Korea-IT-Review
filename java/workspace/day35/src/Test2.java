
class NewAClass {
	public int aInt;
	private final Object lockObject = new Object();
	
	public NewAClass(int newInt) {
		super();
		this.aInt = newInt;
	}
	
	public void lock() throws InterruptedException {
		synchronized (lockObject) {
			System.out.println("NewAClass::lock 함수 wait 전 실행");
			lockObject.wait();
			System.out.println("NewAClass::lock 함수 wait 후 실행");
		}
	}
	
	public void unlock() throws InterruptedException {
		synchronized (lockObject) {
			System.out.println("NewAClass::unlock 함수 wait 전 실행");
			lockObject.notify();
			System.out.println("NewAClass::unlock 함수 wait 후 실행");
		}
	}
}

public class Test2 {
	public static void main(String[] args) throws InterruptedException {
		NewAClass newClass = new NewAClass(10);
		Thread lockThread = new Thread(() -> {
			try {
				newClass.lock();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		});
		
		Thread unlockThread = new Thread(() -> {
			try {
				newClass.unlock();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		});
		
		lockThread.start();
//		Thread.sleep(0);
		unlockThread.start();
		
		lockThread.join();
		unlockThread.join();
		
		System.out.println("Test2::main 메소드 끝");
	}
}