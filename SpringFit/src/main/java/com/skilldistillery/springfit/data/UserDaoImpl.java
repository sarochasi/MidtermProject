package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	// AUTHENTICATE USER - (should return null if invalid user/pass, or disabled -
	// Needs to be surrounded w/ IF/ELSE)
	@Override
	public User authenticateUser(String username, String password) {
		User user = null;
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw" + " AND enabled = true";
		// The space before "AND" is necessary if split across multiple lines
		try {
			user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
			System.out.println("Invalid user!");
			// e.printStackTrace();
		}
		return user;
	}

	@Override
	public User registerUser(User user) {
		try {
			em.persist(user);
			em.flush();
		} catch (Exception e) {
			System.out.println("Error registering user");

			user = null;
		}
		return user;

	}

	@Override
	public Boolean usernameExists(String username) {
		String jpql = "SELECT COUNT(u) FROM User u WHERE u.username = :un";
		Long count = em.createQuery(jpql, Long.class).setParameter("un", username).getSingleResult();

		return count > 0;
	}

	@Override
	public void userLikeWorkout(int userId, int workoutId) {
		User user = em.find(User.class, userId);
		Workout workout = em.find(Workout.class, workoutId);
		user.getLikedWorkout().add(workout);
		em.persist(user);
		em.persist(workout);
	}

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}
	
	
	
	@Override
	public User getUserById(int userId) {
		return em.find(User.class, userId);
	}

}
