package com.ezenparty.notice.service;

import com.ezenparty.notice.dao.NoticeDAO;
import com.ezenparty.notice.vo.NoticeVO;

public class NoticeWriteService {

public int service(NoticeVO vo) throws Exception{

		NoticeDAO dao = new NoticeDAO();

		return dao.write(vo);
	}
}
 