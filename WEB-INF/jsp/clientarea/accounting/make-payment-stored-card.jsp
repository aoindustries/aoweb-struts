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
    <fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
        <skin:path>/clientarea/accounting/make-payment-stored-card.do?accounting=<ao:write scope="request" name="makePaymentStoredCardForm" property="accounting" />&amp;pkey=<ao:write scope="request" name="makePaymentStoredCardForm" property="pkey" /></skin:path>
        <logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="ROBOTS">NOINDEX</skin:meta></logic:equal>
        <skin:title><fmt:message key="makePayment.title" /></skin:title>
        <skin:navImageAlt><fmt:message key="makePayment.navImageAlt" /></skin:navImageAlt>
        <skin:keywords><fmt:message key="makePayment.keywords" /></skin:keywords>
        <skin:description><fmt:message key="makePayment.description" /></skin:description>
        <%@ include file="add-parents.jsp" %>
        <%@ include file="add-siblings.jsp" %>
        <skin:skin onload="document.forms['makePaymentStoredCardForm'].paymentAmount.select(); document.forms['makePaymentStoredCardForm'].paymentAmount.focus();">
            <skin:content width="600">
                <skin:contentTitle><fmt:message key="makePayment.title" /></skin:contentTitle>
                <skin:contentHorizontalDivider />
                <skin:contentLine>
                    <html:form action="make-payment-stored-card-completed">
                        <div>
                            <html:hidden property="pkey" />
                            <skin:lightArea>
                                <fmt:message key="makePaymentStoredCard.amount.title" />
                                <hr />
                                <bean:define scope="request" name="creditCard" id="creditCard" type="com.aoindustries.aoserv.client.CreditCard" />
                                <bean:define scope="request" name="business" id="business" type="com.aoindustries.aoserv.client.Business" />
                                <table cellspacing="0" cellpadding="2">
                                    <tr>
                                        <th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.business.prompt" /></th>
                                        <td style="white-space:nowrap"><html:hidden property="accounting" write="true" /></td>
                                        <td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="accounting" /></td>
                                    </tr>
                                    <tr>
                                        <th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.card.prompt" /></th>
                                        <td style="white-space:nowrap">
                                            <% String cardInfo = creditCard.getCardInfo(); %>
                                            <% if(cardInfo.startsWith("34") || cardInfo.startsWith("37")) { %>
                                                <html:img src="amex.gif" bundle="/clientarea/accounting/ApplicationResources" altKey="creditCardManager.image.amex.alt" style="border:1px solid" width="64" height="40" />
                                            <% } else if(cardInfo.startsWith("60")) { %>
                                                <html:img src="discv.gif" bundle="/clientarea/accounting/ApplicationResources" altKey="creditCardManager.image.discv.alt" style="border:1px solid" width="63" height="40" />
                                            <% } else if(cardInfo.startsWith("51") || cardInfo.startsWith("52") || cardInfo.startsWith("53") || cardInfo.startsWith("54") || cardInfo.startsWith("55")) { %>
                                                <html:img src="mcard.gif" bundle="/clientarea/accounting/ApplicationResources" altKey="creditCardManager.image.mcard.alt" style="border:1px solid" width="64" height="40" />
                                            <% } else if(cardInfo.startsWith("4")) { %>
                                                <html:img src="visa.gif" bundle="/clientarea/accounting/ApplicationResources" altKey="creditCardManager.image.visa.alt" style="border:1px solid" width="64" height="40" />
                                            <% } else { %>
                                                <fmt:message key="creditCardManager.creditCard.cardType.unknown" />
                                            <% } %>
                                            <%= creditCard.getCardInfo().replace('X', 'x') %>
                                        </td>
                                        <td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="creditCard" /></td>
                                    </tr>
                                    <tr>
                                        <th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.cardComment.prompt" /></th>
                                        <td style="white-space:nowrap">
                                            <logic:notEmpty name="creditCard" property="description">
                                                <ao:write name="creditCard" property="description" />
                                            </logic:notEmpty>
                                            <logic:empty name="creditCard" property="description">
                                                &#160;
                                            </logic:empty>
                                        </td>
                                        <td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="cardComment" /></td>
                                    </tr>
                                    <tr>
                                        <th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.accountBalance.prompt" /></th>
                                        <td style="white-space:nowrap">
                                            <% int balance = business.getAccountBalance(); %>
                                            <% if(balance==0) { %>
                                                <fmt:message key="makePaymentSelectCard.balance.value.zero" />
                                            <% } else if(balance<0) { %>
                                                <fmt:message key="makePaymentSelectCard.balance.value.credit">
                                                    <fmt:param><c:out value="<%= com.aoindustries.sql.SQLUtility.getDecimal(-balance) %>" /></fmt:param>
                                                </fmt:message>
                                            <% } else { %>
                                                <fmt:message key="makePaymentSelectCard.balance.value.debt">
                                                    <fmt:param><c:out value="<%= com.aoindustries.sql.SQLUtility.getDecimal(balance) %>" /></fmt:param>
                                                </fmt:message>
                                            <% } %>
                                        </td>
                                        <td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="accountBalance" /></td>
                                    </tr>
                                    <tr>
                                        <th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.paymentAmount.prompt" /></th>
                                        <td style="white-space:nowrap">$<html:text property="paymentAmount" size="8" /></td>
                                        <td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="paymentAmount" /></td>
                                    </tr>
                                    <tr>
                                        <td style="white-space:nowrap">&#160;</td>
                                        <td style='white-space:nowrap' colspan="2"><html:submit onclick="this.disabled='true'; this.form.submit(); return false;"><fmt:message key="makePaymentStoredCard.submit.label" /></html:submit></td>
                                    </tr>
                                </table>
                            </skin:lightArea>
                        </div>
                    </html:form>
                    <%@ include file="security-policy.jsp" %>
                </skin:contentLine>
            </skin:content>
        </skin:skin>
    </fmt:bundle>
</html:html>