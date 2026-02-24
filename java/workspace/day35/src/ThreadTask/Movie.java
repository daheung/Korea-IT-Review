package ThreadTask;

public class Movie {
	private String movieName;

	public Movie(String movieName) {
		super();
		this.movieName = movieName;
	}
	
	public void startMovie() {
		System.out.println(this.movieName + " 영화 상영중~");
	}
	
	public void endMovie() {
		System.out.println(this.movieName + " 영화 종료");
	}
}
