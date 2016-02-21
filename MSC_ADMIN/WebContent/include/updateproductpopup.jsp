<%@page import="com.webmaven.core.ProductsBean"%>
<%@page import="com.webmaven.core.ProductsDAO"%>
<!-- popup form #2 -->
<a href="#x" class="overlay" id="updateProductForm"></a>
<%
			String dummy1 = request.getParameter("productId");
			System.out.println("product Id==>"+dummy1);
			int pid1 = 0;
			if (dummy1 != null) {
				pid1 = Integer.parseInt(dummy1);
			}
			ProductsDAO pdaoUpdate = ProductsDAO.getProductsDAO();
			ProductsBean pbeanUpdate = new ProductsBean();
			pbeanUpdate = pdaoUpdate.getProductInfoBasedOnProductId(pid1);
			if (pbeanUpdate != null) {
		%>
<div class="popup">
	<div class="box col-md-4" style="width: 370px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Update Exiting Products
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
				<form role="form" method="post" action="ProductsServelet"
					name="updateProduct" id="updateProduct">
					<div>
						<input type="hidden" name="formName" value="updateProduct" />
					</div>
					<%-- <div>
						<input type="hidden" name="userName" id="userName"
							value="<%=userName%>" />
					</div> --%>
					<div>
						<input type="hidden" name="productId" id="productId"
							value="<%=pbeanUpdate.getProduct_id()%>" />
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Product Id</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control"
								value="<%=pbeanUpdate.getProduct_id()%>" disabled />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Name</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="name" id="name"
								value="<%=pbeanUpdate.getName()%>">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Code</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="code" id="code"
								value="<%=pbeanUpdate.getCode()%>">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Description</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="description"
								id="description" value="<%=pbeanUpdate.getDescription()%>">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Unit</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="unit"
								id="unit" value="<%=pbeanUpdate.getUnit()%>"
								required="required">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Unit Price</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="unitPrice"
								id="unitPrice" value="<%=pbeanUpdate.getUnit_price()%>"
								required="required">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Update
								Product</button>
						</div>
					</div>
					<%}%>
				</form>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>