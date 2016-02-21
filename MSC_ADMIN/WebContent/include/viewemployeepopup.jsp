<%@page import="com.webmaven.core.EmployeeBean"%>
<%@page import="com.webmaven.core.EmployeeDAO"%>
<!-- popup form #1 -->
		<a href="#x" class="overlay" id="viewEmployeeForm"></a>
		<%
			String dummy = request.getParameter("employeeId");
			System.out.println("viewEmployeeForm --> Employee Id==>"+dummy);
			int eid = 0;
			if (dummy != null) {
				eid = Integer.parseInt(dummy);
			}
			EmployeeDAO edao = EmployeeDAO.getEmployeeDAO();
			EmployeeBean ebean = new EmployeeBean();
			ebean = edao.getEmployeeInfoBasedOnEmployeeId(eid);
			if (ebean != null) {
		%>
		<div class="popup">
			<div class="box col-md-12" style="width: 1200px">
				<div class="box-inner">
					<div class="box-header well" data-original-title="">
						<h2>
							<i class="glyphicon glyphicon-edit"></i> Employee Info
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
									<h5><b>Employee Id</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control"
										value="<%=ebean.getEmployeeId()%>" disabled />
								</div>

								<div class="col-md-2">
									<h5><b>Name</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="name" id="name"
										value="<%=ebean.getName()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Email</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="email" id="email"
										value="<%=ebean.getEmail()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>Mobile Number</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="mobileNo"
										id="mobileNo" value="<%=ebean.getMobileNo()%>" disabled>
								</div>

								<div class="col-md-2">
									<h5><b>Alt Number</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="altNumber"
										id="altNumber" value="<%=ebean.getAltNumber()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Address</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="address"
										id="address" value="<%=ebean.getAddress()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>City</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="city" id="city"
										value="<%=ebean.getCity()%>" disabled />
								</div>

								<div class="col-md-2">
									<h5><b>State</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="state" id="state"
										value="<%=ebean.getState()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Area</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="area" id="area"
										value="<%=ebean.getArea()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>Role</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="role"
										id="role" value="<%=ebean.getRole()%>" disabled>
								</div>

								<div class="col-md-2">
									<h5><b>Department</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="customerType"
										id="customerType" value="<%=ebean.getDepartment()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Pincode</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="pincode"
										id="pincode" value="<%=ebean.getPincode()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>Created By</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control"
										value="<%=ebean.getCreatedby()%>" disabled />
								</div>

								<div class="col-md-2">
									<h5><b>Created On</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control"
										value="<%=ebean.getCreatedon()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Updated On</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="" id=""
										value="<%=ebean.getUpdatedon()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>Updated By</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name=""
										id="" value="<%=ebean.getUpdatedby()%>" disabled>
								</div>

								<div class="col-md-2">
									<h5><b>Delete Flag</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="deleteFlag"
										id="deleteFlag" value="<%=ebean.getDeleteflag()%>" disabled>
								</div>
							</div>
							<%}%>
					</div>
				</div>
			</div>
			<a class="close" href="#close"></a>
		</div>