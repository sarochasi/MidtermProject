package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;

public interface UserDAO {
	
	User authenticateUser(String username, String password);
	
	User registerUser(User user);
	
	Boolean usernameExists(String username);
	
	void userLikeWorkout(int userId, int workoutId);
	
	public User getUserById(int userId);
	
	User saveUser(User user);

	List<Workout> getLikedWorkouts(int userId);


}