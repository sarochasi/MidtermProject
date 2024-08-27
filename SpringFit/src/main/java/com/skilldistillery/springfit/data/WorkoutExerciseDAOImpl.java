package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.springfit.entities.Exercise;
import com.skilldistillery.springfit.entities.WorkoutExercise;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;

@Transactional
@Repository
public class WorkoutExerciseDAOImpl implements WorkoutExerciseDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASpringFit");
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public WorkoutExercise getWorkoutExerciseById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorkoutExercise updateWorkoutExerciseById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorkoutExercise createWorkoutExerciseById(int exerciseId) {

		
		return null;
	}

	@Override
	public WorkoutExercise deleteWorkoutExerciseById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorkoutExercise createWorkoutExerciseByExercise(Exercise exercise) {
		WorkoutExercise newWorkoutExercise = new  WorkoutExercise();
		newWorkoutExercise.setExercise(exercise);		
		return newWorkoutExercise;
	}

}
