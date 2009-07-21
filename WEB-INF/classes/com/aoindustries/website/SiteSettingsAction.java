package com.aoindustries.website;

/*
 * Copyright 2009 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * Resolves the current SiteSettings, sets the request param siteSettings, and calls subclass implementation.
 *
 * @author Dan Armstrong &lt;dan@aoindustries.com&gt;
 */
public class SiteSettingsAction extends Action {

    /**
     * Resolves the <code>SiteSettings</code>, sets the request attribute "siteSettings", then the subclass execute method is invoked.
     *
     * @see #execute(ActionMapping,ActionForm,HttpServletRequest,HttpServletResponse,Locale)
     */
    @Override
    final public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response
    ) throws Exception {
        // Resolve the settings
        SiteSettings siteSettings = SiteSettings.getInstance(getServlet().getServletContext());
        request.setAttribute(Constants.SITE_SETTINGS, siteSettings);

        return execute(mapping, form, request, response, siteSettings);
    }

    /**
     * Once the siteSettings are resolved, this version of the execute method is invoked.
     * The default implementation of this method simply returns the mapping of "success".
     */
    public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response,
        SiteSettings siteSettings
    ) throws Exception {
        return mapping.findForward("success");
    }
}