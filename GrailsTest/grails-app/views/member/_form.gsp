<%@ page import="grailstest.Member" %>



<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="member.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="20" required="" value="${memberInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="member.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${memberInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="member.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${memberInstance.constraints.gender.inList}" required="" value="${memberInstance?.gender}" valueMessagePrefix="member.gender"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="member.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${memberInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="member.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${memberInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'team', 'error')} required">
	<label for="team">
		<g:message code="member.team.label" default="Team" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="team" name="team.id" from="${grailstest.Team.list()}" optionKey="id" required="" value="${memberInstance?.team?.id}" class="many-to-one"/>

</div>

