<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<h2>Edit</h2>


<form:select path="people" multiple="false">
	<form:options items="${people}" itemValue="id" itemLabel="name" />
</form:select>