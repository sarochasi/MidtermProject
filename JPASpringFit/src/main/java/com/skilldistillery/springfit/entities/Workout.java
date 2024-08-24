package com.skilldistillery.springfit.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Workout {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	private Boolean enabled;
	
	private Boolean published;
	
	@Column(name="image_url")
	private String imageUrl;
	@OneToMany(mappedBy = "workout")
	private List<WorkoutComment> workoutComments;
	
	@ManyToMany
	@JoinTable(name="liked_workout", joinColumns = @JoinColumn(name="workout_id"),
	inverseJoinColumns = @JoinColumn(name="user_id"))
	private List<User> users;
	
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public Workout() {
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

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Boolean getPublished() {
		return published;
	}

	public void setPublished(Boolean published) {
		this.published = published;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}



	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	

	public List<WorkoutComment> getWorkoutComments() {
		return workoutComments;
	}

	public void setWorkoutComments(List<WorkoutComment> workoutComments) {
		this.workoutComments = workoutComments;
	}
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		Workout other = (Workout) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Workout [id=" + id + ", name=" + name + ", description=" + description + ", createDate=" + createDate
				+ ", lastUpdate=" + lastUpdate + ", enabled=" + enabled + ", published=" + published + ", imageUrl="
				+ imageUrl + ", users=" + users + ", workoutComments=" + workoutComments + ", user=" + user + "]";
	}
	
	

}
