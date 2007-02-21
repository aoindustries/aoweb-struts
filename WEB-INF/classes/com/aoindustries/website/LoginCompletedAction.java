package com.aoindustries.website;

/*
 * Copyright 2007 by AO Industries, Inc.,
 * 816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.aoserv.client.AOServConnector;
import com.aoindustries.security.AccountDisabledException;
import com.aoindustries.security.AccountNotFoundException;
import com.aoindustries.security.BadPasswordException;
import com.aoindustries.util.ErrorPrinter;
import com.aoindustries.util.StandardErrorHandler;
import com.aoindustries.util.WrappedException;
import java.io.IOException;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.util.MessageResources;

/**
 * @author  AO Industries, Inc.
 */
public class LoginCompletedAction extends HttpsAction {

    public ActionForward executeProtocolAccepted(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response,
        Locale locale,
        Skin skin
    ) throws Exception {
        LoginForm loginForm = (LoginForm)form;

        ActionMessages errors = loginForm.validate(mapping, request);
        if(errors!=null && !errors.isEmpty()) {
            saveErrors(request, errors);
            return mapping.findForward("input");
        }

        String username = loginForm.getUsername();
        String password = loginForm.getPassword();

        try {
	    try {
	        // Get connector
	        AOServConnector aoConn = AOServConnector.getConnector(username, password, new StandardErrorHandler());
	        aoConn.ping();

	        // Store in session
                HttpSession session = request.getSession();
                session.setAttribute(Constants.AUTHENTICATED_AO_CONN, aoConn);
	        session.setAttribute(Constants.AO_CONN, aoConn);

                // Try redirect
                String target = (String)session.getAttribute(Constants.AUTHENTICATION_TARGET);
                if(target!=null && target.length()>0) {
                    response.sendRedirect(target);
                    return null;
                }

                // Return success
	        return mapping.findForward("success");
	    } catch(WrappedException err) {
	        Throwable wrapped = err.getCause();
	        if(wrapped instanceof IOException) throw (IOException)wrapped;
		throw err;
	    }
        } catch(IOException err) {
            ErrorPrinter.printStackTraces(err);
	    String message=err.getMessage();
	    if(message!=null) {
                MessageResources applicationResources = (MessageResources)request.getAttribute("/ApplicationResources");
		if(message.indexOf("Unable to find BusinessAdministrator")!=-1) message=applicationResources.getMessage(locale, "login.accountNotFound");
                else if(message.indexOf("Connection attempted with invalid password")!=-1) message=applicationResources.getMessage(locale, "login.badPassword");
                else if(message.indexOf("BusinessAdministrator disabled")!=-1) message=applicationResources.getMessage(locale, "accountDisabled");
                else message=null;
	    }
            request.setAttribute(Constants.AUTHENTICATION_MESSAGE, message);
            return mapping.findForward("failure");
        }
    }
}
