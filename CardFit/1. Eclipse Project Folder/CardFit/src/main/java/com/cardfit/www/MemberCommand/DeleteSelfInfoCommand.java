package com.cardfit.www.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.wwwCommand.Command;

public class DeleteSelfInfoCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = String.valueOf(session.getAttribute("id"));
		
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		dao.deleteUserInfo(id);
		
		
	}
	
}
