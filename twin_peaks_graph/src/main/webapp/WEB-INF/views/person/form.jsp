<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<h2>Person Form</h2>
	
	<form:form action="/twin-peaks-graph/save" method="POST" modelAttribute="person">		
			<form:hidden path="id" />
		<p>
			<form:label path="name">Name: </form:label>
			<form:input path="name" />
		</p>
		
		<p>
			<form:label path="played_by">Played by: </form:label>
			<form:input path="played_by" />
		</p>
		
		<p>
			<form:label path="photo">Photo: </form:label>
			<form:input path="photo" />
		</p>
		
		<p>
			<form:label path="bio">Bio: </form:label>
			<form:textarea path="bio" placeholder="Bio of the Character" cols="50" rows="3"/>
		</p>
		
		<input type="submit" value="Save"/>
	</form:form>
</t:layout>