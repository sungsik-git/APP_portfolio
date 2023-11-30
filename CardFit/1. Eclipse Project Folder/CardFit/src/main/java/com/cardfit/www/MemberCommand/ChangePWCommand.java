package com.cardfit.www.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.MemberInfoDTO;
import com.cardfit.wwwCommand.Command;

public class ChangePWCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String pw = request.getParameter("pw1");
		MemberInfoDTO dto = new MemberInfoDTO();
		dto.setPw(pw);
		
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		int result = dao.changePW(dto, id);
		
		if(result > 0) {
			System.out.println("비밀번호 변경성공");
			session.removeAttribute("id");
			session.removeAttribute("pw");
			session.removeAttribute("sessionCheck");
		}else{
			System.out.println("비밀번호 변경실패");
		};
		
		
	}
	
}
