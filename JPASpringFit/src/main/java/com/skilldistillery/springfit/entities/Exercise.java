package com.skilldistillery.springfit.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Exercise {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String instructions;
	
	@ManyToOne
	@JoinColumn(name = "exercise_type")
	private ExerciseType exerciseType;
	
	@Column(name="calories_per_unit")
	private int caloriesPerUnit;
	
//	private UnitType unitType;
	
	@Column(name="image_url")
	private String imageUrl;

	public Exercise() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public int getCaloriesPerUnit() {
		return caloriesPerUnit;
	}

	public void setCaloriesPerUnit(int caloriesPerUnit) {
		this.caloriesPerUnit = caloriesPerUnit;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	

	public ExerciseType getExerciseType() {
		return exerciseType;
	}

	public void setExerciseType(ExerciseType exerciseType) {
		this.exerciseType = exerciseType;
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
		Exercise other = (Exercise) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Exercise [id=" + id + ", name=" + name + ", instructions=" + instructions + ", exerciseType="
				+ exerciseType + ", caloriesPerUnit=" + caloriesPerUnit + ", imageUrl=" + imageUrl + "]";
	}
	
	
}
