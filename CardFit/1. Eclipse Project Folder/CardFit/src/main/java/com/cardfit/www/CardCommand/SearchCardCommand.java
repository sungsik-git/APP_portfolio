package com.cardfit.www.CardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.wwwCommand.Command;

public class SearchCardCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] answerList = request.getParameterValues("data");
		
		//디버깅
		for (int i = 0; i < answerList.length; i++) {
			System.out.println(answerList[i]);
		}
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		ArrayList<CardInfoDTO> cardSearchResult = dao.searchCardList(answerList);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("cardSearchResult", cardSearchResult);
	}
}
