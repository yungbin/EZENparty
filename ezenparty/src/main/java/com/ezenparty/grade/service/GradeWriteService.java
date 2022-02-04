package com.ezenparty.grade.service;

import com.ezenparty.grade.dao.GradeDAO;
import com.ezenparty.grade.vo.GradeVO;

public class GradeWriteService {

	public int service(GradeVO vo) throws Exception{
		GradeDAO dao = new GradeDAO();
		return dao.write(vo);
	}
	
}
