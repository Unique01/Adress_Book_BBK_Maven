<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
	<head>
		<title>Création d'une nouvelle adresse</title>
		<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />" >
	</head>
	<body>
		<form:form commandName="adress" method="post">
	 
			Numero <form:errors path="number" cssClass="error"/><br />
			<form:input path="number"/><br /><br />
	 
			Rue <form:errors path="street" cssClass="error"/><br />
			<form:input path="street"/><br /><br />
			
			Code postal <form:errors path="postalCode" cssClass="error"/><br />
			<form:input path="postalCode"/><br /><br />
	 
			Ville <form:errors path="city" cssClass="error"/><br />
			<form:input path="city"/><br /><br />
	 
			<input type="submit" value="Valider">
 
		</form:form>
		
		
	</body>
</html>