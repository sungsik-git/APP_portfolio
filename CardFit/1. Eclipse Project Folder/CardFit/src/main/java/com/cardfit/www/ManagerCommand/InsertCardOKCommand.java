package com.cardfit.www.ManagerCommand;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.DAO.ManagerDAO;
import com.cardfit.www.DTO.CardInfoDTO;
import com.cardfit.wwwCommand.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertCardOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 등록
		
		String path = request.getSession().getServletContext().getRealPath("/CardIMG");
		int size = 1024 * 1024 * 10; //10M - 최대 사이즈
		String file = "";
		String oriFile = "";

		try{
			MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
			String name = multi.getParameter("name");

			System.out.println("이름 " + name);
			
			Enumeration<String> files = multi.getFileNames();		// 폼 요소 중 input 태그 속성이 file로 된 파라미터의 이름들을 반환
															// upload 된 파일이 없으면 비어있는 Enumeration을 반환
			while(files.hasMoreElements())
			{
				String str = files.nextElement();
				file = multi.getFilesystemName(str);			// 사용자가 지정해서 서버에 실제로 업로드된 파일명 반환
																// 파일명이 중복되는 경우 변경된 파일명 반환
				oriFile = multi.getOriginalFileName(str);		// 사용자가 업로드한 실제 파일명을 반환.
																// 이때의 파일명은 파일 중복을 고려한 파일명 변경 전의 이름을 말한다.
				System.out.println("저장된 경로 " + path + " 저장된 이름 " + file + " 원본이름 " + oriFile);
			}
			
			CardInfoDTO dto = new CardInfoDTO();
			
			String rewordStr = "";
			for (int i = 0; i < 5; i++) {
			    String category = multi.getParameter("rewordCategory" + i);
			    rewordStr += category + ":"; // 카테고리와 비율을 구분하는 문자로 변경
			    if(i<4) {
				    String rate = multi.getParameter("rewordRate" + i);
				    rewordStr += rate + ",";
			    }else if(i==4) {
				    String rate = multi.getParameter("rewordRate" + i);
				    rewordStr += rate + ",";
			    }
			}
			System.out.println(rewordStr);
			


			//DB에 parameter 저장
			dto.setImg(oriFile);
			dto.setName(name);
			dto.setCompany(multi.getParameter("company"));
			dto.setStartAge(Integer.parseInt(multi.getParameter("startAge")));
			dto.setEndAge(Integer.parseInt(multi.getParameter("endAge")));
			dto.setFee(multi.getParameter("fee"));
			dto.setOutfee(multi.getParameter("outfee"));
			dto.setRecord(multi.getParameter("record"));
			dto.setCardDivision(multi.getParameter("cardDivision"));
			dto.setReword(rewordStr);
			
			ManagerDAO dao =ManagerDAO.getManagerDAO();
			
			int result = dao.insertCardInfo(dto);
			
			if(result==1) {
				System.out.println("카드 등록 성공");
			}else {
				System.out.println("카드 등록 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
