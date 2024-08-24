package com.skilldistillery.springfit.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="routine_workout")
public class RoutineWorkout {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="day_number")
	private Integer dayNumber;
	
	@Column(name="workout_sequence")
	private Integer workoutSequence;
	
	@ManyToOne
	@JoinColumn(name = "routine_id")
	private Routine routine;

	public RoutineWorkout() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getDayNumber() {
		return dayNumber;
	}

	public void setDayNumber(Integer dayNumber) {
		this.dayNumber = dayNumber;
	}

	public Integer getWorkoutSequence() {
		return workoutSequence;
	}

	public void setWorkoutSequence(Integer workoutSequence) {
		this.workoutSequence = workoutSequence;
	}

	public Routine getRoutine() {
		return routine;
	}

	public void setRoutine(Routine routine) {
		this.routine = routine;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RoutineWorkout other = (RoutineWorkout) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "RoutineWorkout [id=" + id + ", dayNumber=" + dayNumber + ", workoutSequence=" + workoutSequence
				+ ", routine=" + routine + "]";
	}
	
	

}
