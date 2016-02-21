<%@page import="com.webmaven.core.ProductsDAO"%>
<%@page import="com.webmaven.core.ProductsBean"%>
<%@page import="com.webmaven.core.OrderDetailsBean"%>
<%@page import="com.webmaven.core.OrderDetailsDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script>
	$(document)
			.ready(
	function() {
						var cnt = 2;
						$("#anc_add")
								.click(
										function() {
											$('#tbl1 tr')
													.last()
													.after(
															'<tr>'
															+'<td>'+ cnt+ '</td>'
															+'<td>'
															+'<select id="productName_"'+ cnt + 'name="productName_"' + cnt + ' data-rel="chosen">'
															+'<option disabled>-------------------------------</option>'
															+'</select>'
															+'</td>'
															+'<td><input type="text" name="quantity_"'+cnt+'"value=""></td>'
															+'<td><input type="text" name="rate_"'+cnt+'"value=""></td>'
															+'</tr>');
											cnt++;
										});

						$("#anc_rem").click(function() {
							if ($('#tbl1 tr').size() > 1) {
								$('#tbl1 tr:last-child').remove();
								cnt--;
							} else {
								alert('One row should be present in table');
							}
						});

					});
</script>
</head>
<!-- popup form #1 -->
<a href="#x" class="overlay" id="addOrderDetailsForm"></a>
<%
	String dummy7 = request.getParameter("orderNo");
	System.out.println("Order NoV==>" + dummy7);
	int ono_AddOD = 0;
	int listSize_AddOD = 0;
	int totalAmount_AddOD = 0;
	List<ProductsBean> productList_AddOD = null;

	if (dummy7 != null) {
		ono_AddOD = Integer.parseInt(dummy7);
	}
	OrderDetailsDAO odDAO = new OrderDetailsDAO();
	List<Integer> pIdList = odDAO.getProductIdListBasedOnOrderNo(ono_AddOD);
	ProductsDAO pdao_AddOD = ProductsDAO.getProductsDAO();
	productList_AddOD = pdao_AddOD.getAllProductsVector();
	if (productList_AddOD != null) {
%>
<div class="popup">
	<div class="box col-md-10" style="width:800px;height:450px;overflow: scroll;">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i>Add Orders Details
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
			<form name="addOrderDetails" method="Post" action="OrderDetailsServelet">
			<input type="hidden" name="orderNo" id="orderNo" value=<%=ono_AddOD%>>
			<input type="hidden" name="formName" id="formName" value="addOrderDetails">
				<table id="tbl1">
					<tr>
						<td>Sr No</td>
						<td>Product Code</td>
						<td>Product Name</td>
						<td>Quantity</td>
						<td>Rate</td>
					</tr>
					<%
						int i = 1;
							for (ProductsBean pb : productList_AddOD) {
								if(pIdList.contains(pb.getProduct_id()))
									continue;
					%>
					<tr>
						<input type="hidden" name="productId" id="productId" value=<%=pb.getProduct_id()%>>
						<input type="hidden" name="productCode" id="productCode" value=<%=pb.getCode()%>>
						<td><%=i%></td>
						<td><%=pb.getCode()%></td>
						<td><%=pb.getName()%></td>
						<td><input type="text" name="quantity" id="quantity" value=""></td>
						<td><input type="text" name="rate" id="rate" value=""></td>
					</tr>
					<% i++;}%>
				</table>
				<center><input type="submit" name="Update Order Details" value="Update Order Details"></center>
				</form>
			</div>
			<%}%>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>