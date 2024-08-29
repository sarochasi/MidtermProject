package com.skilldistillery.springfit.data;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.springfit.entities.Routine;
import com.skilldistillery.springfit.entities.RoutineWorkout;
import com.skilldistillery.springfit.entities.Workout;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;

@Transactional
@Repository
public class RoutineWorkoutDAOImpl implements RoutineWorkoutDAO {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASpringFit");
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public RoutineWorkout createRoutineWorkout(int day, int workoutId, int routineId, RoutineWorkout routineWorkout) {
//		Workout workout = em.find(Workout.class, workoutId);
		Workout workout = em.find(Workout.class, routineWorkout.getWorkout().getId());
		Routine routine = em.find(Routine.class, routineId);
		if(workout !=null && routine != null) {
			routineWorkout.setRoutine(routine);
			routineWorkout.setWorkout(workout);
			em.persist(routineWorkout);
		}
		return routineWorkout;
	}
	
	

}
