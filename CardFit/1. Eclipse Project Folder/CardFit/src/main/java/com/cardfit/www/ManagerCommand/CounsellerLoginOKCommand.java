package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CounsellerInfoDTO;
import com.cardfit.wwwCommand.Command;

public class CounsellerLoginOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String divisionCheck = request.getParameter("divisionCheck");
		HttpSession session = request.getSession();
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		CounsellerInfoDTO dto = dao.getCounsellerInfo(id);
		int result = dao.login(id, pw);
        System.out.println("command : " + dto.getCompany());

		
		if (dto.getDivision() != null && (dto.getDivision().equals(divisionCheck) || dto.getDivision().equals("s"))) {
		    if (result == 0) {
		        session.setAttribute("id", id);
		        session.setAttribute("pw", pw);
		        session.setAttribute("counsellerName", dto.getName());
		        session.setAttribute("division", dto.getDivision());
		        if(dto.getCompany()!=null) {
		        	session.setAttribute("company", dto.getCompany());
		        }
		    } else {
		        response.sendRedirect("Authority.jsp");
		    }
		} else if (dto.getDivision() == null) {
		    request.setAttribute("result", result);
		}
	}
}
