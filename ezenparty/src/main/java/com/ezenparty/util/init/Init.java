package com.ezenparty.util.init;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class Init
 */
//@WebServlet("/Init")
public class Init extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// URL 등급에 대한 정보를 저장하는 map 변수
	public static Map<String, Integer> authorityMap = new HashMap<String, Integer>();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Init() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// 서버가 실행될 때 실행이 되는지 확인하는 출력
		System.out.println("Init.init() 실행하고 있다. ------------");
		// 1. DB 드라이버 확인 -> DB class확인을 한다.
		try {
			Class.forName("com.ezenparty.util.db.DB");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2. 실행하려는 객체를 생성하고 조립해 둔다. -> 생략한다. 대신 필요할 때 new 하는 것으로 한다.(Spring에서 자동 등록)
		// 3. 페이지 권한을 등록한다.
		
		//		)))))))))  잠그려는 link를 주석처리만 해주세요! (((((((((((((
		
		
		// 회원 관리 권한
		// 9번 : 관리자, 1번 : 일반회원,
		authorityMap.put("/member/list.jsp", 9);
		authorityMap.put("/member/view.jsp", 1);
		authorityMap.put("/member/updateForm.jsp", 1);
		authorityMap.put("/member/update.jsp", 1);
		authorityMap.put("/member/delete.jsp", 1);

		// 공지사항 권한
		authorityMap.put("/notice/writeForm.jsp", 9);
		authorityMap.put("/notice/write.jsp", 9);
		authorityMap.put("/notice/updateForm.jsp", 9);
		authorityMap.put("/notice/update.jsp", 9);
		authorityMap.put("/notice/delete.jsp", 9);

		// 질문답변 권한
		authorityMap.put("/qna/writeForm.jsp", 1);
		authorityMap.put("/qna/write.jsp", 1);
		authorityMap.put("/qna/answerForm.jsp", 1);
		authorityMap.put("/qna/answer.jsp", 1);
		authorityMap.put("/qna/updateForm.jsp", 1);
		authorityMap.put("/qna/update.jsp", 1);
		authorityMap.put("/qna/delete.jsp", 1);
		
		// 상품리스트 권한
		authorityMap.put("/product/writeForm.jsp", 9);
		authorityMap.put("/product/write.jsp", 9);
		authorityMap.put("/product/updateForm.jsp", 9);
		authorityMap.put("/product/update.jsp", 9);
		authorityMap.put("/product/delete.jsp", 9);
		
		// 상품리스트 권한
		authorityMap.put("/cart/list.jsp", 1);

	}

}
