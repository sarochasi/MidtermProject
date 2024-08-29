package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	
	User registerUser(User user);
	
	Boolean usernameExists(String username);
	
	void userLikeWorkout(int userId, int workoutId);

	List<Workout> getLikedWorkouts(int userId); 
	
	public User getUserById(int userId);
	
	

}
