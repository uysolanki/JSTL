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
		<form action="ViewSingleStudent.jsp" method="get">
		Enter Rno : <input type="text" name="t1"> <br>
		<input type="submit" name="s1" value="FETCH RECORD"> <br>
		</form>
		
		<%
		if(request.getParameter("s1") !=null){
		int studRno=Integer.parseInt(request.getParameter("t1"));
		pageContext.setAttribute("studRno", studRno);
		%>
		
		<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"  
				     url="jdbc:mysql://localhost:3306/excelrafternoondb"  
				     user="root"  password=""/> 
		 
		<sql:query dataSource="${con}" var="rs">  
		SELECT * from demostud where rno=?;  
		<sql:param value="${studRno}" />  
		</sql:query> 
		
		<c:forEach var="t" items="${rs.rows}">
		<c:out value="${t.rno}"></c:out> <br>
		<c:out value="${t.sname}"></c:out> <br>
		<c:out value="${t.age}"></c:out> <br>
		<c:out value="${t.per}"></c:out> <br>
		</c:forEach>	    			 
			
		<%}
		%>
</body>
</html>