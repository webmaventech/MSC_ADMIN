<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.Util"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<!-- popup form #4 -->
<a href="#x" class="overlay" id="placeOrderForm"></a>
<div class="popup">
	<div class="box col-md-4" style="width: 450px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-plus"></i> Place Order
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
				<form role="form" method="post" action="OrdersServelet">
					<div>
						<input type="hidden" name="formName" value="placeOrder" />
					</div>
					<div>
						<input type="hidden" name="customerId" id="customerId"
							value="<%=request.getParameter("customerId")%>" />
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Preferred Date</b></h5>
						</div>
						 <div class="col-md-6">
							<input type="text" data-date-format="DD/MM/YYYY" class="form-control" name="preferredDate"
								id="preferredDate" placeholder="DD/MM/YYYY" />
						</div>
						
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Preferred Time</b></h5>
						</div>
						<%
						HashMap<String, String> pickupSlotValueKeyMap = MasterDAO.getPickupSlotValueKeyMap();
						%>
						<div class="col-md-2">
							<select id="preferredTime" name="preferredTime" data-rel="chosen">
								<option disabled>-------------------------------</option>
								<%
								for (String pickupSlotMap : pickupSlotValueKeyMap.keySet()) {
								%>
								<option value="<%=pickupSlotMap%>"><%=pickupSlotValueKeyMap.get(pickupSlotMap)%></option>
								<%} %>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Place
								Order</button>
							<button type="reset" class="btn btn-default btn-xs">Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--/span-->
	<a class="close" href="#close"></a>
</div>