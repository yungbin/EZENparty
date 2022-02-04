package com.ezenparty.qna.service;

import com.ezenparty.qna.dao.QnaDAO;
import com.ezenparty.qna.vo.QnaVO;

public class QnaUpdateService {
	
	public int service(QnaVO vo) throws Exception{
		// 생성 - 호출
		QnaDAO dao = new QnaDAO();
		
		return dao.update(vo);
	}

}
