package com.ezenparty.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ezenparty.member.vo.LoginVO;
import com.ezenparty.member.vo.MemberVO;
import com.ezenparty.util.db.DB;
import com.webjjang.util.PageObject;

public class MemberDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<MemberVO> list(PageObject pageObject) throws Exception{
		
		List<MemberVO> list = null;
		
		try {
			
			// 1. 2.
			con = DB.getConnection();
			// 3.
			// 3-1. 원본 데이터
			String sql = " select m.id, m.name, "
					+ "	to_char(m.birth, 'yyyy-mm-dd') birth, "
					+ " m.tel, m.address, m.photo, m.gradeNo, g.gradeName, "
					+ " to_char(m.conDate, 'yyyy-mm-dd') conDate "
					+ " from member m, grade g "
					+ " where (m.gradeNo = g.gradeNo) "
					+ " order by m.regDate desc ";
			// 3-2. 순서 번호
			sql = " select rownum rnum, id, name, birth, tel, address, photo, gradeNo, gradeName, conDate "
			+ " from( " + sql + ")";
			// 3-3. 페이지에 해당되는 10개 데이터
			sql = " select rownum rnum, id, name, birth, tel, address, photo, gradeNo, gradeName, conDate "
					+ " from( " + sql + ") where rnum between ? and ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pageObject.getStartRow());// 시작번호
			pstmt.setLong(2, pageObject.getEndRow());// 끝번호
		
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					if(list == null) list = new ArrayList<MemberVO>();
					MemberVO vo = new MemberVO();
					
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setBirth(rs.getString("birth"));
					vo.setTel(rs.getString("tel"));
					vo.setAddress(rs.getString("address"));
					vo.setPhoto(rs.getString("photo"));
					vo.setGradeNo(rs.getInt("gradeNo"));
					vo.setGradeName(rs.getString("gradeName"));
					vo.setConDate(rs.getString("conDate"));

					
					list.add(vo);				
				}
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
		
		return list;
		
	}
	// 페이지 처리를 위해서 전체 데이터 갯수를 가져오는 메서드
	public long getTotalRow(PageObject pageObject) throws Exception {

		long totalRow = 0;

		try {

			con = DB.getConnection();

			String sql = "select count(*) from member";

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
	}

	public MemberVO view(String id) throws Exception{
		MemberVO vo = null;
		
		try {
			
			con = DB.getConnection();
			
			String sql = " SELECT m.id, m.name, m.birth, m.tel, m.address, m. email, m.regDate, "
					+ " m.conDate, m.status, m.photo, m.gradeNo, g.gradeName "
					+ " FROM member m, grade g "
					+ " WHERE (id = ?) AND (m.gradeNo = g.gradeNo) ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
				vo = new MemberVO();
				
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setBirth(rs.getString("birth"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setRegDate(rs.getString("regDate"));
				vo.setConDate(rs.getString("conDate"));
				vo.setStatus(rs.getString("status"));
				vo.setPhoto(rs.getString("photo"));
				vo.setGradeNo(rs.getInt("gradeNo"));
				vo.setGradeName(rs.getString("gradeName"));
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
		
		return vo;
	}

	public int write(MemberVO vo) throws Exception{
		int result = 0;
		
		// 예외처리
		try {
			// 1.2.
			con = DB.getConnection();
			// 3. sql 작성
			String sql = " INSERT INTO member(id, pw, name, birth, tel, address, email, photo) "
					+ " VALUES(?, ?, ?, ?, ?, ?, "
					+ " ?, ?) ";
			// 4. 실행객체 및 데이터 세팅
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getBirth());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getPhoto());
			
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 표시
			System.out.println("회원 가입 완료");
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 객체 닫기
				DB.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public int update(MemberVO vo) throws Exception {
		int result = 0;
		
		System.out.println("memberDAO.update vo >> " + vo);
		
		try {
			
			con = DB.getConnection();
			
			String sql = " UPDATE member "
					+ " SET name = ?, birth = ?, "
					+ " tel = ?, address = ?, email = ? "
					+ " WHERE id = ? AND pw = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getBirth());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getId());
			pstmt.setString(7, vo.getPw());
			
			// result 가 1이면 - 수정완료, result 가 0이면 : 아이디나 비밀번호가 틀림.
			result = pstmt.executeUpdate();
			
			if(result == 1) 
				System.out.println("MemberDAO.update() - 글수정 완료");
			else {
				System.out.println("MemberDAO.update() - 글수정 실패 : 글번호 틀림.");	
//				throw new Exception("아이디나 비밀번호 틀림");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception(e); // 사용자를 위한 예외처리
		} finally {
			try {
				DB.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		
		return result;
	}

	public int delete(MemberVO vo) throws Exception{
		int result = 0;
		
		try {
			
			con = DB.getConnection();
			
			String sql = " DELETE FROM member "
					+ " WHERE id = ? AND pw = ? AND tel = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getTel());
			
			result = pstmt.executeUpdate();
			
			if(result == 1) System.out.println("회원 탈퇴/삭제 성공");
			else System.out.println("회원 탈퇴/삭제 실패 - " + vo.getId());
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				DB.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return result;
	}// delete end
	
	public LoginVO login(LoginVO inVO) throws Exception{
		LoginVO vo = null;
		
		try {
			
			con = DB.getConnection();
			
			String sql = " SELECT m.id, m.name, m.gradeNo, g.gradeName, m.photo"
					+ " FROM member m, grade g "
					+ " WHERE (id = ? AND pw = ?) AND (m.gradeNo = g.gradeNo) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inVO.getId());
			pstmt.setString(2, inVO.getPw());
			
			rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
				vo = new LoginVO();
				
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setGradeNo(rs.getInt("gradeNo"));
				vo.setGradeName(rs.getString("gradeName"));
				vo.setPhoto(rs.getString("photo"));
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
		
		return vo;
	}// login end

	public int change(MemberVO vo) throws Exception{
		int result = 0;
		
		try {

			con = DB.getConnection();

			String sql = " update member set photo = ? "
					+ " where id = ? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getPhoto());
			pstmt.setString(2, vo.getId());


			// result 가 1이면 - 수정완료, result 가 0이면 : 아이디나 비밀번호가 틀림.
			result = pstmt.executeUpdate();

			if (result == 1)
				System.out.println("MemberDAO.update() - 이미지 수정 완료");
			else {
				System.out.println("MemberDAO.update() - 이미지 수정 실패");
			//throw new Exception("아이디나 비밀번호 틀림");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception(e); // 사용자를 위한 예외처리
		} finally {
			try {
				DB.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

		return result;
	}

}// class end
