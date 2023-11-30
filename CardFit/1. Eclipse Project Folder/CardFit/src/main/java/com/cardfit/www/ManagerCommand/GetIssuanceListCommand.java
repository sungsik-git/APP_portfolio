package com.cardfit.www.ManagerCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.IssuanceDTO;
import com.cardfit.wwwCommand.Command;

public class GetIssuanceListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage = dao.calIssuanceTotalPage();
		
		ArrayList<IssuanceDTO> issuanceList = dao.getIssuanceList(curPage, 0);
		request.setAttribute("issuanceList", issuanceList);
		request.setAttribute("totalPage", totalPage);
	}
}
