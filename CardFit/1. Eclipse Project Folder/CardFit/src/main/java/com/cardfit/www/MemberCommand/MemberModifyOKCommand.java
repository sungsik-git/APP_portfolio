package com.cardfit.www.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.www.DTO.MemberInfoDTO;
import com.cardfit.wwwCommand.Command;

public class MemberModifyOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberInfoDTO dto = new MemberInfoDTO();
		dto.setName(request.getParameter("name"));
		dto.setRegNum(request.getParameter("regNumF") + request.getParameter("regNumB"));
		dto.setPhone(request.getParameter("phone"));
		dto.setAddress(request.getParameter("postcode")+"/"
				+request.getParameter("roadAddress")+"/"
				+request.getParameter("dibunAddress") + "/"
				+request.getParameter("detailAddress") + "/"
				+request.getParameter("extraAddress"));
		dto.setEmail(request.getParameter("email") );
		
		MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
		int result = dao.modifyOK(dto, id);
		
		if(result != -1) {
			System.out.println("회원정보 수정성공");
		}else {
			System.out.println("회원정보 수정실패");
		}
			
		
	}
	

}
