<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
    <fmt:bundle basename="com.aoindustries.website.ApplicationResources">
        <skin:path>/set-resource-bundle-media-type.do</skin:path>
        <skin:meta name="ROBOTS">NOINDEX</skin:meta>
        <skin:title><fmt:message key="setResourceBundleMediaType.title" /></skin:title>
        <skin:navImageAlt><fmt:message key="setResourceBundleMediaType.navImageAlt" /></skin:navImageAlt>
        <skin:keywords><fmt:message key="setResourceBundleMediaType.keywords" /></skin:keywords>
        <skin:description><fmt:message key="setResourceBundleMediaType.description" /></skin:description>
        <aoweb:exists path="/WEB-INF/jsp/add-parents.jsp">
            <jsp:include page="/WEB-INF/jsp/add-parents.jsp" />
        </aoweb:exists>
        <aoweb:exists path="/WEB-INF/jsp/add-siblings.jsp">
            <jsp:include page="/WEB-INF/jsp/add-siblings.jsp" />
        </aoweb:exists>
        <skin:skin>
            <skin:content width="600">
                <skin:contentTitle><fmt:message key="setResourceBundleMediaType.title" /></skin:contentTitle>
                <skin:contentHorizontalDivider />
                <skin:contentLine>
                    <skin:lightArea>
                        <b><fmt:message key="setResourceBundleMediaType.header" /></b>
                        <hr />
                        <table border="0" cellspacing="0" cellpadding="2">
                            <tr><th style="text-align:left"><fmt:message key="setResourceBundleMediaType.baseName.label" /></th><td><ao:write scope="request" name="baseName" /></td></tr>
                            <tr><th style="text-align:left"><fmt:message key="setResourceBundleMediaType.key.label" /></th><td><ao:write scope="request" name="key" /></td></tr>
                            <tr><th style="text-align:left"><fmt:message key="setResourceBundleMediaType.mediaType.label" /></th><td><ao:write scope="request" name="mediaType" /></td></tr>
                        </table>
                    </skin:lightArea>
                </skin:contentLine>
            </skin:content>
        </skin:skin>
    </fmt:bundle>
</html:html>