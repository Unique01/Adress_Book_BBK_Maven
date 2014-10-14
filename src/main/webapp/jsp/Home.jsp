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
		        ]
		    } ); 
		
		} );

		</script>
		
		
	</head>
	
	<body>
		<br/>
		
			<input type="button"  onclick="location.href='/Adress_Book_BBK_Maven/AddContact'" value="New Contact" >
			<input type="button"  onclick="location.href='/Adress_Book_BBK_Maven/AddAdress'" value="New adress" >
			
			<form:form action="" method="GET">
			<h2 >Contacts<br><br></h2>
			<table class ="homeTable" width="100%" style="border: 3px; background: rgb(243, 244, 248);"><tr><td>
			    <table id="contactTable" class="display" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>Name</th>
			                <th>Surname</th>
			                <th>Email</th>
			                <th>Birth date</th>
			                <th>Modify /Associate adresses/ Delete</th>
			            </tr>
			        </thead>     
			    </table>
			    </td></tr></table>
			</form:form>

	</body>
</html>