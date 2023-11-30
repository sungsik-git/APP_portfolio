package com.cardfit.www.MemberCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.DirectDTO;
import com.cardfit.wwwCommand.Command;

public class GetDirectInquiryListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* QNA리스트 로드*/
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		int curPage = 0;
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		int totalPage = dao.calTotalPage();
		
		ArrayList<DirectDTO> directList = dao.getDirectInquiey(curPage);
		request.setAttribute("directList", directList);
		request.setAttribute("totalPage", totalPage);
		

	}
}
