<%@page import="com.webmaven.core.MasterDAO"%>
<%@page import="com.webmaven.core.OrdersBean"%>
<%@page import="com.webmaven.core.OrdersDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<!-- popup form #1 -->
<a href="#x" class="overlay" id="viewOrders"></a>
<div class="popup">
	<div class="row">
        <div class="box col-md-6" style="width:900px;height:400px;overflow: scroll">
            <div class="box-inner">
                <div class="box-header well" data-original-title="">
                    <h2>Customer Order History</h2>

                    <div class="box-icon">
                        <a href="#" class="btn btn-setting btn-round btn-default"><i
                                class="glyphicon glyphicon-cog"></i></a>
                        <a href="#" class="btn btn-minimize btn-round btn-default"><i
                                class="glyphicon glyphicon-chevron-up"></i></a>
                        <a href="#" class="btn btn-close btn-round btn-default"><i
                                class="glyphicon glyphicon-remove"></i></a>
                    </div>
                </div>
                <div class="box-content">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Sr No</th>
                            <th>Order Number</th>
                            <th>Order Date</th>
                            <th>Collection Date</th>
                            <th>Order Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
						String dummy4 = request.getParameter("customerId");
						System.out.println("Customer Id==>"+dummy4);
						int custId = 0;
						if (dummy4 != null) {
						custId = Integer.parseInt(dummy4);
						}
						List<OrdersBean> oList = null;
						OrdersBean obean = null;
						OrdersDAO oDao = OrdersDAO.getOrdersDAO();
						oList = oDao.getAllOrdersForCustomerId(custId);
						int oListSize = oList.size();
						for (int i = 0; i < oListSize; i++) {
						obean = (OrdersBean) oList.get(i);
						if (obean != null) {
							MasterDAO.initializeMasters();
							HashMap<String, String> orderStatusMap = MasterDAO.getOrderStatusValueKeyMap();
							System.out.println(orderStatusMap.toString());
						%>
                        <tr>
                            <td><%=i + 1%></td>
                            <td class="center"><%=obean.getOrder_no() %></td>
                            <td class="center"><%=obean.getOrderTimestamp() %></td>
                            <td class="center"><%=obean.getPreferredDate() %></td>
                            <td class="center"><%=orderStatusMap.get(obean.getStatus()+"")%></td>
                            <td class="center">
                            <a class="btn btn-success btn-xs"
							href="customers.jsp?btnId=view&orderNo=<%=obean.getOrder_no()%>#viewOrderDetailsForm"><i class="glyphicon glyphicon-zoom-in icon-white"></i> View Details
							</a>
							<a class="btn btn-warning btn-xs"
							href="#"><i class="glyphicon glyphicon-edit icon-white"></i> Edit
							</a></td>
                        </tr>
                        <%}} %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--/span-->
       </div>
       <!--/Row-->
	<a class="close" href="#close"></a>
</div>