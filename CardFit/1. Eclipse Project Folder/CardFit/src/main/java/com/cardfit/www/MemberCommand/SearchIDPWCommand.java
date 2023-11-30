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

public class SearchIDPWCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDTO dto = new MemberInfoDTO();
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name");
		String regNum = request.getParameter("regNumF") + request.getParameter("regNumB");
		String flag = request.getParameter("flag");
		String id = request.getParameter("id");
		
		dto = dao.searchIDPW(name, regNum);
		request.setAttribute("dto", dto);
		
		if(flag.equals("0")) {
			request.setAttribute("flag", 0);
		}else if(flag.equals("1")) {
			if(id.equals(dto.getId())) {
				request.setAttribute("flag", 1);
				session.setAttribute("id", id);
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("searchIDPW.do");
				dispatcher.forward(request, response);
			}
		}
	}
}
