package com.skilldistillery.springfit.entities;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "workout_comment")
public class WorkoutComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	private String content;
	
	@ManyToOne
	@JoinColumn(name = "in_reply_to_id")
	private WorkoutComment reply;
	
	@OneToMany(mappedBy = "reply")
	private List<WorkoutComment> replies;
	
	private Boolean enabled;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

//	private Workout workoutId;
	
	public WorkoutComment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public WorkoutComment getReply() {
		return reply;
	}

	public void setReply(WorkoutComment reply) {
		this.reply = reply;
	}

	public List<WorkoutComment> getReplies() {
		return replies;
	}

	public void setReplies(List<WorkoutComment> replies) {
		this.replies = replies;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}



	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "WorkoutComment [id=" + id + ", createDate=" + createDate + ", content=" + content + ", reply=" + reply
				+ ", replies=" + replies + ", enabled=" + enabled + ", userId=" + user + "]";
	}
	
	
	
}
