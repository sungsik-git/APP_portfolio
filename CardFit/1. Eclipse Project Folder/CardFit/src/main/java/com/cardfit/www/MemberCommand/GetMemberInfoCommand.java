package com.cardfit.www.MemberCommand;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.CounsellerInfoDTO;
import com.cardfit.www.DTO.MemberInfoDTO;
import com.cardfit.wwwCommand.Command;

public class GetMemberInfoCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		ManagerDAO dao2 = ManagerDAO.getManagerDAO();
		HttpSession session = request.getSession();
		String id = String.valueOf(session.getAttribute("id")); 
		String division = String.valueOf(session.getAttribute("division"));
		
		if(division.equals("c")) {
			CounsellerInfoDTO cdto = dao2.getCounsellerInfo(id);
			request.setAttribute("cdto", cdto);
		}else {
			MemberInfoDTO dto = dao.getMemberInfo(id);
			request.setAttribute("dto", dto);
		}
	}
}
