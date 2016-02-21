/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webmaven;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webmaven.core.EmployeeBean;
import com.webmaven.core.EmployeeDAO;
import com.webmaven.core.MasterDAO;

public class LoginServelet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String dummy = "";
        String name = "";
        Long mobileNo = 0L;
        String password = "";
        /*int loginType;*/
        boolean isValidUser = false;
        dummy = request.getParameter("mobileNo");
        password = request.getParameter("password");
        /*loginType = Integer.parseInt(request.getParameter("loginType"));*/
        
        if(dummy != null && !dummy.equalsIgnoreCase("") 
        		&& password != null && !password.equalsIgnoreCase("")){
        	try{
        		mobileNo = Long.parseLong(dummy);
        	}catch(NumberFormatException nfe){
        		System.out.println("Only Number Allowed");
        		 //response.sendRedirect("login.jsp");
        	}
        	
        	/*if(loginType == 1){
        		UsersBean usersBean = new UsersBean();
        		usersBean.setMobileNo(mobileNo);
        		usersBean.setPassword(password);
        		usersBean = UsersDAO.login(usersBean);
        		System.out.println(usersBean.isValidUser());
        		isValidUser = usersBean.isValidUser();

        	}else if(loginType == 2){
        		CustomersBean cbean = new CustomersBean();
        		cbean.setMobileno(mobileNo);
        		cbean.setPassword(password);
        		cbean = CustomersDAO.login(cbean);
        		isValidUser = cbean.isValidUser();

        	}else if(loginType == 3){*/
        		EmployeeBean ebean = new EmployeeBean();
        		ebean.setMobileNo(mobileNo);
        		ebean.setPassword(password);
        		ebean = EmployeeDAO.login(ebean);
        		isValidUser = ebean.isValidUser();
        		if(isValidUser){
        			name = ebean.getName();
        		}
        	/*}*/
           try {
        	   if (isValidUser) {
        		   HttpSession session = request.getSession();
        		   session.setAttribute("id", ebean.getEmployeeId());
        		   session.setAttribute("name", name);
        		   session.setAttribute("userName", dummy);
        		   MasterDAO.initializeMasters();
        		   response.sendRedirect("index.jsp");
        	   } else {
        		   System.out.println("Invalid User Name and Password");
        		   response.sendRedirect("login.jsp"); // redirect to index page if login fails.
        	   }
           	
           } catch (Exception e) {
               out.println("Error:Try Again");
           }
        }else{
        	System.out.println("Mobile No and Password Cannot be Empty");
        }
        
    }
}
