package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.UserInfo;

public interface UserRepository {
	List<UserInfo> selectAllUsers();
	
	UserInfo select(String id);
	
	int insert(UserInfo info);
	
	int update(UserInfo info);
	
	int delete(String userId);
}