package com.wedding.planner.config.auth.eventListeners;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.stereotype.Component;

import com.wedding.planner.service.UserService;

@Component
public class SessionDestroyedEventListener implements ApplicationListener<SessionDestroyedEvent> {

	@Autowired
	private UserService userService;

	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {

		// Handle session expiration event
		event.getSecurityContexts().forEach(securityContext -> {
			String username = securityContext.getAuthentication().getName();

			userService.updateLoginStatus(username, false);

//			System.out.println("Session expired for user: " + username);
		});
	}
}