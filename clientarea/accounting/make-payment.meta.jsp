<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2007-2011 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@include file="/_taglibs.jsp" %>

<fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
    <skin:path>/clientarea/accounting/make-payment.do</skin:path>
    <skin:encrypt>true</skin:encrypt>
    <logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="ROBOTS">NOINDEX</skin:meta></logic:equal>
    <skin:title><fmt:message key="makePayment.title" /></skin:title>
    <skin:navImageAlt><fmt:message key="makePayment.navImageAlt" /></skin:navImageAlt>
    <skin:keywords><fmt:message key="makePayment.keywords" /></skin:keywords>
    <skin:description><fmt:message key="makePayment.description" /></skin:description>
</fmt:bundle>