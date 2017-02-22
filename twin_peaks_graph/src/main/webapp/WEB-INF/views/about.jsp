<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<div class="about">
		<div class="menu">
		<div class="bg">
			<a href="${pageContext.servletContext.contextPath}/"><img class="logo" src="<c:url value='/images/logo.png'/>" alt="Twin Peaks Graph"/></a>
			<div class="instructions">
				<h1>ABOUT</h1>
				<h2>Graph instructions:</h2>
				<p>- Click on node to show character bio.</p>
				<p>- Drag and drop nodes to change their position.</p>
				<p>- Mouse wheel to zoom the graph.</p>
			</div>
			<footer class="footer-about">
				<h2>Powered by:</h2>
				<a href="https://neo4j.com/"><img class="powered" src="<c:url value='/images/neo4j.png'/>" alt="Neo4j"/></a>
				<a href="http://www.cytoscape.org/"><img class="powered" src="<c:url value='/images/cytoscape.png'/>" alt="Cytoscape"/></a>
			</footer>
		</div>
		</div>
	</div>
</t:layout>