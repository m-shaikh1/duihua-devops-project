package com.duihua.chat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duihua.chat.models.ChatRoom;
import com.duihua.chat.repositories.ChatRoomRepository;

@Service
public class ChatRoomService {

	@Autowired
	private ChatRoomRepository ChatRoomRepo;
	
	// Show all users' chat rooms
	 public List<ChatRoom> allChatRooms() {
	        return ChatRoomRepo.findAll();
	    }
	
	// Create new chat room
	 public ChatRoom createChatRoom(ChatRoom chatRoom) {
	        return ChatRoomRepo.save(chatRoom);
	    }
	 
	// Delete chat room
	 public void deleteChatRoom(Long id) {
		 ChatRoomRepo.deleteById(id);
	    }
	 
	// Get one chat room
	 public ChatRoom getOneChatRoom(Long id) {
	    	return ChatRoomRepo.findById(id).orElse(null);
	    }
	
	// Update chat room
	 public ChatRoom updateChatRoom(ChatRoom chatRoom) {
	    	return ChatRoomRepo.save(chatRoom);
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
