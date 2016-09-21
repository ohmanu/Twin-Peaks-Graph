<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>CHARACTERS</h3>

<c:choose>
	<c:when test="${not empty people}">
		<ul>
			<c:forEach items="${people}" var="person">
				<li>
					<h3><a href="person/${person.id}">${person.name}</a></h3>
					<p><img src="${person.photo}" alt="${person.name}"/></p>
					<p><a href="delete/${person.id}">delete</a></p>
				</li>
			</c:forEach>
		</ul>
	</c:when>
	<c:otherwise>
		<h2>No people in Twin Peaks.</h2>
	</c:otherwise>
</c:choose>
