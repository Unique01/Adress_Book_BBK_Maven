<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
	<head>
		<title>Carnet d'adresse BBK</title>
		
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
		
			<input type="button"  onclick="location.href='/Adress_Book_BBK_Maven/AddContact'" value="Nouveau contact" >
			<input type="button"  onclick="location.href='/Adress_Book_BBK_Maven/AddAdress'" value="Nouvelle adresse" >
			
			<form:form action="" method="GET">
			<h2 >Contactes<br><br></h2>
			<table width="70%" style="border: 3px;background: rgb(243, 244, 248);"><tr><td>
			    <table id="contactTable" class="display" cellspacing="0" width="100%">
			        <thead>
			            <tr>
			                <th>Nom</th>
			                <th>Prenom</th>
			                <th>Email</th>
			                <th>Date de naissance</th>
			                <th>Modifier /Associer des adresses/ Supprimer</th>
			            </tr>
			        </thead>     
			    </table>
			    </td></tr></table>
			</form:form>

	</body>
</html>