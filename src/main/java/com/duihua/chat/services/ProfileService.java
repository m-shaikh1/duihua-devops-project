package com.duihua.chat.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.duihua.chat.models.Profile;
import com.duihua.chat.repositories.ProfileRepository;

@Service
public class ProfileService {

	@Autowired
	private ProfileRepository profileRepo;
	
	// Show all users' profiles
	 public List<Profile> allProfiles() {
	        return profileRepo.findAll();
	    }
	
	// Create new profile
	 public Profile createProfile(Profile profile) {
	        return profileRepo.save(profile);
	    }
	 
	// Delete profile page
	 public void deleteProfile(Long id) {
	    	profileRepo.deleteById(id);
	    }
	 
	// Get one profile page
	 public Profile getOneProfile(Long id) {
	    	return profileRepo.findById(id).orElse(null);
	    }
	
	// Update profile page
	 public Profile updateProfile(Profile profile) {
	    	return profileRepo.save(profile);
	    }

   
    // retrieves a profile name
//    public Song findSong(Long id) {
//        Optional<Song> optionalSong = songRepo.findById(id);
//        if(optionalSong.isPresent()) {
//            return optionalSong.get();
//        } else {
//            return null;
//        }
//    }
    
    
}
