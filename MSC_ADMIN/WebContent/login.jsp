<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Head Tag Start -->
<c:import url="include/includeheadtag.jsp"></c:import>
<!-- Head Tag End -->

<body>
<%
String logout = request.getParameter("logout");
if("logout".equals(logout)){
session.invalidate();
}
%>
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2>Welcome to MSC CRM</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
            <div class="alert alert-info">
                Please login with your Mobile No and Password.
            </div>
            <form class="form-horizontal" action="LoginServelet" method="post">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i> Mobile No</span>
                        <input type="text" class="form-control" placeholder="Mobile No" name="mobileNo" id="mobileNo">
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i> Password</span>
                        <input type="password" class="form-control" placeholder="Password" name="password" id="password">
                    </div>
                    <div class="clearfix"></div><br>
                    
                    <!-- <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i> Login Type</span>
							<select id="loginType" name="loginType" data-rel="chosen">
								<option disabled>-------------------------------</option>
								<option value="1">ADMIN</option>
								<option value="2">CUSTOMER</option>
								<option value="3"selected>EMPLOYEE</option>
							</select>
					</div>
					<div class="clearfix"></div> -->

                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" id="remember"> Remember me</label>
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </p>
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

<!-- external javascript start-->
<c:import url="include/includeexternaljavascript.jsp"></c:import>
<!-- external javascript End-->

</body>
</html>
