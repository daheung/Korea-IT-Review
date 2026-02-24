package com.koreait;

import java.lang.reflect.Field;
import java.util.List;

import com.koreait.model.UserDAO;
import com.koreait.model.UserDTO;

public class Main {
	public static void main(String[] args) {
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = new UserDAO();
		
		List<UserDTO> users = userDAO.join(userDTO);
		System.out.println(users);
	}
}
