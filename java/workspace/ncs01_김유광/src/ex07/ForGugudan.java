package ex07;

public class ForGugudan {
	   public static void main(String[] args) {
		   int[][][] matrix = new int[9][8][2];
		   for (int row = 0; row < matrix.length; ++row) {
			   for ( int col = 0; col < matrix[row].length; ++col) {
				   matrix[row][col] = new int[] { col + 2, row + 1 }; 
			   }
		   }
		   
	       for (int i, row = 0; row < matrix.length; ++row) {
	           for (int j, col = 0; col < matrix[row].length; col++) {
	        	   i = matrix[row][col][0];
	        	   j = matrix[row][col][1];
	        	   
	               System.out.printf("%d x %d = %-2d\t", i, j, i * j);
	           }
	           
	           System.out.println();
	       }
	   }
	}