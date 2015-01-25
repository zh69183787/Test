<%@ page import="grailstest.Team" %>



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'teamName', 'error')} required">
	<label for="teamName">
		<g:message code="team.teamName.label" default="Team Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="teamName" maxlength="50" required="" value="${teamInstance?.teamName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'foundDate', 'error')} required">
	<label for="foundDate">
		<g:message code="team.foundDate.label" default="Found Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="foundDate" precision="day"  value="${teamInstance?.foundDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="team.members.label" default="Members" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teamInstance?.members?}" var="m">
    <li><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="member" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'member.label', default: 'Member')])}</g:link>
</li>
</ul>


</div>

