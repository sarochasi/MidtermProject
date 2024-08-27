package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.springfit.entities.Exercise;

import com.skilldistillery.springfit.entities.Workout;

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
	public WorkoutExercise createWorkoutExercise(int exerciseId, int workoutId, WorkoutExercise workoutExercise) {
		Exercise exercise = em.find(Exercise.class, exerciseId);
		Workout workout = em.find(Workout.class, workoutId);
		if(exercise !=null && workout !=null)
		{
			workoutExercise.setExercise(exercise);
			workoutExercise.setWorkout(workout);
			em.persist(workoutExercise);
			return workoutExercise;
		}
		else {
			return null;
		}
		

	}

}
