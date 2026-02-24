package test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import dao.DBConnector;
import dao.UserDAO;
import dto.UserDTO;

public class Test {
	public static void main(String[] args) {
		{
//			UserDAO userDAO = new UserDAO();
//			UserDTO userDTO = new UserDTO();
//			
//			userDTO.setUserId("abc");
//			userDTO.setUserPw("1234");
//			userDTO.setUserName("짱구");
//			userDTO.setUserAge(5);
//			userDTO.setUserGender("M");
//			userDTO.setUserBirth("20000101");
//			System.out.println(userDTO);
//			
//			userDAO.join(userDTO);
			
//			UserDAO userDAO = new UserDAO();
//			String name = userDAO.login("test", "1234");
//			System.out.println(name);
		}
		
		{
//			UserDAO userDAO = new UserDAO();
//			UserDTO newUser = new UserDTO();
//			Scanner sc = new Scanner(System.in);
//			
//			System.out.print("아이디 입력: ");
//			newUser.setUserId(sc.nextLine());
//			
//			if (!userDAO.checkId(newUser.getUserId())) {
//				System.out.println("INFO: Sign up diabled due to duplicated ID");
//				System.exit(0);
//			} else {
//				System.out.println("INFO: Sign up enabled.");
//			}
//			
//			System.out.print("Enter Password: ");
//			newUser.setUserPw(sc.nextLine());
//			System.out.print("Enter Age: ");
//			newUser.setUserAge(sc.nextInt());
//			sc.nextLine();
//			System.out.print("Enter Gender: ");
//			newUser.setUserGender(sc.nextLine());
//			System.out.print("Enter Birthday: ");
//			newUser.setUserBirth(sc.nextLine());
//			
//			if(userDAO.join(newUser)) {
//				System.out.println("Sign up succeed.");
//			}else {
//				System.out.println("Sign up failed.");
//			}
		}
		
		UserDAO userDAO = new UserDAO();
		List<String> userIds = userDAO.findID("짱구", "2000-01-01");
	}
	
	public static void release(Connection connection) {
		try {
			connection.close();
		} catch (SQLException e) {
			System.err.println("Disconnect Failed.");
			e.printStackTrace();
		}
	}
}
