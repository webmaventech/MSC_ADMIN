<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.HashMap"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.webmaven.core.OrdersBean"%>
<%@page import="com.webmaven.core.OrdersDAO"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.util.List"%>


<!-- Head Tag Start -->
<c:import url="include/includeheadtag.jsp"></c:import>
<!-- Head Tag End -->

<body>
	<!-- session Starts-->
	<%@include file="include/includesession.jsp"%>
	<!-- session Starts-->

	<!-- header Starts-->
	<%@include file="include/includeheader.jsp"%>
	<!-- header Starts-->

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
						<li><a href="#">Masters</a></li>
					</ul>
				</div>

				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-user"></i> Master Configuration
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
								<div align="right">
									<a href="#addNewMasterForm" class="btn btn-info">Add New Configuration
										</a>
								</div>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable responsive">
									<thead>
										<tr>
											<th>MASTERID</th>
											<th>MASTERKEY</th>
											<th>MASTERVALUE</th>
											<th>STATUS</th>
											<th>ACTIONS </th>
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
												String masterKey = ob.getMasterKey();
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
															href="master.jsp?MasterId=<%=masterId%>&MasterKey=<%=masterKey%>#viewMasterForm"><i
																class="glyphicon glyphicon-zoom-in"></i> View</a></li>
														<li><a
															href="master.jsp?MasterId=<%=masterId%>&MasterKey=<%=masterKey%>#updateMasterForm"><i
																class="glyphicon glyphicon-pencil"></i> Edit</a></li>
														<li><a
															href="MasterServelet?formName=delete&userName=<%=userName%>&masterId=<%=masterId%>&masterKey=<%=masterKey%>"><i
																class="glyphicon glyphicon-trash"></i> Delete</a></li>
														<li class="divider"></li>
													</ul>
												</div>
											</td>
										</tr>
										<%}%>
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

		<%@include file="include/viewmasterdetailpopup.jsp"%>

		<%@include file="include/updatemasterdetailpopup.jsp"%>

		<%@include file="include/addnewmasterpopup.jsp"%>

		<hr>

		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">X</button>
						<h3>Settings</h3>
					</div>
					<div class="modal-body">
						<p>Here Settings can be configured...</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
						<a href="#" class="btn btn-primary" data-dismiss="modal">Save
							changes</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- footer starts -->
		<%@include file="include/includefooter.jsp"%>
		<!-- footer ends -->
		
	</div>
	<!--/.fluid-container-->

	<!-- external javascript start-->
	<c:import url="include/includeexternaljavascript.jsp"></c:import>
	<!-- external javascript End-->

</body>
</html>
