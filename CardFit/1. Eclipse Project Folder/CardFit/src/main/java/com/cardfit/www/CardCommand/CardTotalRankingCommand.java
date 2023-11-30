package com.cardfit.www.CardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.wwwCommand.Command;

public class CardTotalRankingCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		ArrayList<CardInfoDTO> creditRankingList = dao.getCardRankingList(curPage, "신용카드");
		request.setAttribute("creditRankingList", creditRankingList);
		
		ArrayList<CardInfoDTO> checkRankingList = dao.getCardRankingList(curPage, "체크카드");
		request.setAttribute("checkRankingList", checkRankingList);
		
		ArrayList<CardInfoDTO> issRankingList = dao.getCardissRankingList(curPage);
		request.setAttribute("issRankingList", issRankingList);
	}
	
}
