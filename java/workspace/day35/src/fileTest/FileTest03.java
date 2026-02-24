package fileTest;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileTest03 {
   public static void main(String[] args) {
      BufferedReader br = null;
      
      try {
         br = new BufferedReader(new FileReader("test2.txt"));
         String line;
         
         while((line=br.readLine()) != null) {
            System.out.println(line);
         }
         
         br.close();
         
      } catch (FileNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
   }
}
