package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.DirectDTO;
import com.cardfit.wwwCommand.Command;

public class GetDirectAnswerCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		DirectDTO dto = dao.getAnswer(num);
		
		request.setAttribute("answerdto", dto);
	}
	
}
