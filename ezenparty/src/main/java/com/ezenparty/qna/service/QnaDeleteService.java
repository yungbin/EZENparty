package com.ezenparty.qna.service;

import com.ezenparty.qna.dao.QnaDAO;

public class QnaDeleteService {
	
	public int service(long no) throws Exception{
		QnaDAO dao = new QnaDAO();
		
		return dao.delete(no);
	}
}
