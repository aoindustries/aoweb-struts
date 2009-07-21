<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2007-2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<form method="post" action="<ao:url>make-payment-stored-card.do</ao:url>">
    <div>
        <input name="accounting" type="hidden" value="<%= request.getParameter("accounting") %>" />
        <skin:lightArea>
            <fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
                <fmt:message key="makePaymentSelectCard.selectCard.list.title" />
                <hr />
                <table cellspacing="0" cellpadding="2">
                    <tr>
                        <th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.select.header" /></th>
                        <th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.cardType.header" /></th>
                        <th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.cardNumber.header" /></th>
                        <th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.comments.header" /></th>
                    </tr>
                    <logic:iterate scope="request" name="creditCards" id="creditCard" type="com.aoindustries.aoserv.client.CreditCard">
                        <skin:lightDarkTableRow>
                            <td style="white-space:nowrap">
                                <logic:equal scope="request" name="lastPaymentCreditCard" value="<%= creditCard.getProviderUniqueId() %>">
                                    <input type="radio" name="pkey" value="<%= creditCard.getPkey() %>" checked="checked" />
                                </logic:equal>
                                <logic:notEqual scope="request" name="lastPaymentCreditCard" value="<%= creditCard.getProviderUniqueId() %>">
                                    <input type="radio" name="pkey" value="<%= creditCard.getPkey() %>" />
                                </logic:notEqual>
                            </td>
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
                            </td>
                            <td style="white-space:nowrap"><%= creditCard.getCardInfo().replace('X', 'x') %></td>
                            <td style="white-space:nowrap">
                                <logic:notEmpty name="creditCard" property="description">
                                    <ao:write name="creditCard" property="description" />
                                </logic:notEmpty>
                                <logic:empty name="creditCard" property="description">
                                    &#160;
                                </logic:empty>
                            </td>
                        </skin:lightDarkTableRow>
                    </logic:iterate>
                    <skin:lightDarkTableRow>
                        <td style="white-space:nowrap">
                            <logic:equal scope="request" name="lastPaymentCreditCard" value="">
                                <input type="radio" name="pkey" value="" checked="checked" />
                            </logic:equal>
                            <logic:notEqual scope="request" name="lastPaymentCreditCard" value="">
                                <input type="radio" name="pkey" value="" />
                            </logic:notEqual>
                        </td>
                        <td style='white-space:nowrap' colspan="3"><fmt:message key="makePaymentSelectCard.newCard.link" /></td>
                    </skin:lightDarkTableRow>
                    <tr>
                        <td style='white-space:nowrap' colspan="4" align="center">
                            <input
                                type="submit"
                                name="submitButton"
                                value="<fmt:message key="makePaymentSelectCard.field.submit.label" />"
                            />
                        </td>
                    </tr>
                </table>
            </fmt:bundle>
        </skin:lightArea>
        <%@ include file="security-policy.jsp" %>
    </div>
</form>