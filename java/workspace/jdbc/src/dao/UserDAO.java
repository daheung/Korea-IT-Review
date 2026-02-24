package dao;

import java.nio.channels.AsynchronousSocketChannel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import dto.UserDTO;

public class UserDAO {
	// 1) 객체를 만든다
	//	C	insert 삽입
	//	R	select 조회
	// 	U	update 수정
	// 	D	delete 삭제
	
	// DB 연결 => 메소드마다 사용, 처음에 연결 시 사용 (연결 성공시키기 위해)
	public Connection connection;
	
	// 쿼리문 실행
	public PreparedStatement preparedStatement; 
	
	// select문의 결과를 담아줄 객체(테이블 전체를 담는다)
	public ResultSet resultSet; 
	
	// 한 행씩 가져오기 위해서는 while(resultSet.next()) 또는 if(resultSet.next())
	
	// 2) 필요한 메소드를 만든다
	// 회원가입(i), 아이디 중복검사(s), 로그인(s), 비밀번호 찾기(s), 비밀번호 변경(u), 회원정보 수정(u), 회원탈퇴(d)
	
	// [1] 아이디 중복검사
	public boolean checkId(String id) {
		// 문자열로 쿼리문을 작성한다.
		String query = "SELECT user_number \r\n"
				+ "FROM tbl_user \r\n"
				+ "WHERE user_id = ?";
		
		// DBConnector에서 커넥션 객체를 얻어온다(DB와의 연결)
		connection = DBConnector.getConnection();
		
		try {
			// 쿼리를 보내기 위한 preparedStatement 객체를 커넥션 객체에서 가져온 값을 저장한다.
			preparedStatement = connection.prepareStatement(query);
			
			// 쿼리에 ?가 있으면 미완성 상태로써
			// ?를 메소드의 매개변수로 받은 id가 매꿔줘야한다.
			// 바인딩 set 자료형(물음표 순서, 넣을 값)
			preparedStatement.setString(1, id);
			
			// 완성된 쿼리를 실행하는 방법
			// 1) executeQuery()	=> SELECT할 때 반환되는 결과값을 받기 위해 사용한다.
			//	반환타입은 ResultSet이다
			
			// 2) executeUpdate()	=> INSERT, UPDATE, DELETE할 때 사용한다.
			//	반환타입은 int이다.
			
			resultSet = preparedStatement.executeQuery();
			// resultSet은 쿼리의 결과(테이블)를 저장하고 있다.
			// 각 데이터에 접근하는 방식은 Iterator을 동일하게 커서를 사용한다.
			// next() : 현재 커서 다음에 데이터가 존재하는지를 true/false로 반환한다.
			
			if (resultSet.next()) {
				// 이미 아이디가 존재한다.
				return false;
			}
		} catch (SQLException e) {
			System.err.println("UserDAO::CheckId() function failed due to sql error.");
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.err.println("UserDAO::CheckId function failed. Cannot disconnect Oracle database interface.");
				e.printStackTrace();
			}
		}
 		
		return true;
	}
	
	// [2] 회원가입
	public boolean join(UserDTO userDTO) {
		// 쿼리문
		String query = "INSERT INTO TBL_USER(USER_NUMBER, USER_ID, USER_PW, USER_NAME, USER_AGE, USER_BIRTH) "
				+ "VALUES(SEQ_USER.NEXTVAL, ?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			// db연결
			connection = DBConnector.getConnection();
			preparedStatement = connection.prepareStatement(query);
			// 물음표 채우기(바인딩)
			preparedStatement.setString(1, userDTO.getUserId());
	        preparedStatement.setString(2, userDTO.getUserPw());
	        preparedStatement.setString(3, userDTO.getUserName());
	        preparedStatement.setInt(4, userDTO.getUserAge());
	        preparedStatement.setString(5, userDTO.getUserBirth());
	
	        result = preparedStatement.executeUpdate();
	        return result > 0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("join() sql 오류");
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
			   System.out.println("join() 연결 종료 오류");
			   e.printStackTrace();
			}
		}
		
		return result > 0;
   }
	
	// [3] 로그인
	public String login(String userId, String userPw) {
		String query = "SELECT user_name \r\n"
				+ "FROM tbl_user \r\n"
				+ "WHERE user_id = ? \r\n"
				+ "	AND user_pw = ?";
		String name = null;
		
		connection = DBConnector.getConnection();
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, userPw);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				name = resultSet.getString("user_name");
			}
			
		} catch (SQLException e) {
			System.err.println("UserDAO::login() function failed due to sql error.");
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.err.println("UserDAO::login function failed. Cannot disconnect Oracle database interface.");
				e.printStackTrace();
			}
		}
		
		return name;
	}
	
	public List<String> findID(String userName, String userBirth) {
		String query = "SELECT user_id \r\n"
				+ "FROM tbl_user \r\n"
				+ "WHERE user_name = ? \r\n"
				+ "	AND user_birth = ?";
		
		List<String> userIds = new ArrayList<String>();
		
		try {
			connection = DBConnector.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, userBirth);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String userId = resultSet.getString("user_id");
				userIds.add(userId);
			}
			
			if (userIds.isEmpty()) {
				System.out.println("Cannot found user ids" + Arrays.toString(userIds.toArray()));
			} else {
				System.out.println("User ids : ");
				for (String userId : userIds) {
					System.out.println(userId);
				}
			}
		} catch (SQLException e) {
			System.err.println("UserDAO::findID function failed due to sql error.");
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.err.println("UserDAO::findID function failed. Cannot disconnect Oracle database interface.");
				e.printStackTrace();
			}
		}
		
		return userIds;
	}
	
	public UserDTO findUser(int userNumber) {
		String query = "SELECT user_id, user_name, user_age, user_gender \r\n"
				+ "FROM user_number = ?";
		UserDTO userDTO = null;
		
		connection = DBConnector.getConnection();
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, userNumber);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				userDTO = new UserDTO();
				userDTO.setUserNumber(userNumber);
				userDTO.setUserId	 (resultSet.getString(1));
				userDTO.setUserName	 (resultSet.getString(2));
				userDTO.setUserAge	 (resultSet.getInt(3));
				userDTO.setUserGender(resultSet.getString(4));
			}
		} catch (SQLException e) {
			System.err.println("UserDAO::findUser function failed due to sql error.");
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.err.println("UserDAO::findUser function failed. Cannot disconnect Oracle database interface.");
				e.printStackTrace();
			}
		}
		
		return userDTO;
	}
	
	public boolean delete(int userNumber) {
		String query = "DELETE FROM tbl_user \r\n"
				+ "WHERE user_number = ?";
		int result = 0;
		
		connection = DBConnector.getConnection();
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, userNumber);
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("UserDAO::delete function failed due to sql error.");
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.err.println("UserDAO::delete function failed. Cannot disconnect Oracle database interface.");
				e.printStackTrace();
			}
		}
		
		return result > 0;		
	}
	
	public boolean updatePW(int userNumber, String originPW, String newPW) {
		String query = "UPDATE tbl_user \r\n"
				+ "SET user_pw = ? \r\n"
				+ "WHERE user_number = ? \r\n"
				+ "	 AND user_pw = ?";
		int result = 0;
		
		try {
			connection = DBConnector.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, newPW);
			preparedStatement.setInt   (2, userNumber);
			preparedStatement.setString(3, originPW);
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("UserDAO::updatePW function failed due to sql error.");
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.err.println("UserDAO::updatePW function failed. Cannot disconnect Oracle database interface.");
				e.printStackTrace();
			}
		}
		
		return result > 0; 
	}
}