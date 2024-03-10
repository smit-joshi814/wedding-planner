package com.wedding.planner.config.auth.eventListeners;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.LogoutSuccessEvent;
import org.springframework.stereotype.Component;

import com.wedding.planner.service.UserService;

@Component
public class LogoutSuccessEventListener implements ApplicationListener<LogoutSuccessEvent> {

	@Autowired
	private UserService userService;

	@Override
	public void onApplicationEvent(LogoutSuccessEvent event) {
		// Handle successful logout event
		String username = event.getAuthentication().getName();

		userService.updateLoginStatus(username, false);

//		System.out.println("User logged out: " + username);
		// Add your custom logic here
	}
}
