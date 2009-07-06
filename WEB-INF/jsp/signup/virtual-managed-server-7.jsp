<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2007-2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@ page import="com.aoindustries.util.EncodingUtils" %>
<%@ page import="com.aoindustries.util.StringUtility" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
    <skin:path>/signup/virtual-managed-server-7.do</skin:path>
    <skin:title><bean:message bundle="/signup/ApplicationResources" key="virtualManaged.title" /></skin:title>
    <skin:navImageAlt><bean:message bundle="/signup/ApplicationResources" key="virtualManaged.navImageAlt" /></skin:navImageAlt>
    <skin:keywords><bean:message bundle="/signup/ApplicationResources" key="virtualManaged.keywords" /></skin:keywords>
    <skin:description><bean:message bundle="/signup/ApplicationResources" key="virtualManaged.description" /></skin:description>
    <%@ include file="add-parents.jsp" %>
    <%@ include file="add-siblings.jsp" %>
    <skin:skin>
        <skin:content width="600">
            <skin:contentTitle><bean:message bundle="/signup/ApplicationResources" key="virtualManaged.title" /></skin:contentTitle>
            <skin:contentHorizontalDivider />
            <skin:contentLine>
                <ao:script>
                    function selectStep(step) {
                             if(step=="virtual-managed-server")   window.location.href=<ao:url>virtual-managed-server.do</ao:url>;
                        else if(step=="virtual-managed-server-2") window.location.href=<ao:url>virtual-managed-server-2.do</ao:url>;
                        else if(step=="virtual-managed-server-3") window.location.href=<ao:url>virtual-managed-server-3.do</ao:url>;
                        else if(step=="virtual-managed-server-4") window.location.href=<ao:url>virtual-managed-server-4.do</ao:url>;
                        else if(step=="virtual-managed-server-5") window.location.href=<ao:url>virtual-managed-server-5.do</ao:url>;
                        else if(step=="virtual-managed-server-6") window.location.href=<ao:url>virtual-managed-server-6.do</ao:url>;
                    }
                </ao:script>
                <bean:define toScope="request" type="java.lang.String" id="stepNumber" value="7" />
                <bean:define type="java.lang.String" id="actionPrefix" toScope="request" value="virtual-managed-server" />
                <%@ include file="managed-server-steps.jsp" %>
                <br />
                <form action="<ao:url>virtual-managed-server-7-completed.do</ao:url>" method="post">
                    <%@ include file="managed-server-confirmation.jsp" %>
                </form>
            </skin:contentLine>
        </skin:content>
    </skin:skin>
</html:html>
