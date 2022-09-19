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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.duihua.chat.models.ChatRoom;
import com.duihua.chat.models.Profile;
import com.duihua.chat.models.User;
import com.duihua.chat.services.ChatRoomService;
import com.duihua.chat.services.UserService;
import com.duihua.chat.validator.UserValidator;

@Controller
public class ChatRoomController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@Autowired
	private UserValidator userValidator;
	
	// New Chat Room
	@GetMapping("/newChatRoom")
	public String newChatRoom(Principal principal, Model model,
			@ModelAttribute("chatRoom") ChatRoom chatRoom) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "newChatRoom.jsp";
		// Check if user is in session
//				if(session.getAttribute("loggedInUser")!=null) {
//					return "newProfile.jsp";
//				}
//				else {
//					return "redirect:/";
//				}
	}
	
	//	Create Chat Room
	@PostMapping("/createChatRoom")
	public String createChatRoom(@Valid @ModelAttribute("chatRoom") ChatRoom chatRoom,
			BindingResult result) {
		if(result.hasErrors()) {
			return "newChatRoom.jsp";
		}
		else {
			chatRoomService.createChatRoom(chatRoom);
			return "redirect:/";
		}
	}
	
	// Get One Chat Room
//	Get one chat room details - allow edit/delete
	@GetMapping("/chatRoom/{id}")
	public String enterChatRoom(@PathVariable Long id,
			Model model, Principal principal, @ModelAttribute("chatRoom") ChatRoom chatRoom) {
		
		if(principal !=null) {
		User user= userService.findByUserId(id);
		model.addAttribute("loggedInUser", user);
		
		ChatRoom oneChatRoom = chatRoomService.getOneChatRoom(id);
		model.addAttribute("oneChatRoom", oneChatRoom);
			return "chatRoom.jsp";
	}
			return "redirect:/";
		}
	
}
