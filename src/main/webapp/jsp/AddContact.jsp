<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
	<head>
		<title>Create new contact</title>
	</head>
	<body>
		<form:form modelAttribute="contact" commandName="contact" method="post">
	 
			Name <form:errors path="name" cssClass="error"/><br />
			<form:input path="name"/><br /><br />
	 
			Surname <form:errors path="surname" cssClass="error"/><br />
			<form:input path="surname"/><br /><br />
			
			Email <form:errors path="email" cssClass="error"/><br />
			<form:input path="email"/><br /><br />
	 
			Birth Date (dd/mm/yyyy) <form:errors path="birthDate" cssClass="error"/><br />
			<form:input path="birthDate"/><br /><br />
	 
			<input type="submit" value="Valider">
 
		</form:form>
		
	<div class="container">
      <div class="row">
        <div class="col-md-6">
          <form role="form">
            <div class="form-group">
              <label class="control-label" for="exampleInputEmail1">Name</label>
              <input class="form-control" id="exampleInputEmail1" placeholder="Enter name"
              type="text">
            </div>
            <div class="form-group">
              <label class="control-label" for="exampleInputEmail1">Surname</label>
              <input class="form-control" id="exampleInputEmail1" placeholder="Enter surname"
              type="text">
            </div>
            <div class="form-group">
              <label class="control-label" for="exampleInputEmail1">Email address</label>
              <input class="form-control" id="exampleInputEmail1"
              placeholder="Enter email" type="email">
            </div>
			<div class="input-group date">
				<input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
			</div>
            <button type="submit" class="btn btn-success">Submit</button>
            <button type="submit" class="btn btn-danger">Cancel</button>
          </form>
        </div>
      </div>
    </div>
		
		
	</body>
</html>