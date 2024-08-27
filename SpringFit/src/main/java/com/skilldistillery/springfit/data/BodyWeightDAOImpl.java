package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.springfit.entities.BodyWeight;
import com.skilldistillery.springfit.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Transactional
@Repository
public class BodyWeightDAOImpl implements BodyWeightDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public BodyWeight createNewBodyWeight(BodyWeight bodyWeight, int userId) {
		
		 User user = em.find(User.class, userId);
		 bodyWeight.setUser(user);	
		 em.persist(bodyWeight);
		 return bodyWeight;

	}

}
