<%@ page import="grailstest.Zhoushun" %>



<div class="fieldcontain ${hasErrors(bean: zhoushunInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="zhoushun.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="5" required="" value="${zhoushunInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: zhoushunInstance, field: 'loginName', 'error')} required">
	<label for="loginName">
		<g:message code="zhoushun.loginName.label" default="Login Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="loginName" required="" value="${zhoushunInstance?.loginName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: zhoushunInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="zhoushun.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${zhoushunInstance?.birthDate}"  />

</div>

