package snippet;

public class Snippet {
	boolean deleted = false;
	
	    // Find the workout by ID
	    Workout managedWorkout = em.find(Workout.class, id);
	
	    if(managedWorkout != null) {
	        // First delete all associated exercises
	        deleteExerciseByWorkoutId(id);
	
	        // Then delete the workout itself
	        em.remove(managedWorkout);
	        deleted = true;
	    }
	
	    return deleted;
}

