<%@page import="com.webmaven.core.EmployeeDAO"%>
<%@page import="com.webmaven.core.EmployeeBean"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="com.webmaven.core.OrdersBean"%>
<%@page import="com.webmaven.core.OrdersDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<!-- popup form #2 -->
<a href="#x" class="overlay" id="updateOrderForm"></a>
<%
			String dummy2 = request.getParameter("orderNo");
			System.out.println("[updateorderpopup]:Order No==>"+dummy2);
			int oid1 = 0;
			if (dummy2 != null) {
				oid1 = Integer.parseInt(dummy2);
			}
			OrdersDAO odaoUpdate = OrdersDAO.getOrdersDAO();
			OrdersBean obeanUpdate = new OrdersBean();
			obeanUpdate = odaoUpdate.getOrderInfoBasedOnOrderId(oid1);
			if (obeanUpdate != null) {
				HashMap<String, String> orderStatusValueKeyMap = MasterDAO.getOrderStatusValueKeyMap();
				HashMap<String, String> pickupSlotValueKeyMap = MasterDAO.getPickupSlotValueKeyMap();
		%>
<div class="popup">
	<div class="box col-md-4" style="width: 800px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Update Exiting Order
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
				<form role="form" method="post" action="OrdersServelet"
					name="updateOrder" id="updateOrder">
					<div>
						<input type="hidden" name="formName" value="updateOrder" />
					</div>
					<div>
						<input type="hidden" name="orderNo" id="orderNo"
							value="<%=obeanUpdate.getOrder_no()%>" />
					</div>
					<div>
						<input type="hidden" name="customerId" id="customerId"
							value="<%=obeanUpdate.getCustomer_id()%>" />
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5>
								<b>Order No</b>
							</h5>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control" name="orderNo" id="orderNo"
								value="<%=obeanUpdate.getOrder_no()%>" disabled />
						</div>
						
						<div class="col-md-3">
							<h5>
								<b>Customer Id</b>
							</h5>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control" name="customerId" id="customerId"
								value="<%=obeanUpdate.getCustomer_id()%>" disabled/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5>
								<b>Preferred Date</b>
							</h5>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control" name="preferredDate"
								id="preferredDate" value="<%=obeanUpdate.getPreferredDate()%>">
						</div>
						<div class="col-md-3">
							<h5>
								<b>Preferred Time</b>
							</h5>
						</div>
						<div class="col-md-3">
						<select id="preferredTime" name="preferredTime" data-rel="chosen">
								<option disabled>---------------------</option>
								<%
									for (String slotVal : pickupSlotValueKeyMap.keySet()) {
									if (slotVal.equalsIgnoreCase(String.valueOf(obeanUpdate.getPreferredTime()))) {
								%>
								<option value=<%=slotVal%> selected><%=pickupSlotValueKeyMap.get(slotVal)%></option>
								<%} else {%>
								<option value=<%=slotVal%>><%=pickupSlotValueKeyMap.get(slotVal)%></option>
								<%} }%>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5>
								<b>Status</b>
							</h5>
						</div>
						<div class="col-md-3">
						<select id="orderStatus" name="orderStatus" data-rel="chosen">
								<option disabled>---------------------</option>
								<%
									for (String statusVal : orderStatusValueKeyMap.keySet()) {
									if (statusVal.equalsIgnoreCase(String.valueOf(obeanUpdate.getStatus()))) {
								%>
								<option value=<%=statusVal%> selected><%=orderStatusValueKeyMap.get(statusVal)%></option>
								<%} else {%>
								<option value=<%=statusVal%>><%=orderStatusValueKeyMap.get(statusVal)%></option>
								<%} }%>
							</select>
						</div>
						<div class="col-md-3">
							<h5>
								<b>Assigned To</b>
							</h5>
						</div>
						<div class="col-md-3">
						<select id="assignedTo" name="assignedTo" data-rel="chosen">
								<option disabled>---------------------</option>
								<option value=0>NONE</option>
								<%
									EmployeeDAO edao = EmployeeDAO.getEmployeeDAO();
									List<EmployeeBean> listE = edao.getEmployeesListBasedOnRole(1);
									for (EmployeeBean eb : listE) {
									if (obeanUpdate.getAssignedto() == eb.getEmployeeId()) {
								%>
								<option value=<%=eb.getEmployeeId()%> selected><%=eb.getName()%></option>
								<%} else {%>
								<option value=<%=eb.getEmployeeId()%>><%=eb.getName()%></option>
								<%}}%>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<h5>
								<b>Completed On</b>
							</h5>
						</div>
						<div class="col-md-3">
							<input type="text" data-date-format="MM/DD/YYYY" class="form-control" name="completedOn" id="completedOn"
								<%-- value="<%=obeanUpdate.getCompletedon()%>" --%> required="required" placeholder="DD/MM/YYYY"/>
						</div>
						<div class="col-md-3">
							<h5>
								<b>Completed By</b>
							</h5>
						</div>
						<div class="col-md-3">
						<select id="completedBy" name="completedBy" data-rel="chosen">
							<option disabled>---------------------</option>
							<option value=0>NONE</option>
								<%
									EmployeeDAO edao1 = EmployeeDAO.getEmployeeDAO();
									List<EmployeeBean> listE1 = edao.getEmployeesListBasedOnRole(1);
									for (EmployeeBean eb : listE1) {
									if (obeanUpdate.getCompletedby() == eb.getEmployeeId()) {
								%>
								<option value=<%=eb.getEmployeeId()%> selected><%=eb.getName()%></option>
								<%} else {%>
								<option value=<%=eb.getEmployeeId()%>><%=eb.getName()%></option>
								<%}}%>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Update Order</button>
						</div>
					</div>
					<%}%>
				</form>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>