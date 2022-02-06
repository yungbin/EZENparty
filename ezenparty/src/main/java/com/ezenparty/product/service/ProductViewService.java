package com.ezenparty.product.service;

import com.ezenparty.product.dao.ProductDAO;
import com.ezenparty.product.vo.ProductVO;

public class ProductViewService {
	
	public ProductVO service(long pno, int inc) throws Exception{
		
		ProductDAO dao = new ProductDAO();
		// 만약 inc 가 1 이면 조회수 증가를 시키는 메서드로 이동한다.
		if(inc == 1) dao.increase(pno);
		
		return dao.view(pno);
	}
	
}
