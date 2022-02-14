package com.ezenparty.grade.service;

import com.ezenparty.grade.dao.GradeDAO;

public class GradeDeleteService {

	public int service(int gradeNo) throws Exception{
		
		GradeDAO dao = new GradeDAO();
		return dao.delete(gradeNo);
		
	}
}
