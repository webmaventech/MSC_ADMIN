<!-- popup form #3 -->
<a href="#x" class="overlay" id="addNewProductForm"></a>
<div class="popup">
	<div class="box col-md-4" style="width: 370px">
		<div class="box-inner">
			<div class="box-header well" data-original-title="">
				<h2>
					<i class="glyphicon glyphicon-plus"></i> Add New Products
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
				<form role="form" method="post" action="ProductsServelet">
					<div>
						<input type="hidden" name="formName" value="addProduct" />
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Name</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="name" id="name"
								placeholder="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Code</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="code" id="code"
								placeholder="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Description</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="description"
								id="description" placeholder="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Unit</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="unit"
								id="unit" placeholder="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<h5><b>Unit Price</b></h5>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" name="unitPrice"
								id="unitPrice" placeholder="" required="required">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" align="center">
							<button type="submit" class="btn btn-primary btn-xs">Add
								Product</button>
							<button type="reset" class="btn btn-default btn-xs">Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--/span-->
	<a class="close" href="#close"></a>
</div>