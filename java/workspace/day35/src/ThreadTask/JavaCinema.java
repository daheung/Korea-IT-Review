package ThreadTask;

public class JavaCinema {
	public static void main(String[] args) throws InterruptedException {
		/* JavaCinema라는 영화관이 있다
		 * 3개의 관에서 각각 다른 영화를 상영중이다
		 * A관은 영화를 먼저 시작하고
		 * B, C관은 A관의 상영이 끝나야 영화를 시작한다
		 * 
		 * 각 상영관은 영화를 상영중에 "000 영화 상영중~"이라는 문구를 10번표시한다
		 * 각 상영관은 영화가 끝나면 "000 영화 종료"라는 문구를 표시한다
		 * 영화 이름은 각 쓰레드의 이름으로 설정한다
		 * 
		 * 영화 이름 3개는 자유
		 * 
		 * Movie 클래스와 JavaCinema 클래스를 만든다
		 * JavaCinema에 main 쓰레드가 존재한다
		 * Runnable 인터페이스와 join() 사용할 것
		 * 
		 * 
		 * */
		
		Thread t1 = new Thread(JavaCinema.processMovie("트랜스포머"));
		Thread t2 = new Thread(JavaCinema.processMovie("해리포터"));
		Thread t3 = new Thread(JavaCinema.processMovie("어벤져스"));
		
		t1.start();
		t1.join();
		
		t2.start();
		t3.start();
	}
	
	private static Runnable processMovie(String movieName) {
		return new Runnable() {
			@Override
			public void run() {
				Movie movie1 = new Movie(movieName);		
				for (int i = 0; i < 10; ++i) {
					movie1.startMovie();
					try {
						Thread.sleep(500);
					} catch (InterruptedException e) {}
				}
				
				movie1.endMovie();
			}
		};
	}
	
//    static Runnable bad() {
//        int aInt = 10;
//        aInt = 20; // 재할당 발생
//
//        return () -> {
//        	System.out.println(aInt); // ❌ 컴파일 에러 (aInt는 effectively final 아님)
//        };
//    }
}
