<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="com.eric.jstl.bean.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL Core</title>
</head>
<body>
	<!-- c:out -->
	<h2>c:out</h2>
	<!-- default, 預設輸出字串 -->
	<!-- escapeXml 預設為true, 輸出特殊字元 -->
	ation 參數為:
	<c:out value="${param.action} <>&"></c:out>

	<!-- c:if -->
	<h2>c:if</h2>
	<c:if test="${param.action =='add' }">
		<c:out value="This is add action"></c:out>
	</c:if>
	<c:if test="${param.action =='edit' }">
		<c:out value="This is edit action"></c:out>
	</c:if>
	<br />
	<c:if test="1 == 1">false</c:if>
	<c:if test="${ 1 == 1 }">true</c:if>

	<!-- c:choose/when/otherwise -->
	<h2>c:choose/when/otherwise</h2>
	<c:choose>
		<c:when test="${param.action == 'when' }">
			when tag
		</c:when>
		<c:otherwise>
			otherwise tag
		</c:otherwise>
	</c:choose>

	<h2>c:foreach</h2>
	<c:forEach var="num" begin="2" end="100" step="2">
		${ num },
	</c:forEach>

	<h6>foreach list</h6>
	<%
		List<Person> personList = new ArrayList<Person>();

		int i = 1;

		Person person = new Person();
		person.setId(i++);
		person.setName("張三");
		person.setAge(20);
		person.setSex("男");
		person.setAddress("北京市海淀区上地软件园");
		person.setBirthday("2008-08-08");
		person.setMobile("13810080808");
		person.setTelephone("69653234");
		person.setCity("北京");

		personList.add(person);

		Person person2 = new Person();
		person2.setId(i++);
		person2.setName("李四");
		person2.setAge(20);
		person2.setSex("男");
		person2.setAddress("北京市东皇城根锡拉胡同");
		person2.setBirthday("2008-01-01");
		person2.setMobile("13820080808");
		person2.setTelephone("20054879");
		person2.setCity("北京");

		personList.add(person2);

		Person person3 = new Person();
		person3.setId(i++);
		person3.setName("王五");
		person3.setAge(20);
		person3.setSex("男");
		person3.setAddress("北京市东皇城根锡拉胡同");
		person3.setBirthday("2008-01-01");
		person3.setMobile("13820080808");
		person3.setTelephone("20054879");
		person3.setCity("北京");

		personList.add(person3);

		Person person4 = new Person();
		person4.setId(i++);
		person4.setName("王二麻子");
		person4.setAge(20);
		person4.setSex("男");
		person4.setAddress("北京市东皇城根锡拉胡同");
		person4.setBirthday("2008-01-01");
		person4.setMobile("13820080808");
		person4.setTelephone("20054879");
		person4.setCity("北京");

		personList.add(person4);

		Person person5 = new Person();
		person5.setId(i++);
		person5.setName("王二麻子");
		person5.setAge(20);
		person5.setSex("男");
		person5.setAddress("北京市东皇城根锡拉胡同");
		person5.setBirthday("2008-01-01");
		person5.setMobile("13820080808");
		person5.setTelephone("20054879");
		person5.setCity("北京");

		personList.add(person5);

		Person person6 = new Person();
		person6.setId(i++);
		person6.setName("王二麻子");
		person6.setAge(20);
		person6.setSex("男");
		person6.setAddress("北京市东皇城根锡拉胡同");
		person6.setBirthday("2008-01-01");
		person6.setMobile("13820080808");
		person6.setTelephone("20054879");
		person6.setCity("北京");

		personList.add(person6);

		Person person7 = new Person();
		person7.setId(i++);
		person7.setName("王二麻子");
		person7.setAge(20);
		person7.setSex("男");
		person7.setAddress("北京市东皇城根锡拉胡同");
		person7.setBirthday("2008-01-01");
		person7.setMobile("13820080808");
		person7.setTelephone("20054879");
		person7.setCity("北京");

		personList.add(person7);

		request.setAttribute("personList", personList);
	%>

	<table>
		<tr class="title">
			<td>编号</td>
			<td>姓名</td>
			<td>年龄</td>
			<td>性别</td>
			<td>城市</td>
			<td>地址</td>
			<td>生日</td>
			<td>手机</td>
			<td>电话</td>
		</tr>
		<c:forEach items="${ personList }" var="person">
			<tr>
				<td>${ person.id }</td>
				<td>${ person.name }</td>
				<td>${ person.age }</td>
				<td>${ person.sex }</td>
				<td>${ person.city }</td>
				<td>${ person.address }</td>
				<td>${ person.birthday }</td>
				<td>${ person.mobile }</td>
				<td>${ person.telephone }</td>
			</tr>
		</c:forEach>
	</table>

	<br />
	<br />
	<br />

	<table>
		<tr class="title">
			<td>编号</td>
			<td>姓名</td>
			<td>年龄</td>
			<td>性别</td>
			<td>城市</td>
			<td>地址</td>
			<td>生日</td>
			<td>手机</td>
			<td>电话</td>
		</tr>

		<c:forEach items="${ personList }" var="person" varStatus="varStatus">
			<tr bgcolor="${ varStatus.index % 2 == 1 ? '#EFEFEF' : '#FFFFFF' }">
				<td>${ varStatus.current.id }</td>
				<td>${ varStatus.current.name }</td>
				<td>${ varStatus.current.age }</td>
				<td>${ varStatus.current.sex }</td>
				<td>${ varStatus.current.city }</td>
				<td>${ varStatus.current.address }</td>
				<td>${ varStatus.current.birthday }</td>
				<td>${ varStatus.current.mobile }</td>
				<td>${ varStatus.current.telephone }</td>
			</tr>
		</c:forEach>
	</table>

	<h6>foreach map</h6>

	<%
		Map<String, String> map = new HashMap<>();
		map.put("One", "01");
		map.put("Two", "02");
		map.put("Three", "03");
		map.put("Four", "04");
		map.put("Five", "05");
		map.put("Six", "06");

		request.setAttribute("map", map);
	%>
	<table>
		<tr>
			<td>Key</td>
			<td>Value</td>
		</tr>
		<c:if test="${map != null}">map is not null</c:if>
		<c:if test="${map == null}">map is null</c:if>

		<c:forEach var="item" items="${ map }">
			<tr>
				<td>${item.key }</td>
				<td>${item.value }</td>
			</tr>
		</c:forEach>
	</table>

	<!-- c:forTokens -->
	<h2>c:forTokens</h2>
	<!-- items, 字串內容 -->
	<!-- delims, 切割字元 -->
	<c:forTokens var="item" items="One;Two;Three;Four" delims=";">
		<p>${item }</p>
	</c:forTokens>

	<!-- c:set -->
	<h2>c:set</h2>
	<!-- var, can only Integer, Double, Float, String -->
	<!-- scope, Seesion, request, page, application, Default is page -->
	<!-- target, 只接受EL運算式, 與var不能同時使用, target與property是一起使用 -->
	<!-- property 若target為Jave Bean則property為Bean的一個屬性, 若不存在會拋錯, 若target為Map則property為Key的屬性-->

	<c:set var="totalCount" value="${totalCount +1 }" scope="application"></c:set>
	<c:set var="count" value="${count +1 }" scope="session"></c:set>

	WebsiteTotalCount : ${totalCount }
	<br> Your Access number : ${count }
	<br>

	<%
		Person personProperty = new Person();
		personProperty.setName("test c:set property, is bean name");
		Map<String, String> mapProperty = new HashMap<>();
		mapProperty.put("name", "test c:set property, is map name");

		request.setAttribute("person", personProperty);
		request.setAttribute("mapProperty", mapProperty);
	%>
	<c:set target="${ person }" property="name" value="${ person.name }" />
	${ person.name }

	<c:set target="${ mapProperty }" property="name"
		value="${ mapProperty.name }" />
	${ mapProperty.name }

	<!-- c:remove -->
	<!-- 與c:set相反 -->
	<!-- 僅var與scope兩個屬性 -->
	<h2>c:remove</h2>
	<%
		request.setAttribute("somemap", new HashMap<>());
	%>

	<c:remove var="somemap" />

	${somemap == null ? 'somemap is remove' : 'somemap is not remove'}

	<!-- c:catch -->
	<h2>c:catch</h2>

	<c:catch var="e">
		<c:set target="someBean" property="someProperty" value="Some Value"></c:set>
	</c:catch>

	<c:if test="${ e != null }">
		程式拋出了例外 原因: ${e.message }
	</c:if>

	<!-- c:import -->
	<h2>c:import</h2>
	<!-- charEncoding, defalut is ISO-8859-1 -->
	<!-- var, 將import進來的網頁存到var且為String -->
	<!-- varReader, 將import進來的網頁存到varReader, 供其他JSTL Tag使用, 不能與var同時使用 -->
	<!-- context, 若設定, 則url與context都只能用/開頭, 且只能指定本地端的網頁, context則是網頁的Path -->

	<c:import url="https://google.com.tw"></c:import>

	<!-- c:url -->
	<!-- 類似import -->
	<h2>c:url</h2>
	<c:url value="/images/bg.gif">
	</c:url>
</body>
</html>