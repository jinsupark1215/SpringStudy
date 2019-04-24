package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.ssafy.model.dto.UserInfo;
import com.ssafy.model.repository.UserRepository;

@Component("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	@Qualifier("userMysqlRepo")
	private UserRepository userRepo;

	public UserServiceImpl() {
	}

	public UserServiceImpl(UserRepository repo) {
		this.userRepo = repo;
	}

	public UserRepository getUserRepo() {
		return userRepo;
	}

	public UserInfo login(String id, String pass) {
		return userRepo.select(id);
	}

	public UserInfo select(String id) {
		return userRepo.select(id);
	}

	public List<UserInfo> selectAll() {
		return userRepo.selectAllUsers();
	}

	public int joinDayTime(UserInfo info) {
		System.out.println("Join Day Time " + info);
		return 0;
	}

	public int updateDayTime(UserInfo info) {
		System.out.println("Update Day Time " + info);
		return 0;
	}

	public int leaveDayTime(String id) {
		System.out.println("Leave Day Time " + id);
		return 0;
	}

}