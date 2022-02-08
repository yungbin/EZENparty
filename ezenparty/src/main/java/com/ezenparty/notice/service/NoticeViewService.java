package com.ezenparty.notice.service;

import com.ezenparty.notice.dao.NoticeDAO;
import com.ezenparty.notice.vo.NoticeVO;

public class NoticeViewService {

	public NoticeVO service(long no) throws Exception{

		NoticeDAO dao = new NoticeDAO();

		return dao.view(no);
	}
}
 