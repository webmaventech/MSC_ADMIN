<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="CustomersServelet" method="post">

<input type="hidden" name = "customerId" id = "customerId" value="1">
<input type="hidden" name = "formName" id = "formName" value="updateCustomer">

comments: <input type="text" name = "comments" id = "comments">
Pincode : <input type="text" name = "altNumber"  id = "altNumber" value = "">

<input type="submit" value="Update Customer">
</form>
</body>
</html>