/***
 * 클래스 선언
 *  task > Animal 클래스 선언.
 *   	   아마 기타 하위 동물들의 부모클래스를 하는 역할로 추정됨.
 *  
 *  해당 클래스를 인스턴스화 하지 않고 동물의 기준을 정해줄 것이라면 abstract로 선언해도 무방함.
 */
//class Animal {
	/***
	 * 메소드 선언
	 *  task > "Animal Sound" 출력 
	 */
//    public void cry() {
//        System.out.println("Animal sound");
//    }
//}
//
//class Cat extends Animal {
	/***
	 * Override 메소드 선언
	 *  task > "Meow" 출력
	 *  
	 * tip: Animal 자료형 변수를 선언하고 Cat 클래스로 생성 시 해당 Override로 인해 해당 메소드 실행됨.
	 *  ex)	Animal cat = new Cat();
	 *  	cat.cry();	// << "Meow" 출력 
	 */
//    @Override
//    public void cry() {
//        System.out.println("Meow");
//    }
//}
//
//class Dog extends Animal {
	/***
	 * Override 메소드 선언
	 *  task > "Woof" 출력
	 *  
	 * tip: Animal 자료형 변수를 선언하고 Dog 클래스로 생성 시 해당 Override로 인해 해당 메소드 실행됨.
	 *  ex)	Animal dog = new Dog();
	 *  	dog.cry();	// << "Meow" 출력 
	 */
//    @Override
//    public void cry() {
//        System.out.println("Woof");
//    }
//}
//
//class Mouse extends Animal {
//    @Override
//    public void cry() {
//        System.out.println("Squeak");
//    }
//}
//
//public class AnimalMain {
//    public static void main(String[] args) {
//        Animal animal = new Animal();
//        Cat cat = new Cat();
//        Dog dog = new Dog();
//        Mouse mouse = new Mouse();
//
//        printCrying(animal);
//        printCrying(cat);
//        printCrying(dog);
//        printCrying(mouse);
//    }
//
//    public static void printCrying(Animal animal) {
//        if (animal instanceof Cat) {
//            Cat cat = (Cat) animal;
//            cat.cry();
//        } else if (animal instanceof Dog) {
//            Dog dog = (Dog) animal;
//            dog.cry();
//        } else if (animal instanceof Mouse) {
//            Mouse mouse = (Mouse) animal;
//            mouse.cry();
//        } else {
//            animal.cry();
//        }
//    }
//}