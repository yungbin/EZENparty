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
	// 1. 상품 리스트
	public List<ProductVO> list(PageObject pageObject) throws Exception{
		
		List<ProductVO> list = null;
		
		try {
			
			// 1. 2.
			con = DB.getConnection();
			
			// 3.
			String sql = "select pno, pname, "
					+ " price, image "
					+ " from product order by pno desc ";
			// 3-1. 순서번호
			sql = "select rownum rnum, pno, pname, price, image from( " + sql + ")";
			// 3-2. 페이지에 대한 데이터
			sql = "select rnum, pno, pname, price, image from( " + sql + ") "
					+ " where rnum between ? and ? ";
			// sql 확인용
			System.out.println("ProductDAO.list() sql >> " + sql);
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pageObject.getStartRow());
			pstmt.setLong(2, pageObject.getEndRow());
		
			// 5.
			rs = pstmt.executeQuery();
			
			// 6.
			if(rs != null) {
				while(rs.next()) {
					if(list == null) list = new ArrayList<ProductVO>();
					ProductVO vo = new ProductVO();
					
					vo.setPno(rs.getLong("pno"));
					vo.setPrice(rs.getLong("price"));
					vo.setPname(rs.getString("pname"));
					vo.setImage(rs.getString("image"));
					
					list.add(vo);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				// 7. 객체닫기
				DB.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		// list 확인용
		System.out.println("ProductDAO.list() list >> " + list);
		
		return list;
		
	}// list of end
	
	// 2. 리스트 전체 갯수를 세는 메서드
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
		// 확인용
		System.out.println("ProductDAO.getTotalRow() totalRow >> " + totalRow);
		return totalRow;
	}// getTotalRow of end

	// 3. 조회수 증가 메서드
	public void increase(long pno) throws Exception{
		
		try {
			
			// 1. 2.
			con = DB.getConnection();
			// 3.
			String sql = "update product set hit = hit + 1 where pno = ?";
			System.out.println("ProductDAO.increase().sql - " + sql);
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pno);
			
			// 5.
			int result = pstmt.executeUpdate();
			// 6. 작동 확인용
			System.out.println((result > 0)?"조회수 증가완료":"조회수 증가 실패");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				// 7.
				DB.close(con, pstmt);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
	}// end of increase()

	// 4. 상품 정보 보기
	public ProductVO view(long pno) throws Exception{
		ProductVO vo = null;
		
		try {

			// 1. 2.
			con = DB.getConnection();

			// 3.
			String sql = "select pno, pname, price, "
					+ " color, unit, image, content, "
					+ "to_char(writeDate, 'yyyy-mm-dd') writeDate, hit "
					+ " from product where pno = ?";
			// sql 확인용
			System.out.println("ProductDAO.list() sql >> " + sql);
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pno);

			// 5.
			rs = pstmt.executeQuery();

			// 6.
			if (rs != null && rs.next()) {
				vo = new ProductVO();

				vo.setPno(rs.getLong("pno"));
				vo.setPname(rs.getString("pname"));
				vo.setPrice(rs.getLong("price"));
				vo.setColor(rs.getString("color"));
				vo.setUnit(rs.getInt("unit"));
				vo.setImage(rs.getString("image"));
				vo.setContent(rs.getString("content"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setHit(rs.getLong("hit"));
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

		// list 확인용
		System.out.println("ProductDAO.view() vo >> " + vo);

		return vo;
	}// end of view()
	
	// 5. 상품 등록
	public int write(ProductVO vo) throws Exception{
		int result = 0;

		try {

			// 1. 2.
			con = DB.getConnection();
			// 3.
			String sql = "insert into product(pno, pname, price, color, unit, image, content) "
					+ " values(product_seq.nextval, ?, ?, ?, ?, ?, ?) ";
			System.out.println("ProductDAO.write().sql - " + sql);
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPname());
			pstmt.setLong(2, vo.getPrice());
			pstmt.setString(3, vo.getColor());
			pstmt.setInt(4, vo.getUnit());
			pstmt.setString(5, vo.getImage());
			pstmt.setString(6, vo.getContent());

			// 5.
			result = pstmt.executeUpdate();
			// 6. 작동 확인용
			System.out.println((result > 0) ? "상품 등록 완료" : "상품 등록 실패");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7.
				DB.close(con, pstmt);

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

		return result;
	}// end of write()

	
	// 6. 상품 글 수정
	public int update(ProductVO vo) throws Exception{
		int result = 0;
		try {

			// 1. 2.
			con = DB.getConnection();
			// 3.
			String sql = "update product set pname = ?, price = ?, color = ?, "
					+ " unit = ?, image = ?, content = ? where pno = ?";
			System.out.println("ProductDAO.update().sql - " + sql);
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPname());
			pstmt.setLong(2, vo.getPrice());
			pstmt.setString(3, vo.getColor());
			pstmt.setInt(4, vo.getUnit());
			pstmt.setString(5, vo.getImage());
			pstmt.setString(6, vo.getContent());
			pstmt.setLong(7, vo.getPno());
			// 5.
			result = pstmt.executeUpdate();
			// 6. 작동 확인용
			System.out.println((result > 0) ? "상품 수정 완료" : "상품 수정 실패");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7.
				DB.close(con, pstmt);

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

		return result;
	}// end of update
	
}// class of end
