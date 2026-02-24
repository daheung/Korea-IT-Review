package casting02;

public class TypeMain {
	public static void main(String[] args) {
		Parent parent = new Parent();
		Child child = new Child();
		
		System.out.println(parent);
		System.out.println(child);
		
		System.out.println(parent instanceof Parent);
		System.err.println(parent instanceof Child);
		System.out.println(child instanceof Child);
		System.out.println(child instanceof Parent);
		
		Parent parent2 = new Child();
//		Child child2 = (Parent)new Parent();
		Child child2 = (Child)parent2;
	}
}
