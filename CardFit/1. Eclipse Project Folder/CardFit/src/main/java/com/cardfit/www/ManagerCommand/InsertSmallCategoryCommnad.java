package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.wwwCommand.Command;

public class InsertSmallCategoryCommnad implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		int b_category = Integer.parseInt(request.getParameter("b_category"));   
		String s_name = request.getParameter("s_name");
		
		int result = dao.insertSmallCategory(b_category, s_name);
		request.setAttribute("result", result);
	}
	
}
