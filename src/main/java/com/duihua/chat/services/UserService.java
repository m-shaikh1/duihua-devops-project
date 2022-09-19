package com.duihua.chat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.duihua.chat.models.User;
import com.duihua.chat.repositories.RoleRepository;
import com.duihua.chat.repositories.UserRepository;

 
@Service
public class UserService {
    @Autowired
	private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    // 1
    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        userRepository.save(user);
    }
     
     // 2 
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }    
    
    // 3
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    // find User
    public User findByUserId(Long id) {
//    	Optional<User> optUser = userRepository.findById(id);
//    	return optUser.get();
    	return userRepository.findById(id).orElse(null);
    }
    
    // get all Users
    public List<User> allUsers() {
    	return userRepository.findAll();
    }
    
}