package com.ezenparty.qna.service;

import com.ezenparty.qna.dao.QnaDAO;
import com.ezenparty.qna.vo.QnaVO;

public class QnaViewService {
	
	public QnaVO service(long no ) throws Exception{
		QnaDAO dao = new QnaDAO();
		
		return dao.view(no);
	}
}
