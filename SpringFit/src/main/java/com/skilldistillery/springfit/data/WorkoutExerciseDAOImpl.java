
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
	
	@Override
	public boolean deleteExerciseByWorkoutId(int id) {
		boolean deleted = false;
		
		String jpql = "DELETE FROM WorkoutExercise we WHERE we.workout.id = :workoutId";
	    int result = em.createQuery(jpql)
	                   .setParameter("workoutId", id)
	                   .executeUpdate();

	    if(result > 0) {
	        deleted = true;
	    }

	    return deleted;
		
	}
	
	
//	@Override
//	public boolean deleteWorkoutExercise(int id) {
//		
//		boolean deleted = false;
//		
//		String jpql = "DELETE FROM WorkoutExercise we WHERE we.id = :workoutExerciseId";
//		int result = em.createQuery(jpql).setParameter("workoutExerciseId", id).executeUpdate();
//		
//		if(result > 0) {
//			deleted = true;
//		}
//		return deleted;
//	}

	@Override
	public boolean deleteWorkoutExercise(int id) {
	    WorkoutExercise workoutExercise = em.find(WorkoutExercise.class, id);
	    if (workoutExercise != null) {
	        em.remove(workoutExercise);
	        return true;
	    }
	    return false;
	}
	
	@Override
	public WorkoutExercise updateWorkoutExercise(int id, WorkoutExercise workoutExercise) {
		WorkoutExercise managedWorkoutExercise = em.find(WorkoutExercise.class, id);
		if(managedWorkoutExercise != null) {
//			managedWorkoutExercise.setExercise(workoutExercise.getExercise());
			managedWorkoutExercise.setUnits(workoutExercise.getUnits());
			managedWorkoutExercise.setSets(workoutExercise.getSets());
			managedWorkoutExercise.setNotes(workoutExercise.getNotes());
			
			
		}
		return managedWorkoutExercise;
	}
	
	
	
	

}
