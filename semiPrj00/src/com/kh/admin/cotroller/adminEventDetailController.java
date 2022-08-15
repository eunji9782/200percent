package com.kh.admin.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/eventDetail")
public class adminEventDetailController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("functionName", "이벤트 상세조회");
		req.getRequestDispatcher("/WEB-INF/views/admin/adminEventDetailView.jsp").forward(req, resp);
	}
}
