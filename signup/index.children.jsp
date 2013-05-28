<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2007-2011 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@include file="/_taglibs.jsp" %>

<c:set var="activePackageDefinitions" value="${siteSettings.rootAOServConnector.thisBusinessAdministrator.username.business.activePackageDefinitions}"/>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['application']]!=null}">
    <skin:child><%@include file="application.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['virtual']]!=null}">
    <skin:child><%@include file="virtual-hosting.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['virtual_dedicated']]!=null}">
    <skin:child><%@include file="virtual-dedicated-server.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['virtual_managed']]!=null}">
    <skin:child><%@include file="virtual-managed-server.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['dedicated']]!=null}">
    <skin:child><%@include file="dedicated-server.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['managed']]!=null}">
    <skin:child><%@include file="managed-server.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['aoserv']]!=null}">
    <skin:child><%@include file="aoserv.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['backup']]!=null}">
    <skin:child><%@include file="backup.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['colocation']]!=null}">
    <skin:child><%@include file="colocation.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['reseller']]!=null}">
    <skin:child><%@include file="reseller.meta.jsp" %></skin:child>
</c:if>
<c:if test="${activePackageDefinitions[siteSettings.rootAOServConnector.packageCategories.map['sysadmin']]!=null}">
    <skin:child><%@include file="system-administration.meta.jsp" %></skin:child>
</c:if>