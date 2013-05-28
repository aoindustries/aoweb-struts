<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2000-2011 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@include file="/_taglibs.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
    <%@include file="add-parents.jsp" %>
    <%@include file="create.meta.jsp" %>
    <skin:skin onload="document.forms['ticketForm'].summary.select(); document.forms['ticketForm'].summary.focus();">
        <skin:content>
            <fmt:bundle basename="com.aoindustries.website.clientarea.ticket.ApplicationResources">
                <skin:contentTitle><fmt:message key="create.title" /></skin:contentTitle>
                <skin:contentHorizontalDivider />
                <skin:contentLine>
                    <logic:present scope="request" name="permissionDenied">
                        <%@include file="../../_permission-denied.jsp" %>
                    </logic:present>
                    <logic:notPresent scope="request" name="permissionDenied">
                        <html:javascript staticJavascript='false' bundle="/clientarea/ticket/ApplicationResources" formName="ticketForm" />
                        <html:form action="/create-completed" onsubmit="return validateTicketForm(this);">
                            <skin:lightArea>
                                <table cellspacing="0" cellpadding="4">
                                    <tr>
                                        <td style="white-space:nowrap"><fmt:message key="TicketForm.field.accounting.prompt" /></td>
                                        <td>
                                            <logic:notEqual name="aoConn" property="businesses.size" value="1">
                                                <html:select property="accounting">
                                                    <logic:empty scope="request" name="ticketForm" property="accounting">
                                                        <html:option value="" />
                                                    </logic:empty>
                                                    <html:optionsCollection name="aoConn" property="businesses.rows" label="accounting" value="accounting" />
                                                </html:select>
                                            </logic:notEqual>
                                            <logic:equal name="aoConn" property="businesses.size" value="1">
                                                <html:hidden property="accounting" write="true" />
                                            </logic:equal>
                                        </td>
                                        <td><html:errors bundle="/clientarea/ticket/ApplicationResources" property="accounting" /></td>
                                    </tr>
                                    <tr>
                                        <td style="white-space:nowrap"><fmt:message key="TicketForm.field.contactEmails.prompt" /></td>
                                        <td><html:textarea property="contactEmails" cols="40" rows="3" /></td>
                                        <td><html:errors bundle="/clientarea/ticket/ApplicationResources" property="contactEmails" /></td>
                                    </tr>
                                    <tr>
                                        <td style="white-space:nowrap"><fmt:message key="TicketForm.field.contactPhoneNumbers.prompt" /></td>
                                        <td><html:textarea property="contactPhoneNumbers" cols="40" rows="3" /></td>
                                        <td><html:errors bundle="/clientarea/ticket/ApplicationResources" property="contactPhoneNumbers" /></td>
                                    </tr>
                                    <tr>
                                        <td style="white-space:nowrap"><fmt:message key="TicketForm.field.clientPriority.prompt" /></td>
                                        <td>
                                            <html:select property="clientPriority">
                                                <html:optionsCollection name="aoConn" property="ticketPriorities.rows" label="priority" value="priority" />
                                            </html:select>
                                        </td>
                                        <td><html:errors bundle="/clientarea/ticket/ApplicationResources" property="clientPriority" /></td>
                                    </tr>
                                    <tr>
                                        <td style="white-space:nowrap"><fmt:message key="TicketForm.field.summary.prompt" /></td>
                                        <td><html:text property="summary" size="60" /></td>
                                        <td><html:errors bundle="/clientarea/ticket/ApplicationResources" property="summary" /></td>
                                    </tr>
                                    <tr>
                                        <td style='white-space:nowrap' colspan="3">
                                            <br />
                                            <fmt:message key="TicketForm.field.details.prompt" /><br />
                                            <html:textarea property="details" cols="80" rows="20" /><br />
                                            <%--<textarea name="details" cols="80" rows="20" wrap="hard"><bean:write scope="request" name="ticketForm" property="details"/></textarea><br />--%>
                                            <html:errors bundle="/clientarea/ticket/ApplicationResources" property="details" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="center">
                                            <br />
                                            <ao:input type="submit"><fmt:message key="create.field.submit.label" /></ao:input>
                                        </td>
                                    </tr>
                                </table>
                            </skin:lightArea>
                        </html:form>
                    </logic:notPresent>
                </skin:contentLine>
            </fmt:bundle>
        </skin:content>
    </skin:skin>
</html:html>