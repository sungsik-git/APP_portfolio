package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CompanyInfoDTO;
import com.cardfit.wwwCommand.Command;

public class InsertCompanyCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CompanyInfoDTO dto = new CompanyInfoDTO();
		dto.setName(request.getParameter("name"));
		dto.setTel(request.getParameter("tel"));
		
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		int result = dao.insertCompanyDAO(dto);
		
		if(result > 0 ) {
			System.out.println("카드사 데이터등록 성공");
		}else if(result == -1) {
			System.out.println("카드사 데이터등록 실패");
		}
	}
	
}
