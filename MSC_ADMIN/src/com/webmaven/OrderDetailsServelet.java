package com.webmaven;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webmaven.core.OrdersBean;
import com.webmaven.core.OrdersDAO;
import com.webmaven.core.ProductsDAO;
import com.webmaven.core.OrderDetailsBean;
import com.webmaven.core.OrderDetailsDAO;
import com.webmaven.core.Util;

public class OrderDetailsServelet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String moduleName = "OrderDetailsServelet";
	private String userName = "";
	@Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String methodName = "service";
        PrintWriter out = response.getWriter();
        String formName = "";
        String btnId = "";
        String dummy = "";
        OrderDetailsBean orderDetailsBean = new OrderDetailsBean();
        btnId = request.getParameter("btnId");
        formName = request.getParameter("formName");
        System.out.println("formName:<"+formName+"> And BtnId:<"+btnId+">" );
        HttpSession session = request.getSession();
        
        if(session != null){
        	userName = (String)session.getAttribute("userName");
        	Util.setConsoleLog(moduleName, methodName, "UserName-->"+userName);
        	orderDetailsBean.setUserName(userName);
        }
        try {
        	int rows = 0;
        	OrderDetailsDAO orderDetailsDao =  OrderDetailsDAO.getOrderDetailsDAO();
        	if("addOrderDetails".equalsIgnoreCase(formName)){
        		List<OrderDetailsBean> odbeanList = parseRequestAndFillOrderDetailsBeanObj(request);
        		rows = orderDetailsDao.insertForNewOrderDetails(odbeanList);
        		System.out.println(rows + " Row(s) Inserted.");
        	
        	}else if("updateOrderDetails".equalsIgnoreCase(formName)){
        		List<OrderDetailsBean> odbeanList = parseRequestAndFillOrderDetailsBeanObj(request);
        		rows = orderDetailsDao.updateExistingOrderBasedOnOrderNoAndProductId(odbeanList);
        		System.out.println(rows + " Row(s) Updated.");
        	
        	}else if("deleteDetails".equalsIgnoreCase(btnId)){
        		orderDetailsBean =  parseRequestAndFillOrderDetailsBeanObjForDelete(request);
        		rows = orderDetailsDao.deleteOrderDetailsBasedOnOrderNo(orderDetailsBean);
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
            response.sendRedirect("index.jsp");
            e.printStackTrace();
        }
    }
	
	private OrderDetailsBean parseRequestAndFillOrderDetailsBeanObjForDelete(
			HttpServletRequest request) {
		int order_no = Util.getIntValue(request.getParameter("orderNo"));
		String updatedBy = request.getParameter("userName");
		OrderDetailsBean odetails = new OrderDetailsBean();
		odetails.setOrder_no(order_no);
		odetails.setUserName(updatedBy);
		return odetails;
	}

	private List<OrderDetailsBean> parseRequestAndFillOrderDetailsBeanObj(HttpServletRequest req){
		String methodName = "fillOrderDetailsBeanObjForaddOrderDetails";
		List<OrderDetailsBean> listOrderDetails = new ArrayList<OrderDetailsBean>();
		OrderDetailsBean odbean = null;
		String[] productIdArr = req.getParameterValues("productId");
		String[] productCodeArr = req.getParameterValues("productCode");
		String[] quantityArr = req.getParameterValues("quantity");
		String[] rateArr = req.getParameterValues("rate");
		int order_no = Util.getIntValue(req.getParameter("orderNo"));
		int len = productIdArr.length;
		Util.setConsoleLog(moduleName, methodName, "productIdArr==>"+Arrays.toString(productIdArr));
		Util.setConsoleLog(moduleName, methodName, "productCodeArr==>"+Arrays.toString(productCodeArr));
		Util.setConsoleLog(moduleName, methodName, "quantityArr==>"+Arrays.toString(quantityArr));
		Util.setConsoleLog(moduleName, methodName, "rateArr==>"+Arrays.toString(rateArr));
		Util.setConsoleLog(moduleName, methodName, "productCodeArr.length==>"+len);
		for(int i = 0; i < len; i++){
			odbean = new OrderDetailsBean();
			int productId = Util.getIntValue(productIdArr[i]);
			double quantity = Util.getDoubleValue(quantityArr[i]);
			double unitPrice = Util.getDoubleValue(rateArr[i]);
			
			if(quantity > 0 && unitPrice > 0){
				double totalAmt = Util.formatDouble((quantity * unitPrice));
				odbean.setOrder_no(order_no);
				odbean.setProductId(productId);
				odbean.setQuantity(quantity);
				odbean.setUnitPrice(unitPrice);
				odbean.setTotalAmount(totalAmt);
				odbean.setUserName(userName);
				listOrderDetails.add(odbean);
			}else{
				continue;
			}
		}
		Util.setConsoleLog(moduleName, methodName, "listOrderDetails<"+listOrderDetails.size()+">");
		return listOrderDetails;
	}
}
