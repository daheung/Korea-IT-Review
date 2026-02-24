package ex07;

public class WhileForGugudan {
	public static void main(String[] args) {
		int[][][] matrix = new int[9][8][2];
		
		int row = 0 , col = 0;
		while ( row < matrix.length ) {
			col = 0;
			while ( col < matrix[row].length ) {
				matrix[row][col] = new int[] { col + 2, row + 1 };
				++col;
			}
			
			++row;
		}
		
		row = 0; col = 0;
		while (row < matrix.length) {
			col = 0;
			while ( col < matrix[row].length ) {				
				int i = matrix[row][col][0];
				int j = matrix[row][col][1];
				System.out.printf("%d x %d = %-2d\t", i, j, i * j);
				++col;
			}
			
			System.out.println();
			++row;
		}
	}
}
