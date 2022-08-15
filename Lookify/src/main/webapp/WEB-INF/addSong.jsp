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
<title>Add Song</title>
</head>
<body>
	<div class="container mt-5 ">
		<div class="row">
			<div class="col-11"></div>
			<div class="col-1"><a class="btn btn-dark rounded-pill" href="/dashboard">Dashboard</a></div>
		</div>
		
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
			<form:errors element="div" path="song.*" cssClass="alert alert-danger"/>
			<form:form action="/songs/new" method="post" modelAttribute="song"> 
		    <p>
		        <form:label path="title" cssClass="form-label text-primary">Title :</form:label>
		        <form:input path="title" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
		        <form:errors path="title" cssClass="invalid-feedback"/>
		    </p>
		    <div class="row">
			    <div class="col">
			        <form:label path="artist" cssClass="form-label text-primary">Artist :</form:label>
			        <form:input path="artist" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
			        <form:errors path="artist" cssClass="invalid-feedback"/>
			    </div>    
			    <div class="col">
			        <form:label path="rating" cssClass="form-label text-primary">Rating (1-10) :</form:label>
			        <form:input path="rating" type="number" min="1" max="10" cssClass="form-control" cssErrorClass="form-control is-invalid"/>
			        <form:errors path="rating" cssClass="invalid-feedback"/>
			    </div>
		    </div>
		    <div class="text-center mt-4 mb-5">
		    	<input type="submit" value="Add Song" class="btn btn-primary rounded-pill"/>
		    </div>
			</form:form>
			</div>
		</div>
		
	</div>
</body>
</html>