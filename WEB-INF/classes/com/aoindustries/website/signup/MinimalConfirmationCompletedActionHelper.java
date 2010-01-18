package com.aoindustries.website.signup;

/*
 * Copyright 2009 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.aoserv.client.AOServConnector;
import com.aoindustries.aoserv.client.Brand;
import com.aoindustries.aoserv.client.PackageDefinition;
import com.aoindustries.io.ChainWriter;
import com.aoindustries.website.Mailer;
import com.aoindustries.website.SiteSettings;
import com.aoindustries.website.Skin;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.util.MessageResources;

/**
 * @author  AO Industries, Inc.
 */
final public class MinimalConfirmationCompletedActionHelper {

    /**
     * Make no instances.
     */
    private MinimalConfirmationCompletedActionHelper() {}

    public static void sendSupportSummaryEmail(
        ActionServlet servlet,
        HttpServletRequest request,
        String pkey,
        String statusKey,
        Locale userLocale,
        SiteSettings siteSettings,
        PackageDefinition packageDefinition,
        SignupBusinessForm signupBusinessForm,
        SignupTechnicalForm signupTechnicalForm,
        SignupBillingInformationForm signupBillingInformationForm
    ) {
        try {
            sendSummaryEmail(servlet, request, pkey, statusKey, siteSettings.getBrand().getAowebStrutsSignupAdminAddress(), userLocale, Locale.US, siteSettings, packageDefinition, signupBusinessForm, signupTechnicalForm, signupBillingInformationForm);
        } catch(Exception err) {
            servlet.log("Unable to send sign up details to support admin address", err);
        }
    }
    
    /**
     * Sends the customer emails and stores the successAddresses and failureAddresses as request attributes.
     */
    public static void sendCustomerSummaryEmails(
        ActionServlet servlet,
        HttpServletRequest request,
        String pkey,
        String statusKey,
        Locale userLocale,
        SiteSettings siteSettings,
        PackageDefinition packageDefinition,
        SignupBusinessForm signupBusinessForm,
        SignupTechnicalForm signupTechnicalForm,
        SignupBillingInformationForm signupBillingInformationForm
    ) {
        Set<String> addresses = new HashSet<String>();
        addresses.add(signupTechnicalForm.getBaEmail());
        addresses.add(signupBillingInformationForm.getBillingEmail());
        Set<String> successAddresses = new HashSet<String>();
        Set<String> failureAddresses = new HashSet<String>();
        Iterator<String> I=addresses.iterator();
        while(I.hasNext()) {
            String address=I.next();
            boolean success = sendSummaryEmail(servlet, request, pkey, statusKey, address, userLocale, userLocale, siteSettings, packageDefinition, signupBusinessForm, signupTechnicalForm, signupBillingInformationForm);
            if(success) successAddresses.add(address);
            else failureAddresses.add(address);
        }

        // Store request attributes
        request.setAttribute("successAddresses", successAddresses);
        request.setAttribute("failureAddresses", failureAddresses);
    }

