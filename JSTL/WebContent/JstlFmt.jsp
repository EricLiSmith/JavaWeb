<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.reflect.Field"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL Fmt</title>
<style type="text/css">
body{
	font-size: 14px; 
}
table {
	border-collapse: collapse;
	border: 1px solid #000000;
	margin-top: 5px; 
}
td {
	border: 1px solid #000000;
	padding: 2px; 
	text-align: center;
	font-size: 12px; 
}
.title td {
	background: #EEEEEE; 
	width: 100px; 
}
</style>
</head>
<body>

	<!-- fmt:requestEncoding -->
	<h2>fmt:requestEncoding</h2>
	<fmt:requestEncoding value="UTF-8" />
	<form action="${ pageContext.request.requestURI }" method="post">
		关键字：<input name="key" />
		<c:out value="${ param.key }" default="请输入关键字"></c:out>
		<br /> <br /> <input type="submit">
	</form>

	<!-- fmt:setLocale -->
	<h2>fmt:setLocale</h2>
	<!-- scope, 宣告Locale作用範圍 -->
	<!-- variant, client端瀏覽器或作業系統代號 -->

	<%
		request.setAttribute("localeList", Locale.getAvailableLocales());
	%>

	<table>
		<tr>
			<th>Locale</th>
			<th>Language</th>
			<th>Date and Time</th>
			<th>Number</th>
			<th>Currency</th>
		</tr>
		<jsp:useBean id="dateLocale" class="java.util.Date"></jsp:useBean>

		<c:forEach var="locale" items="${localeList }">
			<fmt:setLocale value="${locale }" />
			<tr>
				<td align="left">${ locale.displayName }</td>
				<td align="left">${ locale.displayLanguage }</td>
				<td><fmt:formatDate value="${ dateLocale }" type="both" /></td>
				<td><fmt:formatNumber value="10000.5" /></td>
				<td><fmt:formatNumber value="10000.5" type="currency" /></td>
			</tr>
		</c:forEach>
	</table>

	<!-- fmt:timeZone -->
	<h2>fmt:timeZone</h2>
	<!-- 僅對標籤內有效 -->

	<%
		Map<String, TimeZone> hashMap = new HashMap<String, TimeZone>();

		for (String ID : TimeZone.getAvailableIDs()) {
			hashMap.put(ID, TimeZone.getTimeZone(ID));
		}

		request.setAttribute("timeZoneIds", TimeZone.getAvailableIDs());
		request.setAttribute("timeZone", hashMap);
	%>
	<jsp:useBean id="dateTimeZone" class="java.util.Date"></jsp:useBean>

	<fmt:setLocale value="zh_tw" />

	现在时刻：<%=TimeZone.getDefault().getDisplayName()%>
	<fmt:formatDate value="${ dateTimeZone }" type="both" />
	<br />

	<table>
		<tr>
			<th>時區ID</th>
			<th>時間</th>
			<th>现在时间</th>
			<th>时差</th>
		</tr>

		<c:forEach var="ID" items="${ timeZoneIds }" varStatus="status">
			<tr>
				<td>${ ID }</td>
				<td>${ timeZone[ID].displayName }</td>
				<td><fmt:timeZone value="${ ID }">
						<fmt:formatDate value="${ dateTimeZone }" type="both"
							timeZone="${ ID }" />
					</fmt:timeZone></td>
				<td>${ timeZone[ID].rawOffset / 60 / 60 / 1000 }</td>
			</tr>
		</c:forEach>
	</table>

	<!-- fmt:setTimeZone -->
	<h2>fmt:setTimeZone</h2>


	<!-- fmt:bundle, message, param 多國語系  -->
	<h2>fmt:bundle, message, param</h2>
	<!-- bundle -->
	<!-- basename 指定資訊檔名稱, 針對語系載入對應的message_xx.properties -->
	<!-- prefix 縮短key的名稱 -->
	<!-- 僅對標籤內有效 -->

	<!-- message -->
	<!-- var 存放message回傳的資源, 並不會顯示在JSP上 -->
	<!-- scope 決定var作用的範圍 -->
	<!-- bundle 宣告被綁定的資源, 與setBundle tag 一起使用 -->
	<fmt:setLocale value="zh_TW" />
	<fmt:bundle basename="messages">
		<fmt:message key="msg.hello">
			<fmt:param value="Eric"></fmt:param>
		</fmt:message>
		<fmt:message key="msg.greeting"></fmt:message>
	</fmt:bundle>
	<br>
	<fmt:setLocale value="en" />
	<fmt:bundle basename="messages" prefix="msg.">
		<!-- basename 指定資訊檔名稱, 針對語系載入對應的message_xx.properties -->
		<fmt:message key="hello">
			<fmt:param value="Eric"></fmt:param>
		</fmt:message>
		<fmt:message key="greeting"></fmt:message>
	</fmt:bundle>

	<!-- fmt:setBundle -->
	<h2>fmt:setBundle</h2>
	<!-- 對所有資源檔標籤有效 -->
	<fmt:setLocale value="zh_TW" />
	<fmt:setBundle basename="messages" var="resource" scope="request" />

	<fmt:message bundle="${resource}" key="msg.hello">
		<fmt:param>DoDoLong</fmt:param>
	</fmt:message>
	<fmt:message bundle="${resource}" key="msg.greeting"></fmt:message>

	<!-- fmt:formatNumber -->
	<h2>fmt:formatNumber</h2>
	<!-- Number to String -->
	<!-- value 要被格式化的數字 -->
	<!-- type number,currency,percent -->
	<!-- pattern 數字格式,ex:000.00 -->
	<!-- currencyCode 定義貨幣程式碼 -->
	<!-- currencySymbol 輸出貨幣符號 -->
	<!-- groupingUsed 是否輸出分隔符號 ex 1,000,000 -->
	<!-- maxIntegerDigits 整數字元數最大值, 超過則去掉高位 -->
	<!-- minIntegerDigits 整數字元最小值, 不夠則低位補0 -->
	<!-- maxFractionDigits 小數字數的最大值, 超過則四捨五入 -->
	<!-- minFractionDigtis 小數字數的最小值, 不夠則低位補0 -->
	<!-- var 存放格式化後的數字 -->
	<!-- scope var的作用範圍 -->
	
	<%
		Field[] field = Locale.class.getFields();

		List<Locale> localeList = new ArrayList<Locale>();

		for (int i = 0; i < field.length; i++) {
			if (field[i].getType().equals(Locale.class)) {
				localeList.add((Locale) field[i].get(null));
			}
		}

		request.setAttribute("localeList", localeList);

		double[] numbers = { 0, 10000, 55.0, -123.2568 };
		request.setAttribute("numbers", numbers);
	%>

	<fmt:setLocale value="${ param.locale }" />

	当前格式：
	<c:out value="${ param.locale }"
		default="${ pageContext.request.locale } "></c:out><br>

	<c:forEach items="${ localeList }" var="locale">
		<a href="${ pageContext.request.requestURI }?locale=${ locale }">${ locale }</a>
	</c:forEach>

	<table>
		<tr class="title">
			<td>数字原值</td>
			<td>数字格式</td>
			<td>货币格式</td>
			<td>百分数格式</td>
		</tr>

		<c:forEach items="${ numbers }" var="number">
			<tr>
				<td>${ number }</td>
				<td><fmt:formatNumber value="${ number }" type="number"
						maxFractionDigits="4" minIntegerDigits="3" maxIntegerDigits="3"
						minFractionDigits="2" /></td>
				<td><fmt:formatNumber value="${ number }" type="currency" /></td>
				<td><fmt:formatNumber value="${ number }" type="percent" /></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- fmt:parseNumber 解析數字--> 
	<h2>fmt:parseNumber</h2>
	<!-- String to Number -->
	<!--  -->           

</body>
</html>