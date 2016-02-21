<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="com.webmaven.core.*"%>

<!-- Head Tag Start -->
<c:import url="include/includeheadtag.jsp"></c:import>
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
						<li><a href="#">Dashboard</a></li>
					</ul>
				</div>
				<div class=" row">
					<%
						int totalCustomers = CustomersDAO.getTotalCustomersCount();
						int totalTodaysCustomers = CustomersDAO.getTodaysNewCustomersCount();
					%>
					<div class="col-md-3 col-sm-3 col-xs-6">
						<a data-toggle="tooltip"
							title="<%=totalTodaysCustomers%> new customers."
							class="well top-block" href="customers.jsp"> <i
							class="glyphicon glyphicon-user blue"></i>
							<div>Total Customers</div>
							<div><%=totalCustomers%></div> <span class="notification"><%=totalTodaysCustomers%></span>
						</a>
					</div>
					<%
						int totalOrders = OrdersDAO.getTotalOrdersCount();
						int totalTodaysOrder = OrdersDAO.getTodaysOrderCountCount();
					%>
					<div class="col-md-3 col-sm-3 col-xs-6">
						<a data-toggle="tooltip" title="<%=totalTodaysOrder%> new orders."
							class="well top-block" href="orders.jsp"> <i
							class="glyphicon glyphicon-shopping-cart yellow"></i>
							<div>Total Orders</div> 
							<div><%=totalOrders%></div> <span class="notification green"><%=totalTodaysOrder%></span>
						</a>
					</div>

					<div class="col-md-3 col-sm-3 col-xs-6">
						<a data-toggle="tooltip" title="$0  new sales."
							class="well top-block" href="#"> <i
							class="glyphicon glyphicon-star green"></i>
							<div>Pending Orders</div>
							<div>$0</div> <span class="notification yellow">$0</span>
						</a>
					</div>

					<div class="col-md-3 col-sm-3 col-xs-6">
						<a data-toggle="tooltip" title="12 new messages."
							class="well top-block" href="#"> <i
							class="glyphicon glyphicon-envelope red"></i>
							<div>Total Products</div>
							<%
 								int totalProducts = ProductsDAO.getTotalProductsCount();
 								//int totalTodaysOrder = OrdersDAO.getTodaysOrderCountCount();
 							%>
							<div><%=totalProducts%></div> <span class="notification red">0</span>
						</a>
					</div>
				</div>

				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner homepage-box">
							<div class="box-header well">
								<h2>
									<i class="glyphicon glyphicon-th"></i> Tabs
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
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a href="#info">Today's Order</a></li>
									<li ><a href="#custom">Week's Order</a></li>
									<li><a href="#messages">Month's Order</a></li>
									<li><a href="#messages">Visitor's Count</a></li>
									<li><a href="#messages">Recent Activity</a></li>
								</ul>

								<div id="myTabContent" class="tab-content">
									<div class="tab-pane active" id="info">
										<h3>
											Charisma <small>a full featured template</small>
										</h3>
										<p>Its a full featured, responsive template for your admin
											panel. It is optimized for tablets and mobile phones.</p>

										<p>Check how it looks on different devices:</p>
										<a
											href="http://www.responsinator.com/?url=usman.it%2Fthemes%2Fcharisma"
											target="_blank"><strong>Preview on iPhone size.</strong></a>
										<br> <a
											href="http://www.responsinator.com/?url=usman.it%2Fthemes%2Fcharisma"
											target="_blank"><strong>Preview on iPad size.</strong></a>
									</div>
									<div class="tab-pane" id="custom">
										<h3>
											Custom <small>small text</small>
										</h3>
										<p>Sample paragraph.</p>

										<p>Your custom text.</p>
									</div>
									<div class="tab-pane" id="messages">
										<h3>
											Messages <small>small text</small>
										</h3>
										<p>Sample paragraph.</p>

										<p>Your custom text.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/span-->

					<!-- <div class="box col-md-4">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-user"></i> Member Activity
								</h2>

								<div class="box-icon">
									<a href="#" class="btn btn-minimize btn-round btn-default"><i
										class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
										class="btn btn-close btn-round btn-default"><i
										class="glyphicon glyphicon-remove"></i></a>
								</div>
							</div>
							<div class="box-content">
								<div class="box-content">
									<ul class="dashboard-list">
										<li><a href="#"> <img class="dashboard-avatar"
												alt="Usman"
												src="http://www.gravatar.com/avatar/f0ea51fa1e4fae92608d8affee12f67b.png?s=50"></a>
											<strong>Name:</strong> <a href="#">Usman </a><br> <strong>Since:</strong>
											17/05/2014<br> <strong>Status:</strong> <span
											class="label-success label label-default">Approved</span></li>
										<li><a href="#"> <img class="dashboard-avatar"
												alt="Sheikh Heera"
												src="http://www.gravatar.com/avatar/3232415a0380253cfffe19163d04acab.png?s=50"></a>
											<strong>Name:</strong> <a href="#">Sheikh Heera </a><br>
											<strong>Since:</strong> 17/05/2014<br> <strong>Status:</strong>
											<span class="label-warning label label-default">Pending</span>
										</li>
										<li><a href="#"> <img class="dashboard-avatar"
												alt="Abdullah"
												src="http://www.gravatar.com/avatar/46056f772bde7c536e2086004e300a04.png?s=50"></a>
											<strong>Name:</strong> <a href="#">Abdullah </a><br> <strong>Since:</strong>
											25/05/2014<br> <strong>Status:</strong> <span
											class="label-default label label-danger">Banned</span></li>
										<li><a href="#"> <img class="dashboard-avatar"
												alt="Sana Amrin" src="http://www.gravatar.com/avatar/hash"></a>
											<strong>Name:</strong> <a href="#">Sana Amrin</a><br> <strong>Since:</strong>
											17/05/2014<br> <strong>Status:</strong> <span
											class="label label-info">Updates</span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					/span

					<div class="box col-md-4">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-list"></i> Weekly Stat
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
								<ul class="dashboard-list">
									<li><a href="#"> <i
											class="glyphicon glyphicon-arrow-up"></i> <span class="green">92</span>
											New Comments
									</a></li>
									<li><a href="#"> <i
											class="glyphicon glyphicon-arrow-down"></i> <span class="red">15</span>
											New Registrations
									</a></li>
									<li><a href="#"> <i class="glyphicon glyphicon-minus"></i>
											<span class="blue">36</span> New Articles
									</a></li>
									<li><a href="#"> <i
											class="glyphicon glyphicon-comment"></i> <span class="yellow">45</span>
											User reviews
									</a></li>
									<li><a href="#"> <i
											class="glyphicon glyphicon-arrow-up"></i> <span class="green">112</span>
											New Comments
									</a></li>
									<li><a href="#"> <i
											class="glyphicon glyphicon-arrow-down"></i> <span class="red">31</span>
											New Registrations
									</a></li>
									<li><a href="#"> <i class="glyphicon glyphicon-minus"></i>
											<span class="blue">93</span> New Articles
									</a></li>
									<li><a href="#"> <i
											class="glyphicon glyphicon-comment"></i> <span class="yellow">254</span>
											User reviews
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					
										/span
				</div>
				/row

				<div class="row">
					<div class="box col-md-4">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-list"></i> Buttons
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
							<div class="box-content buttons">
								<p class="btn-group">
									<button class="btn btn-default">Left</button>
									<button class="btn btn-default">Middle</button>
									<button class="btn btn-default">Right</button>
								</p>
								<p>
									<button class="btn btn-default btn-sm">
										<i class="glyphicon glyphicon-star"></i> Icon button
									</button>
									<button class="btn btn-primary btn-sm">Small button</button>
									<button class="btn btn-danger btn-sm">Small button</button>
								</p>
								<p>
									<button class="btn btn-warning btn-sm">Small button</button>
									<button class="btn btn-success btn-sm">Small button</button>
									<button class="btn btn-info btn-sm">Small button</button>
								</p>
								<p>
									<button class="btn btn-inverse btn-default btn-sm">Small
										button</button>
									<button class="btn btn-primary btn-round btn-lg">Round
										button</button>
									<button class="btn btn-round btn-default btn-lg">
										<i class="glyphicon glyphicon-ok"></i>
									</button>
									<button class="btn btn-primary">
										<i class="glyphicon glyphicon-edit glyphicon-white"></i>
									</button>
								</p>
								<p>
									<button class="btn btn-default btn-xs">Mini button</button>
									<button class="btn btn-primary btn-xs">Mini button</button>
									<button class="btn btn-danger btn-xs">Mini button</button>
									<button class="btn btn-warning btn-xs">Mini button</button>
								</p>
								<p>
									<button class="btn btn-info btn-xs">Mini button</button>
									<button class="btn btn-success btn-xs">Mini button</button>
									<button class="btn btn-inverse btn-default btn-xs">Mini
										button</button>
								</p>
							</div>
						</div>
					</div>
					/span

					<div class="box col-md-4">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-list"></i> Buttons
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
							<div class="box-content  buttons">
								<p>
									<button class="btn btn-default btn-lg">Large button</button>
									<button class="btn btn-primary btn-lg">Large button</button>
								</p>
								<p>
									<button class="btn btn-danger btn-lg">Large button</button>
									<button class="btn btn-warning btn-lg">Large button</button>
								</p>
								<p>
									<button class="btn btn-success btn-lg">Large button</button>
									<button class="btn btn-info btn-lg">Large button</button>
								</p>
								<p>
									<button class="btn btn-inverse btn-default btn-lg">Large
										button</button>
								</p>
								<div class="btn-group">
									<button class="btn btn-default btn-lg">Large Dropdown</button>
									<button class="btn dropdown-toggle btn-default btn-lg"
										data-toggle="dropdown">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#"><i class="glyphicon glyphicon-star"></i>
												Action</a></li>
										<li><a href="#"><i class="glyphicon glyphicon-tag"></i>
												Another action</a></li>
										<li><a href="#"><i
												class="glyphicon glyphicon-download-alt"></i> Something else
												here</a></li>
										<li class="divider"></li>
										<li><a href="#"><i class="glyphicon glyphicon-tint"></i>
												Separated link</a></li>
									</ul>
								</div>

							</div>
						</div>
					</div>
					/span
