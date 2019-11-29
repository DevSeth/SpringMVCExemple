<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>
 
<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>
 
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">Spring 3 MVC Project</a>
	</div>
  </div>
</nav>
 
<div class="jumbotron">
  <div class="container">
	<h1>${title}</h1>
	<p>
		<c:if test="${not empty name}">
			Hello ${name} : ${info} ***

		</c:if>
 
		<c:if test="${empty name}">
			Welcome Welcome! : ${start} ---
		</c:if>

		${message} >>> ${msg}

        <c:if test="${not empty start}">
            <div>start = ${start}</div>
        </c:if>

        <c:if test="${not empty info}">
            <div>info = ${info}</div>
        </c:if>


    </p>
    <p>
		<a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
	</p>
	</div>
</div>
 
<div class="container">
 
  <div class="row">
	<div class="col-md-4">
		<h2>Heading</h2>
		<p>ABC</p>
		<p>
			<a class="btn btn-default" href="hello/jp" role="button">View details</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Heading</h2>
		<p>ABC</p>
		<p>
			<a class="btn btn-default" href="<%=request.getContextPath()%>" role="button">View details</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Heading</h2>
		<p>ABC</p>
		<p>
			<a class="btn btn-default" href="toto/monmessage" role="button">View details</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Heading</h2>
		<p>ABC</p>
		<p>
			<a class="btn btn-default" href="mul/Albert/number/6" role="button">Id</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>Choix</h2>
		<p>123</p>
		<p>
			<a class="btn btn-default" href="param?choice=6" role="button">6</a>
			<a class="btn btn-default" href="param?choice=9" role="button">9</a>
			<a class="btn btn-default" href="param?choice=354" role="button">354</a>
		</p>
	</div>
  </div>
 
 
  <hr>
  <footer>
	<p>&copy; Mkyong.com 2015</p>
  </footer>
</div>
 
<spring:url value="/resources/core/css/hello.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />
 
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
</body>
</html>