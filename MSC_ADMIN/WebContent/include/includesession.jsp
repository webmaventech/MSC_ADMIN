<%@page import="com.webmaven.core.UsersBean"%>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>

<!--Session Management  -->
<%
		System.out.println("Inside include session");
		if (session.getAttribute("userName") == null) {
			response.sendRedirect("login.jsp");
		} else {
			String userName = (String)session.getAttribute("userName");
		}
		response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
<!--Session Management  -->