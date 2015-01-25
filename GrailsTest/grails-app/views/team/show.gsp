
<%@ page import="grailstest.Team" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-team" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-team" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list team">
			
				<g:if test="${teamInstance?.teamName}">
				<li class="fieldcontain">
					<span id="teamName-label" class="property-label"><g:message code="team.teamName.label" default="Team Name" /></span>
					
						<span class="property-value" aria-labelledby="teamName-label"><g:fieldValue bean="${teamInstance}" field="teamName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.foundDate}">
				<li class="fieldcontain">
					<span id="foundDate-label" class="property-label"><g:message code="team.foundDate.label" default="Found Date" /></span>
					
						<span class="property-value" aria-labelledby="foundDate-label"><g:formatDate date="${teamInstance?.foundDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamInstance?.members}">
				<li class="fieldcontain">
					<span id="members-label" class="property-label"><g:message code="team.members.label" default="Members" /></span>
					
						<g:each in="${teamInstance.members}" var="m">
						<span class="property-value" aria-labelledby="members-label"><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:teamInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${teamInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
