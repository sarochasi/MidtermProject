package com.skilldistillery.springfit.data;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;
import com.skilldistillery.springfit.entities.WorkoutExercise;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Repository
public class WorkoutDAOImpl implements WorkoutDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASpringFit");
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Workout getWorkoutById(int workoutId) {
		return em.find(Workout.class, workoutId);
	}

	// Initialize
	@Override
	public Workout createNewWorkoutInitialize(Workout workout, int userId) {
		User user = em.find(User.class, userId);
		workout.setUser(user);
		em.persist(workout);
		return workout;
	}
	// Create
	@Override
	public Workout createNewWorkout(String workoutName, List<WorkoutExercise> exerciseList) {
		Workout newWorkout = new Workout();
		newWorkout.setWorkoutExercise(exerciseList);
		
		return newWorkout;
	}
	// Add exercises to workout
	@Override
	public Workout addExerciseToWorkout(int workoutId, WorkoutExercise workoutExercise) {
		Workout workout = em.find(Workout.class, workoutId);
		if (workout != null) {
			workout.addWorkoutExercise(workoutExercise);  
			em.persist(workoutExercise);  
			em.merge(workout);  
		}
		return workout;
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
