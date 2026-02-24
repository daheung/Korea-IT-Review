package ex06;

public class Ex06 {	
	static int[] arrInt = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
	
	public static void main(String[] args) {
		Ex06 ex06 = new Ex06();
		
		int[] minMax01 = ex06.minMax01(arrInt);
		System.out.printf("최소값은 %d, 최대값은 %d 입니다.\n", minMax01[0], minMax01[1]);
		
		int[] minMax02 = ex06.minMax02();
		System.out.printf("최소값은 %d, 최대값은 %d 입니다.\n", minMax02[0], minMax02[1]);
		
		ex06.minMax03(arrInt);
		ex06.minMax04();
	}
	
	public int[] minMax01(int[] inArrInt) {
		int minValue = Integer.MAX_VALUE;
		int maxValue = Integer.MIN_VALUE;
		
		for (int value : inArrInt) {
			boolean bIsMax = value > maxValue;
			if ( bIsMax ) {
				maxValue = value;
			}
			
			boolean bIsMin = value < minValue;
			if ( bIsMin ) {
				minValue = value;
			}
		}
		
		return new int[] { minValue, maxValue };
	}
	
	public int[] minMax02() {
		int minValue = Integer.MAX_VALUE;
		int maxValue = Integer.MIN_VALUE;
		
		for (int value : Ex06.arrInt) {
			boolean bIsMax = value > maxValue;
			if ( bIsMax ) {
				maxValue = value;
			}
			
			boolean bIsMin = value < minValue;
			if ( bIsMin ) {
				minValue = value;
			}
		}
		
		return new int[] { minValue, maxValue };
	}
	
	public void minMax03(int[] inArrInt) {
		int minValue = Integer.MAX_VALUE;
		int maxValue = Integer.MIN_VALUE;
		
		for (int value : inArrInt) {
			boolean bIsMax = value > maxValue;
			if ( bIsMax ) {
				maxValue = value;
			}
			
			boolean bIsMin = value < minValue;
			if ( bIsMin ) {
				minValue = value;
			}
		}
		
		System.out.printf("최소값은 %d, 최대값은 %d 입니다.\n", minValue, maxValue);
	}
	
	public void minMax04() {
		int minValue = Integer.MAX_VALUE;
		int maxValue = Integer.MIN_VALUE;
		
		for (int value : Ex06.arrInt) {
			boolean bIsMax = value > maxValue;
			if ( bIsMax ) {
				maxValue = value;
			}
			
			boolean bIsMin = value < minValue;
			if ( bIsMin ) {
				minValue = value;
			}
		}
		
		System.out.printf("최소값은 %d, 최대값은 %d 입니다.\n", minValue, maxValue);
	}
}
