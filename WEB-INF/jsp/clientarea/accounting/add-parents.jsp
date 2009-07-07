<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2007-2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<aoweb:exists path="/WEB-INF/jsp/clientarea/accounting/add-parents.override.jsp">
    <jsp:include page="/WEB-INF/jsp/clientarea/accounting/add-parents.override.jsp" />
</aoweb:exists>
<aoweb:notExists path="/WEB-INF/jsp/clientarea/accounting/add-parents.override.jsp">
    <%@ include file="../add-parents.jsp" %>
    <fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
        <skin:addParent useEncryption="false" path="/clientarea/accounting/index.do">
            <skin:title><fmt:message key="index.title" /></skin:title>
            <skin:title><fmt:message key="index.navImageAlt" /></skin:title>
        </skin:addParent>
    </fmt:bundle>
</aoweb:notExists>
