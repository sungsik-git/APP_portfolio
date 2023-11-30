package com.cardfit.www.FrontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cardfit.www.CardCommand.CardCompanyRankingCommnad;
import com.cardfit.www.CardCommand.CardFeeRankingCommand;
import com.cardfit.www.CardCommand.CardRewordRankingCommand;
import com.cardfit.www.CardCommand.CardTotalRankingCommand;
import com.cardfit.www.CardCommand.HeaderSearchCommand;
import com.cardfit.www.CardCommand.SearchCardCommand;
import com.cardfit.www.ManagerCommand.CardInssuanceOKCommand;
import com.cardfit.www.ManagerCommand.CounsellerIssuanceOKCommand;
import com.cardfit.www.ManagerCommand.CounsellerIssuancingCommand;
import com.cardfit.www.ManagerCommand.CounsellerIssunacedListCommand;
import com.cardfit.www.ManagerCommand.CounsellerLoginOKCommand;
import com.cardfit.www.ManagerCommand.CounsellerModifyCommand;
import com.cardfit.www.ManagerCommand.CounsellerModifyOKCommand;
import com.cardfit.www.ManagerCommand.CounsellerRegisterCommand;
import com.cardfit.www.ManagerCommand.DeleteCardOKCommand;
import com.cardfit.www.ManagerCommand.DeleteNoticeOKCommand;
import com.cardfit.www.ManagerCommand.DeleteUserOKCommand;
import com.cardfit.www.ManagerCommand.DeleteIssuanceOKCommand;
import com.cardfit.www.ManagerCommand.GetCardInfoCommand;
import com.cardfit.www.ManagerCommand.GetCardListCommand;
import com.cardfit.www.ManagerCommand.GetDirectInqiryCommand;
import com.cardfit.www.ManagerCommand.GetIssuanceInfoCommand;
import com.cardfit.www.ManagerCommand.GetIssuanceListCommand;
import com.cardfit.www.ManagerCommand.GetIssuanceOfCompanyCommand;
import com.cardfit.www.ManagerCommand.GetMemberListCommand;
import com.cardfit.www.ManagerCommand.GetNoticeContentsCommand;
import com.cardfit.www.ManagerCommand.GetNoticeListCommand;
import com.cardfit.www.ManagerCommand.InsertCardOKCommand;
import com.cardfit.www.ManagerCommand.GetCategoryListCommand;
import com.cardfit.www.ManagerCommand.GetCompanyListCommand;
import com.cardfit.www.ManagerCommand.GetDirectAnswerCommand;
import com.cardfit.www.ManagerCommand.InsertCompanyCommand;
import com.cardfit.www.ManagerCommand.InsertDirectAnswerCommand;
import com.cardfit.www.ManagerCommand.InsertLargeCategoryCommand;
import com.cardfit.www.ManagerCommand.InsertNoticeOKCommand;
import com.cardfit.www.ManagerCommand.InsertSmallCategoryCommnad;
import com.cardfit.www.ManagerCommand.LoadCounsellerPageCommand;
import com.cardfit.www.ManagerCommand.ManagerLoginOKCommand;
import com.cardfit.www.ManagerCommand.CounsellerClearIssuanceCommand;
import com.cardfit.www.ManagerCommand.CounsellerDeleteInfoOKCommand;
import com.cardfit.www.MemberCommand.ChangePWCommand;
import com.cardfit.www.MemberCommand.CheckEmailCommnad;
import com.cardfit.www.MemberCommand.DeleteSelfInfoCommand;
import com.cardfit.www.MemberCommand.GetDirectInquiryListCommand;
import com.cardfit.www.MemberCommand.GetMemberInfoCommand;
import com.cardfit.www.MemberCommand.HelpDirectOKCommand;
import com.cardfit.www.MemberCommand.IDCheckCommand;
import com.cardfit.www.MemberCommand.MemberLoginOKCommand;
import com.cardfit.www.MemberCommand.LogoutCommand;
import com.cardfit.www.MemberCommand.MemberModifyOKCommand;
import com.cardfit.www.MemberCommand.MemberRegisterCommand;
import com.cardfit.www.MemberCommand.SearchIDPWCommand;
import com.cardfit.www.MemberCommand.SendMailCommand;
import com.cardfit.wwwCommand.Command;

