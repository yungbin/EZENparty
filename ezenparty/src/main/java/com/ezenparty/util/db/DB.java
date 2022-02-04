package com.ezenparty.util.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
	// DB 정보 - DB.DRIVER
	private final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final static String URL = "jdbc:oracle:thin:@localhost:1521:xe"; // 서버, 포트 정보 등이 있어야 한다.
	private final static String UID = "ezpt00";
	private final static String UPW = "ezpt00";

	// checkDriver가 true면 있는것. false이면 없는것.
	private static boolean checkDriver = false;

	// static 초기화 블록
	// 처음 실행되는 곳(main())에서 Class.forName(DB) 코드를 넣어 줘야 실행된다.
	static {
		try {
			Class.forName(DRIVER);
			// 드라이버가 있는 경우
			checkDriver = true;
			System.out.println("드라이버 확인");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 연결 객체를 받아가는 메서드 - getConnection()
	public static Connection getConnection() throws SQLException {
		if (checkDriver)
			return DriverManager.getConnection(URL, UID, UPW);
		throw new SQLException("DB 드라이버가 없습니다.");

	}

	// 2개의 객체 닫기 - con, pstmt
	public static void close(Connection con, PreparedStatement pstmt) throws SQLException {
		if (con != null)
			con.close();
		if (pstmt != null)
			pstmt.close();
	}

	// 3개의 객체 닫기 - con, pstmt, rs
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		close(con, pstmt);
		if (rs != null)
			rs.close();
	}

}
