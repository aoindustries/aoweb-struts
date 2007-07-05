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
<skin:setContentType/>
<html:html lang="true">
    <skin:path>/clientarea/accounting/add-credit-card-completed.do</skin:path>
    <skin:title><bean:message bundle="/clientarea/accounting/ApplicationResources" key="addCreditCardCompleted.title"/></skin:title>
    <skin:navImageAlt><bean:message bundle="/clientarea/accounting/ApplicationResources" key="addCreditCardCompleted.navImageAlt"/></skin:navImageAlt>
    <skin:keywords><bean:message bundle="/clientarea/accounting/ApplicationResources" key="addCreditCardCompleted.keywords"/></skin:keywords>
    <skin:description><bean:message bundle="/clientarea/accounting/ApplicationResources" key="addCreditCardCompleted.description"/></skin:description>
    <%@ include file="add-parents.jsp" %>
    <skin:addParent useEncryption="true" path="/clientarea/accounting/credit-card-manager.do">
        <skin:title><bean:message bundle="/clientarea/accounting/ApplicationResources" key="creditCardManager.title"/></skin:title>
        <skin:navImageAlt><bean:message bundle="/clientarea/accounting/ApplicationResources" key="creditCardManager.navImageAlt"/></skin:navImageAlt>
    </skin:addParent>
    <%@ include file="add-siblings.jsp" %>
    <skin:skin>
        <skin:content width="600">
            <skin:contentTitle><bean:message bundle="/clientarea/accounting/ApplicationResources" key="addCreditCardCompleted.title"/></skin:contentTitle>
            <skin:contentHorizontalDivider/>
            <skin:contentLine>
                <logic:present scope="request" name="permissionDenied">
                    <%@ include file="../../permission-denied.jsp" %>
                </logic:present>
                <logic:notPresent scope="request" name="permissionDenied">
                    <skin:lightArea>
                        <bean:message bundle="/clientarea/accounting/ApplicationResources" key="addCreditCardCompleted.successMessage.title"/>
                        <hr>
                        <bean:define scope="request" name="cardNumber" id="cardNumber" type="java.lang.String"/>
                        <bean:message bundle="/clientarea/accounting/ApplicationResources" key="addCreditCardCompleted.successMessage.text" arg0="<%= cardNumber.replace('X', 'x') %>"/><br>
                        <br>
                        <html:link action="/credit-card-manager"><bean:message bundle="/clientarea/accounting/ApplicationResources" key="addCreditCardCompleted.creditCardManager.link"/></html:link>
                    </skin:lightArea>
                </logic:notPresent>
            </skin:contentLine>
        </skin:content>
    </skin:skin>
</html:html>