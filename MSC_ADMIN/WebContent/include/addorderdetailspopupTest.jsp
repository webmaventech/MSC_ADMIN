<%@page import="com.webmaven.core.ProductsDAO"%>
<%@page import="com.webmaven.core.ProductsBean"%>
<%@page import="com.webmaven.core.OrderDetailsBean"%>
<%@page import="com.webmaven.core.OrderDetailsDAO"%>
<%@page import="com.webmaven.core.MasterBean"%>
<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
	$(document).ready(
	function() {
						var cnt = 2;
						$("#anc_add")
								.click(
										function() {
											alert('demo');
											$('#tbl1 tr')
													.last()
													.after(
															+'<tr>'
															+'<td>'+ cnt+ '</td>'
															+'<td>'
															+'<select id="productName_"'+ cnt + 'name="productName_"' + cnt + ' data-rel="chosen">'
															+'<option>'+cnt+'</option>'
															<%--ProductsDAO pdao_AddOD1 = ProductsDAO.getProductsDAO();
															HashMap<String, String> pMap1 = pdao_AddOD1.getAllProductCodeNameMap();
															for (HashMap.Entry<String, String> entry : pMap1.entrySet()) {%>
															+'<option value='+<%=entry.getKey()%>+'>'+<%=entry.getValue()%>+'</option>'+
															<%}--%>
															+'</select>'
															+'</td>'
															+'<td><input type="text" name="quantity_"'+cnt+'"value=""></td>'
															+'<td><input type="text" name="rate_"'+cnt+'"value=""></td>'
															+'</tr>');
											cnt++;
										});

						$("#anc_rem").click(function() {
							if ($('#tbl1 tr').size() > 2) {
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
	ProductsDAO pdao_AddOD = ProductsDAO.getProductsDAO();
	HashMap<Integer, String> pMap = pdao_AddOD.getAllProductIdNameMap();
	if (pMap != null) {
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
			<form action="ordersServelet">
				<table id="tbl1">
					<tr>
					<td colspan = '4'>
						<a href="javascript:void(0);" id='anc_add'>Add Row</a>
 						<a href="javascript:void(0);" id='anc_rem'>Remove Row</a>
 					</td>
					</tr>
					<tr>
						<td>Sr No</td>
						<td>Product Name</td>
						<td>Quantity</td>
						<td>Rate</td>
					</tr>
					 <%int i = 1;%> 
					<tr>
						<input type='hidden' name='productId_<%=i%>' id='productId_<%=i%>' value='PQR'/>
						<td><%=i%></td>
						<td>
						<select id='productName_'+<%=i%> name='productName_'+<%=i%> data-rel='chosen'>
								<option disabled>---------------------</option>
								<%for (int pName : pMap.keySet()) {%>
								<option value='<%=pName%>'><%=pMap.get(pName)%></option>
								<%}%>
							</select>
						</td>
						<td><input type="text" name="quantity_<%=i%>" id="quantity_<%=i%>" value=""></td>
						<td><input type="text" name="rate_<%=i%>" id="rate_<%=i%>" value=""></td>
					</tr>
				</table>
				</form>
			</div>
			<%}%>
		</div>
	</div>
	<a class="close" href="#close"></a>
</div>