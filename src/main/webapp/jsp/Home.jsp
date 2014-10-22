<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
	<head>
		<title>Adress Book BBK</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
		<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript">		
		$(document).ready(function() {
		     
		    $("#contactTable").dataTable( {
		        "bProcessing": false,
		        "bServerSide": false,
		        "sort": "position",
		        "sAjaxSource": "springPaginationDataTables.web",
		        "aoColumns": [
		            { "mData": "name" },
		            { "mData": "surname" },
		            { "mData": "email" },
		            { "mData": "birthDate" },
		            {
		            	bSortable: false,
		                mRender: function (data, type, row) { 
		                	var edit = "<a class='glyphicon glyphicon-list-alt' href='EditContact?id=" + row.id + "'></a>";
		                	var see = "<a class='glyphicon glyphicon-user' href='SeeContact?id=" + row.id + "'></a>";
		                	var del = "<a class='glyphicon glyphicon-trash' href='DeleteContact?id=" + row.id  + "' onclick=\"return confirm('Are you sure you want to delete this contact?')\"></a>";                	
		             		
		                	return edit + " / " + see + " / "+ del; 
		                }
		        
                    }
		        ]
		    } ); 
		
		} );
		
		</script>
		
		
	</head>
	
	<body>		
			<% if(request.getAttribute("contactAddedAlert")!=null){
				if((Boolean) request.getAttribute("contactAddedAlert")) { %>
			<div id = "contactAdded1" class="alert alert-dismissable alert-success">
				<div id="contactAdded2">
	            	<strong>Well done!</strong> You successfully add a contact.
	            </div>
			</div>
			<% }} %>
			
			<% if(request.getAttribute("contactUpdatedAlert")!=null){
				if((Boolean) request.getAttribute("contactUpdatedAlert")) { %>
			<div id = "contactUpdated1" class="alert alert-dismissable alert-success">
				<div id="contactUpdated2">
	            	<strong>Well done!</strong> You successfully updated your contact.
	            </div>
			</div>
			<% }} %>
			
			<form:form action="" method="GET">
			<h2 id="tableTitle">My list of contacts<br><br></h2>
			<table class ="homeTable" width="100%" style="border: 3px; background: rgb(243, 244, 248);"><tr><td>
			    <table id="contactTable" class="display" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>Name</th>
			                <th>Surname</th>
			                <th>Email</th>
			                <th>Birth date</th>
			                <th>Modify / See / Delete</th>
			            </tr>
			        </thead>     
			    </table>
			    </td></tr></table>
			</form:form>
		
	</body>
</html>


