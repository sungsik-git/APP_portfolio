package com.cardfit.www.MemberCommand;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.cardfit.www.DAO.MemberInfoDAO;
import com.cardfit.wwwCommand.Command;

 
public class SendMailCommand implements Command{
 
    @Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	
    	String userEmail = (String)request.getParameter("registerEmail");
    	
    	MemberInfoDAO dao = MemberInfoDAO.getMemberDAO();
    	int randNum = dao.sendMail_reRandNum(userEmail);
    	session.setAttribute("randNum", randNum);
    	System.out.println("session randNum : " + session.getAttribute("randNum"));
    	
    	if(randNum >= 100000) {
    		request.setAttribute("result", 0);
    	}else {
    		request.setAttribute("result", 1);
    	}

    }
} 
  
