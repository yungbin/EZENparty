package com.ezenparty.qna.service;

import com.ezenparty.qna.dao.QnaDAO;
import com.ezenparty.qna.vo.QnaVO;

public class QnaWriteService {
	public int service(QnaVO vo) throws Exception{
		QnaDAO dao = new QnaDAO();
		return dao.write(vo);
	}

}
