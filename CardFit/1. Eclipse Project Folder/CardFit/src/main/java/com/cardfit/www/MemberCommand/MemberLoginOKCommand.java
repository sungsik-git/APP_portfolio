package com.cardfit.www.MemberCommand;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.MemberInfoDTO;
import com.cardfit.wwwCommand.Command;

public class MemberLoginOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		int result = dao.login(id, pw);
		MemberInfoDTO dto = dao.getMemberInfo(id);
		if(result == 0) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("division", dto.getDivision());
		}else {
			request.setAttribute("result", result);
			/*
			 * System.out.println(result); RequestDispatcher dispatcher =
			 * request.getRequestDispatcher("login.do"); dispatcher.forward(request,
			 * response); return;
			 */
		}
	}
}
