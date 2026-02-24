package casting04;

//4번 : 캐스팅 연습 - 자식클래스2
public class IronMan extends Hero {
   // 생성자
   public IronMan(String name) {
      super(name);
   }

   // 메소드 오버라이딩
   @Override
   void superPower() {
      System.out.println(this.getName() + "이 수트를 입고 날아다닙니다");
   }

}