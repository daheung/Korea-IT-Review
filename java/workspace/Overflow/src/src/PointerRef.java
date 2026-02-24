package src;

import java.lang.ref.WeakReference;

public class PointerRef {
	public static int _1MB = 1024 * 1024;
	
	public static void main(String[] args) throws InterruptedException {		
		DummyClassA str = new DummyClassA();
		
		WeakReference<DummyClassA> weakRef = new WeakReference<DummyClassA>(str);
		str = null;
		
		System.out.println(weakRef);
		
		System.gc();
		Thread.sleep(1000);
		
		System.out.println("System exit.");
	}
	
	static class DummyClassA {
		int[] arr = new int[_1MB];
	}
}
