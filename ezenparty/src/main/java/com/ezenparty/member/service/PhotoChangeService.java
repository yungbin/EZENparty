package com.ezenparty.member.service;

import com.ezenparty.member.dao.MemberDAO;
import com.ezenparty.member.vo.MemberVO;

public class PhotoChangeService {
	
	public int service(MemberVO vo) throws Exception{
		MemberDAO dao = new MemberDAO();
		return dao.change(vo);
	}
}
