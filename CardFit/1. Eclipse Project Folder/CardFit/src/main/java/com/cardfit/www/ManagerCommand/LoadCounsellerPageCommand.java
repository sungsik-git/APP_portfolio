package com.cardfit.www.ManagerCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.wwwCommand.Command;

public class LoadCounsellerPageCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String counsellerName = String.valueOf(session.getAttribute("counsellerName"));
		String company = String.valueOf(session.getAttribute("company"));
		
		//갯수 로드
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		int counsellerIssuance = dao.countIssuance(0); //사업자에게 모든 발급대기 카드 수 출력
		int counsellerIssuancing = dao.countCounsellerIssuance(1, counsellerName); //사업자 가 발급중인 카드 수
		int counsellerIssuanced = dao.countCounsellerIssuance(2, counsellerName); //사업자가 발급완료한 카드 수
		
		int companyIssuance = dao.countCompanyIssuance(0, company);
		int companyIssuancing = dao.countCompanyIssuance(1, company, counsellerName);
		int companyIssuanced = dao.countCompanyIssuance(2, company, counsellerName);
		
		
		request.setAttribute("counsellerIssuance", counsellerIssuance);
		request.setAttribute("counsellerIssuancing", counsellerIssuancing);
		request.setAttribute("counsellerIssuanced", counsellerIssuanced);
		request.setAttribute("companyIssuance", companyIssuance);
		request.setAttribute("companyIssuancing", companyIssuancing);
		request.setAttribute("companyIssuanced", companyIssuanced);
		
	}

}
