package casting03;

import javax.swing.text.html.HTMLDocument.HTMLReader.IsindexAction;

//3번 : 캐스팅 특징 - 메인 클래스
public class CastingMain {
   public static void main(String[] args) {

      Animal animal = new Animal("동물", 2);
      System.out.println(animal);
      animal.crying();

      // Up Casting
      Animal animal2 = new Dog("바둑이", 3); // casting03.Dog@279f2327
      System.out.println(animal2);
      // 1. 같은 메소드가 부모에도 있고 자식에도 있는 경우(오버라이딩)
      // 업캐스팅을 해도 오버라이딩 된 메소드가 실행된다
      animal2.crying();

      // 2. 메소드가 부모에는 없고 자식에서만 추가된 경우
      // (부모에 존재하지 않는 멤버에 접근하려는 경우)
      
      // 자식클래스에 추가한 멤버는 부모 타입의 참조변수로는 접근할 수 없다
      // 이 경우 다운캐스팅을 해야한다
      ((Dog) animal2).walk();

      // 각 클래스의 객체 생성
      Dog dog = new Dog("달이", 4);
      Cat cat = new Cat("별이", 5);
      printTest(dog);
      printTest(cat);
      printTest(new Dog("강아지", 2));
      
      CastingMain.tryWalk(animal2);
      CastingMain.tryWalk(new Cat("야옹이", 3));

   }

   // 1. 메소드의 매개변수로 여러 타입을 받는 경우
   // 일반적으로는 각각의 타입을 처리하는 메소드를 별도로 만들어야한다

   // 매개변수에 업캐스팅을 하게 되면 1개의 타입으로 자식 클래스의 값들을 담아줄수있다


   // 2. 같은 부모 클래스가 존재한다면 매개변수를 부모 타입으로 받는다(업캐스팅)
   // 하나의 메소드에서 매개변수를 부모 타입으로 만들면
   // 여러 자식 타입을 받아서 사용이 가능하다(다형성)
   static void printTest(Animal ani) {
      System.out.println(ani.name + "이/가 운다");
      ani.crying(); // 업캐스팅 된 객체가 들어와도 오버라이딩 된 메소드가 호출된다
   }

   	static void tryWalk(Animal animal) {
   		if (animal instanceof Dog) {
   			((Dog)animal).walk();
   		} else {
   			System.out.println(animal.name + " 산책 안가");
   		}
   	}
}
