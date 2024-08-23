package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.springfit.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional; 

@Service
@Transactional
public class UserDaoImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	// AUTHENTICATE USER - (should return null if invalid user/pass, or disabled - Needs to be surrounded w/ IF/ELSE)
	@Override
	public User authenticateUser(String username, String password) {
		User user = null;
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw"
				+ " AND enabled = true";	// The space before "AND" is necessary if split across multiple lines
		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("un", username)
					.setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
			System.out.println("Invalid user!");
			// e.printStackTrace();
		}
		return user;
	} 
	
	
	
	

}
