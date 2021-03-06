package com.ht.service;

import java.util.List;
import java.util.Map;

import com.ht.bean.Bespoke;
import com.ht.bean.User;

public interface UserService {

	public void UserAdd(User user);
	
	public void UserDelete(int id);
	
	public void UserUpdate(User user);
	
	public User UserSelect(int id);
	
	public List<User> UserSelectall();
	
	public List<User> UserQueryAll(Map<String,Object> map);
	
	public Integer UserQueryCount();
	
	public List<User> UserNameQueryAll();
	
	public List<User> UserSelects(Map<String, Object> map);

	public List<User> find(Map<String, Object> map);
}
