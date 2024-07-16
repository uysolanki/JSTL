<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int userage=Integer.parseInt(request.getParameter("t1"));
pageContext.setAttribute("myage", userage);
application.setAttribute("mynewage", userage);
%>
<c:set var="companyName" scope="session" value="ExcelR"/>  
<h1>Welcome to <c:out value="${companyName}"/></h1>  

<c:set var="income" scope="session" value="13000"/>  
<!--<c:set var="age" value="${myage}"/> --> 
<c:if test="${income > 8000}">  
   <p>My income is: <c:out value="${income}"/><p>  
</c:if>

<c:choose>  
    <c:when test="${mynewage >= 30}">  
      Adult  
    </c:when>  
    <c:when test="${mynewage >= 20}">  
      <h1>Young</h1> 
    </c:when>  
    <c:otherwise>  
       Teenager  
    </c:otherwise>  
</c:choose>  
  
</body>
</html>