<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2007-2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
    <skin:path>/clientarea/accounting/make-payment-new-card.do?accounting=<bean:write scope="request" name="makePaymentNewCardForm" property="accounting" /></skin:path>
    <logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="ROBOTS">NOINDEX</skin:meta></logic:equal>
    <skin:title><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePayment.title" /></skin:title>
    <skin:navImageAlt><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePayment.navImageAlt" /></skin:navImageAlt>
    <skin:keywords><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePayment.keywords" /></skin:keywords>
    <skin:description><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePayment.description" /></skin:description>
    <%@ include file="add-parents.jsp" %>
    <%@ include file="add-siblings.jsp" %>
    <skin:skin>
        <skin:content width="600">
            <skin:contentTitle><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePayment.title" /></skin:contentTitle>
            <skin:contentHorizontalDivider />
            <skin:contentLine>
                <skin:popupGroup>
                    <html:form action="/make-payment-new-card-completed">
                        <skin:lightArea>
                            <bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentNewCard.form.title" />
                            <hr />
                            <logic:present scope="request" name="errorReason">
                                <bean:define scope="request" name="errorReason" id="errorReason" type="java.lang.String" />
                                <bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentStoredCardError.error.description" arg0="<%= errorReason %>" />
                                <hr />
                            </logic:present>
                            <logic:present scope="request" name="declineReason">
                                <bean:define scope="request" name="declineReason" id="declineReason" type="java.lang.String" />
                                <bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentStoredCardDeclined.declined.description" arg0="<%= declineReason %>" />
                                <hr />
                            </logic:present>
                            <bean:define scope="request" name="business" id="business" type="com.aoindustries.aoserv.client.Business" />
                            <table cellspacing="0" cellpadding="2">
                                <bean:define name="makePaymentNewCardForm" id="creditCardForm" />
                                <%@ include file="credit-card-form.jsp" %>
                                <tr>
                                    <td style="white-space:nowrap"><bean:message bundle="/clientarea/accounting/ApplicationResources" key="creditCardForm.required.no" /></td>
                                    <th style='white-space:nowrap' align='left'><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentStoredCard.accountBalance.prompt" /></th>
                                    <td style="white-space:nowrap">
                                        <% int balance = business.getAccountBalance(); %>
                                        <% if(balance==0) { %>
                                            <bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentSelectCard.balance.value.zero" />
                                        <% } else if(balance<0) { %>
                                            <bean:message
                                                bundle="/clientarea/accounting/ApplicationResources" key="makePaymentSelectCard.balance.value.credit"
                                                arg0="<%= com.aoindustries.sql.SQLUtility.getDecimal(-balance) %>"
                                            />
                                        <% } else { %>
                                            <bean:message
                                                bundle="/clientarea/accounting/ApplicationResources" key="makePaymentSelectCard.balance.value.debt"
                                                arg0="<%= com.aoindustries.sql.SQLUtility.getDecimal(balance) %>"
                                            />
                                        <% } %>
                                    </td>
                                    <td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="accountBalance" /></td>
                                </tr>
                                <tr>
                                    <td style="white-space:nowrap"><bean:message bundle="/clientarea/accounting/ApplicationResources" key="creditCardForm.required.yes" /></td>
                                    <th style='white-space:nowrap' align='left'><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentStoredCard.paymentAmount.prompt" /></th>
                                    <td style="white-space:nowrap">$<html:text property="paymentAmount" size="8" /></td>
                                    <td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="paymentAmount" /></td>
                                </tr>
                                <tr>
                                    <td style="white-space:nowrap"><bean:message bundle="/clientarea/accounting/ApplicationResources" key="creditCardForm.required.no" /></td>
                                    <th style='white-space:nowrap' align='left'><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentNewCard.storeCard.prompt" /></th>
                                    <td style='white-space:nowrap' colspan="2">
                                        <html:radio property="storeCard" value=""><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentNewCard.storeCard.no" /></html:radio><br />
                                        <html:radio property="storeCard" value="store"><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentNewCard.storeCard.store" /></html:radio><br />
                                        <html:radio property="storeCard" value="automatic"><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentNewCard.storeCard.automatic" /></html:radio>
                                    </td>
                                </tr>
                                <tr><td style='white-space:nowrap' colspan="4" align="center"><html:submit onclick="this.disabled='true'; this.form.submit(); return false;"><bean:message bundle="/clientarea/accounting/ApplicationResources" key="makePaymentNewCard.field.submit.label" /></html:submit></td></tr>
                            </table>
                        </skin:lightArea>
                    </html:form>
                    <%@ include file="security-policy.jsp" %>
                </skin:popupGroup>
            </skin:contentLine>
        </skin:content>
    </skin:skin>
</html:html>
