<%@page import="com.webmaven.core.CustomersBean"%>
<%@page import="com.webmaven.core.CustomersDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.webmaven.core.Util"%>

<!-- popup form #2 -->
<%
	String dummyUpdateCust = request.getParameter("customerId");
	Util.setConsoleLog("updatecustomerpopup.jsp", "updatecustomerpopup.jsp", "customer Id==>"+dummyUpdateCust);
	CustomersBean cbeanUpdate = Util.getCustomerInfo(dummyUpdateCust);
	if (cbeanUpdate != null) {
%>
<a href="#x" class="overlay" id="updateCustomerForm"></a>
<div class="popup">
	<div class="box col-md-12" style="width:1100px;height:450px;overflow: scroll;">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Update Exiting Customer
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
						<input type="hidden" name="formName" value="updateCustomer" />
					</div>
					<div>
						<input type="hidden" name="customerId" id="customerId"
							value="<%=cbeanUpdate.getCustomerId()%>" />
					</div>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Customer Id</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="customerId"
								id="customerId" value="<%=cbeanUpdate.getCustomerId()%>"
								disabled />
						</div>
						<div class="col-md-2">
							<h5>
								<b>Password</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="password"
								id="password" value="<%=cbeanUpdate.getPassword()%>" required/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Name *</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="name" id="name"
								value="<%=cbeanUpdate.getName()%>" />
						</div>
						<div class="col-md-2">
							<h5>
								<b>Mobile Number *</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="mobileNo"
								id="mobileNo" value="<%=cbeanUpdate.getMobileno()%>"
								required="required" />
						</div>
						<div class="col-md-2">
							<h5>
								<b>Email</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="email" id="email"
								value="<%=cbeanUpdate.getEmail()%>" />
						</div>
					</div>
					<!-- <br> -->
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Alt Number</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="altNumber"
								id="altNumber" value="<%=cbeanUpdate.getAltNumber()%>" />
						</div>

						<div class="col-md-2">
							<h5>
								<b>Address</b>
							</h5>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" name="address"
								id="address" value="<%=cbeanUpdate.getAddress()%>" />
						</div>
					</div>
					<hr>
					<!-- <br> -->
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Area</b>
							</h5>
						</div>
						<%
						String area = cbeanUpdate.getArea();
						HashMap <String, String> areaMapU = MasterDAO.getAreasValueKeyMap();
						%>
						<div class="col-md-2">
							<select id="area" name="area" data-rel="chosen">
								<option disabled>-------------------------------</option>
								<%
								for(String areaValue : areaMapU.keySet()){
									if(areaValue.equalsIgnoreCase(area)){
								%>
								<option value="<%=areaValue%>" selected><%=areaMapU.get(areaValue)%></option>
								<%}else{ %>
								<option value="<%=areaValue%>"><%=areaMapU.get(areaValue)%></option>
								<%}}%>
							</select>
						</div>
						<%-- <div class="col-md-2">
							<h5>
								<b>side</b>
							</h5>
						</div>
						<div class="col-md-2">
							<%
								int val1 = cbeanUpdate.getSide();
								List<MasterBean> listmb = Util.getDetailsFromMasterId("SIDE");
									for(MasterBean mb : listmb){
										if(String.valueOf(val1).equalsIgnoreCase(mb.getMasterValue())){
							%>
							<input type="radio" name="side" id="side" value=<%=mb.getMasterValue() %> checked><%=mb.getMasterKey() %>
							<%}else {%> 
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="side" id="side" value=<%=mb.getMasterValue() %>><%=mb.getMasterKey() %>
						<%}}%>
						</div> --%>
						<div class="col-md-2">
							<h5>
								<b>Pincode</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="pincode"
								id="pincode" value="<%=cbeanUpdate.getPincode()%>">
						</div>
					</div>
					<!-- <br> -->
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>City</b>
							</h5>
						</div>
						<%
						String city = cbeanUpdate.getCity();
						HashMap <String, String> citiesMapU = MasterDAO.getCitiesValueKeyMap();
						%>
						<div class="col-md-2">
							<select id="city" name="city" data-rel="chosen">
								<option disabled>-------------------------------</option>
								<%
								for(String citiValu : citiesMapU.keySet()){
									if(citiValu.equalsIgnoreCase(city)){
								%>
								<option value="<%=citiValu%>" selected><%=citiesMapU.get(citiValu)%></option>
								<%}else{ %>
								<option value="<%=citiValu%>"><%=citiesMapU.get(citiValu)%></option>
								<%}}%>
							</select>
						</div>

						<div class="col-md-2">
							<h5>
								<b>State</b>
							</h5>
						</div>
						<%
						String state = cbeanUpdate.getState();
						%>
						<div class="col-md-2">
							<input type="text" class="form-control" name="state"
								id="state" value="<%=state%>">
						</div>
						<div class="col-md-2">
							<h5>
								<b>Customer Type</b>
							</h5>
						</div>
						<%
						int custType = cbeanUpdate.getCustomerType();
						HashMap <String, String> customerTypeValueMapU = MasterDAO.getCustomerTypeValueKeyMap();
						%>						
						<div class="col-md-2">
							<select id="customerType" name="customerType" data-rel="chosen">
								<option disabled>-----------------------------</option>
								<%
								for(String custTypeVal : customerTypeValueMapU.keySet()){
									if(String.valueOf(custType).equalsIgnoreCase(custTypeVal)){
								%>
								<option value="<%=custTypeVal%>" selected><%=customerTypeValueMapU.get(custTypeVal)%></option>
								<%}else{ %>
								<option value="<%=custTypeVal%>"><%=customerTypeValueMapU.get(custTypeVal)%></option>
								<%}}%>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Comments</b>
							</h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="comments"
								id="comments" value="<%=cbeanUpdate.getComments()%>"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Update
								Customer</button>
						</div>
					</div>
					<%}%>
					</form>
					</div>
			</div>
			
		</div>
		<a class="close" href="#close"></a>
	</div>
	