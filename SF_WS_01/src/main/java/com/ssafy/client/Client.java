package com.ssafy.client;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ssafy.model.repository.UserRepository;
import com.ssafy.model.service.UserService;

public class Client {

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		BeanFactory ctx = new ClassPathXmlApplicationContext("/ApplicationConfig.xml");

//		UserRepository repoJDBC = (UserRepository) ctx.getBean("userJDBCRepo");
//		UserRepository repoMySQL = (UserRepository) ctx.getBean("userMySQLRepo");
//		UserService jdbcService = (UserService) ctx.getBean("userJDBCService");
//		UserService mysqlService = (UserService) ctx.getBean("userMySQLService");
//
//		System.out.println("JDBC와 빈의 동일성 확인 : " + (jdbcService.getUserRepo() == repoJDBC));
//		System.out.println("MySQL과 빈의 동일성 확인 : " + (mysqlService.getUserRepo() == repoMySQL));
		
//		UserService userService = (UserService) ctx.getBean("userJDBCService");
//		UserRepository repoJDBC = (UserRepository) ctx.getBean("userJDBCRepo");
//		
//		System.out.println("JDBC Repository와 빈의 동일성 확인 : " + (userService.getUserRepo() == repoJDBC));
		
		UserService userService = (UserService) ctx.getBean("userService");
		UserRepository repoMySQL = (UserRepository) ctx.getBean("userMysqlRepo");
		
		System.out.println("MySQL Repository와 빈의 동일성 확인 : " + (userService.getUserRepo() == repoMySQL));
	}
}