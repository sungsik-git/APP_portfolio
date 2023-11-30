package com.cardfit.www.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cardfit.wwwCommand.Command;

public class CheckEmailCommnad implements Command {

    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String userNumber = (String) request.getParameter("userNumber");
        String randNum = String.valueOf((int) session.getAttribute("randNum"));
        int result = 0;

        // 디버깅
        System.out.println("입력받은 userNumber : " + userNumber);
        System.out.println("세션에 넘어온 randNum : " + randNum);

        if (userNumber.equals(randNum)) {
            result = 0;
        } else {
            result = 1;
        }
        System.out.println("result : " + result);

        request.setAttribute("result", String.valueOf(result));

    }
}

