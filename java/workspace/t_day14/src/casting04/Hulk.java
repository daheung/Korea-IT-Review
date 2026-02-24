package casting04;

//4번 : 캐스팅 연습 - 자식클래스1
public class Hulk extends Hero {
   // Hero 멤버(필드, 생성자, 메소드)
   // 생성자
   public Hulk(String name) {
      super(name);
   }

   // 메소드 오버라이딩
   @Override
   void superPower() {
      // TODO Auto-generated method stub
      System.out.println(this.getName() + "이/가 거대해지며 공격합니다");
   }
   
   void printInfo() {
	   System.out.println("헐크가 변신합니다.");
   }
}