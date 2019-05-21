<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Category Form</title>
</head>
<body>
<script type="text/javascript">function ajaxEvent() {

    var xmlHttp;
    try // Firefox, Opera 8.0+, Safari
    {
        xmlHttp = new XMLHttpRequest();
    } catch (e) {
        try // Internet Explorer
        {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {
                alert("Your browser does not support AJAX!");
                return false;
            }
        }
    }

    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {
            document.getElementById("coursediv").innerHTML = xmlHttp.responseText;
        }
    }
    
    var queryString = document.getElementById("queryString").value;

    xmlHttp.open("POST", "../category/ajaxservice?course="+queryString, true);
    xmlHttp.send();
}</script>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<a href="${contextPath}/user/">Seller Home</a><br/>

	<h2>Add a New Category</h2>


	<form:form action="${contextPath}/category/add" method="post" commandName="category">

		<table>
			<tr>
				<td>Category Title:</td>
				<td><form:input path="title" size="30" required="required" id="queryString" onkeyup="ajaxEvent()" /> <font color="red"><form:errors
							path="title" /></font></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Create Category" /></td>
			</tr>
		</table>

	</form:form>

<div id="coursediv">
		
	</div>


</body>
</html>