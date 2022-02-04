package com.ezenparty.member.service;

import com.ezenparty.member.dao.MemberDAO;
import com.ezenparty.member.vo.LoginVO;

public class LoginService {
	
	public LoginVO service(LoginVO inVO) throws Exception{
		MemberDAO dao = new MemberDAO();
		return dao.login(inVO);	
	}

}
