package com.duihua.chat.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.duihua.chat.models.ChatRoom;

public interface ChatRoomRepository extends CrudRepository<ChatRoom, Long> {
	List<ChatRoom> findAll();

}
