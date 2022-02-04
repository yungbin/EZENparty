package com.ezenparty.member.service;

import com.ezenparty.member.dao.MemberDAO;
import com.ezenparty.member.vo.MemberVO;

public class MemberDeleteService {
	
	public int service(MemberVO vo) throws Exception{
		// 생성하고 호출
		MemberDAO dao = new MemberDAO();
		
		return dao.delete(vo);
		
	}
	
}
