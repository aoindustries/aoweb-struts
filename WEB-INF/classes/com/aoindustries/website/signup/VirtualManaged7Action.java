package com.aoindustries.website.signup;

/*
 * Copyright 2007 by AO Industries, Inc.,
 * 816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.aoserv.client.AOServConnector;
import com.aoindustries.aoserv.client.PackageDefinition;
import com.aoindustries.aoserv.client.PackageDefinitionLimit;
import com.aoindustries.sql.SQLUtility;
import com.aoindustries.website.RootAOServConnector;
import com.aoindustries.website.Skin;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;

/**
 * @author  AO Industries, Inc.
 */
public class VirtualManaged7Action extends VirtualManagedStepAction {

    public ActionForward executeVirtualManagedStep(
        ActionMapping mapping,
        HttpServletRequest request,
        HttpServletResponse response,
        Locale locale,
        Skin skin,
        SignupSelectServerForm signupSelectServerForm,
        boolean signupSelectServerFormComplete,
        SignupCustomizeServerForm signupCustomizeServerForm,
        boolean signupCustomizeServerFormComplete,
        SignupCustomizeManagementForm signupCustomizeManagementForm,
        boolean signupCustomizeManagementFormComplete,
        SignupBusinessForm signupBusinessForm,
        boolean signupBusinessFormComplete,
        SignupTechnicalForm signupTechnicalForm,
        boolean signupTechnicalFormComplete,
        SignupBillingInformationForm signupBillingInformationForm,
        boolean signupBillingInformationFormComplete
    ) throws Exception {
        if(!signupSelectServerFormComplete) return mapping.findForward("virtual-managed-server-completed");
        if(!signupCustomizeServerFormComplete) return mapping.findForward("virtual-managed-server-2-completed");
        if(!signupCustomizeManagementFormComplete) return mapping.findForward("virtual-managed-server-3-completed");
        if(!signupBusinessFormComplete) return mapping.findForward("virtual-managed-server-4-completed");
        if(!signupTechnicalFormComplete) return mapping.findForward("virtual-managed-server-5-completed");
        if(!signupBillingInformationFormComplete) return mapping.findForward("virtual-managed-server-6-completed");

        initRequestAttributes(
            request,
            signupSelectServerForm,
            signupCustomizeServerForm,
            signupCustomizeManagementForm,
            signupBusinessForm,
            signupTechnicalForm,
            signupBillingInformationForm
        );

        return mapping.findForward("input");
    }

    protected void initRequestAttributes(
        HttpServletRequest request,
        SignupSelectServerForm signupSelectServerForm,
        SignupCustomizeServerForm signupCustomizeServerForm,
        SignupCustomizeManagementForm signupCustomizeManagementForm,
        SignupBusinessForm signupBusinessForm,
        SignupTechnicalForm signupTechnicalForm,
        SignupBillingInformationForm signupBillingInformationForm
    ) throws IOException, SQLException {
        ServletContext servletContext = getServlet().getServletContext();

        SignupSelectServerActionHelper.setConfirmationRequestAttributes(servletContext, request, signupSelectServerForm);
        SignupCustomizeServerActionHelper.setConfirmationRequestAttributes(servletContext, request, signupSelectServerForm, signupCustomizeServerForm);
        SignupCustomizeManagementActionHelper.setConfirmationRequestAttributes(servletContext, request, signupSelectServerForm, signupCustomizeServerForm, signupCustomizeManagementForm);
        SignupBusinessActionHelper.setConfirmationRequestAttributes(servletContext, request, signupBusinessForm);
        SignupTechnicalActionHelper.setConfirmationRequestAttributes(servletContext, request, signupTechnicalForm);
        SignupBillingInformationActionHelper.setConfirmationRequestAttributes(servletContext, request, signupBillingInformationForm);
    }
}