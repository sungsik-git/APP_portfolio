package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.MemberInfoDTO;
import com.cardfit.wwwCommand.Command;

public class ManagerLoginOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String divisionCheck = request.getParameter("divisionCheck");
		HttpSession session = request.getSession();
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		
		
		MemberInfoDTO dto = dao.getMemberInfo(id);
		String division = dto.getDivision();
		
		if(division.equals(divisionCheck)||division.equals("s")) {
			int result = dao.login(id, pw);
			if(result == 0) {
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
			}else {
				request.setAttribute("result", result);
				RequestDispatcher dispatcher = request.getRequestDispatcher("ManagerLogin.do");
				dispatcher.forward(request, response);		
			}
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("Authority.jsp");
			dispatcher.forward(request, response);	
		}
	}
}
