package com.wedding.planner.config.auth.eventListeners;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

import com.wedding.planner.service.UserService;

@Component
public class AuthenticationSuccessEventListener implements ApplicationListener<AuthenticationSuccessEvent> {

	@Autowired
	private UserService userService;
	
    @Override
    public void onApplicationEvent(AuthenticationSuccessEvent event) {
        // Handle successful login event
        String username = event.getAuthentication().getName();
        
        userService.updateLoginStatus(username, true);
        
//        System.out.println("User logged in: " + username);
        // Add your custom logic here
    }
}
