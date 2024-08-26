
package com.skilldistillery.springfit.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.springfit.entities.Exercise;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class ExerciseDaoImpl implements ExerciseDAO {
	
	@PersistenceContext
	private EntityManager em;

	// SHOW ALL
	@Override
	public List<Exercise> showAllExercises() {
		// Exercise exercise = null;
		String jpql = "SELECT e FROM Exercise e";
		return em.createQuery(jpql, Exercise.class).getResultList();		
	}
	@Override
	public List<Exercise> findAllExercises() {
		// Exercise exercise = null;
		String jpql = "SELECT e FROM Exercise e";
		List<Exercise> exerciseList;
		exerciseList = em.createQuery(jpql, Exercise.class).getResultList();
		em.close();
		return exerciseList;
	}

	// KEYWORD
	@Override
	public List<Exercise> showExercisesByKeyword(String keyword) {
		String jpql = "SELECT e FROM Exercise e WHERE e.name LIKE :keyword";
		return em.createQuery(jpql, Exercise.class).setParameter("keyword", "%" + keyword + "%")
				.getResultList();
	}
	
	// ID
	@Override
	public Exercise showExerciseById(int id) {
		return em.find(Exercise.class, id);
	}
// Might find a need for an update feature in the future.	


	// This may need work.
	@Override
	public List<Exercise> showExercisesByType(int id) {
		String jpql = "SELECT e FROM Exercise e WHERE e.type.id = :exerciseType";
        return em.createQuery(jpql, Exercise.class)
                 .setParameter("exerciseType", id)
                 .getResultList(); 
	}
	
	
	
	
	
	
	
	

}

