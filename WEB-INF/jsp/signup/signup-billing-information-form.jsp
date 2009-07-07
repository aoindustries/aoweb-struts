<%-- aoweb-struts: Do not edit --%>
<%--
  Copyright 2007-2009 by AO Industries, Inc.,
  7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
  All rights reserved.
--%>
<%@ page language="java" buffer="256kb" autoFlush="true" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<div>
    <input type="hidden" name="selectedStep" value="" />
    <ao:script>
        function selectStep(step) {
            var form = document.forms['signupBillingInformationForm'];
            form.selectedStep.value=step;
            form.submit();
        }
    </ao:script>
    <skin:lightArea>
        <fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
             <table cellpadding="0" cellspacing="0">
                <tr><td colspan="4"><b><fmt:message key="dedicated5.stepLabel" /></b><br /><hr /></td></tr>
                <tr><td colspan="4"><fmt:message key="dedicated5.stepHelp" /><br /><br /></td></tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingContact.prompt" /></td>
                    <td style="white-space:nowrap"><html:text size="32" property="billingContact" maxlength="255" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingContact" /></td>
                </tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingEmail.prompt" /></td>
                    <td style="white-space:nowrap"><html:text size="32" property="billingEmail" maxlength="255" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingEmail" /></td>
                </tr>
                <tr><td colspan="4">&#160;</td></tr>
                <tr><td colspan="4" align='center'>
                    <html:img src="amex.gif" bundle="/signup/ApplicationResources" altKey="dedicated5.image.amex.alt" style="border:1px solid" width="64" height="40" />
                    &#160;&#160;<html:img src="discv.gif" bundle="/signup/ApplicationResources" altKey="dedicated5.image.discv.alt" style="border:1px solid" width="63" height="40" />
                    &#160;&#160;<html:img src="mcard.gif" bundle="/signup/ApplicationResources" altKey="dedicated5.image.mcard.alt" style="border:1px solid" width="64" height="40" />
                    &#160;&#160;<html:img src="visa.gif" bundle="/signup/ApplicationResources" altKey="dedicated5.image.visa.alt" style="border:1px solid" width="64" height="40" />
                </td></tr>
                <tr><td colspan="4">&#160;</td></tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingCardholderName.prompt" /></td>
                    <td style="white-space:nowrap"><html:text size="32" property="billingCardholderName" maxlength="255" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingCardholderName" /></td>
                </tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingCardNumber.prompt" /></td>
                    <td style="white-space:nowrap"><html:text size="32" property="billingCardNumber" maxlength="255" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingCardNumber" /></td>
                </tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingExpirationDate.prompt" /></td>
                    <td style="white-space:nowrap">
                        <html:select property="billingExpirationMonth">
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.none.display" value="" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.jan.display" value="01" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.feb.display" value="02" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.mar.display" value="03" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.apr.display" value="04" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.may.display" value="05" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.jun.display" value="06" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.jul.display" value="07" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.aug.display" value="08" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.sep.display" value="09" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.oct.display" value="10" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.nov.display" value="11" />
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationMonth.dec.display" value="12" />
                        </html:select>&#160;/&#160;<html:select property="billingExpirationYear">
                            <html:option bundle="/signup/ApplicationResources" key="signupBillingInformationForm.billingExpirationYear.none.display" value="" />
                            <html:options name="billingExpirationYears" />
                        </html:select>
                    </td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingExpirationDate" /></td>
                </tr>
                <tr><td colspan="4">&#160;</td></tr>
                <tr><td colspan="4"><fmt:message key="dedicated5.cardAddressHelp" /></td></tr>
                <tr><td colspan="4">&#160;</td></tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingStreetAddress.prompt" /></td>
                    <td style="white-space:nowrap"><html:text size="32" property="billingStreetAddress" maxlength="255" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingStreetAddress" /></td>
                </tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingCity.prompt" /></td>
                    <td style="white-space:nowrap"><html:text size="14" property="billingCity" maxlength="255" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingCity" /></td>
                </tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingState.prompt" /></td>
                    <td style="white-space:nowrap"><html:text size="5" property="billingState" maxlength="255" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingState" /></td>
                </tr>
                <tr>
                    <td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
                    <td style="white-space:nowrap"><fmt:message key="signupBillingInformationForm.billingZip.prompt" /></td>
                    <td style="white-space:nowrap"><html:text size="10" property="billingZip" maxlength="255" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingZip" /></td>
                </tr>
                <tr><td colspan="4">&#160;</td></tr>
                <tr valign='top'>
                    <td style="white-space:nowrap" colspan="2">&#160;</td>
                    <td style="white-space:nowrap"><html:checkbox property="billingUseMonthly" /><fmt:message key="signupBillingInformationForm.billingUseMonthly.value" /><br /><br /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingUseMonthly" /></td>
                </tr>
                <tr valign='top'>
                    <td style="white-space:nowrap" colspan="2">&#160;</td>
                    <td style="white-space:nowrap"><html:checkbox property="billingPayOneYear" /><fmt:message key="signupBillingInformationForm.billingPayOneYear.value" /></td>
                    <td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="billingPayOneYear" /></td>
                </tr>
                <tr><td colspan="4" align="center"><br /><html:submit><fmt:message key="dedicated5.submit.label" /></html:submit><br /><br /></td></tr>
            </table>
        </fmt:bundle>
    </skin:lightArea>
</div>
