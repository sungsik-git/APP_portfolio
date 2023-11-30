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

public class GetIssuanceInfoCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		ArrayList<UserIssuanceDTO> issuanceInfo = dao.getUserIssuance(id);
		request.setAttribute("issuanceInfo", issuanceInfo);
		
		
		int issCnt = dao.countIssuanceOfMember(id);
		request.setAttribute("issCnt", issCnt);
	}
	
}
