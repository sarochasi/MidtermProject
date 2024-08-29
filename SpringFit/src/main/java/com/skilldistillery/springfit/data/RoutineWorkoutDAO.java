package com.skilldistillery.springfit.data;

import com.skilldistillery.springfit.entities.RoutineWorkout;

public interface RoutineWorkoutDAO {
	
	public RoutineWorkout createRoutineWorkout(int day, int workoutId, int routineId, RoutineWorkout routineWorkout);
	

}
