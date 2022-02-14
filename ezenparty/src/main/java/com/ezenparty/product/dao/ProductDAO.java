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
			String sql = "select pno, pname, price , image "
					+ " from product ";

			switch (pageObject.getPeriod()) {
			case "colorB":
				sql += " where categories = 'balloon' and pkind = 'colorB' ";
				break;
			case "numberB":
				sql += " where categories = 'balloon' and pkind = 'numberB' ";
				break;
			case "charB":
				sql += " where categories = 'balloon' and pkind = 'charB' ";
				break;
			case "birthB":
				sql += " where categories = 'balloon' and pkind = 'birthB' ";
				break;
			case "halloween":
				sql += " where categories = 'cos' and pkind = 'halloween' ";
				break;
			case "birthday":
				sql += " where categories = 'cos' and pkind = 'birthday' ";
				break;
			case "balloonAll":
				sql += " where categories = 'balloon' ";
				break;
			case "cosAll":
				sql += " where categories = 'cos' ";
				break;
			default:
				System.out.println(" 잘못된 정보가 넘어 왔습니다. ");// 잘못된 데이터 일 경우 모든 이미지를 넘긴다.
				sql += "";
				break;
			}
			sql += " order by writeDate desc";
			
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
					vo.setPname(rs.getString("pname"));
					vo.setPrice(rs.getLong("price"));
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
			
			switch (pageObject.getPeriod()) {
			case "colorB":
				sql += " where categories = 'balloon' and pkind = 'colorB' ";
				break;
			case "numberB":
				sql += " where categories = 'balloon' and pkind = 'numberB' ";
				break;
			case "charB":
				sql += " where categories = 'balloon' and pkind = 'charB' ";
				break;
			case "birthB":
				sql += " where categories = 'balloon' and pkind = 'birthB' ";
				break;
			case "halloween":
				sql += " where categories = 'cos' and pkind = 'halloween' ";
				break;
			case "birthday":
				sql += " where categories = 'cos' and pkind = 'birthday' ";
				break;
			case "balloonAll":
				sql += " where categories = 'balloon' ";
				break;
			case "cosAll":
				sql += " where categories = 'cos' ";
				break;
			default:
				System.out.println(" 잘못된 정보가 넘어 왔습니다. ");// 잘못된 데이터 일 경우 모든 이미지를 넘긴다.
				sql += "";
				break;
			}

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

	// 4. 상품 정보 보기
	public ProductVO view(long pno) throws Exception{
		ProductVO vo = null;
		
		try {

			// 1. 2.
			con = DB.getConnection();

			// 3.
			String sql = "select pno, pname, price, unit, image, content, "
					+ " writeDate, pkind, categories"
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
				vo.setUnit(rs.getInt("unit"));
				vo.setImage(rs.getString("image"));
				vo.setContent(rs.getString("content"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setPkind(rs.getString("pkind"));
				vo.setCategories(rs.getString("categories"));
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
			String sql = "insert into product(pno, pname, price, unit, image, content, pkind, categories) "
					+ " values(product_seq.nextval, ?, ?, ?, ?, ?, ?, ?) ";
			System.out.println("ProductDAO.write().sql - " + sql);
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPname());
			pstmt.setLong(2, vo.getPrice());
			pstmt.setInt(3, vo.getUnit());
			pstmt.setString(4, vo.getImage());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getPkind());
			pstmt.setString(7, vo.getCategories());

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

			System.out.println("productDAO.update() vo >> " + vo);
			// 1. 2.
			con = DB.getConnection();
			// 3.
			String sql = "update product set pname = ?, price = ?, "
					+ " unit = ?, image = ?, content = ?, pkind = ?, categories = ? where pno = ?";
			System.out.println("ProductDAO.update().sql - " + sql);
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPname());
			pstmt.setLong(2, vo.getPrice());
			pstmt.setInt(3, vo.getUnit());
			pstmt.setString(4, vo.getImage());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getPkind());
			pstmt.setString(7, vo.getCategories());
			pstmt.setLong(8, vo.getPno());
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

	public int delete(long pno) throws Exception{
		int result = 0;

		try {

			// 1. 2.
			con = DB.getConnection();
			// 3.
			String sql = " delete from product where pno = ? ";
			System.out.println("ProductDAO.update().sql - " + sql);
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pno);
			// 5.
			result = pstmt.executeUpdate();
			// 6. 작동 확인용
			System.out.println((result > 0) ? "상품 삭제 완료" : "상품 삭제 실패");

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
	}
	
}// class of end
