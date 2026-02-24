package ex08;

public class Student extends Person implements ScoreCalculable {
	private int javaScore;
	private int dbmsScore;
	private int htmlScore;
	Major major;
	
	public Student(String inName, String inMajor, int inJavaScore, int inDbmsScore, int inHtmlScore) {
		super(inName);
		this.javaScore = inJavaScore;
		this.dbmsScore = inDbmsScore;
		this.htmlScore = inHtmlScore;
		
		try {
			this.major = Major.toMajor(inMajor);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getTotalScore() {
		return  this.javaScore + this.dbmsScore + this.htmlScore;
	}

	@Override
	public int getAverageScore() {
		return this.getTotalScore() / 3;
	}
	
	Major getMajor() {
		return this.major;
	}

	public int getJavaScore() {
		return javaScore;
	}

	public int getDbmsScore() {
		return dbmsScore;
	}

	public int getHtmlScore() {
		return htmlScore;
	}
	
	
}
