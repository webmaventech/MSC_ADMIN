<%@page import="com.webmaven.core.ProductsDAO"%>
<%@page import="com.webmaven.core.OrderDetailsBean"%>
<%@page import="com.webmaven.core.OrderDetailsDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<!-- popup form #1 -->
<a href="#x" class="overlay" id="viewOrderDetailsForm"></a>
<%
	String dummy5 = request.getParameter("orderNo");
	System.out.println("Order NoV==>"+dummy5);
	int ono1 = 0;
	int listSize = 0;
	int totalAmount = 0;
	HashMap<Integer, String> productIdNameMap = null;
	List<OrderDetailsBean> orderDList = new ArrayList<OrderDetailsBean>();
	if (dummy5 != null) {
		ono1 = Integer.parseInt(dummy5);
	}
	OrderDetailsDAO oDao1 = OrderDetailsDAO.getOrderDetailsDAO();
	OrderDetailsBean obean1 = new OrderDetailsBean();
	orderDList = oDao1.getOrderDetailsInfoBasedOnOrderId(ono1);
	listSize = orderDList.size();
	ProductsDAO pdao = ProductsDAO.getProductsDAO();
	productIdNameMap = pdao.getAllProductIdNameMap();
	if (orderDList != null) {
%>
<div class="popup">
	<div class="box col-md-10" style="width: 900px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-edit"></i> Orders Details
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
							<b>Sr No</b>
						</h5>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Product</b>
						</h5>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Unit Price (Rs)</b>
						</h5>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Quantity (Kg)</b>
						</h5>
					</div>
					<div class="col-md-2">
						<h5>
							<b>Total</b>
						</h5>
					</div>
				</div>
				<%
					for(int i = 0; i < listSize; i++){
						obean1 = orderDList.get(i);
				%>
				<div class="row">
					<div class="col-md-2">
						<input type="text" class="form-control" name="srNo"
							id="srNo" value="<%=i+1%>"
							disabled>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="productName"
							id="productName" value="<%=productIdNameMap.get(obean1.getProductId()) %>"
							disabled>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="unitPrice"
							id="unitPrice" value="<%=obean1.getUnitPrice() %>"
							disabled>
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" name="quantity"
							id="quantity" value="<%=obean1.getQuantity() %>"
							disabled>
					</div>
					<%totalAmount += ((obean1.getUnitPrice()) * (obean1.getQuantity())); %>
					<div class="col-md-2">
						<input type="text" class="form-control" name="total"
							id="total" value="<%=((obean1.getUnitPrice()) * (obean1.getQuantity()))%>"
							disabled>
					</div>
				</div>
				<%}}%>
			</div>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>