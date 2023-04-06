package com.servlet;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/addContact")
public class AddContact extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  
		int userId = Integer.parseInt(req.getParameter("userid"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		
		Contact c = new Contact(name, email, mobile, userId);
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		
		HttpSession session = req.getSession();
		
		boolean f = dao.saveContact(c);
		
		if(f) {
			
			session.setAttribute("succMsg", "Your Contact added successfully !!");
			resp.sendRedirect("addContact.jsp");
		} else {

			session.setAttribute("failedMsg", "Something went wrong on Server....");
			resp.sendRedirect("addContact.jsp");
		}
		
		
	}
	
	

}
