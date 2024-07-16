<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page errorPage="MyErrors.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"  
				     url="jdbc:mysql://localhost:3306/excelrafternoondb"  
				     user="root"  password=""/> 
		 
		<sql:query dataSource="${con}" var="rs">  
		SELECT * from demostud;
		</sql:query> 
		
		<table border="1" class="table">
			 <thead class="thead-dark">
			 <tr>
			 <th>Rno</th>
			 <th>Stud Name</th>
			 <th>Age</th>
			 <th>Percentage</th>
			 <th>DELETE</th>
			 </tr>
			 </thead>
			 
		<c:forEach var="t" items="${rs.rows}">
		<tr>
				 <td><c:out value="${t.rno}"></c:out></td>
				 <td><c:out value="${t.sname}"></c:out></td>
				 <td><c:out value="${t.age}"></c:out> </td>
				 <td><c:out value="${t.per}"></c:out></td>
				 <td><a href='deletesingle?rno=<c:out value="${t.rno}"></c:out>' class="btn btn-danger">Delete</a></td> 
				</tr>
		</c:forEach>	    
</body>
</html>