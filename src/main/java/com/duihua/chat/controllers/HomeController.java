package com.duihua.chat.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duihua.chat.models.User;
import com.duihua.chat.models.ChatRoom;
import com.duihua.chat.models.Profile;
import com.duihua.chat.services.ProfileService;
import com.duihua.chat.services.ChatRoomService;
import com.duihua.chat.services.UserService;
import com.duihua.chat.validator.UserValidator;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@Autowired
	UserValidator userValidator;
	
//	Root route
	@GetMapping(value={"/", "/home"})
	public String home(Principal principal, Model model) {
		
		//alternate spring security method w/principal:
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		model.addAttribute("chatRooms", chatRoomService.allChatRooms());
		return "homePage.jsp";
	}
	
	//	Registration page
	@GetMapping("/registration")
	public String registerForm(@Valid @ModelAttribute("user") User user) {
		return "registrationPage.jsp";
	}
	
//	Register a user
	@PostMapping("/registration")
	public String registerUser(@Valid @ModelAttribute("user") User user, 
         BindingResult result, Model model) {
		
		//	Validate user
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			 return "registrationPage.jsp";
	}
		//	Register user
//		userService.saveWithUserRole(user);
		userService.saveUserWithAdminRole(user);
		 return "redirect:/newProfile"; 
	}
	
	//	Login Page
	@GetMapping("/login")
	public String login(@RequestParam(value="error", required=false) String error, 
			@RequestParam(value="logout", required=false) String logout, Model model) {
		if(error != null) {
			model.addAttribute("errorMessage", "Invalid credentials, please try again.");
		}
		if(logout != null) {
			model.addAttribute("logoutMessage", "Logout successful!");
		}
		return "loginPage.jsp";
	}
	
	//	Admin Dashboard
	@GetMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "adminPage.jsp";
	}
	
	// Example chat room
	@GetMapping("/chat")
	public String chatRoom() {
		return "chatRoom.jsp";
	}
	
	//	Discover Users page
	@GetMapping("/discover")
	public String allUsers(Principal principal, Model model) {
		model.addAttribute("allProfiles", profileService.allProfiles());
		return "discoverUsers.jsp";
	}
	
	 // Login a user
//	 @PostMapping("/login")
//	 public String loginUser(@Valid @ModelAttribute("newLogin") LoginUser loginUser, 
//	         BindingResult result, 
//	         HttpSession session, 
//	         @ModelAttribute("newUser") User user) {
//		 
//		 //Authenticate the user
//		 userService.authenticateUser(loginUser, result);
//		 if(result.hasErrors()) {
//			 return "index.jsp";
//		 }
//	     User loggedInUser=userService.findByEmail(loginUser.getEmail());
//	    
//	     //Put user in session
//	     session.setAttribute("loggedInUser", loggedInUser);
//	     return "redirect:/dashboard";
//	 }

	 //	Logout a user
	 @GetMapping("/logout")
	 public String logout(HttpSession session) {
		 session.invalidate();
		 return "redirect:/";
	 }
	
//	
//	@GetMapping(path = UserLinks.LIST_USERS)
//    public ResponseEntity<?> listUsers() {
//        log.info("UsersController:  list users");
//        List<Users> resource = usersService.getUsers();
//        return ResponseEntity.ok(resource);
//    }
//	
//	@PostMapping(path = UserLinks.ADD_USER)
//	public ResponseEntity<?> saveUser(@RequestBody Users user) {
//        log.info("UsersController:  list users");
//        Users resource = usersService.saveUser(user);
//        return ResponseEntity.ok(resource);
//    }
	
}
