<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>List Adverts</title>
</head>
<body bgcolor="red">
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<a href="${contextPath}/"><input type="submit" value="Logout"></a><br/><br>
	<br>

	<!--                     -->
	
	<table border="1" cellpadding="5" cellspacing="5">
		<tr>
			<td><b>Product Name</b></td>
			<td><b>Product Description</b></td>
			<td><b>Seller Name</b></td>
			<td><b>Category</b></td>
			<td><b>Image</b></td>
			<td><b>Price</b></td>
			<td><b>Options</b></td>
		</tr>
		<c:forEach var="adv" items="${adverts}">
			<form:form action="${contextPath}/cart/insert" method="post" commandName="cart">
				<form:hidden path="id" value="${adv.id}"/>
				<form:hidden path="title" value="${adv.title}"/>
				<form:hidden path="totalprice" value="${adv.price}"/>
				<form:hidden path="category" value="${adv.categories}"/>
				<form:hidden path="filename" value="${adv.filename}"/>
			
				
				<tr>
					<td>${adv.title}</td>
					<td>${adv.message}</td>
					<td>${adv.user.username}</td>
					<td style="width:200px;"><c:forEach var="categ" items="${adv.categories}">
	                    	${categ} , 
	                    </c:forEach></td>
	                <td><img height="150" width="150" src="${adv.filename}" /></td>
	                <td>${adv.price}</td>
	                <td><input type="submit" value="Add to Cart" /></td>
				</tr>
			</form:form>	
		</c:forEach>
	</table>
	
	<!--                     -->
	
	
</body>
</html>