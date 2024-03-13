package com.wedding.planner.utils.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.wedding.planner.config.auth.AuthUserDetails;
import com.wedding.planner.utils.UtilityService;

@Service
public class UtilityServiceImpl implements UtilityService {

	@Autowired
	private SessionRegistry sessionRegistry;

	@Override
	public String getCurrentUsername() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null && authentication.isAuthenticated()) {
			Object principal = authentication.getPrincipal();

			if (principal instanceof UserDetails) {
				return ((UserDetails) principal).getUsername();
			}
		}

		// Return a default or handle the case where the username is not available
		return "unknownUser";
	}

	@Override
	public void invalidateUserSession(String username) {
		List<Object> principals = sessionRegistry.getAllPrincipals();

		for (Object principal : principals) {
			if (principal instanceof AuthUserDetails) {
				AuthUserDetails userDetails = (AuthUserDetails) principal;
				if (userDetails.getUsername().trim().contentEquals(username.trim())) {
					List<SessionInformation> sessions = sessionRegistry.getAllSessions(principal, false);
					for (SessionInformation session : sessions) {
						session.expireNow(); // Invalidate the session
					}
				}
			}
		}
	}

}