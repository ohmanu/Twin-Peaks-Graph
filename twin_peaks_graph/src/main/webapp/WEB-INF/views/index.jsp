<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<div class="index">
		<div class="menu">
			<h1>TWIN PEAKS GRAPH</h1>
			<img class="logo" src="<c:url value='/images/logo.png'/>" alt="Twin Peaks Graph"/>
			
			<p>
			<a href="about">ABOUT</a>
			<a class="sexual" href="relationship/SEXUAL">SEXUAL</a>
			<a href="relationship/DRUGS">DRUGS</a>
			<a class="fbi" href="relationship/FBI">FBI</a>
			<a class="family" href="relationship/FAMILY">FAMILY</a>
			<a class="friendship" href="relationship/FRIENDSHIP">FRIENDSHIP</a>
			<a class="sheriff" href="relationship/SHERIFF_DEPARTMEN">SHERIFF_DEPARTMEN</a>
			<a class="married" href="relationship/MARRIED">MARRIED</a>
			</p>
			
			<footer class="footer">
				<p>Manuel Casas ©</p>
			</footer>
		</div>
	</div>
</t:layout>