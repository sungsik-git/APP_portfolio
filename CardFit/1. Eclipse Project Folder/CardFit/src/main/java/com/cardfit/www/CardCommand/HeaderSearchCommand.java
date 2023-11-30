package com.cardfit.www.CardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.wwwCommand.Command;

public class HeaderSearchCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("searchKeyword");
		request.setAttribute("keyword", keyword);
		
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		ArrayList<CardInfoDTO> searchCardByNameList = dao.searchCardnameByKeyword(keyword);
		request.setAttribute("searchCardByNameList", searchCardByNameList);
		
		ArrayList<CardInfoDTO> searchCardByRewordList = dao.searchCardrewordByKeyword(keyword);
		request.setAttribute("searchCardByRewordList", searchCardByRewordList);
		
		ArrayList<CardInfoDTO> searchCardByCompanyList = dao.searchCardCompanyByKeyword(keyword);
		request.setAttribute("searchCardByCompanyList", searchCardByCompanyList);
		
		int nameCount = dao.countSearchByCardName(keyword);
		request.setAttribute("nameCount", nameCount);
		
		int companyCount = dao.countSearchByCardCompany(keyword);
		request.setAttribute("companyCount", companyCount);
		
		int rewordCount = dao.countSearchByCardReword(keyword);
		request.setAttribute("rewordCount", rewordCount);
		
	}
}
