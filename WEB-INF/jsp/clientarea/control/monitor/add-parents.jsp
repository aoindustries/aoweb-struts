<%-- aoweb-struts --%>
<%--
  Copyright 2007-2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<%@ include file="../add-parents.jsp" %>
<skin:addParent useEncryption="false" path="/clientarea/control/monitor/MonitorIndex.ao">
    <skin:title><bean:message bundle="/clientarea/control/ApplicationResources" key="monitor.index.title"/></skin:title>
    <skin:title><bean:message bundle="/clientarea/control/ApplicationResources" key="monitor.index.navImageAlt"/></skin:title>
</skin:addParent>
