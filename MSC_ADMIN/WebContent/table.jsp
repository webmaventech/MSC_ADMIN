<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="com.webmaven.core.OrdersBean"%>
<%@page import="com.webmaven.core.OrdersDAO"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.util.List"%>

<c:import url="include/includeheadtag.jsp"></c:import>
<head>
    <meta charset="utf-8">
    <title>Wel-Come to MSC CRM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="MSC admin template.">
    <meta name="author" content="Webmaven">

    <!-- The styles -->
    <link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">
    <link href="css/charisma-app.css" rel="stylesheet">
    <link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <link href='css/animate.min.css' rel='stylesheet'>
    <!-- Added by Nikunj -->
    <link href="css/layout.css" rel="stylesheet" type="text/css" />
    <link href="css/modal.css" rel="stylesheet" type="text/css" />
	<!-- Added by Nikunj -->
    <!-- jQuery -->
    <script src="bower_components/jquery/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">

</head>

<body>

	<%@include file="include/includesession.jsp"%>

	<%@include file="include/includeheader.jsp"%>

	<!-- topbar ends -->
	<div class="ch-container">
		<div class="row">

			<!-- left bar Starts-->
			<c:import url="include/includeleftmenu.jsp"></c:import>
			<!-- left bar Ends-->

			<noscript>
				<div class="alert alert-block col-md-12">
					<h4 class="alert-heading">Warning!</h4>

					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="#">Master</a></li>
					</ul>
				</div>

				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-user"></i> Master Settings
								</h2>

								<div class="box-icon">
									<a href="#" class="btn btn-setting btn-round btn-default"><i
										class="glyphicon glyphicon-cog"></i></a> <a href="#"
										class="btn btn-minimize btn-round btn-default"><i
										class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
										class="btn btn-close btn-round btn-default"><i
										class="glyphicon glyphicon-remove"></i></a>
								</div>
							</div>
							<div class="box-content">
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable responsive">
									<thead>
										<tr>
											<th>Username</th>
											<th>Date registered</th>
											<th>Role</th>
											<th>Status</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<%
											List<MasterBean> oList = null;
											MasterBean ob = null;
											int orderNo;
											MasterDAO odao = MasterDAO.getMasterDAO();
											oList = odao.getAllMasterIdVector();
											int oListSize = oList.size();
											for (int i = 0; i < oListSize; i++) {
												ob = (MasterBean) oList.get(i);
												String masterId = ob.getMasterId();
										%>
										<tr>
											<td class="center"><%=masterId%></td>
											<td class="center"><%=ob.getMasterKey()%></td>
											<td class="center"><%=ob.getMasterValue()%></td>
											<td class="center"><%=ob.getStatus()%></td>
											<td class="center">
												<div class="btn-group">
													<a class="btn btn-primary btn-xs" href="#"><i
														class="glyphicon glyphicon-user icon-white"></i> Actions</a> <a
														class="btn btn-primary btn-xs dropdown-toggle"
														data-toggle="dropdown" href="#"><span class="caret"></span></a>
													<ul class="dropdown-menu">
														<li><a
															href="orders.jsp?btnId=view&orderNo=<%=masterId%>#viewOrderForm"><i
																class="glyphicon glyphicon-zoom-in"></i> View</a></li>
														<li><a
															href="orders.jsp?btnId=edit&orderNo=<%=masterId%>#updateOrderForm"><i
																class="glyphicon glyphicon-pencil"></i> Edit</a></li>
														<li><a
															href="OrdersServelet?btnId=delete&userName=<%--=userName--%>&orderNo=<%=masterId%>"><i
																class="glyphicon glyphicon-trash"></i> Delete</a></li>
														<li class="divider"></li>
													</ul>
												</div>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->
		<hr>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h3>Settings</h3>
					</div>
					<div class="modal-body">
						<p>Here settings can be configured...</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
						<a href="#" class="btn btn-primary" data-dismiss="modal">Save
							changes</a>
					</div>
				</div>
			</div>
		</div>
		<%@include file="include/includefooter.jsp"%>
	</div>
	<!--/.fluid-container-->
	<c:import url="include/includeexternaljavascript.jsp"></c:import>
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calender plugin -->
	<script src='bower_components/moment/min/moment.min.js'></script>
	<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- select or dropdown enhancer -->
	<script src="bower_components/chosen/chosen.jquery.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- library for making tables responsive -->
	<script src="bower_components/responsive-tables/responsive-tables.js"></script>
	<!-- tour plugin -->
	<script
		src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	
	<!-- Added by Nikunj -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
	    $( "#completedOn" ).datepicker();
	  });
  $(function() {
    $( "#preferredDate" ).datepicker();
  });
  </script>
	<!-- Added by Nikunj -->
</body>
</html>
