package com.ezenparty.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ezenparty.qna.vo.QnaVO;
import com.webjjang.util.PageObject;
import com.ezenparty.util.db.DB;

public class QnaDAO {
	
	// 필요한 객체 선언 - 전역 변수
	// 연결 객체
	Connection con = null;
	// 실행 객체
	PreparedStatement pstmt = null;
	// 결과 저장 객체
	ResultSet rs = null;
	
	// 1. 질문 답변 리스트 데이터 가져오는 메서드 선언
	public List<QnaVO> list(PageObject pageObject) throws Exception{
		// 실행 위치와 전달 데이터 확인
		System.out.println("QnaDAO.list().pageObject>> " + pageObject);
		// 리턴 데이터 변수 선언
		List<QnaVO> list = null;
		
		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
			// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
			// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성
			// 3-1. 원본 데이터 가져오기
			String sql = " SELECT q.no, q.title, q.id, q.writeDate, q.refNo, q.ordNo, q.levNo, q.parentNo "
					+ " FROM qna q, member m "
					+ " WHERE m.id = q.id "
					+ " ORDER BY q.refNo DESC, q.ordNo ";
			// 3-2. 순서번호를 붙이기
			sql = " SELECT rownum rnum, no, title, id, writeDate, "
					+ " refNo, ordNo, levNo, parentNo FROM(" + sql + ") ";
			// 3-3. 페이지에 맞는 데이터 가져오기
			sql = " SELECT rnum, no, title, id, writeDate, "
					+ " refNo, ordNo, levNo, parentNo FROM(" + sql + ") "
					+ " WHERE rnum BETWEEN ? AND ? ";
			System.out.println("qnaDAO.list().sql : " + sql); // 확인용
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			// startRow, endRow의 계산은 setTotalRow()를 호출해야만 나온다. 아니면 0 이되서 데이터가 나오지 않는다.
			pstmt.setLong(1, pageObject.getStartRow());
			pstmt.setLong(2, pageObject.getEndRow());
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 데이터 담기
			if(rs != null) {
				// 리스트 데이터는 여러개이다. 반복문 사용해야한다.
				// rs.next() -> 다음 포인터로 이동 시킨다. 맨처음 포인터는 -1이다. 데이터가 있으면 true가 리턴된다.
				while(rs.next()) {
					// list 가 null 이면 데이터를 담을 수 없으므로 생성해 준다. -> 한번만 될 수 있도록 if문 처리해준다.
					if(list == null) list = new ArrayList<QnaVO>();
					QnaVO vo = new QnaVO();
					// setter 를 이용해서 rs에서 가져온 데이터 담기
					vo.setNo(rs.getLong("no"));
					vo.setTitle(rs.getString("title"));
					vo.setId(rs.getString("id"));
					vo.setWriteDate(rs.getString("writeDate"));
					vo.setRefNo(rs.getLong("refNo"));
					vo.setOrdNo(rs.getInt("ordNo"));
					vo.setLevNo(rs.getInt("levNo"));
					vo.setParentNo(rs.getLong("parentNo"));
					
					// list 객체에 데이터가 담긴 vo 객체를 넣는다
					list.add(vo);
				}// while문의 끝
			}// if문의 끝
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
				// 7. 객체 닫기
				DB.close(con, pstmt, rs);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		}// end of try{}
		
