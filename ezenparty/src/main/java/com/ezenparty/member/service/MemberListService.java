package com.ezenparty.member.service;

import java.util.List;

import com.ezenparty.member.dao.MemberDAO;
import com.ezenparty.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public class MemberListService {
	
	public List<MemberVO> service(PageObject pageObject) throws Exception{
		
		MemberDAO dao = new MemberDAO();
		
		// 전체 데이터 세팅 -> 페이지 정보 계산처리도 된다.
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		return dao.list(pageObject);
		
	}
	
}
