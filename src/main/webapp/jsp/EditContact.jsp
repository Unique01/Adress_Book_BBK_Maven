<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
	<head>
		<title>Edit contact</title>
		
		<script>
		$(document).ready(
				
				function () {
					$('#btnAddAddress').click(
							function addressFieldsGenerator() {	
						
								var $address = $('#AddressFieldset');
								var num = $('.clonedAddress').length; // there are 4 children inside each address so the prevCloned address * 4 + original
								var newNum = new Number(num + 1);
								var newElem = $address.clone().attr('id',
										'address' + newNum).addClass(
										'clonedAddress');
	
								//set all div id's and the input id's
								newElem.children('div').each(function(i) {
									this.id = 'input' + (newNum * 4 + i);
								});
								
								newElem.find('button').each(function(i) {
									this.id = this.id + (newNum * 2 + i);
								});
	
								newElem.find('input').each(function() {
									this.id = this.id + newNum;
								});	
								
								newElem.find('legend').each(function() {
									this.id = this.id + newNum;
								});			
								
								
								if (newNum = 1) {
									newElem.find("input[id='InputAdressNumber" + newNum + "']").attr('value', "${contact.adressList[1].number}");
									newElem.find("input[id='InputAdressStreet" + newNum + "']").attr('value', "${contact.adressList[1].street}");
									newElem.find("input[id='InputAdressPostal" + newNum + "']").attr('value', "${contact.adressList[1].postalCode}");
									newElem.find("input[id='InputAdressCity" + newNum + "']").attr('value', "${contact.adressList[1].city}");								
								}
								if (newNum = 2) {
									newElem.find("input[id='InputAdressNumber" + newNum + "']").attr('value', "${contact.adressList[2].number}");
									newElem.find("input[id='InputAdressStreet" + newNum + "']").attr('value', "${contact.adressList[2].street}");
									newElem.find("input[id='InputAdressPostal" + newNum + "']").attr('value', "${contact.adressList[2].postalCode}");
									newElem.find("input[id='InputAdressCity" + newNum + "']").attr('value', "${contact.adressList[2].city}");
									
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
							});
					$('#btnDelAddress').click(function deleteAdressField() {
						$('.clonedAddress:last').remove();
						$('#btnAddAddress').removeAttr('disabled');
						if ($('.clonedAddress').length == 0) {
							$('#btnDelAddress').attr('disabled', 'disabled');
						}
					});
					$('#btnDelAddress').attr('disabled', 'disabled');
				});
		</script>

	</head>
	<body>		
		<br />
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="formTitle">Edit the selected Contact</h2>
					<form:form id ="editContactForm" modelAttribute="contact" commandName="contact"
						method="post">
						<div class="form-group">
							<label class="control-label" for="InputName">Name</label>
							<form:errors path="name" cssClass="error" />
							<br />
							<form:input id="InputName" class="form-control"  path="name" />
						</div>
						<div class="form-group">
							<label class="control-label" for="InputSurname">Surname</label>
							<form:errors path="surname" cssClass="error" />
							<form:input id="InputSurname" class="form-control" 
								path="surname" />
						</div>
						<div class="form-group">
							<label class="control-label" for="InputEmail">Email</label>
							<form:errors path="email" cssClass="error" />
							<br />
							<form:input id="InputEmail" class="form-control" 
								path="email" />
						</div>
						<div class="form-group">
							<label class="control-label" for="InputBirthDate">Date
								(dd/mm/yyyy)</label>
							<form:errors path="birthDate" cssClass="error" />
							<br/>
							<form:input id="InputBirthDate" class="form-control" path="birthDate" />
						</div>
						
						<fieldset id="AddressFieldset">
	          				<legend id="AddressLegend" class="AddressTitle">Billing address</legend>
							<div id="AddressFields" class="form-group">
								<div id="AddressUpperDiv" class="col-md-12">
									<div class="col-md-3">
										<label class="control-label" for="InputAdressNumber">Number</label>
										<form:errors path="${adressList[0].number}" cssClass="error" />
										<br />										
										<input id="InputAdressNumber" class="form-control"  value="${contact.adressList[0].number}" />
																				    						
									</div>
									<div class="col-md-9">
										<label class="control-label" for="InputAdressStreet">Street</label>
										<form:errors path="${adressList[0].street}" cssClass="error" />
										<br />
										<input id="InputAdressStreet" class="form-control"  value="${contact.adressList[0].street}" />
									</div>
								</div>
								<br/>
								<div id="AddressLowerDiv" class="col-md-12">
									<div class="col-md-3">
										<label class="control-label" for="InputAdressPostal">Postal Code</label>
										<form:errors path="${adressList[0].postalCode}" cssClass="error" />
										<br />
										<input id="InputAdressPostal" class="form-control"  value="${contact.adressList[0].postalCode}" />
									</div>
									<div class="col-md-6">
										<label class="control-label" for="InputAdressCity">City</label>
										<form:errors path="${adressList[0].city}" cssClass="error" />
										<br />
										<input id="InputAdressCity" class="form-control"  value="${contact.adressList[0].city}" />
									</div>
								</div>
							</div>
							
	
							<div class="text-right" style="padding-right:10px;">
								<button type="button" id="btnAddAddress" class="btn btn-success">Add delivery address</button>
								<button type="button" id="btnDelAddress" class="btn btn-danger">Cancel delivery address</button>
							</div>	
							
						</fieldset>	
							
						<br/>
						<div class="text-right">
							<button type="submit" class="btn btn-success" >Update</button>
							<a href="./"><button type="button" class="btn btn-danger" >Cancel</button></a>		
						</div>										
					</form:form>
					
				</div>
			</div>
		</div>
		
		<c:forEach items="${contact.adressList}" begin="1" var="element"> 
			<script>
				$(document).ready( function( ) { $('#btnAddAddress').click( );} );
			</script>
		</c:forEach>
			
	</body>
</html>