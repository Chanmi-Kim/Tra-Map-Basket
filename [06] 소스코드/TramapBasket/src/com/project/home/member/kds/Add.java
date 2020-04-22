package com.project.home.member.kds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/board/free/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//add.java
		
		//인증 사용자
		//AuthCheck auth = new AuthCheck(req.getSession(), resp);
		//auth.allow();
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/board/free/add.jsp");
		dispatcher.forward(req, resp);

	}//doget

}//class
