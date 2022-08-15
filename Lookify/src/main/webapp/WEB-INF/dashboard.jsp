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
<title>Dashboard</title>
</head>
<body>
<div class="container mt-5">
<c:if test="${success != null}"> 
			<div class="alert alert-success text-center">
				<c:out value="${success}"/>
			</div>
		</c:if>
		
		<c:if test="${error != null}"> 
			<div class="alert alert-danger text-center">
				<c:out value="${error}"/>
			</div>
		</c:if>
	<div class="row">
		<div class="col-2"> <a class="btn btn-primary rounded-pill" href="/songs/new">Add New</a> </div>
		<div class="col-2"> <a class="btn btn-dark rounded-pill" href="/topTen">Top Songs</a> </div>
		<div class="col-8">
				<form action="/search" method="post">
				    <div class="row">
				    
					    <div class="col-8">
					        <input type="text" class="form-control" name="artist">
					    </div>
					    
					    <div class="col-4">
				    		<input type="submit" value="Search Artists" class="btn btn-primary rounded-pill"/>
				    	</div> 
				    	
					</div>
				</form>
		</div>
	</div>
	
	
	
	<div class="mt-5">
		<table class="table table-striped text-center">
		  <thead class="table-dark">
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Rating</th>
		      <th scope="col">Actions</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${allSongs}" var="song">
		    <tr>
		      <td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
		      <td><c:out value="${song.rating}"/></td>
		      <td>
		      	<form action="/delete/${song.id}" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" class="btn btn-danger rounded-pill" value="Delete">
				</form> 
		      </td>
		    </tr>
		    
		  </c:forEach>
		  </tbody>
		</table>
	</div>
</div>
</body>
</html>