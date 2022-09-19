package com.duihua.chat.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.duihua.chat.models.Profile;

@Repository
public interface ProfileRepository extends CrudRepository<Profile, Long> {
	List<Profile> findAll();
	
	
}
