package com.ezenparty.product.service;

import java.util.List;

import com.ezenparty.product.dao.ProductDAO;
import com.ezenparty.product.vo.ProductVO;
import com.webjjang.util.PageObject;

public class ProductListService {
	
	public List<ProductVO> service(PageObject pageObject) throws Exception{
		
		ProductDAO dao = new ProductDAO();
		
		// 페이지 정보 데이터 계산을 한다. - 안하면 데이터를 안 가져온다.
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		return dao.list(pageObject);
		
	}

}
