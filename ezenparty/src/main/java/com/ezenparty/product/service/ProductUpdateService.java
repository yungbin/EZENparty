package com.ezenparty.product.service;

import com.ezenparty.product.dao.ProductDAO;
import com.ezenparty.product.vo.ProductVO;

public class ProductUpdateService {
	
	public int service(ProductVO vo) throws Exception{
		
		ProductDAO dao = new ProductDAO();
		
		return dao.update(vo);
		
	}
	
}
