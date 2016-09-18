<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<h2>Create</h2>

<form:form action="save" method="POST" modelAttribute="person">
	<p>
		<form:label path="name">Name</form:label>
		<form:input path="name" />
	</p>
	
	<p>
		<form:label path="played_by">Played by</form:label>
		<form:input path="played_by" />
	</p>
	
	<p>
		<form:label path="photo">Photo url</form:label>
		<form:input path="photo" />
	</p>
	
	<p>
		<form:label path="bio">Bio</form:label>
		<form:textarea path="bio" placeholder="Bio of the Character" cols="50" rows="3" maxlength="10"/>
	</p>
	
	<input type="submit" value="Save Person"/>
</form:form>

