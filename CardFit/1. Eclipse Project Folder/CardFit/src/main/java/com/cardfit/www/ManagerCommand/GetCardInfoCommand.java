package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.www.DTO.MemberInfoDTO;
import com.cardfit.wwwCommand.Command;

public class GetCardInfoCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		String cardName = request.getParameter("cardName");
		
		CardInfoDTO cardInfo = dao.getCardInfo(cardName);
		
		HttpSession session =request.getSession();
		String id = String.valueOf(session.getAttribute("id"));
		
		MemberInfoDAO daoOfMember = MemberInfoDAO.getMemberDAO();
		MemberInfoDTO memberInfo =  daoOfMember.getMemberInfo(id);
		
		request.setAttribute("cardInfo", cardInfo);
		request.setAttribute("memberInfo", memberInfo);
	}

}
