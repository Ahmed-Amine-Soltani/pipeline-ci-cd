<html>
<head>
<title>Hello Soltani !!</title>
</head>
<body>
	<h1>Hello Soltani!</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>

	<p><a href='./page1.jsp'>Vers la page 1</a></p>
	<p><a href='./page2.jsp'>Vers la page 2</a></p>


</body>
