package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.wwwCommand.Command;

public class DeleteCardOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		String cardName = request.getParameter("cardName");
		int result = dao.deleteCardInfo(cardName);
		if(result == 1) request.setAttribute("result", result);
		else System.out.println("데이터 삭제 실패");
	}

}
