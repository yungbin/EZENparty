package com.ezenparty.cart.service;

import java.util.List;

import com.ezenparty.cart.dao.CartDAO;
import com.ezenparty.cart.vo.CartVO;
import com.webjjang.util.PageObject;

public class CartListService {

	public List<CartVO> service(PageObject pageObject) throws Exception {
		CartDAO dao = new CartDAO();
		// 전체 데이터 세팅 -> 페이지 정보 계산처리도 된다.
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		return dao.list(pageObject);
	}
}
