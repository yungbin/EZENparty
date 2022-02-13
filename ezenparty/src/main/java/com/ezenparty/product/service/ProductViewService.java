package com.ezenparty.product.service;

import com.ezenparty.product.dao.ProductDAO;
import com.ezenparty.product.vo.ProductVO;

public class ProductViewService {
	
	public ProductVO service(long pno) throws Exception{
		
		ProductDAO dao = new ProductDAO();

		return dao.view(pno);
	}
	
}
