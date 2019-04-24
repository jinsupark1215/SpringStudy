package com.ssafy.model.repository;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ssafy.model.dto.UserInfo;

@Component("userMysqlRepo")
public class UserRepositoryMysqlImpl implements UserRepository{
	
	public List<UserInfo> selectAllUsers() {
		System.out.println("select All User");
		return null;
	}

	public UserInfo select(String id) {
		System.out.println("select : id : " + id);
		return null;
	}

	public int insert(UserInfo info) {
		System.out.println(info);
		return 0;
	}

	public int update(UserInfo info) {
		System.out.println(info);
		return 0;
	}

	public int delete(String userId) {
		System.out.println("userId = " + userId);
		return 0;
	}

}
