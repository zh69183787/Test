
<%@ page import="grailstest.Zhoushun" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'zhoushun.label', default: 'Zhoushun')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-zhoushun" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-zhoushun" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'zhoushun.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="loginName" title="${message(code: 'zhoushun.loginName.label', default: 'Login Name')}" />
					
						<g:sortableColumn property="birthDate" title="${message(code: 'zhoushun.birthDate.label', default: 'Birth Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${zhoushunInstanceList}" status="i" var="zhoushunInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${zhoushunInstance.id}">${fieldValue(bean: zhoushunInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: zhoushunInstance, field: "loginName")}</td>
					
						<td><g:formatDate date="${zhoushunInstance.birthDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${zhoushunInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
