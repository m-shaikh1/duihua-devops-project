package com.duihua.chat.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.duihua.chat.models.Profile;
import com.duihua.chat.models.User;
import com.duihua.chat.services.ProfileService;
import com.duihua.chat.services.UserService;

@Controller
public class ProfileController {

    @Autowired
    ProfileService profileService;

    @Autowired
    UserService userService;
    
	//	New Profile
	@GetMapping("/newProfile")
	public String newProfile(Principal principal,
			@ModelAttribute("profile") Profile profile, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "newProfile.jsp";
	}
	
	//	Create Profile
	@PostMapping("/createProfile")
	public String createProfile(@Valid @ModelAttribute("profile") Profile profile,
			BindingResult result) {
		if(result.hasErrors()) {
			return "newProfile.jsp";
		}
		else {
			profileService.createProfile(profile);
			return "redirect:/";
		}
	}
	
	//	Get one Profile details - allow edit/delete
	@GetMapping("/profileDetails/{id}")
	public String profileDetails(@PathVariable Long id,
			Model model, Principal principal) {
		
		//new method with Spring Security:
		if(principal !=null) {
			String username = principal.getName();
			model.addAttribute("currentUser", userService.findByUsername(username));
			
			User user= userService.findByUserId(id);
			model.addAttribute("user", user);
//			User user= userService.findByUserId(id);
//			model.addAttribute("loggedInUser", user);
//			
			Profile oneProfile = profileService.getOneProfile(id);
			model.addAttribute("oneProfile", oneProfile);
			return "profile.jsp";
		}
		return "redirect:/";
		}
	
//		Edit Profile
	@GetMapping("/editProfile/{id}")
	public String editProfile(Principal principal,
			@PathVariable Long id,
			Model model) {
		
		//	New Method with Spring Security
		if(principal !=null) {
			String username = principal.getName();
			model.addAttribute("currentUser", userService.findByUsername(username));
			
			User user= userService.findByUserId(id);
			model.addAttribute("loggedInUser", user);
			
			Profile myProfile = profileService.getOneProfile(id);
			model.addAttribute("myProfile", myProfile);
			return "editProfile.jsp";
		}
			return "redirect:/";
	}
	
	//	Update Profile
	@PostMapping("/updateProfile/{id}")
	public String updateProfile(@Valid @ModelAttribute("myProfile") Profile myProfile,
			BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			return "editProfile.jsp";
		}
		else {
			profileService.updateProfile(myProfile);
			return "redirect:/profileDetails/{id}";
		}
	}
	
	//	Delete Profile
	@DeleteMapping("/deleteProfile/{id}")
	public String deleteProfile(@PathVariable Long id, Principal principal) {
		System.out.println(id);
		// Check if user is in session
		if(principal != null) {
			profileService.deleteProfile(id);
			return "redirect:/";
		}
		
		return "redirect:/profileDetails/{id}";
	}
    
}
