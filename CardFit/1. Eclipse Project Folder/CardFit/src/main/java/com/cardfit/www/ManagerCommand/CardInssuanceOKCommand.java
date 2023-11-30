package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.IssuanceDTO;
import com.cardfit.wwwCommand.Command;

public class CardInssuanceOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IssuanceDTO dto = new IssuanceDTO();
		dto.setCardName(request.getParameter("cardName"));
		dto.setUserName(request.getParameter("userName"));
		dto.setPhone(request.getParameter("phone"));
		dto.setAddress(request.getParameter("postcode")+"/"
				+request.getParameter("roadAddress")+"/"
				+request.getParameter("dibunAddress") + "/"
				+request.getParameter("detailAddress") + "/"
				+request.getParameter("extraAddress"));
		dto.setEmail(request.getParameter("email"));
		dto.setContactableDate(request.getParameter("contactableDate"));
		dto.setStartTime(request.getParameter("startTime"));
		dto.setEndTime(request.getParameter("endTime"));
		dto.setCardCompany(request.getParameter("company"));
		
		HttpSession session = request.getSession();
		dto.setUserId(String.valueOf(session.getAttribute("id")));  
		
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		int result = dao.insertIssuanceCard(dto);
		
		if(result >= 1) {
			System.out.println("발급등록 성공");
		}else {
			System.out.println("발급등록 실패");
		}
		session.removeAttribute("cardSearchResult");
	}
}
