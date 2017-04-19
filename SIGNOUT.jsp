<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignOut</title>
</head>
<body>
<% session.setAttribute("login", null);
session.invalidate();
%>
         <script type="text/javascript">
    window.onload = function() {
        setTimeout(function() {
            window.location = "index.jsp";
        }, 1);
    };
    
</script>
</body>
</html>