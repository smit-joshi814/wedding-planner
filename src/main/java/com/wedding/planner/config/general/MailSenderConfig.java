package com.wedding.planner.config.general;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailSenderConfig {

	@Value("${spring.mail.username:}")
	private final String username = env("SPRING_MAIL_USERNAME");

	@Value("${spring.mail.password:}")
	private final String password = env("SPRING_MAIL_PASSWORD");

	private static String env(String name) {
		return System.getenv(name);
	}

	@Bean
	JavaMailSender javaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(465);
		mailSender.setUsername(username);
		mailSender.setPassword(password);

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");

		return mailSender;
	}
}
