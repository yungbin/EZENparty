package com.ezenparty.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ezenparty.product.vo.ProductVO;
import com.ezenparty.util.db.DB;
import com.webjjang.util.PageObject;

public class ProductDAO {
	
	// 객체 생성
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<ProductVO> list(PageObject pageObject) throws Exception{
		
		List<ProductVO> list = null;
		
		try {
			
			// 1. 2.
			con = DB.getConnection();
			
			// 3.
			String sql = "select pno, pname, price, image "
					+ " from product order by pno desc ";
			// 순서번호
			sql = "select rownum rnum, pno, pname, price, image from( " + sql + ")";
			// 페이지에 대한 데이터
			sql = "select rnum, pno, pname, price, image from( " + sql + ") "
					+ " where rnum between ? and ? ";
			
			System.out.println("ProductDAO.list() sql >> " + sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pageObject.getStartRow());
			pstmt.setLong(2, pageObject.getEndRow());
		
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					if(list == null) list = new ArrayList<ProductVO>();
					ProductVO vo = new ProductVO();
					
					vo.setPno(rs.getLong("pno"));
					vo.setPname(rs.getString("pname"));
					vo.setPrice(rs.getString("price"));
					vo.setImage(rs.getString("image"));
					
					list.add(vo);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				// 객체닫기
				DB.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return list;
		
	}// list of end
	
	public long getTotalRow(PageObject pageObject) throws Exception {

		long totalRow = 0;

		try {

			con = DB.getConnection();

			String sql = "select count(*) from product";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs != null && rs.next()) {
				totalRow = rs.getLong(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				DB.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

		return totalRow;
	}// getTotalRow of end
	
}// class of end
