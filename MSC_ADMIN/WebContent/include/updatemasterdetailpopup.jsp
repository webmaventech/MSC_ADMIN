<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.CustomersBean"%>
<%@page import="com.webmaven.core.CustomersDAO"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.webmaven.core.Util"%>
<!-- popup form #1 -->
<a href="#x" class="overlay" id="updateMasterForm"></a>
<%
	String masterIdu = request.getParameter("MasterId");
	String masterKeyu = request.getParameter("MasterKey");
	MasterBean mbeanUpdate = new MasterBean();

	if ((masterIdu != null && !"".equalsIgnoreCase(masterIdu))
			&& (masterKeyu != null && !"".equalsIgnoreCase(masterKeyu))) {
		mbeanUpdate.setMasterId(masterIdu.trim());
		mbeanUpdate.setMasterKey(masterKeyu.trim());
	}
	MasterDAO mdaou = MasterDAO.getMasterDAO();
	mbeanUpdate = mdaou.getMasterDetailsBasedOnMasterIdAndKey(mbeanUpdate);
	if (mbeanUpdate != null) {
%>
<div class="popup">
	<div class="box col-md-12" style="width: 1200px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Update Master
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
			<form role="form" method="post" action="MasterServelet">
			<div>
						<input type="hidden" name="formName" value="updateMaster" />
					</div>
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Master Id</b>
						</h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="masterId" id="masterId"
							value="<%=mbeanUpdate.getMasterId()%>"/>
					</div>

					<div class="col-md-2">
						<h5>
							<b>Name</b>
						</h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="masterKey" id="masterKey"
							value="<%=mbeanUpdate.getMasterKey()%>">
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
							id="masterValue" value="<%=mbeanUpdate.getMasterValue()%>">
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
							value="<%=mbeanUpdate.getStatus()%>"/>
					</div>

					<%-- <div class="col-md-2">
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
					</div> --%>
				</div>
				<!-- <br> -->
				<%-- <div class="row">
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
				</div> --%>
				<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Update
								Master</button>
						</div>
					</div>
				<%}%>
				</form>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>