<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Cache-control" content="public">
<meta name="author" content="Manogna Reddy">
<link rel="icon" href="resources/logo.png">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href=resources/logo.png type="image/x-icon">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Rubik:300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet" />
<style type='text/css'>
.container {
	/* 	padding-top: 15%; */
	
}

body html {
	height: 100%;
}

.body {
	background-image: url("photos/admin/upload.jpg");
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
	/* 	background-attachment: fixed; */
	height: 100vh;
}

.hero-unit {
	padding: 30px 30px 30px 30px;
	border-radius: 5px;
	background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
}

/* For larger screens */
@media only screen and (min-device-width: 800px) {
	.hero-unit {
		margin-left: 20%;
		margin-right: 20%;
		max-width: 60%;
		background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
	}
}
</style>
</head>
<body>
	<section class="header">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="index">Home</a> <a class="navbar-brand" href="upload">Upload</a> <a class="navbar-brand" href="delete">Delete</a>
				</div>
			</div>
		</nav>
	</section>

	<section class="body">
		<div class="container">
			<div class="hero-unit">
				<div class="row-fluid">
					<p class="h5 text-center mb-4">Upload Images</p>
				</div>
				<div class="row-fluid">
					<form action="image/upload" class="form-horizontal" method="post" id="theForm" enctype="multipart/form-data">
						<div class="form-group">
							<label for="file">Image:</label> <input class="form-control-file" type="file" name="file" id="file" required></input>
						</div>
						<div class="form-group">
							<label for="tag">Tag:</label> <select class="form-control" name="tag" id="tag" required>
								<option>--Select--</option>
								<option>maternity</option>
								<option>newBorn</option>
								<option>babies</option>
							</select>
						</div>
						<div class="form-group">
							<label for="homeImage">Home Image:</label> <select class="form-control" name="homeImage" id="homeImage" required>
								<option>no</option>
								<option>yes</option>
								<option>replace</option>
							</select>
						</div>
						<c:if test="${sessionScope.appToken == null}">
							<div class="form-group">
								<label for="token">Token:</label> <input type="password" class="form-control" id="token" name="token" required>
							</div>
						</c:if>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-primary" id="btnSubmit">Upload</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="wait" style="display: none; width: 69px; height: 89px; position: absolute; top: 50%; left: 50%; padding: 2px;">
			<img src="resources/loading.gif" width="64" height="64" /></div>
	</section>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://getbootstrap.com/assets/js/vendor/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script>
	$(document).ready(
			function() {
				$(document).ajaxStart(function() {
					$("#wait").css("display", "block");
				});
				$(document).ajaxComplete(function() {
					$("#wait").css("display", "none");
				});

				$("#btnSubmit").click(
						function(event) {
							if ($('#file').val()
									&& $('#tag').val() != "--Select--"
									&& ($('#token').length == 0 || $('#token')
											.val())) {

								var url = "image/upload"; // the script where you handle the form input.
								var form = $("#theForm")[0];
								var data = new FormData(form);
								$.ajax({
									type : "POST",
									contentType : false,
									url : url,
									enctype : 'multipart/form-data',
									processData : false,
									data : data, // serializes the form's elements.
									success : function(data) {
										alert(data); // show response from the php script.
										$('#theForm')[0].reset();
									}
								});
							} else {
								alert("Enter all the fields.");
							}
							$("#theForm").submit(function(e) {
								e.preventDefault();
							});
						});
			});
</script>


</html>

