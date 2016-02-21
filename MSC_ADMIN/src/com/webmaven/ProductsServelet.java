package com.webmaven;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webmaven.core.ProductsBean;
import com.webmaven.core.ProductsDAO;

public class ProductsServelet extends HttpServlet {
	
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
        
        btnId = request.getParameter("btnId");
        formName = request.getParameter("formName");
        System.out.println(formName + " <==formName");
        
        ProductsBean productsBean = new ProductsBean();
        productsBean.setName(request.getParameter("name"));
        productsBean.setDescription(request.getParameter("description"));
        productsBean.setUnit_price(request.getParameter("unitPrice"));
        productsBean.setUnit(request.getParameter("unit"));
        productsBean.setCode(request.getParameter("code"));
        
        HttpSession session = request.getSession();
        if(session != null){
        String userName = (String)session.getAttribute("userName");
        System.out.println("ProductServelet --> Session --> UserName-->"+userName);
        productsBean.setUserName(userName);
        }
        
        
        
        try {
        	int rows = 0;
        	ProductsDAO productsDao =  ProductsDAO.getProductsDAO();

        	if("addProduct".equalsIgnoreCase(formName)){
        		rows = productsDao.insertForNewProduct(productsBean);
        		System.out.println(rows + " Row(s) Inserted.");
        	}else if("updateProduct".equalsIgnoreCase(formName)){
        		productsBean.setProduct_id(Integer.parseInt(request.getParameter("productId")));
        		rows = productsDao.updateExistingProductBasedOnProductId(productsBean);
        		System.out.println(rows + " Row(s) Updated.");
        	}else if("delete".equalsIgnoreCase(btnId)){
        		productsBean.setProduct_id(Integer.parseInt(request.getParameter("productId")));
        		rows = productsDao.deleteProductBasedOnProductId(productsBean);
        		System.out.println(rows + " Row(s) Updated.");
        	}
        	
        	if (rows > 0) {
        		response.sendRedirect("products.jsp");
        	} else {
        		System.out.println("Error: Inserting/Updating Product into Database");
        		response.sendRedirect("index.jsp");
        	}

        } catch (Exception e) {
            out.println("Error:Try Again");
        }
    }

}
