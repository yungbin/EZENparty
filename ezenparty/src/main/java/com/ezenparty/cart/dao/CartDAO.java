package com.ezenparty.cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ezenparty.cart.vo.CartVO;
import com.ezenparty.util.db.DB;
import com.webjjang.util.PageObject;

public class CartDAO {

	// 객체 생성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 1. 장바구니 리스트
		public List<CartVO> list(PageObject pageObject) throws Exception {
			// TODO Auto-generated method stub
			List<CartVO> list = null;
			
			try {
				// 1. 2.
				con = DB.getConnection();
				// 3.
				String sql = "select pno, image, pname, nuit, price from cart order by pno desc ";
				// 3-1. 순서번호
				sql = "select rownum rnum, pno, image, pname, nuit, price from( " + sql + ")";
				// 3-2. 페이지에 대한 데이터
				sql = "select rnum, pno, image, pname, nuit, price from( " + sql + ") "
						+ " where rnum between ? and ? ";
				// sql 확인용
				System.out.println("CartDAO.list() sql - " + sql);
				// 4.
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, pageObject.getStartRow());
				pstmt.setLong(2, pageObject.getEndRow());
				// 5.
				rs = pstmt.executeQuery();
				// 6.
				if(rs != null) {
					while(rs.next()) {
						if(list == null) list = new ArrayList<CartVO>();
						CartVO vo = new CartVO();
						vo.setPno(rs.getLong("pno"));
						vo.setImage(rs.getString("image"));
						vo.setPname(rs.getString("Pname"));
						vo.setNuit(rs.getInt("nuit"));
						vo.setPrice(rs.getLong("price"));
						
						list.add(vo);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					// 7. 객체닫기
					DB.close(con, pstmt, rs);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			return list;
		}
		
		// 2. 리스트 전체 갯수를 세는 메서드
		public long getTotalRow(PageObject pageObject) throws Exception {
			// TODO Auto-generated method stub
			long totalRow = 0;

			try {

				con = DB.getConnection();

				String sql = "select count(*) from cart";

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
			// 확인용
			System.out.println("ProductDAO.getTotalRow() totalRow >> " + totalRow);
			return totalRow;
		}// getTotalRow of end
}
