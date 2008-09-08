<%--
  Copyright 2007-2008 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" %>
<%@ page buffer="256kb" %>
<%@ page autoFlush="true" %>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/aoweb-struts-skin.tld" prefix="skin" %>

<TR>
    <TD><bean:message bundle="/signup/ApplicationResources" key="signup.notRequired"/></TD>
    <TD><bean:message bundle="/signup/ApplicationResources" key="signupSelectServerForm.packageDefinition.prompt"/></TD>
    <TD><bean:write scope="request" name="packageDefinition" property="display"/></TD>
</TR>