    /**
     * Sends a summary email and returns <code>true</code> if successful.
     */
    private static boolean sendSummaryEmail(
        ActionServlet servlet,
        HttpServletRequest request,
        String pkey,
        String statusKey,
        String recipient,
        Locale userLocale,
        Locale subjectLocale,
        SiteSettings siteSettings,
        PackageDefinition packageDefinition,
        SignupBusinessForm signupBusinessForm,
        SignupTechnicalForm signupTechnicalForm,
        SignupBillingInformationForm signupBillingInformationForm
    ) {
        try {
            // Find the locale and related resource bundles
            String charset = Skin.getCharacterSet(userLocale);
            MessageResources signupApplicationResources = (MessageResources)request.getAttribute("/signup/ApplicationResources");
            if(signupApplicationResources==null) throw new JspException("Unable to load resources: /signup/ApplicationResources");

            // Generate the email contents
            CharArrayWriter cout = new CharArrayWriter();
            ChainWriter emailOut = new ChainWriter(cout);
            String htmlLang = ServerConfirmationCompletedActionHelper.getHtmlLang(userLocale);
            emailOut.print("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n"
                    + "<html xmlns=\"http://www.w3.org/1999/xhtml\"");
            if(htmlLang!=null) emailOut.print(" lang=\"").print(htmlLang).print("\" xml:lang=\"").print(htmlLang).print('"');
            emailOut.print(">\n"
                         + "<head>\n"
                         + "    <meta http-equiv='Content-Type' content='text/html; charset=").print(charset).print("' />\n");
            // Embed the text-only style sheet
            InputStream cssIn = servlet.getServletContext().getResourceAsStream("/textskin/global.css");
            if(cssIn!=null) {
                try {
                    emailOut.print("    <style type=\"text/css\">\n"
                                 + "      /* <![CDATA[ */\n");
                    Reader cssReader = new InputStreamReader(cssIn);
                    try {
                        char[] buff = new char[4096];
                        int ret;
                        while((ret=cssReader.read(buff, 0, 4096))!=-1) emailOut.write(buff, 0, ret);
                    } finally {
                        cssIn.close();
                    }
                    emailOut.print("      /* ]]> */\n"
                                 + "    </style>\n");
                } finally {
                    cssIn.close();
                }
            } else {
                servlet.log("Warning: Unable to find resource: /global/textskin.css");
            }
            emailOut.print("</head>\n"
                         + "<body>\n"
                         + "<table style='border:0px' cellpadding=\"0\" cellspacing=\"0\">\n"
                         + "    <tr><td style='white-space:nowrap' colspan=\"3\">\n"
                         + "        ").print(signupApplicationResources.getMessage(userLocale, statusKey, pkey)).print("<br />\n"
                         + "        <br />\n"
                         + "        ").print(signupApplicationResources.getMessage(userLocale, "serverConfirmationCompleted.belowIsSummary")).print("<br />\n"
                         + "        <hr />\n"
                         + "    </td></tr>\n"
                         + "    <tr><th colspan=\"3\">").print(signupApplicationResources.getMessage(userLocale, "steps.selectPackage.label")).print("</th></tr>\n");
            SignupSelectPackageActionHelper.printConfirmation(emailOut, userLocale, packageDefinition, signupApplicationResources);
            AOServConnector rootConn = siteSettings.getRootAOServConnector();
            emailOut.print("    <tr><td colspan=\"3\">&#160;</td></tr>\n"
                         + "    <tr><th colspan=\"3\">").print(signupApplicationResources.getMessage(userLocale, "steps.businessInfo.label")).print("</th></tr>\n");
            SignupBusinessActionHelper.printConfirmation(emailOut, userLocale, signupApplicationResources, rootConn, signupBusinessForm);
            emailOut.print("    <tr><td colspan=\"3\">&#160;</td></tr>\n"
                         + "    <tr><th colspan=\"3\">").print(signupApplicationResources.getMessage(userLocale, "steps.technicalInfo.label")).print("</th></tr>\n");
            SignupTechnicalActionHelper.printConfirmation(emailOut, userLocale, signupApplicationResources, rootConn, signupTechnicalForm);
            emailOut.print("    <tr><td colspan=\"3\">&#160;</td></tr>\n"
                         + "    <tr><th colspan=\"3\">").print(signupApplicationResources.getMessage(userLocale, "steps.billingInformation.label")).print("</th></tr>\n");
            SignupBillingInformationActionHelper.printConfirmation(emailOut, userLocale, signupApplicationResources, signupBillingInformationForm);
            emailOut.print("</table>\n"
                         + "</body>\n"
                         + "</html>\n");
            emailOut.flush();

            // Send the email
            Brand brand = siteSettings.getBrand();
            Mailer.sendEmail(
                brand.getSignupEmailAddress().getDomain().getAOServer().getHostname(),
                "text/html",
                charset,
                brand.getSignupEmailAddress().toString(),
                brand.getSignupEmailDisplay(),
                Collections.singletonList(recipient),
                signupApplicationResources.getMessage(subjectLocale, "serverConfirmationCompleted.email.subject", pkey),
                cout.toString()
            );

            return true;
        } catch(RuntimeException err) {
            servlet.log("Unable to send sign up details to "+recipient, err);
            return false;
        } catch(IOException err) {
            servlet.log("Unable to send sign up details to "+recipient, err);
            return false;
        } catch(MessagingException err) {
            servlet.log("Unable to send sign up details to "+recipient, err);
            return false;
        } catch(JspException err) {
            servlet.log("Unable to send sign up details to "+recipient, err);
            return false;
        }
    }
}