		//확인용
		System.out.println("QnaDAO.list() list>> " + list);
		// 수집한 데이터를 넘긴다.
		return list;
		
	}// end of list()

	// 1-1. 페이지 처리를 위한 전체 데이터 가져오는 메서드 선언
	public long getTotalRow(PageObject pageObject) throws Exception {
		// 실행 위치와 전달 데이터 확인
		System.out.println("QnaDAO.getTotalRow().pageObject>> " + pageObject);
		// 리턴 데이터 변수 선언
		long totalRow = 0;

		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
				// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
				// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성
			// 3-1. 원본 데이터 가져오기
			String sql = " SELECT count(*) FROM qna ";
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 데이터 담기
			// 데이터가 한개만 나온다. if문으로 다 처리하도록 한다.
			if (rs != null && rs.next()) {
				totalRow = rs.getLong(1);
			} // if문의 끝
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
					// 7. 객체 닫기
				DB.close(con, pstmt, rs);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		} // end of try{}
		// 수집한 데이터를 넘긴다.
		return totalRow;
	}// end of getTotalRow()
	
	// 2. 질문 답변 보기
	public QnaVO view(long no) throws Exception{
		// 실행 위치와 전달 데이터 확인
		System.out.println("QnaDAO.view().no>> " + no);
		// 리턴 데이터 변수 선언
		QnaVO vo = null;
		
		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
				// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
				// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성
			// 3-1. 원본 데이터 가져오기
			String sql = " select q.no, q.title, q.content, q.id, "
					+ " q.writeDate, "
					+ " q.refNo, q.ordNo, q.levNo, Q.parentNo "
					+ " from qna q, member m "
					+ " where (no = ?) and (q.id = m.id) ";
			System.out.println("qnaDAO.view().sql : " + sql); // 확인용
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 데이터 담기
			if (rs != null && rs.next()) {
					vo = new QnaVO();
					// setter 를 이용해서 rs에서 가져온 데이터 담기
					vo.setNo(rs.getLong("no"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setId(rs.getString("id"));
					vo.setWriteDate(rs.getString("writeDate"));
					vo.setRefNo(rs.getLong("refNo"));
					vo.setOrdNo(rs.getInt("ordNo"));
					vo.setLevNo(rs.getInt("levNo"));
					vo.setParentNo(rs.getLong("parentNo"));		
			} // if문의 끝
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
					// 7. 객체 닫기
				DB.close(con, pstmt, rs);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		} // end of try{}

		// 확인용
		System.out.println("QnaDAO.view() vo>> " + vo);
		// 수집한 데이터를 넘긴다.
		return vo;
	}// end of view()
	
	// 2-1. 조회수 1 증가
	public void increase(long no) throws Exception{

		// 실행 위치와 전달 데이터 확인
		System.out.println("QnaDAO.increase().no>> " + no);
		
		int result = 0;
		
		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
				// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
				// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성
			// 3-1. 원본 데이터 가져오기
			String sql = " UPDATE qna SET hit = hit + 1 WHERE no = ? ";
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5. 실행
			// update가 됐으면 1, 안됐으면 0 -> 글 번호에 따른 데이터가 없는 경우.
			result = pstmt.executeUpdate();
			// 6. 데이터 담기
			System.out.println("QnaDAO.increase() - 조회수 증가 result : " + result);
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
					// 7. 객체 닫기
				DB.close(con, pstmt);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		} // end of try
	}
	
	// 3. 질문하기
	public int write(QnaVO vo) throws Exception{
		// 실행 위치와 전달 데이터 확인
		System.out.println("QnaDAO.write().vo>> " + vo);
		// 리턴 데이터 변수 선언
		int result = 0;

		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
			// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
			// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성
			// 3-1. 원본 데이터 가져오기
			String sql = " INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo) "
					+ " VALUES(qna_seq.NEXTVAL, ?, ?, ?, qna_seq.NEXTVAL, 1, 0) ";
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getId());
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 담기
			System.out.println("QnaDAO.write() - 질문이 등록되었습니다.");
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
					// 7. 객체 닫기
				DB.close(con, pstmt);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		} // end of try
		
		// 결과 데이터를 넘긴다.
		return result;
	}// end of write

	// 4. 질문이나 답변 수정하기
	public int update(QnaVO vo) throws Exception {
		int result = 0;

		// 실행 위치와 전달 데이터 확인 - 번호, 제목, 내용
		System.out.println("QnaDAO.update().vo>> " + vo);

		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
				// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
				// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성
			// 3-1. 원본 데이터 가져오기
			String sql = " UPDATE qna SET title = ?, content = ? where no = ? ";
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setLong(3, vo.getNo());
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 담기
			System.out.println("QnaDAO.update() - 질문이나 답변이 수정되었습니다.");
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
					// 7. 객체 닫기
				DB.close(con, pstmt);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		} // end of try

		return result;
	}
	
	// 5. 질문이나 답변 삭제
	public int delete(long no) throws Exception{
		int result = 0;

		// 실행 위치와 전달 데이터 확인
		System.out.println("QnaDAO.delete().no>> " + no);

		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
				// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
				// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성
			// 3-1. 원본 데이터 가져오기
			String sql = " DELETE FROM qna WHERE no = ? ";
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, no);
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 담기
			System.out.println("QnaDAO.delete() - 질문이나 답변이 삭제되었습니다.");
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
					// 7. 객체 닫기
				DB.close(con, pstmt);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		} // end of try

		return result;
	}

	// 6-1. 답변하기의 순서번호 1증가 - 관련번호(refNo)가 같고 순서번호(ordNo)와 같거나 큰 순서번호를 +1 시킨다.
	public void increaseOrdNo(QnaVO vo) throws Exception{

		// 실행 위치와 전달 데이터 확인
		System.out.println("QnaDAO.increaseOrdNo().vo >> " + vo);
		
		int result = 0;
		
		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
				// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
				// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성 - 관련번호(refNo)가 같고 순서번호(ordNo)와 같거나 큰 순서번호를 +1 시킨다.
			String sql = " UPDATE qna SET ordNo = ordNo + 1 WHERE refNo = ? and ordNo >= ?";
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, vo.getRefNo());
			pstmt.setInt(2, vo.getOrdNo());
			// 5. 실행
			// update가 됐으면 1, 안됐으면 0 -> 글 번호에 따른 데이터가 없는 경우.
			result = pstmt.executeUpdate();
			// 6. 데이터 담기
			System.out.println("QnaDAO.increaseOrdNo() - 순서번호가 1 증가되었습니다. result : " + result);
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
					// 7. 객체 닫기
				DB.close(con, pstmt);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		} // end of try
	}
	
	// 6-2. 답변 등록
	public int answer(QnaVO vo) throws Exception{
		// 실행 위치와 전달 데이터 확인
		System.out.println("QnaDAO.write().vo>> " + vo);
		// 리턴 데이터 변수 선언
		int result = 0;

		// 데이터 채우기 - DB에서 가져오므로 예외처리 필수
		try { // 정상 처리
			// 1. 드라이버 확인 --> DB.java에서 static 초기화 블록으로 해결
			// 2. 연결
			con = DB.getConnection();
			// 3. 실행할 sql 문 작성
			// 3-1. 원본 데이터 가져오기
			String sql = " INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo) "
					+ " VALUES(qna_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?) ";
			
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getId());
			pstmt.setLong(4, vo.getRefNo());
			pstmt.setInt(5, vo.getOrdNo());
			pstmt.setInt(6, vo.getLevNo());
			pstmt.setLong(7, vo.getParentNo());
			// 5. 실행
			result = pstmt.executeUpdate();
			// 6. 데이터 담기
			System.out.println("QnaDAO.answer() - 답변이 등록되었습니다. result : " + result);
		} catch (Exception e) { // 예외처리
			// TODO: handle exception
			// 개발자를 위해서 오류 경로 추적 출력
			e.printStackTrace();
		} finally { // 반드시 처리
			try { // 정상 처리
					// 7. 객체 닫기
				DB.close(con, pstmt);
			} catch (Exception e) { // 예외처리
				// TODO: handle exception
				// 개발자를 위해서 오류 경로 추적 출력
				e.printStackTrace();
			}
		} // end of try
		
		// 결과 데이터를 넘긴다.
		return result;
	}// end of write


}// end of class
