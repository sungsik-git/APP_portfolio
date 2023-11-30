package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.DirectDTO;
import com.cardfit.wwwCommand.Command;

public class GetDirectInqiryCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inqiryNum = Integer.parseInt(request.getParameter("num"));
		
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		DirectDTO dto = dao.getDirectInqiry(inqiryNum);
		
		request.setAttribute("inqirydto", dto);
	}
	
}
