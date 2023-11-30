package com.cardfit.www.CardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.wwwCommand.Command;

public class CardFeeRankingCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		
		ArrayList<CardInfoDTO> feeFreeList = dao.getCardFeeRankingList(curPage);
		ArrayList<CardInfoDTO> feeList = dao.getCardFeeRankingList(curPage, 1);
		ArrayList<CardInfoDTO> recordFreeList = dao.getCardRecordRankingList(curPage);
		ArrayList<CardInfoDTO> recordList = dao.getCardRecordRankingList(curPage,1);
		
		request.setAttribute("feeFreeList", feeFreeList);
		request.setAttribute("feeList", feeList);
		request.setAttribute("recordFreeList", recordFreeList);
		request.setAttribute("recordList", recordList);
 	}
	
}
