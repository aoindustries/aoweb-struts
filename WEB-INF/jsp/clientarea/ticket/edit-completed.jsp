<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2000-2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
    <fmt:bundle basename="com.aoindustries.website.clientarea.ticket.ApplicationResources">
        <skin:path>/clientarea/ticket/edit.do?pkey=<ao:write scope="request" name="ticket" property="pkey" /></skin:path>
        <skin:title><fmt:message key="edit.title" /></skin:title>
        <skin:navImageAlt><fmt:message key="edit.navImageAlt" /></skin:navImageAlt>
        <skin:keywords><fmt:message key="edit.keywords" /></skin:keywords>
        <skin:description><fmt:message key="edit.description" /></skin:description>
        <jsp:include page="add-parents.jsp" />
        <jsp:include page="add-siblings.jsp" />
        <skin:skin>
            <skin:content>
                <skin:contentTitle><fmt:message key="edit.title" /></skin:contentTitle>
                <skin:contentHorizontalDivider />
                <skin:contentLine>
                    <logic:present scope="request" name="permissionDenied">
                        <%@ include file="../../permission-denied.jsp" %>
                    </logic:present>
                    <logic:notPresent scope="request" name="permissionDenied">
                        <skin:lightArea>
                            <fmt:message key="edit-completed.ticketChanges" />
                            <hr />
                            <ul>
                                <logic:equal scope="request" name="businessUpdated" value="true">
                                    <li><fmt:message key="edit-completed.businessUpdated" /></li>
                                </logic:equal>
                                <logic:equal scope="request" name="contactEmailsUpdated" value="true">
                                    <li><fmt:message key="edit-completed.contactEmailsUpdated" /></li>
                                </logic:equal>
                                <logic:equal scope="request" name="contactPhoneNumbersUpdated" value="true">
                                    <li><fmt:message key="edit-completed.contactPhoneNumbersUpdated" /></li>
                                </logic:equal>
                                <logic:equal scope="request" name="clientPriorityUpdated" value="true">
                                    <li><fmt:message key="edit-completed.clientPriorityUpdated" /></li>
                                </logic:equal>
                                <logic:equal scope="request" name="summaryUpdated" value="true">
                                    <li><fmt:message key="edit-completed.summaryUpdated" /></li>
                                </logic:equal>
                                <logic:equal scope="request" name="annotationAdded" value="true">
                                    <li><fmt:message key="edit-completed.annotationAdded" /></li>
                                </logic:equal>
                                <logic:equal scope="request" name="nothingChanged" value="true">
                                    <li><fmt:message key="edit-completed.nothingChanged" /></li>
                                </logic:equal>
                            </ul>
                            <fmt:message key="edit-completed.index.backTo" /><html:link action="/index"><fmt:message key="edit-completed.index.link" /></html:link>
                        </skin:lightArea>
                    </logic:notPresent>
                </skin:contentLine>
            </skin:content>
        </skin:skin>
    </fmt:bundle>
</html:html>