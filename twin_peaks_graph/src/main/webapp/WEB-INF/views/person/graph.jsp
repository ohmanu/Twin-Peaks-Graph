<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>CHARACTERS</h3>

<c:choose>
	<c:when test="${not empty people}">
		<ul>
			<c:forEach items="${people}" var="relationship">
				<li>
					<h3>${relationship.person1.name} -> ${relationship.person2.name}</h3>
				</li>
			</c:forEach>
		</ul>
	</c:when>
	<c:otherwise>
		<h2>No people in Twin Peaks.</h2>
	</c:otherwise>
</c:choose>
