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
	/* 	padding-top: 5%; */
	
}

body html {
	height: 100%;
}

.body {
	background-image: url("photos/admin/delete.jpg");
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

.row {
	display: flex;
	flex-wrap: wrap;
	padding: 0 4px;
}

/* Create four equal columns that sits next to each other */
.column {
	flex: 33%;
	max-width: 33%;
	padding: 0 4px;
}

.column img {
	margin-top: 8px;
	vertical-align: middle;
}

.flex-container {
	display: flex;
	flex-wrap: wrap;
	/*   background-color: DodgerBlue; */
}

.flex-container-child {
	/*   width: 100px; */
	margin: 10px;
	/*   text-align: center; */
	/*   line-height: 75px; */
	/*   font-size: 30px; */
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media ( max-width : 800px) {
	.column {
		flex: 50%;
		max-width: 50%;
	}
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media ( max-width : 600px) {
	.column {
		flex: 100%;
		max-width: 100%;
	}
}

/* For larger screens */
@media only screen and (min-device-width: 800px) {
	.hero-unit {
		/* 		margin-left: 20%; */
		/* 		margin-right: 20%; */
		max-width: 100%;
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
					<p class="h5 text-center mb-4">Delete Images</p>
				</div>
				<div class="row-fluid">
					<form action="image/delete" class="form-horizontal" method="post" id="theForm" >
					
						<div class="form-group">
							<label for="tag">Tag:</label> <select class="form-control" name="tag" id="tag" required>
								<option>--Select--</option>
								<option <c:if test='${tag == "maternity"}'>selected</c:if>>maternity</option>
								<option <c:if test='${tag == "newBorn"}'>selected</c:if>>newBorn</option>
								<option <c:if test='${tag == "babies"}'>selected</c:if>>babies</option>
							</select>
						</div>
						<c:if test="${sessionScope.appToken == null}">
							<div class="form-group">
								<label for="token">Token:</label> <input type="password" class="form-control" id="token" name="token" required>
							</div>
						</c:if>
						<c:if test="${maxTagCount > 0}">
							<div class="container" style="height: 350px; overflow-y: scroll;">
								<c:forEach var="i" begin="0" end="${maxTagCount-1}">
									<c:if test="${((i+1)%3) == 1}">
										<div class="flex-container">
									</c:if>
									<div class="flex-container-child">
										<img height="200" src="photos/<c:out value='${tag}'></c:out>/min/<c:out value='${imagesArr[i]}'></c:out>" />
										<div class="caption">
											<input type="checkbox" name="<c:out value='${imagesArr[i]}'/>" />
										</div>
									</div>
									<c:if test="${((i+1)%3) == 0 || i == maxTagCount-1}">
							</div>
						</c:if>
						</c:forEach>
				</div>
				</c:if>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary" id="btnDelete">Delete</button>
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
	$(document).ready(function() {
		$(document).ajaxStart(function() {
			$("#wait").css("display", "block");
		});
		$(document).ajaxComplete(function() {
			$("#wait").css("display", "none");
		});
		$("#btnDelete").click(function(event) {
			if ($('#tag').val() != "--Select--" && ($('#token').length == 0 || $('#token')
					.val())) {

				var url = "image/delete"; // the script where you handle the form input.
				var form = $("#theForm");
				var data = form.serialize();
				$.ajax({
					type : "POST",
					contentType : false,
					url : url,
// 					processData : false,
					data : data, // serializes the form's elements.
					success : function(data) {
						alert(data); // show response from the php script.
						$('#theForm')[0].reset();
					}
				});
			} else {
				alert("Enter all the fields.");
			}
			
		});
		
		$("#theForm").submit(function(e) {
			e.preventDefault();
		});
		
	});

	$("#tag").change(function(event) {
		var value = this.value;
		var url = "delete?tag=" + value; // the script where you handle the form input.
		window.location = url;
	});
</script>


</html>

