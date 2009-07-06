package com.aoindustries.website.signup;

/*
 * Copyright 2007-2009 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.website.SiteSettings;
import com.aoindustries.website.Skin;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * @author  AO Industries, Inc.
 */
public class Managed3CompletedAction extends Managed3Action {

    @Override
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
        if(!signupCustomizeServerFormComplete)  return mapping.findForward("managed-server-2-completed");
        if(!signupCustomizeManagementFormComplete) {
            // Init values for the form
            return super.executeManagedStep(
                mapping,
                request,
                response,
                siteSettings,
                locale,
                skin,
                signupSelectServerForm,
                signupSelectServerFormComplete,
                signupCustomizeServerForm,
                signupCustomizeServerFormComplete,
                signupCustomizeManagementForm,
                signupCustomizeManagementFormComplete,
                signupBusinessForm,
                signupBusinessFormComplete,
                signupTechnicalForm,
                signupTechnicalFormComplete,
                signupBillingInformationForm,
                signupBillingInformationFormComplete
            );
        }
        if(!signupBusinessFormComplete) return mapping.findForward("managed-server-4");
        if(!signupTechnicalFormComplete) return mapping.findForward("managed-server-5");
        if(!signupBillingInformationFormComplete) return mapping.findForward("managed-server-6");
        return mapping.findForward("managed-server-7");
    }

    /**
     * Errors are not cleared for the complete step.
     */
    @Override
    protected void clearErrors(HttpServletRequest req) {
        // Do nothing
    }
}
