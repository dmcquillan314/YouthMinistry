<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>

<form action="<c:url value="/signin/authenticate"/>" id="signin" method="POST">
	<div class="formInfo">
  		<c:if test="${param.error eq 'bad_credentials'}">
  		<div class="error">
  			Your sign in information was incorrect.
  			Please try again or <a href="<c:url value="/signup" />">sign up</a>.
  		</div>
 	 	</c:if>
 	 	<c:if test="${param.error eq 'multiple_users'}">
 	 	<div class="error">
 	 		Multiple local account are connected to the provider account.
 	 		Try again with a different provider or with your username and password.
 	 	</div>
 	 	</c:if>
	</div>
	<fieldset>
		<label for="login">Username</label>
		<input id="login" name="j_username" type="text" size="25" <c:if test="${not empty signinErrorMessage}">value="${SPRING_SECURITY_LAST_USERNAME}"</c:if> />
		<label for="password">Password</label>
		<input id="password" name="j_password" type="password" size="25" />	
	</fieldset>
	<p>Some test user/password pairs you may use are:</p>
	<ul>
		<li>dmcquillan/test</li>
		<li>gbelgard/test</li>
		<li>test/test</li>
	</ul>
	<button type="submit">Sign In</button>
</form>

	<h3>Sign in via a provider:</h3>
	<p>(Uses SocialAuthenticationFilter)</p>

	<!-- FACEBOOK SIGNIN -->
    <p><a href="<c:url value="/auth/facebook"/>"><img src="<c:url value="/resources/social/facebook/sign-in-with-facebook.png"/>" border="0"/></a><br/></p>