<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String studName=request.getParameter("t1");
int studAge=Integer.parseInt(request.getParameter("t2"));
double studPer=Double.parseDouble(request.getParameter("t3"));
pageContext.setAttribute("studAge", studAge);
pageContext.setAttribute("studName", studName);
pageContext.setAttribute("studPer", studPer);

%>
<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/excelrafternoondb"  
     user="root"  password=""/>  
     
<sql:update dataSource="${con}" var="count">  
INSERT INTO demostud(sname,age,per) VALUES (?,?,?); 
<sql:param value="${studName}" />  
<sql:param value="${studAge}" />  
<sql:param value="${studPer}" />   
</sql:update>  

<c:if test="${count>0}">  
   <h1>Record Inserted</h1>  
</c:if>

</body>



</html>