package ex08;

public enum Major {
	COMPUTER_SCIENCE("컴퓨터공학"), CYBER_SECURITY("정보보안학"), ARTIFICIAL_INTELLIGENCE("인공지능학");
	
	private final String koreanName;
	private Major(String inMajor) {
		this.koreanName = inMajor;
	}
	
	public String getKoreanName() {
		return this.koreanName;
	}
	
	static Major toMajor(String inName) throws Exception {
		if (inName.equals(Major.COMPUTER_SCIENCE.toString())) {
			return Major.COMPUTER_SCIENCE;
		}
		
		if (inName.equals(Major.CYBER_SECURITY.toString())) {
			return Major.CYBER_SECURITY;
		}
		
		if (inName.equals(Major.ARTIFICIAL_INTELLIGENCE.toString())) {
			return Major.ARTIFICIAL_INTELLIGENCE;
		}
		
		throw new Exception();
	}
}
