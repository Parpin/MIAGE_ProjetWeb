<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML>  
<html>  
<head>  
<title>${param.title}</title>  
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/style.css">
</head>  
<body>  
    <jsp:include page="header.jsp"/>  
  
      
    <h1>${param.title}</h1>  
    

    <jsp:include page="menu.jsp"/> 
    <jsp:include page="${param.content}.jsp"/>  
      
    <jsp:include page="footer.jsp"/>  
     
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
      
</body>  
</html>