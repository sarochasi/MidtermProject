package com.skilldistillery.springfit.data;

import com.skilldistillery.springfit.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	

}
