package com.cardfit.www.CardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.wwwCommand.Command;

public class CardCompanyRankingCommnad implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		
		ArrayList<CardInfoDTO> KMlist = dao.getCardCompanyRankingList(curPage, "국민카드");
		ArrayList<CardInfoDTO> HDList = dao.getCardCompanyRankingList(curPage, "현대카드");
		ArrayList<CardInfoDTO> KUList = dao.getCardCompanyRankingList(curPage, "기업은행카드");
		ArrayList<CardInfoDTO> NHList = dao.getCardCompanyRankingList(curPage, "농협카드");
		ArrayList<CardInfoDTO> LTList = dao.getCardCompanyRankingList(curPage, "롯데카드");
		ArrayList<CardInfoDTO> BCList = dao.getCardCompanyRankingList(curPage, "비씨카드");
		ArrayList<CardInfoDTO> SSList = dao.getCardCompanyRankingList(curPage, "삼성카드");
		ArrayList<CardInfoDTO> SHList = dao.getCardCompanyRankingList(curPage, "신한카드");
		ArrayList<CardInfoDTO> WRList = dao.getCardCompanyRankingList(curPage, "우리카드");
		ArrayList<CardInfoDTO> HNList = dao.getCardCompanyRankingList(curPage, "하나카드");
		
		request.setAttribute("KMlist", KMlist);
		request.setAttribute("HDList", HDList);
		request.setAttribute("KUList", KUList);
		request.setAttribute("NHList", NHList);
		request.setAttribute("LTList", LTList);
		request.setAttribute("BCList", BCList);
		request.setAttribute("SSList", SSList);
		request.setAttribute("SHList", SHList);
		request.setAttribute("WRList", WRList);
		request.setAttribute("HNList", HNList);
		
	}
	
}
