package com.webmaven;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webmaven.core.MasterBean;
import com.webmaven.core.MasterDAO;
import com.webmaven.core.Util;

public class MasterServelet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String moduleName = "MasterServelt";

	@Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodName = "service";
		String msg = "";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String formName = "";
        String btnId = "";
        MasterBean masterBean = new MasterBean();
        formName = request.getParameter("formName");
        msg = "==>formName:<"+formName+">";
        Util.setConsoleLog(moduleName, methodName, msg);
        
        HttpSession session = request.getSession();
        if(session != null){
        String userName = (String)session.getAttribute("userName");
        Util.setConsoleLog(moduleName, methodName, "UserName:<"+userName+">");
        masterBean.setUserName(userName);
        }
        
        try {
        	int rows = 0;
        	MasterDAO masterDao =  MasterDAO.getMasterDAO();

        	if("addNewMaster".equalsIgnoreCase(formName)){
        		masterBean.setMasterId(request.getParameter("masterId"));
        		masterBean.setMasterKey(request.getParameter("masterKey"));
        		masterBean.setMasterValue(request.getParameter("masterValue"));
        		masterBean.setStatus(request.getParameter("status"));
        		rows = masterDao.insertIntoMaster(masterBean);
        		Util.setConsoleLog(moduleName, methodName, rows + " Row(s) Inserted.");
        	
        	}else if("updateMaster".equalsIgnoreCase(formName)){
        		masterBean.setMasterId(request.getParameter("masterId"));
        		masterBean.setMasterKey(request.getParameter("masterKey"));
        		masterBean.setMasterValue(request.getParameter("masterValue"));
        		masterBean.setStatus(request.getParameter("status"));
        		rows = masterDao.updateMasterBasedOnMasterIdAndKey(masterBean);
        		Util.setConsoleLog(moduleName, methodName, rows + " Row(s) Updated.");
        	
        	}else if("delete".equalsIgnoreCase(formName)){
        		masterBean.setMasterId(request.getParameter("masterId"));
        		masterBean.setMasterKey(request.getParameter("masterKey"));
        		rows = masterDao.deleteMasterBasedOnMasterIdAndKey(masterBean);
        		Util.setConsoleLog(moduleName, methodName, rows + " Row(s) Updated.");

        	}
        	
        	if (rows > 0) {
        		response.sendRedirect("master.jsp");
        	} else {
        		Util.setConsoleLog(moduleName, methodName, "Error: Inserting/Updating into Database");
        		response.sendRedirect("index.jsp");
        	}

        } catch (Exception e) {
            out.println("Error:Try Again");
            e.printStackTrace();
        }
    }
}
