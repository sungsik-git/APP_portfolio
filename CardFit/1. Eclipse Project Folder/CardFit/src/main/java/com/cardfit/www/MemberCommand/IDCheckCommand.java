package com.cardfit.www.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.*;
import com.cardfit.wwwCommand.Command;

public class IDCheckCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		int result = dao.checkId(request.getParameter("id"));
		System.out.println(result);
		request.setAttribute("result", result);
	}
}