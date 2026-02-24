package casting04;

//4번 : 캐스팅 예제 - 메인 클래스
public class HeroMain {
   public static void main(String[] args) {
      // 각 클래스의 객체 생성
//      Hero hero = new Hero("히어로");
//      Hulk hulk = new Hulk("헐크");
//      IronMan ironMan = new IronMan("아이언맨");

//      hero.superPower();
//      hulk.superPower();
//      ironMan.superPower();

      // 업캐스팅
      Hero iron2 = new IronMan();
      iron2.setName("아이언맨3");
      iron2.superPower();

      Hero hulk2 = new Hulk(); // 업캐스팅
      hulk2.superPower(); // 업캐스팅 된 객체로 메소드 호출 시 오버라이딩 된 메소드가 실행
//      hulk2.printInfo(); //업캐스팅 된 객체는 자식 클래스에서 만든 멤버를 사용하지 못한다
      // 다운캐스팅을 해야 사용 가능하다
      ((Hulk) hulk2).printInfo();

   }
}
