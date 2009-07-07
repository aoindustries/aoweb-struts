<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2007-2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<aoweb:exists path="/WEB-INF/jsp/add-parents.jsp">
    <jsp:include page="/WEB-INF/jsp/add-parents.jsp" />
</aoweb:exists>
<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
    <skin:addParent useEncryption="false" path="/signup/SignUpIndex.ao">
        <skin:title><fmt:message key="index.title" /></skin:title>
        <skin:navImageAlt><fmt:message key="index.navImageAlt" /></skin:navImageAlt>
    </skin:addParent>
</fmt:bundle>
