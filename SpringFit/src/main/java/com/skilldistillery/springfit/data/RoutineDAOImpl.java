package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.springfit.entities.Routine;
import com.skilldistillery.springfit.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;

@Transactional
@Repository
public class RoutineDAOImpl implements RoutineDAO {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASpringFit");
	
	@PersistenceContext
	private EntityManager em;
	

	@Override
	public Routine createNewRoutine(Routine routine, int userId) {
		User user = (User)em.find(User.class, userId);
		routine.setUser(user);
		em.persist(routine);
		return routine;
	}

}
