package com.webmaven;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webmaven.core.CustomersBean;
import com.webmaven.core.CustomersDAO;
import com.webmaven.core.Util;

public class CustomersServelet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String moduleName = "CustomersServelet";
	private static String smsP1 = "Thanks+for+calling+My+Scrap+Collector+No:";
	private static String smsP2 = "+with+Password:";
	private static String smsP3 = "+is+registered+with+us+Downlaod+App-https://goo.gl/2aA2b4+or+visit+myscrapcollector.com";
	boolean updatePassAndSendSMS = false;

	@Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String methodName = "service";
        String formName = "";
        String btnId = "";
        btnId = request.getParameter("btnId");
        formName = request.getParameter("formName");
        System.out.println("<"+formName+"><==formName");
        CustomersBean customersBean = new CustomersBean();
        if(formName != null && !"".equalsIgnoreCase(formName)){
        	customersBean = parseRequestAndRetriveFormElementsIntoBean(request);
        	customersBean.setSource(3);
        }
        
        HttpSession session = request.getSession();
        if(session != null){
        String userName = (String)session.getAttribute("userName");
        Util.setConsoleLog(moduleName, methodName, "UserName-->"+userName);
        customersBean.setUserName(userName);
        }
        
        try {
        	int rows = 0;
        	CustomersDAO customersDao =  CustomersDAO.getCustomersDAO();

        	if("addCustomer".equalsIgnoreCase(formName)){
        		Util.setConsoleLog(moduleName, methodName, "Inside addCustomer");
        		rows = customersDao.insertForNewCustomer(customersBean);
        		if(updatePassAndSendSMS){
        			long[] custIdMobileNo = customersDao.retriveCustomerIdMobileNoAndUpdatePassword();
        			String msg = smsP1+custIdMobileNo[1]+smsP2+custIdMobileNo[0]+smsP3;
        			Util.sendTransactionSms(custIdMobileNo[1], msg);
        		}
        						
        		System.out.println(rows + " Row(s) Inserted.");
        	}else if("updateCustomer".equalsIgnoreCase(formName)){
        		customersBean.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
        		rows = customersDao.updateExistingCustomerBasedOnCustomerIdNew(customersBean);
        		System.out.println(rows + " Row(s) Updated.");
        	}else if("delete".equalsIgnoreCase(btnId)){
        		customersBean.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
        		rows = customersDao.deleteCustomerBasedOnCustomerId(customersBean);
        		System.out.println(rows + " Row(s) Updated.");
        	}
        	
        	if (rows > 0) {
        		response.sendRedirect("customers.jsp");
        	} else {
        		System.out.println("Error: Inserting/Updating Customer into Database");
        		response.sendRedirect("index.jsp");
        	}

        } catch (Exception e) {
            out.println("Error:Try Again");
        }
    }
	
	private CustomersBean parseRequestAndRetriveFormElementsIntoBean(HttpServletRequest request){
		String dummy;
		int intDummy = 0;
		Long longDummy = 0L;
		
		CustomersBean customersBean = new CustomersBean();
    	
		dummy = request.getParameter("password");
		System.out.println("password-->"+dummy);
		customersBean.setPassword(dummy);

		dummy = request.getParameter("name");
		System.out.println("name-->"+dummy);
		customersBean.setName(dummy);

		dummy = request.getParameter("email");
		System.out.println("email-->"+dummy);
		customersBean.setEmail(dummy);

		dummy = request.getParameter("mobileNo");
		System.out.println("mobileno-->"+dummy);
		if(dummy != null && !"".equalsIgnoreCase(dummy)){
    	longDummy = Util.getLongValue(dummy);
    	customersBean.setMobileno(longDummy);
    	}
		dummy = request.getParameter("altNumber");
		System.out.println("altNumber-->"+dummy);
		longDummy = Util.getLongValue(dummy);
		System.out.println("altNumberLong-->"+longDummy);
		customersBean.setAltNumber(longDummy);
		
		dummy = request.getParameter("address");
		System.out.println("address-->"+dummy);
		customersBean.setAddress(dummy);

		dummy = request.getParameter("city");
		System.out.println("city-->"+dummy);
		customersBean.setCity(dummy);

		dummy = request.getParameter("state");
		System.out.println("state-->"+dummy);
		customersBean.setState(dummy);

		dummy = request.getParameter("area");
		System.out.println("area-->"+dummy);
		customersBean.setArea(dummy);

		dummy = request.getParameter("side");
		System.out.println("side-->"+dummy);
		if(dummy != null){
    	intDummy = Util.getIntValue(dummy);
    	customersBean.setSide(intDummy);
    	}
		
		dummy = request.getParameter("pincode");
		System.out.println("pincode-->"+dummy);
		if(dummy != null){
    	longDummy = Util.getLongValue(dummy);
    	customersBean.setPincode(longDummy);
    	}
		
		dummy = request.getParameter("customerType");
		System.out.println("customerType-->"+dummy);
		if(dummy != null){
    	intDummy = Util.getIntValue(dummy);
    	customersBean.setCustomerType(intDummy);
    	}
		
		dummy = request.getParameter("comments");
		System.out.println("comments-->"+dummy);
		if(dummy !=  null){
		customersBean.setComments(dummy);
		}
		return customersBean;
	}

}
