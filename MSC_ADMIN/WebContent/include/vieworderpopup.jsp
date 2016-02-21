<%@page import="com.webmaven.core.EmployeeDAO"%>
<%@page import="com.webmaven.core.EmployeeBean"%>
<%@page import="com.webmaven.core.OrdersBean"%>
<%@page import="com.webmaven.core.OrdersDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="com.webmaven.core.Util"%>
<%@page import="java.util.List"%>

<!-- popup form #1 -->
<a href="#x" class="overlay" id="viewOrderForm"></a>
<%
	String dummy1 = request.getParameter("orderNo");
	System.out.println("[vieworderpopup.jsp]:Order No==>" + dummy1);
	int ono = 0;
	if (dummy1 != null) {
		ono = Integer.parseInt(dummy1);
	}
	OrdersDAO oDao = OrdersDAO.getOrdersDAO();
	OrdersBean obean = new OrdersBean();
	obean = oDao.getOrderInfoBasedOnOrderId(ono);
	if (obean != null) {
		String assigendTo = "NONE";
		EmployeeDAO edao = EmployeeDAO.getEmployeeDAO();
		EmployeeBean eb = edao.getEmployeeInfoBasedOnEmployeeId(obean.getAssignedto());
		if (eb != null) {
			assigendTo = eb.getName();
		}
		
		String completedBy = "NONE";
		EmployeeDAO edao1 = EmployeeDAO.getEmployeeDAO();
		EmployeeBean eb1 = edao.getEmployeeInfoBasedOnEmployeeId(obean
				.getCompletedby());
		if (eb1 != null) {
			completedBy = eb1.getName();
		}
		
		String orderStatus = MasterDAO.getOrderStatusValueKeyMap().get(String.valueOf(obean.getStatus()));
		String pickupSlot = MasterDAO.getPickupSlotValueKeyMap().get(String.valueOf(obean.getPreferredTime()));
%>
<div class="popup">
	<div class="box col-md-10" style="width: 1100px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Orders Info
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
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Order No</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control"
							value="<%=obean.getOrder_no()%>" disabled />
					</div>

					<div class="col-md-2">
						<h5>
							<b>Customer Id</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="customerId"
							id="customerId" value="<%=obean.getCustomer_id()%>" disabled>
					</div>

					<div class="col-md-2">
						<h5>
							<b>Assigned To</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="assignedTo"
							id="assignedTo" value="<%=assigendTo%>" disabled>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Order Timestamp</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="orderTimestamp"
							id="orderTimestamp" value="<%=obean.getOrderTimestamp()%>"
							disabled>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Status</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="status" id="status"
							value="<%=orderStatus%>" disabled>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Completed By</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="completedBy" id="completedBy"
							value="<%=completedBy%>" disabled>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Preferred Date</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="preferredDate"
							id="preferredDate" value="<%=obean.getPreferredDate()%>" disabled>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Preferred Time</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="preferredTime"
							id="preferredTime" value="<%=pickupSlot%>" disabled>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Completed On</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="completedOn"
							id="completedOn" value="<%=obean.getCompletedon()%>" disabled>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Created By</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control"
							value="<%=obean.getCreatedby()%>" disabled />
					</div>

					<div class="col-md-2">
						<h5>
							<b>Created On</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="createdOn"
							id="createdOn" value="<%=obean.getCreatedon()%>" disabled>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Updated By</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="updatedBy"
							id="updatedBy" value="<%=obean.getUpdatedby()%>" disabled>
					</div>

					<div class="col-md-2">
						<h5>
							<b>Updated On</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="updatedOn"
							id="updatedOn" value="<%=obean.getUpdatedon()%>" disabled>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>