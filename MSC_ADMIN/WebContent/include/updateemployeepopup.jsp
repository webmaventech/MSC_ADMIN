<%@page import="com.webmaven.core.EmployeeBean"%>
<%@page import="com.webmaven.core.EmployeeDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.Util"%>
<%@page import="java.util.List"%>

<!-- popup form #2 -->
<%
			String dummy1 = request.getParameter("employeeId");
			System.out.println("updateEmployeeForm --> employee Id==>"+dummy1);
			int eid1 = 0;
			if (dummy1 != null) {
				eid1 = Integer.parseInt(dummy1);
			}
			EmployeeDAO edaoUpdate = EmployeeDAO.getEmployeeDAO();
			EmployeeBean ebeanUpdate = new EmployeeBean();
			ebeanUpdate = edaoUpdate.getEmployeeInfoBasedOnEmployeeId(eid1);
			if (ebeanUpdate != null) {
		%>
<a href="#x" class="overlay" id="updateEmployeeForm"></a>
<div class="popup">
	<div class="box col-md-12" style="width:1100px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Update Employee
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
				<form role="form" method="post" action="EmployeeServelet">
					<div>
						<input type="hidden" name="formName" value="updateEmployee" />
					</div>
					<div>
						<input type="hidden" name="employeeId" id="employeeId"
							value="<%=ebeanUpdate.getEmployeeId()%>" />
					</div>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Employee Id</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="employeeId"
								id="employeeId" value="<%=ebeanUpdate.getEmployeeId()%>"
								disabled />
						</div>
						<div class="col-md-2">
							<h5>
								<b>Password</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="password"
								id="password" value="<%=ebeanUpdate.getPassword()%>"/>
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
								value="<%=ebeanUpdate.getName()%>" />
						</div>
						<div class="col-md-2">
							<h5>
								<b>Mobile Number *</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="mobileNo"
								id="mobileNo" value="<%=ebeanUpdate.getMobileNo()%>" required="required" />
						</div>
						<div class="col-md-2">
							<h5>
								<b>Email Address</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="email" id="email"
								value="<%=ebeanUpdate.getEmail()%>" />
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
								id="altNumber" value="<%=ebeanUpdate.getAltNumber()%>" />
						</div>

						<div class="col-md-2">
							<h5>
								<b>Address</b>
							</h5>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" name="address"
								id="address" value="<%=ebeanUpdate.getAddress()%>" />
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
						<div class="col-md-2">
							<input type="text" class="form-control" name="area" id="area"
								value="<%=ebeanUpdate.getArea()%>">
						</div>
						<div class="col-md-2">
							<h5>
								<b>Role</b>
							</h5>
						</div>
						<%
						int empRole = ebeanUpdate.getRole();
						List<MasterBean> listUpdateEmpRole = Util.getDetailsFromMasterId("ROLES");
						%>						
						<div class="col-md-2">
							<select id="role" name="role" data-rel="chosen">
								<option disabled>-----------------------------</option>
								<%
								for(MasterBean mb : listUpdateEmpRole){
									if(String.valueOf(empRole).equalsIgnoreCase(mb.getMasterValue())){
								%>
								<option value="<%=mb.getMasterValue()%>" selected><%=mb.getMasterKey()%></option>
								<%}else{ %>
								<option value="<%=mb.getMasterValue()%>"><%=mb.getMasterKey()%></option>
								<%}}%>
							</select>
						</div>
						<div class="col-md-2">
							<h5>
								<b>Pincode</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="pincode"
								id="pincode" value="<%=ebeanUpdate.getPincode()%>">
						</div>
					</div>
					<!-- <br> -->
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>City</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="city" id="city"
								value="<%=ebeanUpdate.getCity()%>" />
						</div>

						<div class="col-md-2">
							<h5>
								<b>State</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="state" id="state"
								value="<%=ebeanUpdate.getState()%>">
						</div>

						<div class="col-md-2">
							<h5>
								<b>Department</b>
							</h5>
						</div>
						<%
						int empDept = ebeanUpdate.getDepartment();
						List<MasterBean> listUpdateEmpDept = Util.getDetailsFromMasterId("DEPARTMENT");
						%>						
						<div class="col-md-2">
							<select id="department" name="department" data-rel="chosen">
								<option disabled>-----------------------------</option>
								<%
								for(MasterBean mb : listUpdateEmpDept){
									if(String.valueOf(empDept).equalsIgnoreCase(mb.getMasterValue())){
								%>
								<option value="<%=mb.getMasterValue()%>" selected><%=mb.getMasterKey()%></option>
								<%}else{ %>
								<option value="<%=mb.getMasterValue()%>"><%=mb.getMasterKey()%></option>
								<%}}%>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Update
								Employee</button>
						</div>
					</div>
					<%}%>
				</form>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>