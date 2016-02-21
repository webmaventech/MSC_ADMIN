<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.CustomersBean"%>
<%@page import="com.webmaven.core.CustomersDAO"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.webmaven.core.Util"%>
<!-- popup form #1 -->
<a href="#x" class="overlay" id="addNewMasterForm"></a>
<div class="popup">
	<div class="box col-md-12" style="width: 1200px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Add New Master Configuration
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
						<input type="hidden" name="formName" value="addNewMaster" />
					</div>
				<div class="row">
					<div class="col-md-2">
						<h5>
							<b>Master Id</b>
						</h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="masterId" id="masterId"
							value=""/>
					</div>

					<div class="col-md-2">
						<h5>
							<b>Master Key</b>
						</h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="masterKey" id="masterKey"
							value="">
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
							id="masterValue" value="">
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
							value=""/>
					</div>
				</div>

				<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>