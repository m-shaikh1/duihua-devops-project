package com.duihua.chat.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="profiles")
public class Profile {
    
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message="Please enter at least one language.")
    @Size(min = 3, max = 100, message="Language name(s) must be between 3 and 100 characters")
    private String languagesSpoken;
    
    @NotBlank(message="Please enter at least one language.")
    @Size(min = 3, max = 100, message="Language name(s) must be between 3 and 100 characters")
    private String languagesLearning;
    
    @NotBlank(message="Interest(s) is/are required.")
    @Size(min = 3, max = 200, message="Interest(s) must be between 3 and 200 characters")
    private String interests;
    
    @NotBlank(message="Profile description is required.")
    @Size(min = 3, max = 250, message="Profile description must be between 3 and 250 characters")
    private String description;
    
    // This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
   // One to one relationship with a single user
    @OneToOne(fetch = FetchType.LAZY) // optional = false <-- needed?
    @JoinColumn(name = "user_id") // nullable = false <-- needed?
    private User user;

    //	Getters and setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLanguagesSpoken() {
		return languagesSpoken;
	}
	public void setLanguagesSpoken(String languagesSpoken) {
		this.languagesSpoken = languagesSpoken;
	}
	public String getLanguagesLearning() {
		return languagesLearning;
	}
	public void setLanguagesLearning(String languagesLearning) {
		this.languagesLearning = languagesLearning;
	}
	public String getInterests() {
		return interests;
	}
	public void setInterests(String interests) {
		this.interests = interests;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

    
}