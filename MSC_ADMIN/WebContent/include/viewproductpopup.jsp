<%@page import="com.webmaven.core.ProductsBean"%>
<%@page import="com.webmaven.core.ProductsDAO"%>
<!-- popup form #1 -->
<a href="#x" class="overlay" id="viewProductForm"></a>
<%
			String dummy = request.getParameter("productId");
			System.out.println("product Id==>"+dummy);
			int pid = 0;
			if (dummy != null) {
				pid = Integer.parseInt(dummy);
			}
			ProductsDAO pDao = ProductsDAO.getProductsDAO();
			ProductsBean pbean = new ProductsBean();
			pbean = pDao.getProductInfoBasedOnProductId(pid);
			if (pbean != null) {
		%>
<div class="popup">
	<div class="box col-md-12" style="width: 900px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Products Info
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
						<h5><b>Product Id</b></h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control"
							value="<%=pbean.getProduct_id()%>" disabled />
					</div>

					<div class="col-md-2">
						<h5><b>Name</b></h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="name" id="name"
							value="<%=pbean.getName()%>" disabled>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<h5><b>Description</b></h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="description"
							id="description" value="<%=pbean.getDescription()%>" disabled>
					</div>

					<div class="col-md-2">
						<h5><b>Unit Price</b></h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="unitPrice"
							id="unitPrice" value="<%=pbean.getUnit_price()%>" disabled>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<h5><b>Created By</b></h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control"
							value="<%=pbean.getCreatedby()%>" disabled />
					</div>

					<div class="col-md-2">
						<h5><b>Created On</b></h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="name" id="name"
							value="<%=pbean.getCreatedon()%>" disabled>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<h5><b>Updated By</b></h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="description"
							id="description" value="<%=pbean.getUpdatedby()%>" disabled>
					</div>

					<div class="col-md-2">
						<h5><b>Updated On</b></h5>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" name="description"
							id="description" value="<%=pbean.getUpdatedon()%>" disabled>
					</div>
				</div>
				<%}%>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>