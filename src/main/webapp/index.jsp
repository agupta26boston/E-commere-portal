
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Advert Application Lab8</title>
</head>
<body style="background-color:powderblue;">

	<center><h1="red">Welcome to the MARKETPLACE</h1>
	<h5>Place where you can buy different things for yourself or others</h5><br></center>
	<h3>Please login to continue ahead or if you are a new user kindly Sign Up by pressing the button below</h3>
	<a href="user/register.htm"><input type="submit" class="btn btn-primary" value="Sign Up"></a><br/><br><br>

	<h2>Login</h2>
	<form action="user/login" method="post">
	
		<table>
		
		<tr>
		    <td>User Name:</td>
		    <td><input name="username" size="30" required="required" /></td>
		</tr>
		
		<tr>
		    <td>Password:</td>
		    <td><input type="password" name="password" size="30" required="required"/></td>
		</tr>
		
		<tr>
		    <td colspan="2"><input type="submit" class="btn btn-primary" value="Login" /></td>
		</tr>
		
		
		<tr>
				<td colspan="2">
				<label for="captchaCode" class="prompt">Retype the characters from the picture:</label> 
				<%
					// Adding BotDetect Captcha to the page
					Captcha captcha= Captcha.load(request,"CaptchaObject");
				    captcha.setUserInputID("captchaCode");
				    
				    String captchaHtml= captcha.getHtml();
				    out.write(captchaHtml);
					
				%> 
				<input id="captchaCode" type="text" name="captchaCode" required="required"/>
				</td>
			</tr>
				
				
		</table>

	</form>


</body>
</html>

