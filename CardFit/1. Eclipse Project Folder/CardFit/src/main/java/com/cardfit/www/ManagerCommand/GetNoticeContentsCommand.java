package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.NoticeDTO;
import com.cardfit.wwwCommand.Command;

public class GetNoticeContentsCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeDTO dto = dao.getNoticeContents(num);
		System.out.println(num);
		request.setAttribute("dto", dto);
	}
	
}
