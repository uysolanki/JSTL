<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page errorPage="MyErrors.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

int studRno=Integer.parseInt(request.getParameter("rno"));
pageContext.setAttribute("studRno",studRno);

%>
<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/excelrafternoondb"  
     user="root"  password=""/>  
     
<sql:update dataSource="${con}" var="count">  
delete from demostud where rno=?; 
<sql:param value="${studRno}" />  
</sql:update>  

<c:if test="${count>0}">  
   <c:redirect url="/ViewAllStudents.jsp"/>  
</c:if>
</body>
</html>