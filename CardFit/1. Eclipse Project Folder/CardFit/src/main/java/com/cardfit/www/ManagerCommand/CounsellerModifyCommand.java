package com.cardfit.www.ManagerCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CompanyInfoDTO;
import com.cardfit.www.DTO.CounsellerInfoDTO;
import com.cardfit.wwwCommand.Command;

public class CounsellerModifyCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = String.valueOf(session.getAttribute("id"));
		
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		CounsellerInfoDTO dto = dao.getCounsellerInfo(id);
		request.setAttribute("dto", dto);
		
		/*회사리스트 로드*/
		ArrayList<CompanyInfoDTO> companyList = dao.getCompanyList();
		request.setAttribute("companyList", companyList);
	}
	
}
