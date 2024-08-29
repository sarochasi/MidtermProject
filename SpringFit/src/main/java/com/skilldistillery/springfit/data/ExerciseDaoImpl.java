
package com.skilldistillery.springfit.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.springfit.entities.Exercise;
import com.skilldistillery.springfit.entities.ExerciseType;

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
		String jpql = "SELECT e FROM Exercise e WHERE e.exerciseType.id = :exerciseType";
        return em.createQuery(jpql, Exercise.class)
                 .setParameter("exerciseType", id)
                 .getResultList(); 
	}
	@Override
	public List<ExerciseType> findAllExerciseTypes() {
		String jpql = "Select e FROM ExerciseType e";				
		return em.createQuery(jpql, ExerciseType.class).getResultList();
	}
	@Override
	public boolean deleteExercise(int id) {
		
		boolean deleted = false;
		
		Exercise managedExercise = em.find(Exercise.class, id);
		if(managedExercise != null)
		{
			em.remove(managedExercise);
			deleted = true;
		}
		return deleted;
	}
	
	
	

}

