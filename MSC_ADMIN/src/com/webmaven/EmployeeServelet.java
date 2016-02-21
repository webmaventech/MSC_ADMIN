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

public class EmployeeServelet extends HttpServlet {
	
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
        
        btnId = request.getParameter("btnId");
        formName = request.getParameter("formName");
        System.out.println(formName + " <==formName");
        
        EmployeeBean employeeBean = new EmployeeBean();
        
        if(formName != null && !"".equalsIgnoreCase(formName)){
        	
        	employeeBean.setName(request.getParameter("name"));
        	
        	employeeBean.setEmpUserName(request.getParameter("empusername"));
        	
        	dummy = request.getParameter("mobileNo");
        	if(dummy != null && !"".equalsIgnoreCase(dummy)){
        		employeeBean.setMobileNo(Long.parseLong(dummy));
        	}
        	dummy = request.getParameter("altNumber");
        	if(dummy != null && !"".equalsIgnoreCase(dummy)){
        		employeeBean.setAltNumber(Long.parseLong(dummy));
        	}
        	employeeBean.setEmail(request.getParameter("email"));
        	System.out.println("Email:<"+request.getParameter("email")+">");
        	
        	employeeBean.setAddress(request.getParameter("address"));
        	System.out.println("address:<"+request.getParameter("address")+">");
        	
        	employeeBean.setCity(request.getParameter("city"));
        	System.out.println("city:<"+request.getParameter("city")+">");
        	
        	employeeBean.setState(request.getParameter("state"));
        	System.out.println("state:<"+request.getParameter("state")+">");
        	
        	employeeBean.setArea(request.getParameter("area"));
        	System.out.println("area:<"+request.getParameter("area")+">");
        	
        	employeeBean.setPassword(request.getParameter("password"));
        	System.out.println("password:<"+request.getParameter("password")+">");
        	
        	dummy = request.getParameter("salary");
        	if(dummy != null && !"".equalsIgnoreCase(dummy)){
        		employeeBean.setSalary(Integer.parseInt(dummy));
        	}
        	dummy = request.getParameter("department");
        	System.out.println("department:<"+dummy+">");
        	if(dummy != null && !"".equalsIgnoreCase(dummy)){
        		employeeBean.setDepartment(Integer.parseInt(dummy));
        	}
        	
        	dummy = request.getParameter("role");
        	if(dummy != null && !"".equalsIgnoreCase(dummy)){
        		employeeBean.setRole(Integer.parseInt(dummy));
        	}
        	dummy = request.getParameter("status");
        	System.out.println("Status:<"+dummy+">");
        	if(dummy != null && !"".equalsIgnoreCase(dummy)){
        		employeeBean.setStatus(Integer.parseInt(dummy));
        	}
        	dummy = request.getParameter("pincode");
        	if(dummy != null && !"".equalsIgnoreCase(dummy)){
        		employeeBean.setPincode(Integer.parseInt(dummy));
        	}
        }
        
        HttpSession session = request.getSession();
        if(session != null){
        String userName = (String)session.getAttribute("userName");
        System.out.println("EmployeeServelet --> Session --> UserName-->"+userName);
        employeeBean.setUserName(userName);
        }
        
        try {
        	int rows = 0;
        	EmployeeDAO employeeDao =  EmployeeDAO.getEmployeeDAO();

        	if("addEmployee".equalsIgnoreCase(formName)){
        		rows = employeeDao.insertForNewEmployee(employeeBean);
        		System.out.println(rows + " Row(s) Inserted.");
        	}else if("updateEmployee".equalsIgnoreCase(formName)){
        		employeeBean.setEmployeeId(Integer.parseInt(request.getParameter("employeeId")));
        		rows = employeeDao.updateExistingEmployeeBasedOnEmployeeId(employeeBean);
        		System.out.println(rows + " Row(s) Updated.");
        	}else if("delete".equalsIgnoreCase(btnId)){
        		employeeBean.setEmployeeId(Integer.parseInt(request.getParameter("employeeId")));
        		rows = employeeDao.deleteEmployeeBasedOnEmployeeId(employeeBean);
        		System.out.println(rows + " Row(s) Updated.");
        	}
        	
        	if (rows > 0) {
        		response.sendRedirect("employee.jsp");
        	} else {
        		System.out.println("Error: Inserting/Updating Employee into Database");
        		response.sendRedirect("index.jsp");
        	}

        } catch (Exception e) {
            out.println("Error:Try Again");
        }
    }

}
