package com.aoindustries.website.signup;

/*
 * Copyright 2009-2011 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.website.SiteSettings;
import com.aoindustries.website.Skin;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * @author  AO Industries, Inc.
 */
public class SystemAdministration5Action extends SystemAdministrationStepAction {

    public ActionForward executeSystemAdministrationStep(
        ActionMapping mapping,
        HttpServletRequest request,
        HttpServletResponse response,
        SiteSettings siteSettings,
        Skin skin,
        SystemAdministrationSignupSelectPackageForm signupSelectPackageForm,
        boolean signupSelectPackageFormComplete,
        SignupBusinessForm signupBusinessForm,
        boolean signupBusinessFormComplete,
        SignupTechnicalForm signupTechnicalForm,
        boolean signupTechnicalFormComplete,
        SignupBillingInformationForm signupBillingInformationForm,
        boolean signupBillingInformationFormComplete
    ) throws Exception {
        if(!signupSelectPackageFormComplete) return mapping.findForward("system-administration-completed");
        if(!signupBusinessFormComplete) return mapping.findForward("system-administration-2-completed");
        if(!signupTechnicalFormComplete) return mapping.findForward("system-administration-3-completed");
        if(!signupBillingInformationFormComplete) return mapping.findForward("system-administration-4-completed");

        initRequestAttributes(
            request,
            response,
            signupSelectPackageForm,
            signupBusinessForm,
            signupTechnicalForm,
            signupBillingInformationForm
        );

        return mapping.findForward("input");
    }

    protected void initRequestAttributes(
        HttpServletRequest request,
        HttpServletResponse response,
        SignupSelectPackageForm signupSelectPackageForm,
        SignupBusinessForm signupBusinessForm,
        SignupTechnicalForm signupTechnicalForm,
        SignupBillingInformationForm signupBillingInformationForm
    ) throws IOException {
        ServletContext servletContext = getServlet().getServletContext();

        SignupSelectPackageActionHelper.setConfirmationRequestAttributes(servletContext, request, signupSelectPackageForm);
        SignupBusinessActionHelper.setConfirmationRequestAttributes(servletContext, request, signupBusinessForm);
        SignupTechnicalActionHelper.setConfirmationRequestAttributes(servletContext, request, signupTechnicalForm);
        SignupBillingInformationActionHelper.setConfirmationRequestAttributes(servletContext, request, signupBillingInformationForm);
    }
}