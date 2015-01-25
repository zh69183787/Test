
<%@ page import="grailstest.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-member" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

    <g:form controller="member" method="post" action="search" >
        Team Name: <input type="text" id='teamName' name='teamName'/>
        Name: <input type="text" id='name' name='name'/>
        Gender:
        <g:select id='gender' name='gender' from='${new Member().constraints.gender.inList}' >
        </g:select>
        <input type="submit" value="search"/>
    </g:form>

		<div id="list-member" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'member.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'member.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'member.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'member.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'member.phone.label', default: 'Phone')}" />
					
						<th><g:message code="member.team.label" default="Team" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${memberInstanceList}" status="i" var="memberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${memberInstance.id}">${fieldValue(bean: memberInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: memberInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "team")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${memberInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
