package src;

public class whileTest {
	public static void main(String[] args) {
		int count = 0, i = 0, j = 0;
		while (i < 10) {
			while(j < 10) {
				count++;
				j++;
			}
			i++;
		}
		
		System.out.println("반복 횟수 : " + count);
		System.out.println();
		
		i = 2;
		while (i < 10) {
			j = 1;
			while (j < 10) {
				System.out.printf("%dX%d=%d\t", i, j, (i * j));
				++j;
			}
			
			System.out.println();
			++i;
		}
		
		System.out.println();
		
		
		i = 1;
		while (i < 10) {
			j = 2;
			while (j < 10) {
				System.out.printf("%dX%d=%d\t", j, i, (i * j));
				++j;
			}
			
			System.out.println();
			++i;
			
		}
	}
}
