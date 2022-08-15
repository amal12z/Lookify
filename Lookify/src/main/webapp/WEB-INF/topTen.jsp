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
<title>Top Ten</title>
</head>
<body>
	<div class="container mt-5">
	<div class="row mb-5">
		<div class="col-2 text-dark"></div>
		<div class="col-7 text-dark"><h1>Top Ten Songs</h1></div>
		<div class="col-3"><a class="btn btn-dark rounded-pill" href="/dashboard">Dashboard</a></div>
	</div>
	<div class="row">
	<div class="col-2"></div>
	<div class="col-8 text-center rounded alert alert-dark">
	<table class="table table-borderless">
	  <thead>
	    <tr>
	      <th scope="col">Rating</th>
	      <th scope="col">Title</th>
	      <th scope="col">Artist</th>
	    </tr>
	  </thead>
	  <tbody>
	   <c:forEach items="${topTen}" var="song">
	    <tr>
	      <td><c:out value="${song.rating}"/></td>
	      <td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
	      <td><c:out value="${song.artist}"/></td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
	
	</div>
	</div>
	</div>
</body>
</html>



		      
		      







		    
		  