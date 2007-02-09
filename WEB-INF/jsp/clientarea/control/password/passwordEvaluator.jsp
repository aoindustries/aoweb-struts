<%--
  Copyright 2000-2007 by AO Industries, Inc.,
  816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld"       prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld"       prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld"      prefix="logic" %>
<%@ taglib uri="/WEB-INF/aoweb-struts-skin.tld" prefix="skin" %>
<skin:setContentType/>
<html:html lang="true">
    <skin:path>/clientarea/control/password/passwordEvaluator.do</skin:path>
    <skin:title><bean:message bundle="/clientarea/control/ApplicationResources" key="password.passwordEvaluator.title"/></skin:title>
    <skin:navImageAlt><bean:message bundle="/clientarea/control/ApplicationResources" key="password.passwordEvaluator.navImageAlt"/></skin:navImageAlt>
    <skin:keywords><bean:message bundle="/clientarea/control/ApplicationResources" key="password.passwordEvaluator.keywords"/></skin:keywords>
    <skin:description><bean:message bundle="/clientarea/control/ApplicationResources" key="password.passwordEvaluator.description"/></skin:description>
    <%@ include file="addParents.jsp" %>
    <%@ include file="addSiblings.jsp" %>
    <skin:skin onLoad="document.forms['passwordEvaluatorForm'].password.select(); document.forms['passwordEvaluatorForm'].password.focus();">
        <html:javascript staticJavascript='false' bundle="/clientarea/control/ApplicationResources" formName="passwordEvaluatorForm"/>
        <center>
            <skin:lightArea>
                <html:form action="/password/passwordEvaluatorCompleted" onsubmit="return validatePasswordEvaluatorForm(this);">
                    <B><bean:message bundle="/clientarea/control/ApplicationResources" key="password.passwordEvaluator.prompt"/></B>
                    <HR>
                    <bean:message bundle="/clientarea/control/ApplicationResources" key="password.passwordEvaluator.field.password.prompt"/><html:password size="16" property="password" /> <html:errors bundle="/clientarea/control/ApplicationResources" property="password"/>
                    <logic:present scope="request" name="results">
                        <br><br>
                        <TABLE border="0" cellspacing="0" cellpadding="4">
                            <logic:iterate scope="request" name="results" id="result" type="com.aoindustries.aoserv.client.PasswordChecker.Result">
                                <TR>
                                    <TD><bean:message bundle="/aoserv/client/ApplicationResources" key="<%= result.getCategoryKey() %>"/>:</TD>
                                    <TD><bean:message bundle="/aoserv/client/ApplicationResources" key="<%= result.getResultKey() %>" arg0="<%= result.getArg0() %>"/></TD>
                                </TR>
                            </logic:iterate>
                        </TABLE>
                    </logic:present><br>
                    <br>
                    <CENTER><html:submit styleClass='ao_button'><bean:message bundle="/clientarea/control/ApplicationResources" key="password.passwordEvaluator.field.submit.label"/></html:submit></CENTER>
                </html:form>
            </skin:lightArea>
        </center>
    </skin:skin>
</html:html>
