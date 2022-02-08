package com.ezenparty.notice.service;

import java.util.List;
import com.ezenparty.notice.dao.NoticeDAO;
import com.ezenparty.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public class NoticeListService {

		public List<NoticeVO> service(PageObject pageobject) throws Exception {

			NoticeDAO dao = new NoticeDAO();

			pageobject.setTotalRow(dao.getTotalRow(pageobject));

			return dao.list(pageobject);

		}
}
