<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.CustomersBean"%>
<%@page import="com.webmaven.core.CustomersDAO"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.webmaven.core.Util"%>
<!-- popup form #1 -->
<a href="#x" class="overlay" id="viewMasterForm"></a>
<%
	String masterId = request.getParameter("MasterId");
	String masterKey = request.getParameter("MasterKey");
	MasterBean mbean = new MasterBean();

	if ((masterId != null && !"".equalsIgnoreCase(masterId))
			&& (masterKey != null && !"".equalsIgnoreCase(masterKey))) {
		mbean.setMasterId(masterId.trim());
		mbean.setMasterKey(masterKey.trim());
	}
	MasterDAO mdao = MasterDAO.getMasterDAO();
	mbean = mdao.getMasterDetailsBasedOnMasterIdAndKey(mbean);
	if (mbean != null) {
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
						<h5>
							<b>Master Id</b>
						</h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control"
							value="<%=mbean.getMasterId()%>" disabled />
					</div>

					<div class="col-md-2">
						<h5>
							<b>Name</b>
						</h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="masterKey" id="masterKey"
							value="<%=mbean.getMasterKey()%>" disabled>
					</div>

				</div>
				<!-- <br> -->
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Master Value</b>
						</h5>
					</div>
					<div class="col-md-10">
						<input type="text" class="form-control" name="masterValue"
							id="masterValue" value="<%=mbean.getMasterValue()%>" disabled>
					</div>
				</div>
				<!-- <br> -->
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Status</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="status" id="status"
							value="<%=mbean.getStatus()%>" disabled />
					</div>

					<div class="col-md-2">
						<h5>
							<b>Created By</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="createdBy" id="createdBy"
							value="<%=mbean.getCreatedby()%>" disabled>
					</div>

					<div class="col-md-2">
						<h5>
							<b>Created On</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="createdOn" id="createdOn"
							value="<%=mbean.getCreatedon()%>" disabled>
					</div>
				</div>
				<!-- <br> -->
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Updated By</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="updatedBy"
							id="updatedBy"
							value="<%=mbean.getUpdatedby()%>" disabled>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Updated On</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="updatedOn"
							id="updatedOn" value="<%=mbean.getUpdatedon()%>" disabled>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Delete Flag</b>
						</h5>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control"
							value="<%=mbean.getDeleteFlag()%>" disabled />
					</div>
				</div>
				<%}%>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>