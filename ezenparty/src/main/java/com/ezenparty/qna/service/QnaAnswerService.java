package com.ezenparty.qna.service;

import com.ezenparty.qna.dao.QnaDAO;
import com.ezenparty.qna.vo.QnaVO;

public class QnaAnswerService {
	public int service(QnaVO vo) throws Exception{
		QnaDAO dao = new QnaDAO();
		// 관련 글번호가 같고, 순서번호와 같거나 큰 데이터의 순서번호를 1 증가시킨다.
		dao.increaseOrdNo(vo);		
		return dao.answer(vo);
	}

}
