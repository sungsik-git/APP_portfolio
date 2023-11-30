package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.NoticeDTO;
import com.cardfit.wwwCommand.Command;

public class InsertNoticeOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		NoticeDTO dto = new NoticeDTO();
		
		
		dto.setTitle(request.getParameter("title"));
		dto.setContents(request.getParameter("editordata"));
		String emphasis = request.getParameter("emphasis");
		System.out.println(emphasis);
		
		if(emphasis.equals("on")) {
			dto.setEmphasis(1);
			}
		else if(emphasis.equals(null)) {
			dto.setEmphasis(0);
		}
		int result = dao.insertNotice(dto);
		if(result == 0) {
			System.out.println("공지사항 등록실패");
		}else {
			System.out.println("공지사항 등록성공");
		}
	}
	
}
