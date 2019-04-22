package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.UserInfo;
import com.ssafy.model.repository.UserRepository;

public interface UserService {
	UserRepository getUserRepo();
	UserInfo login(String id, String pass);
	UserInfo select(String id);
	List<UserInfo> selectAll();
	int joinDayTime(UserInfo info);
	int updateDayTime(UserInfo info);
	int leaveDayTime(String id);
}