<div class="box col-md-4">
						<div class="box-inner homepage-box">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-list-alt"></i> Open Source
								</h2>

								<div class="box-icon">
									<a href="#" class="btn btn-minimize btn-round btn-default"><i
										class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
										class="btn btn-close btn-round btn-default"><i
										class="glyphicon glyphicon-remove"></i></a>
								</div>
							</div>
							<div class="box-content">
								<h3>Charisma is Open Source</h3>
								<a class="btn btn-default center-block col-md-6" title="GitHub"
									href="https://github.com/usmanhalalit/charisma" target="_blank"><i
									class="icon-edit"></i> View on GitHub</a>

								<div class="clearfix"></div>
								<br>
								<ul class="github-buttons center-block">
									<li><iframe
											src="http://ghbtns.com/github-btn.html?user=usmanhalalit&amp;repo=charisma&amp;type=watch&amp;count=true"
											height="20" width="100" frameborder="0" scrolling="0"></iframe>
									</li>
									<li><iframe
											src="http://ghbtns.com/github-btn.html?user=usmanhalalit&amp;repo=charisma&amp;type=fork&amp;count=true"
											height="20" width="98" frameborder="0" scrolling="0"></iframe>
									</li>
								</ul>
								<div class="clearfix"></div>

								<div class="donate">
									<div>
										<small>Help development of Charisma</small>
									</div>
									<a class="btn btn-default"
										href="http://flattr.com/thing/1507720/usmanhalalitcharisma-on-GitHub"
										target="_blank"><i class="glyphicon glyphicon-usd green"></i>
										Donate</a>
								</div>
								<br />

								<p>
									You may like my other open source work, check my profile on <a
										href="http://github.com/usmanhalalit" target="_blank">GitHub</a>.
								</p>

							</div>
						</div>
					</div>

										/span
				</div>
 -->
					<!--/row-->
					<!-- content ends -->
				</div>
				<!--/#content.col-md-0-->
			</div>
			<!--/fluid-row-->

			<hr />

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">

				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h3>Settings</h3>
						</div>
						<div class="modal-body">
							<p>Here settings can be configured...</p>
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
	</div>
	<!--/.fluid-container-->

	<!-- external javascript start-->
	<c:import url="include/includeexternaljavascript.jsp"></c:import>
	<!-- external javascript End-->

</body>
</html>
