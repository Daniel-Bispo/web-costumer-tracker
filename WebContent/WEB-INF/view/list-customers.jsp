<!-- Adiciona suporte para tags do JSTL Core -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>

	<title>List Customers</title>	
	
	<!-- referencia ao css -->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"  />

</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>	
	</div>
	
	<div id="container">
		<div id="content">
			
			<!-- insere o bot�o: Add Customer -->
			<input 
				type="button"
				value="Add Customer"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button"
			/>
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<!-- preenche a tabela com cada customer -->
				<c:forEach var="tempCustomer" items="${customers}">
						
						<!-- insere um link "update" com o id do customer -->
						<c:url var="updateLink" value="/customer/showFormForUpdate">
							<c:param name="customerId" value="${tempCustomer.id}"/>
						</c:url>
						
						<!-- insere um link "delete" com o id do customer -->
						<c:url var="deleteLink" value="/customer/delete">
							<c:param name="customerId" value="${tempCustomer.id}"/>
						</c:url>
						
					<tr>
						<td> ${tempCustomer.firstName} </td>
						<td> ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.email} </td>
						
						<td>
							<!-- mostra o link update -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}" onclick="if(!(confirm('Are you sure want to delete this customer?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>				
			</table>
		</div>
	</div>
</body>

</html>