package com.aoindustries.website.signup;

/*
 * Copyright 2007-2009 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.website.SiteSettings;
import com.aoindustries.website.Skin;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Locale;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * @author  AO Industries, Inc.
 */
public class Managed7Action extends ManagedStepAction {

    public ActionForward executeManagedStep(
        ActionMapping mapping,
        HttpServletRequest request,
        HttpServletResponse response,
        SiteSettings siteSettings,
        Locale locale,
        Skin skin,
        ManagedSignupSelectServerForm signupSelectServerForm,
        boolean signupSelectServerFormComplete,
        ManagedSignupCustomizeServerForm signupCustomizeServerForm,
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
        if(!signupSelectServerFormComplete) return mapping.findForward("managed-server-completed");
        if(!signupCustomizeServerFormComplete) return mapping.findForward("managed-server-2-completed");
        if(!signupCustomizeManagementFormComplete) return mapping.findForward("managed-server-3-completed");
        if(!signupBusinessFormComplete) return mapping.findForward("managed-server-4-completed");
        if(!signupTechnicalFormComplete) return mapping.findForward("managed-server-5-completed");
        if(!signupBillingInformationFormComplete) return mapping.findForward("managed-server-6-completed");

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
