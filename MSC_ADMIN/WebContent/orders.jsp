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
						<li><a href="#">Home</a></li>
						<li><a href="#">Orders</a></li>
					</ul>
				</div>

				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-user"></i> Orders Info
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
								<!-- <div align="right">
									<a href="#addNewOrderForm" class="btn btn-info">Add New
										Order</a>
								</div> -->
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable responsive">
									<thead>
										<tr>
											<th>ORDER NO</th>
											<th>CUSTOMER ID</th>
											<th>ORDER TIMESTAMP</th>
											<th>PREFERRED DATE</th>
											<th>PREFERRED TIME</th>
											<th>STATUS</th>
											<th>ACTIONS</th>
										</tr>
									</thead>
									<tbody>
										<%
											List<OrdersBean> oList = null;
											OrdersBean ob = null;
											HashMap<String, String> OrderStatusMvalueMkeyMap = null;
											HashMap<String, String> PickupSlotMvalueMkeyMap = null;
											String prefTime;
											int orderNo;
											OrdersDAO odao = OrdersDAO.getOrdersDAO();
											oList = odao.getAllOrdersVector();
											int oListSize = oList.size();
											MasterDAO.initializeMasters();
											OrderStatusMvalueMkeyMap = MasterDAO.getOrderStatusValueKeyMap();
											PickupSlotMvalueMkeyMap = MasterDAO.getPickupSlotValueKeyMap();
											for (int i = 0; i < oListSize; i++) {
												ob = (OrdersBean) oList.get(i);
												prefTime = PickupSlotMvalueMkeyMap.get(ob.getPreferredTime());
												orderNo = ob.getOrder_no();
										%>
										<tr>
											<td><a 
											href="orders.jsp?btnId=view&orderNo=<%=orderNo%>#viewOrderDetailsForm">
											<%=orderNo%>
											</a></td>
											<td class="center"><a
												href="orders.jsp?btnId=view&customerId=<%=ob.getCustomer_id()%>#viewCustomerForm">
													<%=ob.getCustomer_id()%>
											</a></td>
											<td class="center"><%=ob.getOrderTimestamp()%></td>
											<td class="center"><%=ob.getPreferredDate()%></td>
											<td class="center"><%=prefTime%></td>
											<td class="center">
											<span class="label-success label label-default">
												<%=OrderStatusMvalueMkeyMap.get(String.valueOf(ob.getStatus()))%>
											</span>
											</td>
											<td class="center">
												<div class="btn-group">
													<a class="btn btn-primary btn-xs" href="#"><i
														class="glyphicon glyphicon-user icon-white"></i> Actions</a> <a
														class="btn btn-primary btn-xs dropdown-toggle"
														data-toggle="dropdown" href="#"><span class="caret"></span></a>
													<ul class="dropdown-menu">
														<li><a
															href="orders.jsp?btnId=view&orderNo=<%=orderNo%>#viewOrderForm"><i
																class="glyphicon glyphicon-zoom-in"></i> View</a></li>
														<li><a
															href="orders.jsp?btnId=edit&orderNo=<%=orderNo%>#updateOrderForm"><i
																class="glyphicon glyphicon-pencil"></i> Edit</a></li>
														<li><a
															href="OrdersServelet?btnId=delete&userName=<%=userName%>&orderNo=<%=orderNo%>"><i
																class="glyphicon glyphicon-trash"></i> Delete</a></li>
														<li class="divider"></li>
														<li><a
															href="orders.jsp?btnId=view&orderNo=<%=orderNo%>#viewOrderDetailsForm"><i
																class="glyphicon glyphicon-list"></i> View Details</a></li>
														<li><a
															href="orders.jsp?btnId=addOrderDetails&orderNo=<%=orderNo%>#addOrderDetailsForm"><i
																class="glyphicon glyphicon-list"></i> Add Details</a></li>
														<li><a
															href="OrderDetailsServelet?btnId=deleteDetails&userName=<%=userName%>&orderNo=<%=orderNo%>"><i
																class="glyphicon glyphicon-trash"></i> Delete Details</a></li>
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

		<!-- view customer popup starts -->
		<%@include file="include/includeviewcustomerpopup.jsp"%>
		<!-- view customer popup ends -->

		<!-- view order popup starts -->
		<%@include file="include/vieworderpopup.jsp"%>
		<!-- view order popup ends -->

		<!-- update order popup starts -->
		<%@include file="include/updateorderpopup.jsp"%>
		<!-- update order popup ends -->

		<!-- view order details popup starts -->
		<%@include file="include/vieworderdetailspopup.jsp"%>
		<!-- view order details popup ends -->

		<!-- view order details popup starts -->
		<%@include file="include/addorderdetailspopup.jsp"%>
		<!-- view order details popup ends -->

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
