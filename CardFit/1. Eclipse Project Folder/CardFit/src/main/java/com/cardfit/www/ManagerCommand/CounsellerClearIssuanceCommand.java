package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.wwwCommand.Command;

public class CounsellerClearIssuanceCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cardName = String.valueOf(request.getParameter("cardName"));
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("command : " +cardName);
		System.out.println("command num : " + num);
		
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		int result = dao.changeissCondition2(num);
		dao.incrementissuanceNum(cardName);
		if(result >0) {
			System.out.println("처리완료");
		}else {
			System.out.println("처리실패");
		}
	}
}
