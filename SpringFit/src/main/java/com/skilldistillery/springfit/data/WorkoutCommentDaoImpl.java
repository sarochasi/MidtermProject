package com.skilldistillery.springfit.data;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.skilldistillery.springfit.entities.WorkoutComment;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Repository
public class WorkoutCommentDaoImpl implements WorkoutCommentDAO{
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASpringFit");

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<WorkoutComment> findByUserId(int userId) {
		
		String jpql = "SELECT wc FROM WorkoutComment wc WHERE wc.user.id = :userId";
		return em.createQuery(jpql, WorkoutComment.class).setParameter("userId", userId).getResultList();
	}

	@Override
	public List<WorkoutComment> findByWorkoutId(int workoutId) {
		String jpql = "SELECT wc FROM WorkoutComment wc WHERE wc.workout.workout.id = :workoutId";
		
		return em.createQuery(jpql, WorkoutComment.class).setParameter("workoutId", workoutId).getResultList();
	}

}
