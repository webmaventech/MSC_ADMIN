package com.webmaven;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webmaven.core.OrderDetailsBean;
import com.webmaven.core.OrdersBean;
import com.webmaven.core.OrdersDAO;
import com.webmaven.core.ProductsDAO;

public class OrdersServelet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String formName = "";
        String btnId = "";
        String dummy = "";
        OrdersBean ordersBean = new OrdersBean();
        btnId = request.getParameter("btnId");
        formName = request.getParameter("formName");
        System.out.println(formName + "<==formName");
        
        ordersBean.setPreferredDate(request.getParameter("preferredDate"));
        ordersBean.setPreferredTime(request.getParameter("preferredTime"));
        dummy = request.getParameter("customerId");
        System.out.println("Got Customer_Id :<"+dummy+"> in Orders Servelet");
        if((dummy != null) && !("".equalsIgnoreCase(dummy))){
        	ordersBean.setCustomer_id(Integer.parseInt(dummy));
        }else{
        	System.out.println("Error: while setting Customer_Id :<"+dummy+">");
        }
        
        HttpSession session = request.getSession();
        if(session != null){
        String userName = (String)session.getAttribute("userName");
        System.out.println("OrdersServelet --> Session --> UserName-->"+userName);
        ordersBean.setUserName(userName);
        }
        try {
        	int rows = 0;
        	OrdersDAO ordersDao =  OrdersDAO.getOrdersDAO();

        	if("placeOrder".equalsIgnoreCase(formName)){
        		
        		rows = ordersDao.insertForNewOrder(ordersBean);
        		System.out.println(rows + " Row(s) Inserted.");
        	
        	}else if("updateOrder".equalsIgnoreCase(formName)){
        		
        		ordersBean.setOrder_no(Integer.parseInt(request.getParameter("orderNo")));
        		ordersBean.setStatus(Integer.parseInt(request.getParameter("orderStatus")));
        		ordersBean.setCompletedon(request.getParameter("completedOn"));
        		
        		dummy = request.getParameter("assignedTo");
                System.out.println("Got Assigned To :<"+dummy+"> in Orders Servelet");
                if((dummy != null) && !("".equalsIgnoreCase(dummy))){
                	ordersBean.setAssignedto(Integer.parseInt(dummy));
                }else{
                	System.out.println("Error: while setting Assigned To :<"+dummy+"> hence setting Zero");
                	ordersBean.setAssignedto(0);
                }
        		
                dummy = request.getParameter("completedBy");
                System.out.println("Got Completed By :<"+dummy+"> in Orders Servelet");
                if((dummy != null) && !("".equalsIgnoreCase(dummy))){
                	ordersBean.setCompletedby(Integer.parseInt(dummy));
                }else{
                	System.out.println("Error: while setting Completed By :<"+dummy+"> hence setting Zero");
                	ordersBean.setCompletedby(0);
                }
        		
        		rows = ordersDao.updateExistingOrderBasedOnOrderId(ordersBean);
        		System.out.println(rows + " Row(s) Updated.");
        	
        	}else if("delete".equalsIgnoreCase(btnId)){
        		ordersBean.setOrder_no(Integer.parseInt(request.getParameter("orderNo")));
        		rows = ordersDao.deleteOrderBasedOnOrderId(ordersBean);
        		System.out.println(rows + " Row(s) Updated.");

        	}
        	
        	if (rows > 0) {
        		response.sendRedirect("orders.jsp");
        	} else {
        		System.out.println("Error: Inserting/Updating Order into Database");
        		response.sendRedirect("index.jsp");
        	}

        } catch (Exception e) {
            out.println("Error:Try Again");
            e.printStackTrace();
        }
    }
}
