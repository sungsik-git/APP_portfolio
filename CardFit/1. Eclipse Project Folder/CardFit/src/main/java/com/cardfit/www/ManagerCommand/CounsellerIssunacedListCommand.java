package com.cardfit.www.ManagerCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.UserIssuanceDTO;
import com.cardfit.wwwCommand.Command;

public class CounsellerIssunacedListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String company = String.valueOf(session.getAttribute("compnay"));
		String counsellerName = String.valueOf(session.getAttribute("counsellerName"));
		
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		ArrayList<UserIssuanceDTO> companyList = dao.getCompnayIssuance(company, 2);
		request.setAttribute("companyList", companyList);
		
		ArrayList<UserIssuanceDTO> idList = dao.counsellerIssuancingCommand(counsellerName, 2);
		request.setAttribute("idList", idList);
	}
	
}
