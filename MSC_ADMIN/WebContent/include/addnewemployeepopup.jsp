<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.CustomersBean"%>
<%@page import="com.webmaven.core.CustomersDAO"%>
<%@page import="com.webmaven.core.Util"%>
<%@page import="java.util.List"%>

<!-- popup form #3 -->
<a href="#x" class="overlay" id="addNewEmployeeForm"></a>
<div class="popup">
	<div class="box col-md-12" style="width: 1200px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Add New Employee
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
						<input type="hidden" name="formName" value="addEmployee" />
					</div>
					<div class="row">
						<div class="col-md-2">
							<h5>
								<b>Employee Name *</b>
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
								<b>Alternate Number</b>
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
						<div class="col-md-2">
							<input type="text" class="form-control" name="area" id="area"
								value="Malad">
						</div>
						<div class="col-md-2">
							<h5>
								<b>Salary</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="salary" id="salary"
								value="0">
						</div>
						
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
						<div class="col-md-2">
							<input type="text" class="form-control" name="city" id="city"
								value="Mumbai">
						</div>

						<div class="col-md-2">
							<h5>
								<b>State</b>
							</h5>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control" name="state" id="state"
								value="Maharashtra">
						</div>
						<div class="col-md-2">
							<h5>
								<b>Employee Type</b>
							</h5>
						</div>
						<%
						List<MasterBean> listM = Util.getDetailsFromMasterId("ROLES");
						%>
						<div class="col-md-2">
							<select id="role" name="role" data-rel="chosen">
								<option disabled>-------------------------------</option>
								<%
								for(MasterBean mb : listM){
								%>
								<option value="<%=mb.getMasterValue()%>"><%=mb.getMasterKey()%></option>
								<%} %>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Add
								Employee</button>
							<button type="reset" class="btn btn-default btn-xs">Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>