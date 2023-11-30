package com.cardfit.www.ManagerCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.CompanyInfoDTO;
import com.cardfit.wwwCommand.Command;

public class GetCompanyListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		/*회사리스트 로드*/
		ArrayList<CompanyInfoDTO> companyList = dao.getCompanyList();
		request.setAttribute("companyList", companyList);
	}
	
}
