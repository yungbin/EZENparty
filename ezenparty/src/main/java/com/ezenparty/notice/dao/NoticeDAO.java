package com.ezenparty.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ezenparty.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;
import com.ezenparty.util.db.DB;

public class NoticeDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// pt - 공지의 종류 : = pageObject.period
	public List<NoticeVO> list(PageObject pageObject) throws Exception{

		List<NoticeVO> list = null;

		try {

			con = DB.getConnection();

			String sql = "select no, title, ";
			sql += " to_char(startDate, 'yyyy-mm-dd') startDate, ";
			sql += " to_char(endDate, 'yyyy-mm-dd') endDate, ";
			sql += " to_char(writeDate, 'yyyy-mm-dd') writeDate "
					+ " from notice ";

			// 조건에 맞는 쿼리 추가. -> 동적 쿼리 : 넘어오는 pt 변수의 값으로 정한다.

			switch (pageObject.getPeriod()) {
			case "notice":
				sql += " WHERE kind = 1 ";
				break;
			case "event":
				sql += " WHERE kind = 2 ";
				break;
			case "all":
				sql += " ";
				break;
			default:
				System.out.println(" 잘못된 정보가 넘어 왔습니다. ");// 잘못된 데이터 일 경우 현재로 작성한다.
				sql += " WHERE startDate <= SYSDATE AND endDate >= TRUNC(SYSDATE) ";
				break;
			}

			// 정렬
			sql += " ORDER BY writeDate DESC, no Desc";
			sql = " select rownum rnum, no, title, startDate, endDate, writeDate from( " + sql + ")";
			sql = " select rownum rnum, no, title, startDate, endDate, writeDate from( " + sql + ")"
					+ " where rnum between ? and ? ";

			System.out.println("NoticeDAO.list().sql : " + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pageObject.getStartRow());
			pstmt.setLong(2, pageObject.getEndRow());

			rs = pstmt.executeQuery();

			if(rs != null) {
				while(rs.next()) {
					if(list == null) list = new ArrayList<NoticeVO>();

					NoticeVO vo = new NoticeVO();

					// select no, title, startDate, endDate, writeDate 
					vo.setNo(rs.getLong("no"));
					vo.setTitle(rs.getString("title"));
					vo.setStartDate(rs.getString("startDate"));
					vo.setEndDate(rs.getString("endDate"));
					vo.setWriteDate(rs.getString("writeDate"));

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
		System.out.println("list" + list);
		return list;
	}

	public long getTotalRow(PageObject pageObject) throws Exception{

		long totalRow = 0;

		try {

			con = DB.getConnection();

			String sql = "select count(*) from notice ";

			// 조건에 맞는 쿼리 추가. -> 동적 쿼리 : 넘어오는 pt 변수의 값으로 정한다.
			switch (pageObject.getPeriod()) {
			case "notice":
				sql += " WHERE kind = 1 ";
				break;
			case "event":
				sql += " WHERE kind = 2 ";
				break;
			case "all":
				sql += " ";
				break;
			default:
				System.out.println(" 잘못된 정보가 넘어 왔습니다. ");// 잘못된 데이터 일 경우 현재로 작성한다.
				sql += " WHERE startDate <= SYSDATE AND endDate >= TRUNC(SYSDATE) ";
				break;
			}

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs != null && rs.next()) {		
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

	public NoticeVO view(long no) throws Exception{

		NoticeVO vo = null;

		try {
			// 1. 2.
			con = DB.getConnection();
			// 3.
			String sql = " SELECT no, title, content, "
					+ " to_char(startDate, 'yyyy-mm-dd') startDate, "
					+ " to_char(endDate, 'yyyy-mm-dd') endDate, "
					+ " to_char(writeDate, 'yyyy-mm-dd') writeDate "
					+ " FROM notice "
					+ " WHERE no = ? ";
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5.
			rs = pstmt.executeQuery();
			// 6.
			if(rs != null && rs.next()) {
				vo = new NoticeVO();
				vo.setNo(rs.getLong("no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setEndDate(rs.getString("endDate"));
				vo.setWriteDate(rs.getString("writeDate"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7.
				DB.close(con, pstmt, rs);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return vo;
	} 

	public int write(NoticeVO vo) throws Exception{

		int result = 0;

		try {
			// 1. 2.
			con = DB.getConnection();
			// 3.
			String sql = " INSERT INTO notice(no, title, content, kind, startDate, endDate) "
					+ " VALUES(notice_seq.NEXTVAL, ?, ?, ?, ?, ?) ";
			// 4.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getKind());
			pstmt.setString(4, vo.getStartDate());
			pstmt.setString(5, vo.getEndDate());
			// 5.
			result = pstmt.executeUpdate();
			// 6.
			if(result == 1) System.out.println("글쓰기 완료");
			else System.out.println("글쓰기 실패 - sql을 확인하세요.");
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

	public int update(NoticeVO vo) throws Exception{

		int result = 0;

		try {
			con = DB.getConnection();
			String sql = " UPDATE notice SET title = ?, content = ?, startDate = ?, endDate = ? "
					+ " WHERE no = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getStartDate());
			pstmt.setString(4, vo.getEndDate());
			pstmt.setLong(5, vo.getNo());
			
			result = pstmt.executeUpdate();
			if(result == 1) System.out.println("수정 완료");
			else System.out.println("수정 실패 - 데이터를 확인하세요.");
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
	}

	public int delete(long no) throws Exception{

		int result = 0;

		try {
			con = DB.getConnection();
			String sql = " DELETE FROM notice WHERE no = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			result = pstmt.executeUpdate();
			if(result == 1) System.out.println("삭제 완료");
			else System.out.println("삭제 실패 - 데이터를 확인해 주세요.");
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
	}
}
