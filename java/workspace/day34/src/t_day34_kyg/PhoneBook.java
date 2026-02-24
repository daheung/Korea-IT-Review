package t_day34_kyg;

import java.util.HashMap;
import java.util.Map;

public class PhoneBook {
	//	② PhoneBook 클래스 요구사항
	//	HashMap<String, String> 사용 (이름 - 전화번호)
	//	구현 메서드
	//	add(String name, String phone) : 연락처 추가, 이미 존재하면 예외 발생
	//	search(String name) : 이름으로 검색, 없으면 예외 발생
	//	delete(String name) : 삭제 메소드, 없는 이름이면 예외 발생
	//	printAll() : 이름 기준 오름차순 정렬 후 전체 출력
	//
	//	예외처리
	//	중복 추가 시 : "이미 존재하는 연락처입니다."
	//	없는 이름 검색/삭제 시 : "존재하지 않는 연락처입니다."
	//	이름 또는 전화번호가 null이거나 빈 문자열이면 : "이름과 전화번호를 입력하세요."
	private HashMap<String, String> phoneInfo = new HashMap<String, String>();
	
	public void add(String name, String phone) throws IllegalArgumentException {
		if (this.phoneInfo.containsValue(phone)) {
			throw new IllegalArgumentException("이미 존재하는 연락처입니다.");
		}
		
		this.phoneInfo.put(name, phone);
		
		// 추가 완료: 홍길동 - 010-1234-5678
		System.out.printf("추가 완료: %s - %s\n", name, phone);
	}
	
	public void search(String name) throws IllegalArgumentException {
		PhoneBook.checkName(phoneInfo, name);	
		
		final String phone = this.phoneInfo.get(name);
		System.out.printf("검색 결과: %s - %s\n", name, phone);
	}
	
	public void delete(String name) throws IllegalArgumentException {
		PhoneBook.checkName(phoneInfo, name);		
		this.phoneInfo.remove(name);
	}
	
	public void printAll() {
		this.phoneInfo.entrySet().stream()
			.sorted(Map.Entry.comparingByKey())
			.forEach((entry) -> {
				System.out.printf("%s : %s\n", entry.getKey(), entry.getValue());
			});			
	}
	
	private static void checkName(HashMap<String, String> container, String name) throws IllegalArgumentException {
		String optPhone = container.get(name);
		if (optPhone == null) {
			throw new IllegalArgumentException("존재하지 않는 연락처입니다.");
		}
	}
}
