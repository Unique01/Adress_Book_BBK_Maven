<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
	<head>
		<title>Edit contact</title>
		<script>
		$(document).ready(
				function setLabelValue() {
					$("#Name").text("${contact.name}");
					$("#Surname").text("${contact.surname}");
					$("#Email").text("${contact.email}");
					$("#Date").text("${contact.birthDate}");
					
					$("#Number").text("${contact.adressList[0].number}");
					$("#Street").text("${contact.adressList[0].street}");
					$("#PostalCode").text("${contact.adressList[0].postalCode}");
					$("#City").text("${contact.adressList[0].city}");
				}
			);
		
		function seeAddressFieldsGenerator() {
				var $address = $('#AddressFieldset');
				var num = $('.clonedAddress').length; 
				var newNum = new Number(num + 1);
				var newElem = $address.clone().attr('id',
						'address' + newNum).addClass(
						'clonedAddress');
	
				//set all div id's and the input id's
				newElem.children('div').each(function(i) {
					this.id = 'input' + (newNum * 4 + i);
				});
				
				newElem.find('label').each(function() {
					this.id = this.id + newNum;
				});	
				
				newElem.find('legend').each(function() {
					this.id = this.id + newNum;
				});			
				
				
				if (newNum = 1) {
					newElem.find("label[id='Number" + newNum + "']").text("${contact.adressList[1].number}");
					newElem.find("label[id='Street" + newNum + "']").text("${contact.adressList[1].street}");
					newElem.find("label[id='PostalCode" + newNum + "']").text("${contact.adressList[1].postalCode}");
					newElem.find("label[id='City" + newNum + "']").text("${contact.adressList[1].city}");								
				}
				if (newNum = 2) {
					newElem.find("label[id='Number" + newNum + "']").text("${contact.adressList[2].number}");
					newElem.find("label[id='Street" + newNum + "']").text("${contact.adressList[2].street}");
					newElem.find("label[id='PostalCode" + newNum + "']").text("${contact.adressList[2].postalCode}");
					newElem.find("label[id='City" + newNum + "']").text("${contact.adressList[2].city}");								
				}
	
				if (num > 0) {
					$('.clonedAddress:last').after(newElem);
				} else {
					$address.after(newElem);
				}
	
				$('#btnDelAddress').removeAttr('disabled');
	
				if (num == 1)
					$('#btnAddAddress').attr('disabled', 'disabled');
				
				$("#AddressLegend1").text("Delivery address");
				$("#AddressLegend2").text("Delivery address");
				$('#btnAddAddress2').hide();
				$('#btnDelAddress3').hide();
				$('#btnAddAddress4').hide();
				$('#btnDelAddress5').hide();
			
		};
				
		</script>
	</head>
	<body>		
		<br />
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="formTitle">Selected Contact informations</h2>
					<form:form id ="editContactForm" modelAttribute="contact" 
						method="GET">
						<div class="form-group">
							<label class="control-label" >Name</label>
							<br />
							<label id="Name" class="form-control"></label>
						</div>
						<div class="form-group">
							<label class="control-label">Surname</label>
							<label id="Surname" class="form-control"></label>
						</div>
						<div class="form-group">
							<label class="control-label" >Email</label>
							<label id="Email" class="form-control"></label>
						</div>
						<div class="form-group">
							<label class="control-label">Date </label>
							<label id="Date" class="form-control"></label>
						</div>
						
						<fieldset id="AddressFieldset">
	          				<legend id="AddressLegend" class="AddressTitle">Billing address</legend>
							<div id="AddressFields" class="form-group">
								<div id="AddressUpperDiv" class="col-md-12">
									<div class="col-md-3">
										<label class="control-label" >Number</label>									
										<label id="Number" class="form-control"></label>																    						
									</div>
									<div class="col-md-9">
										<label class="control-label">Street</label>
										<label id="Street" class="form-control"></label>
									</div>
								</div>
								<br/>
								<div id="AddressLowerDiv" class="col-md-12">
									<div class="col-md-3">
										<label class="control-label">Postal Code</label>
										<label id="PostalCode" class="form-control"></label>
									</div>
									<div class="col-md-6">
										<label class="control-label">City</label>
										<label id="City" class="form-control"></label>
									</div>
								</div>
							</div>								
						</fieldset>	
							
						<br/>
						<div class="text-right">
							<a href="./EditContact?id=${contact.id}"><button type="button" class="btn btn-success" >Modify</button></a>
							<a href="./"><button type="button" class="btn btn-danger" >Back</button></a>		
						</div>										
					</form:form>
					
				</div>
			</div>
		</div>
		
		<c:forEach items="${contact.adressList}" begin="1" var="element"> 
			<script>
				$(document).ready( function( ) { seeAddressFieldsGenerator();} );
			</script>
		</c:forEach>
			
	</body>
</html>