<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>TOTO title</title>

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<div class="jumbotron">
    <div class="container">
   	<h1>${title}</h1>
        <p>Bienvenue, Numero ${identifiant}, Nom : ${nom}</p>
        <p>Enregistrement effectue ! </p>
    </div>
</div>

<div class="container">
    <p>
        <a class="btn btn-default" href="<%=request.getContextPath()%>" role="button">Retour</a>
    </p>
</div>

</body>
</html