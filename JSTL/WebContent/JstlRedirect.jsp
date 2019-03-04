<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- c:redirect -->
	<!-- context, 若設定, 則url與context都只能用/開頭, 且只能指定本地端的網頁, context則是網頁的Path -->
	
	<!-- redirect與import可以帶param -->
	
	<h2>c:redirect</h2>
	<c:redirect url="/JstlCore.jsp">
		<c:param name="action" value="add"/>
		<c:param name="chinaword" value="中文字"/>	
	</c:redirect>
	
</body>
</html> 