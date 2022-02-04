package com.ezenparty.member.service;

import com.ezenparty.member.dao.MemberDAO;
import com.ezenparty.member.vo.MemberVO;

public class MemberWriteService {
	
	public int service(MemberVO vo) throws Exception{
		// 생성 호출
		MemberDAO dao = new MemberDAO();
		
		return dao.write(vo);
		
	}

}
