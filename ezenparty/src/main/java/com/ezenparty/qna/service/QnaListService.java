package com.ezenparty.qna.service;

import java.util.List;

import com.ezenparty.qna.dao.QnaDAO;
import com.ezenparty.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public class QnaListService {
	public List<QnaVO> service(PageObject pageObject) throws Exception{
		// DB 처리 객체 생성
		QnaDAO dao = new QnaDAO();
		// 페이지 처리로 전체 데이터 개수를 가져와서 pageObject에 넣어준다.
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		// 리스트 데이터를 가져와서 리턴한다.
		return dao.list(pageObject);
	}
}
