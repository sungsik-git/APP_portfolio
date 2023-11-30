package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.wwwCommand.Command;

public class CounsellerIssuanceOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		int num = Integer.parseInt(request.getParameter("num")); 
		
		HttpSession session = request.getSession();
		String counsellerName = String.valueOf(session.getAttribute("counsellerName"));
		System.out.println(counsellerName);
		
		int result = dao.changeissCondition1(num, counsellerName);
		request.setAttribute("result", result);
	}
	
}
