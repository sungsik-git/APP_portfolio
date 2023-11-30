package com.cardfit.www.ManagerCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CategoryDTO;
import com.cardfit.wwwCommand.Command;

public class GetCategoryListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ManagerDAO dao = ManagerDAO.getManagerDAO();
		
		/*모든 카테고리리스트 로드*/
		ArrayList<CategoryDTO> categoryList = dao.getCategoryList();
		request.setAttribute("categoryList", categoryList);
		/*대분류 리스트 로드*/
		ArrayList<CategoryDTO> LargeCategoryList = dao.getLargeCategoryList();
		request.setAttribute("LargeCategoryList", LargeCategoryList);
	}

}
