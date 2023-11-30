package com.cardfit.www.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.DirectDTO;
import com.cardfit.wwwCommand.Command;

public class HelpDirectOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String contents = request.getParameter("contents");
		
		DirectDTO dto = new DirectDTO();
		dto.setTitle(title);
		dto.setCategory(category);
		dto.setContents(contents);
		dto.setWriter(writer);
		
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		int result = dao.insertHelpDirect(dto);
		
		if(result != -1) {
			System.out.println("등록성공");
		}else {
			System.out.println("등록실패");
		}
	}
}
