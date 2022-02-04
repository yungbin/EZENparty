package com.ezenparty.member.service;

import com.ezenparty.member.dao.MemberDAO;
import com.ezenparty.member.vo.MemberVO;

public class MemberViewService {
	
	public MemberVO service(String id) throws Exception{
		// 생성 호출 : Controller - [Service] - DAO
		MemberDAO dao = new MemberDAO();
		// list - view 일 때만 1 증가 시킨다.
		// update와 update 끝나고 view로 갈때 조회수 1 증가 시키지 않는다.
		return dao.view(id);
		
	}
	
}
