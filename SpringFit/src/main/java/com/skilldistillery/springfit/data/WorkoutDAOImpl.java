
package com.skilldistillery.springfit.data;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;
import com.skilldistillery.springfit.entities.WorkoutExercise;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Repository
public class WorkoutDAOImpl implements WorkoutDAO {
 
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
		workout.setEnabled(true);
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
	public boolean deleteExerciseByWorkoutId(int id) {
		boolean deleted = false;

		String jpql = "DELETE FROM WorkoutExercise we WHERE we.workout.id = :workoutId";
		int result = em.createQuery(jpql).setParameter("workoutId", id).executeUpdate();

		if (result > 0) {
			deleted = true;
		}

		return deleted;

	}

	@Override
	public boolean deleteWorkout(int id) {
		boolean deleted = false;

		Workout managedWorkout = em.find(Workout.class, id);

		if (managedWorkout != null) {
//			deleteExerciseByWorkoutId(id);
			managedWorkout.setEnabled(false);
//			em.remove(managedWorkout);
			deleted = true;
		}

		return deleted;
	}

	@Override
	public List<Workout> showAllWorkouts() {
		String jpql = "SELECT w FROM Workout w";
		return em.createQuery(jpql, Workout.class).getResultList();
	}

//	===================================================================
	public List<WorkoutExercise> getExercisesByWorkoutId(int workoutId) {
		String jpql = "SELECT we FROM WorkoutExercise we WHERE we.workout.id = :workoutId";
		return em.createQuery(jpql, WorkoutExercise.class).setParameter("workoutId", workoutId).getResultList();
	}
	


//	=====================================================================

	public List<Workout> getWorkoutByUserId(int userId) {
		String jpql = "SELECT w FROM Workout w JOIN FETCH w.workoutExercises WHERE w.user.id = :userId AND w.enabled = true";

		return em.createQuery(jpql, Workout.class).setParameter("userId", userId).getResultList();

	}

	@Override
	public Workout updateWorkout(int id, Workout workout) {

		Workout managedWorkout = em.find(Workout.class, id);
		if (managedWorkout != null) {
			managedWorkout.setName(workout.getName());
			managedWorkout.setDescription(workout.getDescription());
//			managedWorkout.setCreateDate(workout.getCreateDate());
//			managedWorkout.setLastUpdate(workout.getLastUpdate());
//			managedWorkout.setEnabled(workout.getEnabled());
			managedWorkout.setPublished(workout.getPublished());
			managedWorkout.setImageUrl(workout.getImageUrl());
//			managedWorkout.setWorkoutExercises(workout.getWorkoutExercises());
			em.flush();

		}
		return managedWorkout;

	}

	 @Override
	    public Workout save(Workout workout) {
	        if (workout.getId() == 0) { // If the workout doesn't have an ID, it's new
	            em.persist(workout);
	        } else { // If it has an ID, it's an update
	            workout = em.merge(workout);
	        }
	        return workout;
	    }
	 
	  public Workout findById(Integer id) {
	        return em.find(Workout.class, id);
	    }
	
}
