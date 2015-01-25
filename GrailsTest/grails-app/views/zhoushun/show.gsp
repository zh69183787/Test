
<%@ page import="grailstest.Zhoushun" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'zhoushun.label', default: 'Zhoushun')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-zhoushun" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-zhoushun" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list zhoushun">
			
				<g:if test="${zhoushunInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="zhoushun.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${zhoushunInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${zhoushunInstance?.loginName}">
				<li class="fieldcontain">
					<span id="loginName-label" class="property-label"><g:message code="zhoushun.loginName.label" default="Login Name" /></span>
					
						<span class="property-value" aria-labelledby="loginName-label"><g:fieldValue bean="${zhoushunInstance}" field="loginName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${zhoushunInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="zhoushun.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${zhoushunInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:zhoushunInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${zhoushunInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
