<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Song Details</title>
</head>
<body>
	<!-- song -->
	
	<div class="container mt-5">
		<div class="row">
			<div class="col-11"></div>
			<div class="col-1"><a class="btn btn-dark rounded-pill" href="/dashboard">Dashboard</a></div>
		</div> <!--  -->
		<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="rounded alert alert-secondary text-center">
				<h1 class="mt-5">Title : <c:out value="${song.title}"/></h1>
				<p class="mt-4 fs-5 fw-bolder">Artist : <c:out value="${song.artist}"/></p>
				<p class="mt-4 fs-5">Rating : <c:out value="${song.rating}"/></p>
				<div class="mt-5 mb-5">
					<form action="/delete/${song.id}" method="post">
						<input type="hidden" name="_method" value="delete">
						<input type="submit" class="btn btn-danger rounded-pill" value="Delete">
					</form>
				</div>
			</div> 
		</div>
		
		</div>
	</div>
</body>
</html>