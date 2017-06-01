package org.zerock.persistence;

import java.util.Date;

import org.zerock.domain.LoginDto;
import org.zerock.domain.UserDto;

public interface UserDao {
	public UserDto login(LoginDto dto) throws Exception;
	
	public void keepLogin(String uid, String sessionKey, Date sessionLimit);
	
	public UserDto checkUserWithSessionKey(String sessionKey);
}
