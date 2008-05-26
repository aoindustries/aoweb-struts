package com.aoindustries.website.clientarea.accounting;

/*
 * Copyright 2007-2008 by AO Industries, Inc.,
 * 816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.aoserv.client.AOServConnector;
import com.aoindustries.aoserv.client.Business;
import com.aoindustries.aoserv.client.BusinessAdministrator;
import com.aoindustries.aoserv.client.BusinessProfile;
import com.aoindustries.sql.SQLUtility;
import com.aoindustries.website.AuthenticatedAction;
import com.aoindustries.website.RootAOServConnector;
import com.aoindustries.website.Skin;
import com.aoindustries.website.signup.SignupBusinessActionHelper;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * Gets the form for adding a credit card.
 *
 * @author  AO Industries, Inc.
 */
public class MakePaymentNewCardAction extends AuthenticatedAction {

    public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response,
        Locale locale,
        Skin skin,
        AOServConnector aoConn
    ) throws Exception {
        MakePaymentNewCardForm makePaymentNewCardForm=(MakePaymentNewCardForm)form;

        String accounting = makePaymentNewCardForm.getAccounting();
        if(GenericValidator.isBlankOrNull(accounting)) {
            // Redirect back to credit-card-manager it no accounting selected
            return mapping.findForward("make-payment");
        }

        // Populate the initial details from the selected accounting code or authenticated user
        Business business = aoConn.businesses.get(accounting);
        if(business==null) throw new SQLException("Unable to find Business: "+accounting);
        BusinessProfile profile = business.getBusinessProfile();
        if(profile!=null) {
            makePaymentNewCardForm.setFirstName(AddCreditCardAction.getFirstName(profile.getBillingContact(), locale));
            makePaymentNewCardForm.setLastName(AddCreditCardAction.getLastName(profile.getBillingContact(), locale));
            makePaymentNewCardForm.setCompanyName(profile.getName());
            makePaymentNewCardForm.setEmail(profile.getBillingEmail().isEmpty() ? "" : profile.getBillingEmail().get(0));
            makePaymentNewCardForm.setPhone(profile.getPhone());
            makePaymentNewCardForm.setFax(profile.getFax());
            makePaymentNewCardForm.setStreetAddress1(profile.getAddress1());
            makePaymentNewCardForm.setStreetAddress2(profile.getAddress2());
            makePaymentNewCardForm.setCity(profile.getCity());
            makePaymentNewCardForm.setState(profile.getState());
            makePaymentNewCardForm.setPostalCode(profile.getZIP());
            makePaymentNewCardForm.setCountryCode(profile.getCountry().getCode());
        } else {
            BusinessAdministrator thisBA = aoConn.getThisBusinessAdministrator();
            makePaymentNewCardForm.setFirstName(AddCreditCardAction.getFirstName(thisBA.getName(), locale));
            makePaymentNewCardForm.setLastName(AddCreditCardAction.getLastName(thisBA.getName(), locale));
            makePaymentNewCardForm.setEmail(thisBA.getEmail());
            makePaymentNewCardForm.setPhone(thisBA.getWorkPhone());
            makePaymentNewCardForm.setFax(thisBA.getFax());
            makePaymentNewCardForm.setStreetAddress1(thisBA.getAddress1());
            makePaymentNewCardForm.setStreetAddress2(thisBA.getAddress2());
            makePaymentNewCardForm.setCity(thisBA.getCity());
            makePaymentNewCardForm.setState(thisBA.getState());
            makePaymentNewCardForm.setPostalCode(thisBA.getZIP());
            makePaymentNewCardForm.setCountryCode(thisBA.getCountry()==null ? "" : thisBA.getCountry().getCode());
        }

        initRequestAttributes(request, getServlet().getServletContext());

        // Prompt for amount of payment defaults to current balance.
        int balance = business.getAccountBalance();
        if(balance>0) {
            makePaymentNewCardForm.setPaymentAmount(SQLUtility.getDecimal(balance));
        } else {
            makePaymentNewCardForm.setPaymentAmount("");
        }

        request.setAttribute("business", business);

        return mapping.findForward("success");
    }

    protected void initRequestAttributes(HttpServletRequest request, ServletContext context) throws SQLException, IOException {
        // Build the list of years
        List<String> expirationYears = new ArrayList<String>(12);
        int startYear = Calendar.getInstance().get(Calendar.YEAR);
        for(int c=0;c<12;c++) expirationYears.add(Integer.toString(startYear+c));

        // Build the list of countries
        // We use the root connector to provide a better set of country values
        List<SignupBusinessActionHelper.CountryOption> countryOptions = SignupBusinessActionHelper.getCountryOptions(RootAOServConnector.getRootAOServConnector(context));

        // Store to request attributes
        request.setAttribute("expirationYears", expirationYears);
        request.setAttribute("countryOptions", countryOptions);
    }
}