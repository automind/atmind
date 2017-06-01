package org.zerock.service;

import java.util.Date;

import org.zerock.domain.LoginDto;
import org.zerock.domain.UserDto;

public interface UserService {
	public UserDto login(LoginDto dto) throws Exception;
	
	public void keepLogin(String uid, String sessionKey, Date sessionLimit) throws Exception;
	
	public UserDto checkLoginBefore(String sessionLimit);
}
