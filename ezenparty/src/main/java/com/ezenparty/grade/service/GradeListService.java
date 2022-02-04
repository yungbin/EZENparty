package com.ezenparty.grade.service;

import java.util.List;

import com.ezenparty.grade.dao.GradeDAO;
import com.ezenparty.grade.vo.GradeVO;

public class GradeListService {

	public List<GradeVO> service() throws Exception{
		GradeDAO dao = new GradeDAO();
		return dao.list();
	}
	
}
