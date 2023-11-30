package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.wwwCommand.Command;

public class InsertDirectAnswerCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num =  Integer.parseInt(request.getParameter("num"));
		System.out.println("insert command num : " + num);
		String answer = request.getParameter("answer");
		System.out.println("insert command answer : " + answer);
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		dao.insertAnswer(num, answer);
		
		int result = dao.checkAnswer(num);
		System.out.println("insert command answer : " + result);
		if(result==1)
			System.out.println("답변등록 성공");
		else
			System.out.println("답변등록 실패");
	}
	
}
