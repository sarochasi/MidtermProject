package com.skilldistillery.springfit.data;

import com.skilldistillery.springfit.entities.User;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	
	User registerUser(User user);
	
	Boolean usernameExists(String username);
	
	void userLikeWorkout(int userId, int workoutId);
	
	User findById(int userId);
	
	

}
