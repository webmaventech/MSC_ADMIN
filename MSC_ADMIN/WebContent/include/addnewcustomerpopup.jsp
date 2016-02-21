<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.CustomersBean"%>
<%@page import="com.webmaven.core.CustomersDAO"%>
<%@page import="com.webmaven.core.Util"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>

<!-- popup form #3 -->
<a href="#x" class="overlay" id="addNewCustomerForm"></a>
<% MasterDAO.initializeMasters(); %>
<div class="popup">
	<div class="box col-md-12" style="width: 1200px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Add New Customer
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
				<form role="form" method="post" action="CustomersServelet">
					<div>
						<input type="hidden" name="formName" value="addCustomer" />
					</div>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Name *</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="name" id="name"
								value="" />
						</div>
						<div class="col-md-2">
							<h5>
								<b>Mobile Number *</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="mobileNo"
								id="mobileNo" value="" required="required" />
						</div>
						<div class="col-md-2">
							<h5>
								<b>Email</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="email" id="email"
								value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Alt Number</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="altNumber"
								id="altNumber" value="" />
						</div>

						<div class="col-md-2">
							<h5>
								<b>Address</b>
							</h5>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" name="address"
								id="address" value="" />
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Area</b>
							</h5>
						</div>
						<%
						HashMap <String, String> areaMap = MasterDAO.getAreasValueKeyMap();
						%>
						<div class="col-md-2">
							<select id="area" name="area" data-rel="chosen">
								<option disabled>-------------------------------</option>
								<%
								for(String areaMapVal : areaMap.keySet()){
								%>
								<option value="<%=areaMapVal%>"><%=areaMap.get(areaMapVal)%></option>
								<%} %>
							</select>
						</div>
						<!-- <div class="col-md-2">
							<h5>
								<b>side</b>
							</h5>
						</div> -->
						<%-- <%
						List<MasterBean> listSide = Util.getDetailsFromMasterId("SIDE");
						%>
						<div class="col-md-2">
							<select id="side" name="side" data-rel="chosen">
								<option disabled>-------------------------------</option>
								<%
								for(MasterBean mb : listSide){
								%>
								<option value="<%=mb.getMasterValue()%>"><%=mb.getMasterKey()%></option>
								<%} %>
							</select>
						</div> --%>
						
						<div class="col-md-2">
							<h5>
								<b>Pincode</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="pincode"
								id="pincode" value="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>City</b>
							</h5>
						</div>
						<%
						HashMap <String, String> citiesValueMap = MasterDAO.getCitiesValueKeyMap();
						%>
						<div class="col-md-2">
							<select id="city" name="city" data-rel="chosen">
								<option disabled>-------------------------------</option>
								<%
								for(String citiMapVal : citiesValueMap.keySet()){
								%>
								<option value="<%=citiMapVal%>"><%=citiesValueMap.get(citiMapVal)%></option>
								<%} %>
							</select>
						</div>

						<div class="col-md-2">
							<h5>
								<b>State</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="state"
								id="state" value="Maharashtra">
						</div>

						<div class="col-md-2">
							<h5>
								<b>Customer Type</b>
							</h5>
						</div>
						<%
						HashMap <String, String> customerTypeValueMap = MasterDAO.getCustomerTypeValueKeyMap();
						%>
						<div class="col-md-2">
							<select id="customerType" name="customerType" data-rel="chosen">
								<option disabled>------------------------------</option>
								<%
								for(String custMap : customerTypeValueMap.keySet()){
									%>
									<option value="<%=custMap%>"><%=customerTypeValueMap.get(custMap)%></option>
									<%} %>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Add
								Customer</button>
							<button type="reset" class="btn btn-default btn-xs">Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>