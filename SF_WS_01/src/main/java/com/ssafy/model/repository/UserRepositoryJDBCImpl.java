package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.UserInfo;

public class UserRepositoryJDBCImpl implements UserRepository {

	@Override
	public List<UserInfo> selectAllUsers() {
		System.out.println("select All User");
		return null;
	}

	@Override
	public UserInfo select(String id) {
		System.out.println("select : id : " + id);
		return null;
	}

	@Override
	public int insert(UserInfo info) {
		System.out.println(info);
		return 0;
	}

	@Override
	public int update(UserInfo info) {
		System.out.println(info);
		return 0;
	}

	@Override
	public int delete(String userId) {
		System.out.println("userId = " + userId);
		return 0;
	}
}