import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class frontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String commandName = request.getServletPath();
		String viewPage = null;
		Command command;
		PrintWriter out = null;
		boolean flag = false;

		if(commandName.equals("/register.do")) {
			command = new MemberRegisterCommand();
			command.excute(request, response);
			viewPage = "MemberRegisterOK.jsp";
			flag = true;
		}else if(commandName.equals("/index.do")) {
			viewPage = "Index.jsp";
			flag = true;
		}else if(commandName.equals("/idCheck.do")) {
			command = new IDCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/login.do")){
			viewPage = "Login.jsp";
			flag = true;
		}else if(commandName.equals("/loginOK.do")) {
			command = new MemberLoginOKCommand();
			command.excute(request, response);
			String result = request.getAttribute("result") + "";
			if(result.equals("1")) {
				viewPage = "login.do";
				System.out.println("로그인실패");
			}else {
				viewPage = "index.do";
				System.out.println("로그인성공");
			}
			flag = true;
		}else if(commandName.equals("/logout.do")) {
			command = new LogoutCommand();
			command.excute(request, response);
			viewPage = "index.do";
			flag = true;
		}else if(commandName.equals("/changePW.do")) {
			viewPage = "MyPageChangePW.jsp";
			flag = true;
		}else if(commandName.equals("/changePWOK.do")) {
			command = new ChangePWCommand();
			command.excute(request, response);
			viewPage = "index.do";
			flag = true;
		}else if(commandName.equals("/MyPageModify.do")) {
			command = new GetMemberInfoCommand();
			command.excute(request, response);
			viewPage = "MyPageModify.jsp";
			flag = true;
		}else if(commandName.equals("/modifyOK.do")){
			command = new MemberModifyOKCommand();
			command.excute(request, response);
			viewPage = "MyPage.do";
			flag = true;
		}else if(commandName.equals("/MyPage.do")) {
			command = new GetMemberInfoCommand();
			command.excute(request, response);
			Command command2 = new GetIssuanceInfoCommand();
			command2.excute(request, response);
			viewPage = "MyPage.jsp";
			flag = true;
		}else if(commandName.equals("/MemberEmailIdentify.do")) {
			viewPage = "MemberEmailIdentify.jsp";
			flag = true;
		}else if(commandName.equals("/MemberRegister.do")) {
			viewPage = "MemberRegister.jsp";
			flag = true;
		}else if(commandName.equals("/searchID.do") || commandName.equals("/searchPW.do")) {
			command = new SearchIDPWCommand();
			command.excute(request, response);
			viewPage= "searchResult.do";
			flag = true;
		}else if(commandName.equals("/searchResult.do")) {
			viewPage = "SearchResultOK.jsp";
			flag = true;
		}else if(commandName.equals("/searchIDPW.do")) {
			viewPage = "SearchIDPW.jsp";
			flag =true;
		}else if(commandName.equals("/MyPageChangePW.do")) {
			viewPage = "MyPageChangePW.jsp";
			flag =true;
		}else if(commandName.equals("/MyPageIssuance.do")) {
			command = new GetIssuanceInfoCommand();
			command.excute(request, response);
			viewPage = "MyPageIssuance.jsp";
			flag = true;
		}else if(commandName.equals("/changePW.do")) {
			command = new ChangePWCommand();
			command.excute(request, response);
			viewPage = "index.do";
			flag = true;
		}else if(commandName.equals("/deleteInfo.do")) {
			command = new GetMemberInfoCommand();
			command.excute(request, response);
			viewPage = "MyPageDeleteInfo.jsp";
			flag= true;
		}else if(commandName.equals("/deleteInfoOK.do")) {
			command = new DeleteSelfInfoCommand();
			command.excute(request, response);
			viewPage = "index.do";
			flag= true;
			}else if(commandName.equals("/HelpNotice.do")) {
			command = new GetNoticeListCommand();
			command.excute(request, response);
			viewPage = "HelpNotice.jsp";
			flag = true;
		}else if(commandName.equals("/HelpDirect.do")) {
			viewPage = "HelpDirect.jsp";
			flag = true;
		}else if(commandName.equals("/helpDirectOK.do")){
			command = new HelpDirectOKCommand();
			command.excute(request, response);
			response.sendRedirect("MyPage.do");
		}else if(commandName.equals("/HelpQNA.do")) {
			command = new GetDirectInquiryListCommand();
			command.excute(request, response);
			viewPage = "HelpQNA.jsp";
			flag = true;
		}else if(commandName.equals("/deleteUserissOK.do")) {
			command = new DeleteIssuanceOKCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result")+"");
		}
		//이메일 입력
		else if(commandName.equals("/registerEmail.do")) {
			command = new SendMailCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/headerSearch.do")) {
			command = new HeaderSearchCommand();
			command.excute(request, response);
			viewPage = "HeaderSearchResult.jsp";
			flag = true;
		}
		//인증번호 체크
		else if(commandName.equals("/checkEmail.do")) {
			command = new CheckEmailCommnad();
			command.excute(request, response);
			out = response.getWriter();
			response.setContentType("text/plain;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			out.write(request.getAttribute("result") + "");
		//카드찾기 서비스
		}else if(commandName.equals("/SearchCardTest.do")) {
			viewPage = "SearchCardTest.jsp";
			flag=true;
		}
		else if(commandName.equals("/searchCard.do")) {
			command = new SearchCardCommand();
			command.excute(request, response);
			viewPage = "SearchCardResult.do";
			flag= true;
		}else if(commandName.equals("/SearchCardResult.do")) {
			viewPage = "./SearchCardResult.jsp";
			flag=true;
		}else if(commandName.equals("/CardInssuance.do")) {
			command = new GetCardInfoCommand();
			command.excute(request, response);
			viewPage = "CardIssuance.jsp";
			flag=true;
		}else if(commandName.equals("/CardIssuanceOK.do")) {
			viewPage = "CardIssuanceOK.jsp";
			flag=true;
		}
		else if(commandName.equals("/issuanceCardOK.do")) {
			command = new CardInssuanceOKCommand();
			command.excute(request, response);
			response.sendRedirect("CardIssuanceOK.do");
		}
		/* 랭킹 탭 로드 */
		else if(commandName.equals("/TotalRanking.do")) {
			command = new CardTotalRankingCommand();
			command.excute(request, response);
			viewPage = "./Ranking/TotalRanking.jsp";
			flag = true;
		}else if(commandName.equals("/CompanyRanking.do")) {
			command = new CardCompanyRankingCommnad();
			command.excute(request, response);
			viewPage = "./Ranking/CompanyRanking.jsp";
			flag = true;
		}else if(commandName.equals("/RewordRanking.do")) {
			command = new CardRewordRankingCommand();
			command.excute(request, response);
			viewPage = "./Ranking/RewordRanking.jsp";
			flag = true;
		}else if(commandName.equals("/FeeRanking.do")) {
			command = new CardFeeRankingCommand();
			command.excute(request, response);
			viewPage = "./Ranking/FeeRanking.jsp";
			flag = true;
		}
		/*매니저 페이지*/
		else if(commandName.equals("/ManagerLogin.do")) {
			viewPage = "ManagerLogin.jsp";
			flag=true;
		}else if(commandName.equals("/managerLoginOK.do")) {
			command = new ManagerLoginOKCommand();
			command.excute(request, response);
			viewPage = "ManagerPage.do";
			flag=true;
		}else if(commandName.equals("/counsellerLoginOK.do")) {
			command = new CounsellerLoginOKCommand();
			command.excute(request, response);
			String result = request.getAttribute("result") + "";
			if(result.equals("1")) {
				viewPage = "ManagerLogin.do";
				System.out.println("로그인실패");
			}else {
				viewPage = "CounsellerPage.do";
				System.out.println("로그인성공");
			}
			flag=true;
		}
		else if(commandName.equals("/ManagerPage.do")) {
			viewPage = "ManagerPage.jsp";
			flag = true;
		}else if(commandName.equals("/companyInsert.do")) {
			command = new InsertCompanyCommand();
			command.excute(request, response);
			viewPage = "ManagerPage.do";
			flag = true;
		}else if(commandName.equals("/CounsellerRegister.do")) {
			command = new GetCompanyListCommand();
			command.excute(request, response);
			viewPage = "CounsellerRegister.jsp";
			flag = true;
		}else if(commandName.equals("/counsellerRegisterOK.do")) {
			command = new CounsellerRegisterCommand();
			command.excute(request, response);
			viewPage = "ManagerLogin.do";
			flag = true;	
		}else if(commandName.equals("/getMemberInfoList.do")) {
			command = new GetMemberInfoCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/insertLargeCategory.do")) {
			command = new InsertLargeCategoryCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/insertSmallCategory.do")) {
			command = new InsertSmallCategoryCommnad();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/getCategoryList.do")) {
			command = new GetCategoryListCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("categoryList") + "");
		}else if(commandName.equals("/changePage.do")) {

		}
		
		/* 관리자 탭메뉴 로드 */
		else if(commandName.equals("/CardTab.do")) {
			command = new GetCategoryListCommand();
			command.excute(request, response);
			Command command2 = new GetCardListCommand();
			command2.excute(request, response);
			Command command3 = new GetCompanyListCommand();
			command3.excute(request, response);
			viewPage = "Manager/CardTab.jsp";
			flag = true;
		}else if(commandName.equals("/UserTab.do")) {
			command = new GetMemberListCommand();
			command.excute(request, response);
			viewPage = "Manager/UserTab.jsp";
			flag = true;
		}else if(commandName.equals("/CompanyTab.do")) {
			command = new GetCompanyListCommand();
			command.excute(request, response);
//			Command command2 = new GetCounsellerListCommand();
//			command2.excute(request, response);
			viewPage = "Manager/CompanyTab.jsp";
			flag = true;
		}else if(commandName.equals("/IssuanceTab.do")) {
			command = new GetIssuanceListCommand();
			command.excute(request, response);
			viewPage = "Manager/IssuanceTab.jsp";
			flag = true;
		}else if(commandName.equals("/BannerTab.do")) {
			viewPage = "Manager/BannerTab.jsp";
			flag = true;
		}else if(commandName.equals("/NoticeTab.do")) {
			command = new GetNoticeListCommand();
			command.excute(request, response);
			viewPage = "Manager/NoticeTab.jsp";
			flag = true;
		}else if(commandName.equals("/QuestionTab.do")) {
			command = new GetDirectInquiryListCommand();
			command.excute(request, response);
			viewPage = "Manager/QuestionTab.jsp";
			flag = true;
		}else if(commandName.equals("/BoardTab.do")) {
			viewPage = "Manager/BoardTab.jsp";
			flag = true;
		}else if(commandName.equals("/TestTab.do")) {
				viewPage = "Manager/TestTab.jsp";
				flag = true;
		}else if(commandName.equals("/StatsTab.do")) {
			viewPage = "Manager/StatsTab.jsp";
			flag = true;
		}
		
		
		/* ManagerPage 기능 */
		else if(commandName.equals("/directAnswer.do")) {
			command = new GetDirectInqiryCommand();
			command.excute(request, response);
			Command command2 = new GetDirectAnswerCommand();
			command2.excute(request, response);
			viewPage = "Manager/DirectAnswerPage.jsp";
			flag = true;
		}else if(commandName.equals("/insertAnswer.do")) {
			command = new GetDirectInqiryCommand();
			command.excute(request, response);
			viewPage = "Manager/InsertAnswerPage.jsp";
			flag = true;
		}else if(commandName.equals("/insertAnswerOK.do")) {
			command = new InsertDirectAnswerCommand();
			command.excute(request, response);
			viewPage = "directAnswer.do";
			flag = true;
		}else if(commandName.equals("/cardInsertOK.do")) {
			command = new InsertCardOKCommand();
			command.excute(request, response);
			viewPage = "CardTab.do";
			flag = true;
		}else if(commandName.equals("/deleteUserOK.do")) {
			command = new DeleteUserOKCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/deleteCard.do")) {
			command = new DeleteCardOKCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/NoticeContents.do")) {
			command = new GetNoticeContentsCommand();
			command.excute(request, response);
			viewPage = "Manager/NoticeContentsPage.jsp";
			flag=true;
		}else if(commandName.equals("/NoticeWriterPage.do")) {
		    viewPage = "Manager/NoticeWriterPaga.jsp";
		    flag = true;
		}else if(commandName.equals("/insertNotice.do")) {
			command = new InsertNoticeOKCommand();
			command.excute(request, response);
			response.sendRedirect("NoticeTab.do");
		}else if(commandName.equals("/deleteNoticeOK.do")) {
			command = new DeleteNoticeOKCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/deleteIssuanceOK.do")) {
			command = new DeleteIssuanceOKCommand();
			command.excute(request, response);
			out =response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		
		/* 상담사 탭 로드 */
		else if(commandName.equals("/CounsellerPage.do")) {
			command = new LoadCounsellerPageCommand();
			command.excute(request, response);
			Command command2 = new GetIssuanceListCommand();
			command2.excute(request, response);
			Command command3 = new GetIssuanceOfCompanyCommand();
			command3.excute(request, response);
			viewPage = "./Counseller/IndexTab.jsp";
			flag = true;
		}else if(commandName.equals("/cIssuancingTab.do")) {
			command = new GetIssuanceOfCompanyCommand();
			command.excute(request, response);
			Command command2 = new GetIssuanceListCommand();
			command2.excute(request, response);
			viewPage = "./Counseller/IssuancingTab.jsp";
			flag = true;
		}else if(commandName.equals("/cIssuancedTab.do")) {
			command = new CounsellerIssunacedListCommand();
			command.excute(request, response);
			viewPage = "./Counseller/IssuancedTab.jsp";
			flag = true;
		}else if(commandName.equals("/cMyIssuanceTab.do")) {
			command = new CounsellerIssuancingCommand();
			command.excute(request, response);
			viewPage = "./Counseller/MyIssuanceTab.jsp";
			flag = true;
		}else if(commandName.equals("/cNoticeTab.do")) {
			command = new GetNoticeListCommand();
			command.excute(request, response);
			Command command2 = new GetDirectInquiryListCommand();
			command2.excute(request, response);
			viewPage = "./Counseller/NoticeTab.jsp";
			flag = true;
		}else if(commandName.equals("/cModifyTab.do")) {
			command = new CounsellerModifyCommand();
			command.excute(request, response);
			viewPage = "./Counseller/ModifyTab.jsp";
			flag = true;
		}else if(commandName.equals("/cModifyOK.do")){
			command = new CounsellerModifyOKCommand();
			command.excute(request, response);
			
		}else if(commandName.equals("/cDirectTab.do")) {
			viewPage = "./Counseller/DirectTab.jsp";
			flag = true;
		}else if(commandName.equals("/cDeleteInfoTab.do")) {
			viewPage = "./Counseller/DeleteInfoTab.jsp";
			flag = true;
		}
		
		/*상담사 페이지 기능*/
		else if(commandName.equals("/counsellerIssuanceOK.do")) {
			command = new CounsellerIssuanceOKCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}else if(commandName.equals("/counsellerClearIssuance.do")) {
			command = new CounsellerClearIssuanceCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result")+"");
		}else if(commandName.equals("/deleteCounsellerInfoOK.do")) {
			command = new CounsellerDeleteInfoOKCommand();
			command.excute(request, response);
			viewPage = "index.do";
			flag = true;
		}
		if(flag) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);	
		} 
	}
}
