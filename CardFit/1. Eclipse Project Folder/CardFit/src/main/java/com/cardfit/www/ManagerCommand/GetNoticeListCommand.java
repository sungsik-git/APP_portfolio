package com.cardfit.www.ManagerCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.www.DTO.NoticeDTO;
import com.cardfit.wwwCommand.Command;

public class GetNoticeListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage = dao.calNoticeTotalPage();
		
		ArrayList<NoticeDTO> NoticeList = dao.getNoticeList(curPage);
		request.setAttribute("NoticeList", NoticeList);
		request.setAttribute("totalPage", totalPage);
	}
	
}
