<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.webmaven.core.ProductsBean"%>
<%@page import="com.webmaven.core.ProductsDAO"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.util.List"%>


<!-- Head Tag Start -->
<c:import url="./include/includeheadtag.jsp"></c:import>
<!-- Head Tag End -->

<body>
	<!-- session Starts-->
	<%@include file="include/includesession.jsp"%>
	<!-- session Starts-->

	<!-- header Starts-->
	<%@include file="include/includeheader.jsp"%>
	<!-- header Starts-->

	<div class="ch-container">
		<div class="row">

			<!-- left bar Starts-->
			<c:import url="include/includeleftmenu.jsp"></c:import>
			<!-- left bar Ends-->

			<noscript>
				<div class="alert alert-block col-md-12">
					<h4 class="alert-heading">Warning!</h4>

					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li><a href="#">Products</a></li>
					</ul>
				</div>

				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-user"></i> Products Info
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
								<div align="right">
									<a href="#addNewProductForm" class="btn btn-info btn-xs">Add New
										Product</a>
								</div>
								<table
									class="table table-striped table-bordered bootstrap-datatable datatable responsive">
									<thead>
										<tr>
											<th>Product Id</th>
											<th>Product Name</th>
											<th>Code</th>
											<th>Description</th>
											<th>Unit Price</th>
											<th>Unit</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<%
											List<ProductsBean> pList = null;
											ProductsBean pb = null;
											ProductsDAO pdao = ProductsDAO.getProductsDAO();
											pList = pdao.getAllProductsVector();
											int pListSize = pList.size();
											for (int i = 0; i < pListSize; i++) {
											pb = (ProductsBean) pList.get(i);
										%>
										<tr>
											<td><%=pb.getProduct_id()%></td>
											<td class="center"><%=pb.getName()%></td>
											<td class="center"><%=pb.getCode()%></td>
											<td class="center"><%=pb.getDescription()%></td>
											<td class="center"><span
												class="label-success label label-default"><%=pb.getUnit_price()%></span>
											</td>
											<td class="center"><%=pb.getUnit()%></td>
											<td class="center"><a class="btn btn-success btn-xs"
												href="products.jsp?btnId=view&productId=<%=pb.getProduct_id()%>#viewProductForm">
													<i class="glyphicon glyphicon-zoom-in icon-white"></i> View
											</a> <a class="btn btn-info btn-xs"
												href="products.jsp?btnId=edit&productId=<%=pb.getProduct_id()%>#updateProductForm">
													<i class="glyphicon glyphicon-edit icon-white"></i> Edit
											</a> <a class="btn btn-danger btn-xs"
												href="ProductsServelet?btnId=delete&userName=<%=userName%>&productId=<%=pb.getProduct_id()%>">
													<i class="glyphicon glyphicon-trash icon-white"></i> Delete
											</a></td>
										</tr>
										<%}%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->


		<!-- view product popup starts -->
		<%@include file="include/viewproductpopup.jsp"%>
		<!-- view product popup ends -->

		<!-- add product popup starts -->
		<%@include file="include/addnewproductpopup.jsp"%>
		<!-- add product popup ends -->

		<!-- update product popup starts -->
		<%@include file="include/updateproductpopup.jsp"%>
		<!-- update product popup ends -->

		<hr>
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">X</button>
						<h3>Settings</h3>
					</div>
					<div class="modal-body">
						<p>Here Settings can be configured...</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
						<a href="#" class="btn btn-primary" data-dismiss="modal">Save
							changes</a>
					</div>
				</div>
			</div>
		</div>

		<!-- footer starts -->
		<%@include file="include/includefooter.jsp"%>
		<!-- footer ends -->

	</div>
	<!--/.fluid-container-->

	<!-- external javascript start-->
	<c:import url="include/includeexternaljavascript.jsp"></c:import>
	<!-- external javascript End-->

</body>
</html>
