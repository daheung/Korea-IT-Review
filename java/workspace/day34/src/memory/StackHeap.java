package memory;

public class StackHeap {
	public static void main(String[] args) {
		int number1 = 10;
		int number2 = 20;
		int sum;
		
		sum = addNum(number1, number2);
		System.out.println("sum : " + sum);
		
	}
	
	public static int addNum(int num1, int num2) {
		int result = num1 + num2;
		return result;
	}
}
