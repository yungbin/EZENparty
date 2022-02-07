package com.ezenparty.product.service;

import com.ezenparty.product.dao.ProductDAO;

public class ProductDeleteService {
	
	public int service(long pno) throws Exception{
		
		ProductDAO dao = new ProductDAO();
		
		return dao.delete(pno);
		
	}
	
}
