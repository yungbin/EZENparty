package com.ezenparty.member.service;

import com.ezenparty.member.dao.MemberDAO;
import com.ezenparty.member.vo.MemberVO;

public class MemberUpdateService {
	
	public int service(MemberVO vo) throws Exception {
		// 생성 - 호출
		MemberDAO dao = new MemberDAO();
		
		return dao.update(vo);
		
	}
	
}
