<%--
  Copyright 2007 by AO Industries, Inc.,
  816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
  All rights reserved.
--%>
<%@ taglib uri="/WEB-INF/struts-bean.tld"       prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld"      prefix="logic" %>
<%@ taglib uri="/WEB-INF/aoweb-struts-skin.tld" prefix="skin" %>

<skin:lightArea>
    <B><bean:message bundle="/signup/ApplicationResources" key="steps.title"/></B>
    <HR>
    <bean:define scope="request" name="dedicatedSignupSelectServerFormComplete" id="dedicatedSignupSelectServerFormComplete" type="java.lang.String"/>
    <bean:define scope="request" name="dedicatedSignupCustomizeServerFormComplete" id="dedicatedSignupCustomizeServerFormComplete" type="java.lang.String"/>
    <bean:define scope="request" name="signupBusinessFormComplete" id="signupBusinessFormComplete" type="java.lang.String"/>
    <bean:define scope="request" name="signupTechnicalFormComplete" id="signupTechnicalFormComplete" type="java.lang.String"/>
    <bean:define scope="request" name="signupBillingInformationFormComplete" id="signupBillingInformationFormComplete" type="java.lang.String"/>
    <bean:define name="stepNumber" id="myStepNumber" type="java.lang.String"/>
    <TABLE border=0 cellspacing=2 cellpadding=0>
        <TR>
            <TD>
                <logic:equal name="myStepNumber" value="1"><bean:message bundle="/signup/ApplicationResources" key="steps.arrow"/></logic:equal>
                <logic:notEqual name="myStepNumber" value="1">&nbsp;</logic:notEqual>
            </TD>
            <TD><bean:message bundle="/signup/ApplicationResources" key="steps.1"/></TD>
            <TD>
                <% if(myStepNumber.equals("7")) { %>
                    <bean:message bundle="/signup/ApplicationResources" key="steps.selectServer.label"/>
                <% } else { %>
                    <A class="ao_dark_link" href="javascript:selectStep('dedicated');"><bean:message bundle="/signup/ApplicationResources" key="steps.selectServer.label"/></A>
                <% } %>
            </TD>
            <TD>
                <logic:equal scope="request" name="dedicatedSignupSelectServerFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.completed"/>
                </logic:equal>
                <logic:notEqual scope="request" name="dedicatedSignupSelectServerFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.incomplete"/>
                </logic:notEqual>
            </TD>
        </TR>
        <TR>
            <TD>
                <logic:equal name="myStepNumber" value="2"><bean:message bundle="/signup/ApplicationResources" key="steps.arrow"/></logic:equal>
                <logic:notEqual name="myStepNumber" value="2">&nbsp;</logic:notEqual>
            </TD>
            <TD><bean:message bundle="/signup/ApplicationResources" key="steps.2"/></TD>
            <TD>
                <% if(myStepNumber.equals("7") || !dedicatedSignupSelectServerFormComplete.equals("true")) { %>
                    <bean:message bundle="/signup/ApplicationResources" key="steps.customizeServer.label"/>
                <% } else { %>
                    <A class="ao_dark_link" href="javascript:selectStep('dedicated2');"><bean:message bundle="/signup/ApplicationResources" key="steps.customizeServer.label"/></A>
                <% } %>
            </TD>
            <TD>
                <logic:equal scope="request" name="dedicatedSignupCustomizeServerFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.completed"/>
                </logic:equal>
                <logic:notEqual scope="request" name="dedicatedSignupCustomizeServerFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.incomplete"/>
                </logic:notEqual>
            </TD>
        </TR>
        <TR>
            <TD>
                <logic:equal name="myStepNumber" value="3"><bean:message bundle="/signup/ApplicationResources" key="steps.arrow"/></logic:equal>
                <logic:notEqual name="myStepNumber" value="3">&nbsp;</logic:notEqual>
            </TD>
            <TD><bean:message bundle="/signup/ApplicationResources" key="steps.3"/></TD>
            <TD>
                <% if(
                        myStepNumber.equals("7")
                        || !dedicatedSignupSelectServerFormComplete.equals("true")
                        || !dedicatedSignupCustomizeServerFormComplete.equals("true")
                   ) { %>
                    <bean:message bundle="/signup/ApplicationResources" key="steps.businessInfo.label"/>
                <% } else { %>
                    <A class="ao_dark_link" href="javascript:selectStep('dedicated3');"><bean:message bundle="/signup/ApplicationResources" key="steps.businessInfo.label"/></A>
                <% } %>
            </TD>
            <TD>
                <logic:equal scope="request" name="signupBusinessFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.completed"/>
                </logic:equal>
                <logic:notEqual scope="request" name="signupBusinessFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.incomplete"/>
                </logic:notEqual>
            </TD>
        </TR>
        <TR>
            <TD>
                <logic:equal name="myStepNumber" value="4"><bean:message bundle="/signup/ApplicationResources" key="steps.arrow"/></logic:equal>
                <logic:notEqual name="myStepNumber" value="4">&nbsp;</logic:notEqual>
            </TD>
            <TD><bean:message bundle="/signup/ApplicationResources" key="steps.4"/></TD>
            <TD>
                <% if(
                        myStepNumber.equals("7")
                        || !dedicatedSignupSelectServerFormComplete.equals("true")
                        || !dedicatedSignupCustomizeServerFormComplete.equals("true")
                        || !signupBusinessFormComplete.equals("true")
                   ) { %>
                    <bean:message bundle="/signup/ApplicationResources" key="steps.technicalInfo.label"/>
                <% } else { %>
                    <A class="ao_dark_link" href="javascript:selectStep('dedicated4');"><bean:message bundle="/signup/ApplicationResources" key="steps.technicalInfo.label"/></A>
                <% } %>
            </TD>
            <TD>
                <logic:equal scope="request" name="signupTechnicalFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.completed"/>
                </logic:equal>
                <logic:notEqual scope="request" name="signupTechnicalFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.incomplete"/>
                </logic:notEqual>
            </TD>
        </TR>
        <TR>
            <TD>
                <logic:equal name="myStepNumber" value="5"><bean:message bundle="/signup/ApplicationResources" key="steps.arrow"/></logic:equal>
                <logic:notEqual name="myStepNumber" value="5">&nbsp;</logic:notEqual>
            </TD>
            <TD><bean:message bundle="/signup/ApplicationResources" key="steps.5"/></TD>
            <TD>
                <% if(
                        myStepNumber.equals("7")
                        || !dedicatedSignupSelectServerFormComplete.equals("true")
                        || !dedicatedSignupCustomizeServerFormComplete.equals("true")
                        || !signupBusinessFormComplete.equals("true")
                        || !signupTechnicalFormComplete.equals("true")
                   ) { %>
                    <bean:message bundle="/signup/ApplicationResources" key="steps.billingInformation.label"/>
                <% } else { %>
                    <A class="ao_dark_link" href="javascript:selectStep('dedicated5');"><bean:message bundle="/signup/ApplicationResources" key="steps.billingInformation.label"/></A>
                <% } %>
            </TD>
            <TD>
                <logic:equal scope="request" name="signupBillingInformationFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.completed"/>
                </logic:equal>
                <logic:notEqual scope="request" name="signupBillingInformationFormComplete" value="true">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.incomplete"/>
                </logic:notEqual>
            </TD>
        </TR>
        <TR>
            <TD>
                <logic:equal name="myStepNumber" value="6"><bean:message bundle="/signup/ApplicationResources" key="steps.arrow"/></logic:equal>
                <logic:notEqual name="myStepNumber" value="6">&nbsp;</logic:notEqual>
            </TD>
            <TD><bean:message bundle="/signup/ApplicationResources" key="steps.6"/></TD>
            <TD>
                <% if(
                        myStepNumber.equals("7")
                        || !dedicatedSignupSelectServerFormComplete.equals("true")
                        || !dedicatedSignupCustomizeServerFormComplete.equals("true")
                        || !signupBusinessFormComplete.equals("true")
                        || !signupTechnicalFormComplete.equals("true")
                        || !signupBillingInformationFormComplete.equals("true")
                   ) { %>
                    <bean:message bundle="/signup/ApplicationResources" key="steps.confirmation.label"/>
                <% } else { %>
                    <A class="ao_dark_link" href="javascript:selectStep('dedicated6');"><bean:message bundle="/signup/ApplicationResources" key="steps.confirmation.label"/></A>
                <% } %>
            </TD>
            <TD>
                <logic:equal name="myStepNumber" value="7">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.completed"/>
                </logic:equal>
                <logic:notEqual name="myStepNumber" value="7">
                    <bean:message bundle="/signup/ApplicationResources" key="steps.incomplete"/>
                </logic:notEqual>
            </TD>
        </TR>
        <TR>
            <TD>
                <logic:equal name="myStepNumber" value="7"><bean:message bundle="/signup/ApplicationResources" key="steps.arrow"/></logic:equal>
                <logic:notEqual name="myStepNumber" value="7">&nbsp;</logic:notEqual>
            </TD>
            <TD><bean:message bundle="/signup/ApplicationResources" key="steps.7"/></TD>
            <TD><bean:message bundle="/signup/ApplicationResources" key="steps.finished.label"/></TD>
            <TD>&nbsp;</TD>
        </TR>
    </TABLE>
</skin:lightArea>
