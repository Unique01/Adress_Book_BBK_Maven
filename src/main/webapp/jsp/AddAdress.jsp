<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
	<head>
		<title>Add new adress</title>
		<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />" >
	</head>
	<body>
		<form:form commandName="adress" method="post">
	 
			Phone number <form:errors path="number" cssClass="error"/><br />
			<form:input path="number"/><br /><br />
	 
			Street <form:errors path="street" cssClass="error"/><br />
			<form:input path="street"/><br /><br />
			
			Postal Code <form:errors path="postalCode" cssClass="error"/><br />
			<form:input path="postalCode"/><br /><br />
	 
			City <form:errors path="city" cssClass="error"/><br />
			<form:input path="city"/><br /><br />
	 
			<input type="submit" value="Valider">
 
		</form:form>
		
		
	</body>
</html>