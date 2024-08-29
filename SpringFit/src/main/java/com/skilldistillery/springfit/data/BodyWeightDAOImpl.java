package com.skilldistillery.springfit.data;

import java.util.List;

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
	public List<BodyWeight> showAllBodyWeightsForUser(User user){
		List<BodyWeight> usersBodyWeightList = null;
		
		String jpql = "SELECT bw FROM BodyWeight bw WHERE user.id = :id";
		usersBodyWeightList = em.createQuery(jpql, BodyWeight.class)
								.setParameter("id", user.getId())
								.getResultList();
		
		return usersBodyWeightList;
	}

}
