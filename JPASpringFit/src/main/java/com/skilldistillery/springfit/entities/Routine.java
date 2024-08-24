package com.skilldistillery.springfit.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Routine {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@OneToMany(mappedBy = "routine")
	private List<RoutineWorkout> routineWorkout;

	public Routine() {
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public List<RoutineWorkout> getRoutineWorkout() {
		return routineWorkout;
	}

	public void setRoutineWorkout(List<RoutineWorkout> routineWorkout) {
		this.routineWorkout = routineWorkout;
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
		Routine other = (Routine) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Routine [id=" + id + ", name=" + name + ", description=" + description + ", imageUrl=" + imageUrl
				+ ", routineWorkout=" + routineWorkout + "]";
	}
	
	

}
