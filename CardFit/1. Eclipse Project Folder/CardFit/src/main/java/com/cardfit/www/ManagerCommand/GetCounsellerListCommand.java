package com.cardfit.www.ManagerCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CounsellerInfoDTO;
import com.cardfit.wwwCommand.Command;

public class GetCounsellerListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage = dao.calCounsellerTotalPage();
		ArrayList<CounsellerInfoDTO> CounsellerList = dao.getCounsellerList(curPage);
		
		request.setAttribute("CounsellerList", CounsellerList);
		request.setAttribute("totalPage", totalPage);
	}
}
