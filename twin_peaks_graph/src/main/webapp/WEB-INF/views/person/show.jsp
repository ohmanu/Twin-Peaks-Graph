<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<c:choose>
		<c:when test="${person != null}">
			<h3>${person.name}</h3>
			<p>PLAYED BY: ${person.played_by}</p>
			<p><img src="${person.photo}" alt="${person.name}"/></p>
			<p>BIO: ${person.bio}</p>
		</c:when>
	
		<c:otherwise>
			<h2>Person cannot be found.</h2>
		</c:otherwise>
	</c:choose>
</t:layout>
