<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h3>Create Event</h3>

<c:if test="${not empty message}">
	<div class="${message.type.cssClass}">${message.text}</div>
</c:if>

<c:url value="/CreateEvent" var="createEventUrl" />
<form:form id="createEvent" action="${createEventUrl}" method="post" modelAttribute="createEventForm">
	<div class="formInfo">
		<s:bind path="*">
			<c:choose>
				<c:when test="${status.error}">
					<div class="error">Unable to create event. Please fix the errors below and resubmit.</div>
				</c:when>
			</c:choose>
		</s:bind>
	</div>
	
	<fieldset>
		<form:label path="eventName">
			Event Name 
			<form:errors path="eventName" cssClass="error" />
		</form:label>
		<form:input path="eventName" />
		<form:label path="eventDescription">
			Event Description 
			<form:errors path="eventDescription" cssClass="error" />
		</form:label>
		<form:input path="eventDescription" />
		<form:label path="startTime">
			Event Start Time 
			<form:errors path="startTime" cssClass="error" />
		</form:label>
		<form:input path="startTime" />
		<form:label path="endTime">
			Event End Time 
			<form:errors path="endTime" cssClass="error" />
		</form:label>
		<form:input path="endTime" />
	</fieldset>
	<p><button type="submit">Create Event</button>
</form:form>