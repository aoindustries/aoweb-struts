<%--
  Copyright 2007 by AO Industries, Inc.,
  816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
  All rights reserved.
--%>
<%@ taglib uri="/WEB-INF/aoweb-struts-skin.tld" prefix="skin" %>

<%@ include file="../add-parents.jsp" %>
<skin:addParent useEncryption="false" path="/clientarea/control/monitor/MonitorIndex.ao">
    <skin:title><bean:message bundle="/clientarea/control/ApplicationResources" key="monitor.index.title"/></skin:title>
    <skin:title><bean:message bundle="/clientarea/control/ApplicationResources" key="monitor.index.navImageAlt"/></skin:title>
</skin:addParent>