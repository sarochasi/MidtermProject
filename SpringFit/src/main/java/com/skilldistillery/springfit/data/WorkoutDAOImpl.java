package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.Exercise;
import com.skilldistillery.springfit.entities.Workout;
import com.skilldistillery.springfit.entities.WorkoutExercise;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;

public class WorkoutDAOImpl implements WorkoutDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASpringFit");
	
	
	@PersistenceContext
	private EntityManager em;

	//	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory(")

	@Override
	public Workout getWorkoutById(int workoutId) {
		// TODO Auto-generated method stub
		return em.find(Workout.class, workoutId);
	}

	@Override
	public Workout createNewWorkout(String workoutName, List<WorkoutExercise> exerciseList) {
		EntityManager em=emf.createEntityManager();
		Workout newWorkout = new Workout();
		newWorkout.setWorkoutExercise(exerciseList);
		return newWorkout;
	}

	@Override
	public Workout updateNewWorkout(int id, List<WorkoutExercise> exerciseList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteWorkout(int id, List<WorkoutExercise> exerciseList) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	

}
