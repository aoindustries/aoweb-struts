<%--
  Copyright 2007 by AO Industries, Inc.,
  816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" %>
<%@ page buffer="256kb" %>
<%@ page autoFlush="false" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld"       prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld"       prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld"      prefix="logic" %>
<%@ taglib uri="/WEB-INF/aoweb-struts-skin.tld" prefix="skin" %>

<logic:notEmpty scope="request" name="backupOnsiteOption">
    <TR>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signup.notRequired"/></TD>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signupCustomizeManagementConfirmation.backupOnsite.prompt"/></TD>
        <TD><bean:write name="backupOnsiteOption"/></TD>
    </TR>
</logic:notEmpty>
<logic:notEmpty scope="request" name="backupOffsiteOption">
    <TR>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signup.notRequired"/></TD>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signupCustomizeManagementConfirmation.backupOffsite.prompt"/></TD>
        <TD><bean:write name="backupOffsiteOption"/></TD>
    </TR>
</logic:notEmpty>
<logic:notEmpty scope="request" name="backupDvdOption">
    <TR>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signup.notRequired"/></TD>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signupCustomizeManagementConfirmation.backupDvd.prompt"/></TD>
        <TD><bean:write name="backupDvdOption"/></TD>
    </TR>
</logic:notEmpty>
<logic:notEmpty scope="request" name="distributionScanOption">
    <TR>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signup.notRequired"/></TD>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signupCustomizeManagementConfirmation.distributionScan.prompt"/></TD>
        <TD><bean:write name="distributionScanOption"/></TD>
    </TR>
</logic:notEmpty>
<logic:notEmpty scope="request" name="failoverOption">
    <TR>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signup.notRequired"/></TD>
        <TD><bean:message bundle="/signup/ApplicationResources" key="signupCustomizeManagementConfirmation.failover.prompt"/></TD>
        <TD><bean:write name="failoverOption"/></TD>
    </TR>
</logic:notEmpty>
<TR>
    <TD><bean:message bundle="/signup/ApplicationResources" key="signup.notRequired"/></TD>
    <TD><bean:message bundle="/signup/ApplicationResources" key="signupCustomizeManagementConfirmation.totalMonthlyRate.prompt"/></TD>
    <TD>$<bean:write name="totalMonthlyRate"/></TD>
</TR>