<%@page import="com.webmaven.core.CustomersBean"%>
<%@page import="com.webmaven.core.CustomersDAO"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.webmaven.core.Util"%>
<!-- popup form #1 -->
		<a href="#x" class="overlay" id="viewCustomerForm"></a>
		<%
			String dummy = request.getParameter("customerId");
			System.out.println("viewCustomerForm --> customer Id==>"+dummy);
			int cid = 0;
			if (dummy != null) {
				cid = Integer.parseInt(dummy);
			}
			CustomersDAO cdao = CustomersDAO.getCustomersDAO();
			CustomersBean cbean = new CustomersBean();
			cbean = cdao.getCustomerInfoBasedOnCustomerId(cid);
			if (cbean != null) {
				MasterDAO.initializeMasters();
				HashMap<String, String> custTypeMap = MasterDAO.getCustomerTypeValueKeyMap();
				HashMap<String, String> areaMap = MasterDAO.getAreasValueKeyMap();
		%>
		<div class="popup">
			<div class="box col-md-12" style="width: 1200px">
				<div class="box-inner">
					<div class="box-header well" data-original-title="">
						<h2>
							<i class="glyphicon glyphicon-edit"></i> Customer Info
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
									<h5><b>Customer Id</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control"
										value="<%=cbean.getCustomerId()%>" disabled />
								</div>

								<div class="col-md-2">
									<h5><b>Name</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="name" id="name"
										value="<%=cbean.getName()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Email</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="email" id="email"
										value="<%=cbean.getEmail()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>Mobile Number</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="mobileNo"
										id="mobileNo" value="<%=cbean.getMobileno()%>" disabled>
								</div>

								<div class="col-md-2">
									<h5><b>Alt Number</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="altNumber"
										id="altNumber" value="<%=cbean.getAltNumber()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Address</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="address"
										id="address" value="<%=cbean.getAddress()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>City</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="city" id="city"
										value="<%=cbean.getCity()%>" disabled />
								</div>

								<div class="col-md-2">
									<h5><b>State</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="state" id="state"
										value="<%=cbean.getState()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Area</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="area" id="area"
										value="<%=areaMap.get(cbean.getArea())%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<%-- <div class="col-md-2">
									<h5><b>side</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="side"
										id="side" value="<%=Util.getSide(cbean.getSide())%>" disabled>
								</div> --%>

								<div class="col-md-2">
									<h5><b>Customer Type</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="customerType"
										id="customerType" value="<%=custTypeMap.get(cbean.getCustomerType()+"")%>" disabled>
								</div>
								<div class="col-md-2">
									<h5><b>Pincode</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="pincode"
										id="pincode" value="<%=cbean.getPincode()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>Created By</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control"
										value="<%=cbean.getCreatedby()%>" disabled />
								</div>

								<div class="col-md-2">
									<h5><b>Created On</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control"
										value="<%=cbean.getCreatedon()%>" disabled>
								</div>
								
								<div class="col-md-2">
									<h5><b>Updated On</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="" id=""
										value="<%=cbean.getUpdatedon()%>" disabled>
								</div>
							</div>
							<!-- <br> -->
							<div class="row">
								<div class="col-md-2">
									<h5><b>Updated By</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name=""
										id="" value="<%=cbean.getUpdatedby()%>" disabled>
								</div>

								<div class="col-md-2">
									<h5><b>Delete Flag</b></h5>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" name="deleteFlag"
										id="deleteFlag" value="<%=cbean.getDeleteFlag()%>" disabled>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2">
									<h5><b>Comments</b></h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" name="comments"
										id="comments" value="<%=cbean.getComments()%>" disabled>
								</div>
							</div>
							<%}%>
					</div>
				</div>
			</div>
			<a class="close" href="#close"></a>
		</div>