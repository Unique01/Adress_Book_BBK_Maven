<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
	<head>
		<title>Création d'un nouveau contact</title>
		<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />" >
	</head>
	<body>
		<form:form commandName="contact" method="post">
	 
			Nom <form:errors path="name" cssClass="error"/><br />
			<form:input path="name"/><br /><br />
	 
			Prenom <form:errors path="surname" cssClass="error"/><br />
			<form:input path="surname"/><br /><br />
			
			Email <form:errors path="email" cssClass="error"/><br />
			<form:input path="email"/><br /><br />
	 
			Date de naissance (dd/mm/yyyy) <form:errors path="birthDate" cssClass="error"/><br />
			<form:input path="birthDate"/><br /><br />
	 
			<input type="submit" value="Valider">
 
		</form:form>
		
		
	</body>
</html>