package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CounsellerInfoDTO;
import com.cardfit.wwwCommand.Command;

public class CounsellerRegisterCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CounsellerInfoDTO dto = new CounsellerInfoDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setCompany(request.getParameter("company"));
		dto.setCorporate(request.getParameter("corporate"));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		dao.insertCounseller(dto);
	}
	
}
