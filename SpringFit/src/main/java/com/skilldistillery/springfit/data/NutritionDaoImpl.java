package com.skilldistillery.springfit.data;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.skilldistillery.springfit.entities.Nutrition;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Repository
public class NutritionDaoImpl implements NutritionDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Nutrition addNutrition(Nutrition nutrition) {
		em.persist(nutrition);
		return nutrition;
	}

	@Override
	public List<Nutrition> showAllNutrition() {
		String jpql = "SELECT n FROM Nutrition n";
		return em.createQuery(jpql, Nutrition.class).getResultList();
	}

	@Override
	public List<Nutrition> findAllByUser(int userId) {
	    String jpql = "SELECT n FROM Nutrition n WHERE n.user.id = :userId";
	    return em.createQuery(jpql, Nutrition.class)
	             .setParameter("userId", userId)
	             .getResultList();
	}


	
	

}


