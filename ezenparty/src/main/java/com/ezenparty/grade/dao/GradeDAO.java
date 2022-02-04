package com.ezenparty.grade.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ezenparty.grade.vo.GradeVO;
import com.ezenparty.util.db.DB;

public class GradeDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<GradeVO> list() throws Exception{
		List<GradeVO> list = null;
		
		try {
			//1.2.
			con = DB.getConnection();
			//3 .sql
			String sql = " select gradeNo, gradeName from grade order by gradeNo";
			//4. 
			pstmt = con.prepareStatement(sql);
			//5.
			rs = pstmt.executeQuery();
			//6 
			if(rs != null) {
				while(rs.next()) {
					if(list == null) list = new ArrayList<GradeVO>();
					GradeVO vo = new GradeVO();
					vo.setGradeNo(rs.getInt("gradeNo"));
					vo.setGradeName(rs.getString("gradeName"));
					
					list.add(vo);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				///7.
				DB.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public int write(GradeVO vo) throws Exception{
		int result = 0;
		
		try {
			//1.2.
			con = DB.getConnection();
			//3 .sql
			String sql = " insert into grade(gradeNo, gradeName) values(?, ?)";
			//4. 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getGradeNo());
			pstmt.setString(2, vo.getGradeName());
			//5.
			result = pstmt.executeUpdate();
			//6 
			System.out.println("GradeDAO.write() - 새로운 등급이 등록되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				///7.
				DB.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public int update(GradeVO vo) throws Exception{
		int result = 0;
		
		try {
			//1.2.
			con = DB.getConnection();
			//3 .sql
			String sql = " update grade set gradeName = ? where gradeNo = ?";
			//4. 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getGradeName());
			pstmt.setInt(2, vo.getGradeNo());
			//5.
			result = pstmt.executeUpdate();
			//6 
			System.out.println("GradeDAO.update() - 등급명이 수정되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				///7.
				DB.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public int delete(int gradeNo) throws Exception{
		int result = 0;
		
		try {
			//1.2.
			con = DB.getConnection();
			//3 .sql
			String sql = " delete from grade where gradeNo = ?";
			//4. 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gradeNo);
			//5.
			result = pstmt.executeUpdate();
			//6 
			System.out.println("GradeDAO.delete() - 등급 데이터가 삭제되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				///7.
				DB.close(con, pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
