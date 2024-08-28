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

	@Override
	public Workout createNewWorkoutInitialize(Workout workout, int userId) {
		User user = em.find(User.class, userId);
		workout.setUser(user);
		em.persist(workout);
		return workout;
	}
	@Override
	public Workout createNewWorkout(String workoutName, List<WorkoutExercise> exerciseList) {
		Workout newWorkout = new Workout();
		newWorkout.setWorkoutExercises(exerciseList);
		
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

	@Override
	public List<Workout> showAllWorkouts() {
		String jpql = "SELECT w FROM Workout w";
		return em.createQuery(jpql, Workout.class).getResultList();
	}
	

//	===================================================================
	public List<WorkoutExercise> getExercisesByWorkoutId(int workoutId) {
	    String jpql = "SELECT we FROM WorkoutExercise we WHERE we.workout.id = :workoutId";
	    return em.createQuery(jpql, WorkoutExercise.class)
	             .setParameter("workoutId", workoutId)
	             .getResultList();
	}

//	=====================================================================
	
	public List<Workout> getWorkoutByUserId(int  userId){
		String jpql = "SELECT w FROM Workout w JOIN FETCH w.workoutExercises WHERE w.user.id = :userId";
		
		
		return em.createQuery(jpql, Workout.class).setParameter("userId", userId).getResultList();
		
	}

}
