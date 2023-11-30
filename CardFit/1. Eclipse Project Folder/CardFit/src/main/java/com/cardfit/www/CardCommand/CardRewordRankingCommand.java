package com.cardfit.www.CardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.wwwCommand.Command;

public class CardRewordRankingCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		
		ArrayList<CardInfoDTO> storeList = dao.getCardRewordRankingList(curPage, "편의점");
		ArrayList<CardInfoDTO> shoppingList = dao.getCardRewordRankingList(curPage, "쇼핑");
		ArrayList<CardInfoDTO> carList = dao.getCardRewordRankingList(curPage, "주유");
		ArrayList<CardInfoDTO> airList = dao.getCardRewordRankingList(curPage, "항공");
		
		request.setAttribute("storeList", storeList);
		request.setAttribute("shoppingList", shoppingList);
		request.setAttribute("carList", carList);
		request.setAttribute("airList", airList);
		
	}
	
}
