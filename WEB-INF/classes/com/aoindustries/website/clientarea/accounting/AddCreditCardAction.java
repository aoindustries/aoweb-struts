package com.aoindustries.website.clientarea.accounting;

/*
 * Copyright 2007 by AO Industries, Inc.,
 * 816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.aoserv.client.AOServConnector;
import com.aoindustries.aoserv.client.AOServPermission;
import com.aoindustries.aoserv.client.Business;
import com.aoindustries.aoserv.client.BusinessAdministrator;
import com.aoindustries.aoserv.client.BusinessProfile;
import com.aoindustries.website.PermissionAction;
import com.aoindustries.website.Skin;
import com.aoindustries.website.signup.SignupBusinessActionHelper;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
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
public class AddCreditCardAction extends PermissionAction {

    /**
     * Parses the first name in a locale-specific manner.
     */
    public static String getFirstName(String name, Locale userLocale) {
        if(name==null) return null;
        name=name.trim();
        if(userLocale.getLanguage().equals(Locale.JAPANESE.getLanguage())) {
            // Last then first
            int pos = name.lastIndexOf(' ');
            if(pos==-1) return "";
            else return name.substring(pos+1).trim();
        } else {
            // First then last
            int pos = name.indexOf(' ');
            if(pos==-1) return "";
            else return name.substring(0, pos).trim();
        }
    }

    /**
     * Parses the last name in a locale-specific manner.
     */
    public static String getLastName(String name, Locale userLocale) {
        if(name==null) return null;
        name=name.trim();
        if(userLocale.getLanguage().equals(Locale.JAPANESE.getLanguage())) {
            // Last then first
            int pos = name.lastIndexOf(' ');
            if(pos==-1) return name;
            else return name.substring(0, pos).trim();
        } else {
            // First then last
            int pos = name.indexOf(' ');
            if(pos==-1) return name;
            else return name.substring(pos+1).trim();
        }
    }

    public ActionForward executePermissionGranted(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response,
        Locale locale,
        Skin skin,
        AOServConnector aoConn
    ) throws Exception {
        AddCreditCardForm addCreditCardForm=(AddCreditCardForm)form;

        String accounting = addCreditCardForm.getAccounting();
        if(GenericValidator.isBlankOrNull(accounting)) {
            // Redirect back to credit-card-manager it no accounting selected
            return mapping.findForward("credit-card-manager");
        }

        // Populate the initial details from the selected accounting code or authenticated user
        Business business = aoConn.businesses.get(accounting);
        if(business==null) throw new SQLException("Unable to find Business: "+accounting);
        BusinessProfile profile = business.getBusinessProfile();
        if(profile!=null) {
            addCreditCardForm.setFirstName(getFirstName(profile.getBillingContact(), locale));
            addCreditCardForm.setLastName(getLastName(profile.getBillingContact(), locale));
            addCreditCardForm.setCompanyName(profile.getName());
            addCreditCardForm.setEmail(profile.getBillingEmail().isEmpty() ? "" : profile.getBillingEmail().get(0));
            addCreditCardForm.setPhone(profile.getPhone());
            addCreditCardForm.setFax(profile.getFax());
            addCreditCardForm.setStreetAddress1(profile.getAddress1());
            addCreditCardForm.setStreetAddress2(profile.getAddress2());
            addCreditCardForm.setCity(profile.getCity());
            addCreditCardForm.setState(profile.getState());
            addCreditCardForm.setPostalCode(profile.getZIP());
            addCreditCardForm.setCountryCode(profile.getCountry().getCode());
        } else {
            BusinessAdministrator thisBA = aoConn.getThisBusinessAdministrator();
            addCreditCardForm.setFirstName(getFirstName(thisBA.getName(), locale));
            addCreditCardForm.setLastName(getLastName(thisBA.getName(), locale));
            addCreditCardForm.setEmail(thisBA.getEmail());
            addCreditCardForm.setPhone(thisBA.getWorkPhone());
            addCreditCardForm.setFax(thisBA.getFax());
            addCreditCardForm.setStreetAddress1(thisBA.getAddress1());
            addCreditCardForm.setStreetAddress2(thisBA.getAddress2());
            addCreditCardForm.setCity(thisBA.getCity());
            addCreditCardForm.setState(thisBA.getState());
            addCreditCardForm.setPostalCode(thisBA.getZIP());
            addCreditCardForm.setCountryCode(thisBA.getCountry()==null ? "" : thisBA.getCountry().getCode());
        }

        initRequestAttributes(request, aoConn);

        return mapping.findForward("success");
    }

    protected void initRequestAttributes(HttpServletRequest request, AOServConnector aoConn) throws SQLException {
        // Build the list of years
        List<String> expirationYears = new ArrayList<String>(12);
        int startYear = Calendar.getInstance().get(Calendar.YEAR);
        for(int c=0;c<12;c++) expirationYears.add(Integer.toString(startYear+c));

        // Build the list of countries
        List<SignupBusinessActionHelper.CountryOption> countryOptions = SignupBusinessActionHelper.getCountryOptions(aoConn);

        // Store to request attributes
        request.setAttribute("expirationYears", expirationYears);
        request.setAttribute("countryOptions", countryOptions);
    }

    public List<AOServPermission.Permission> getPermissions() {
        return Collections.singletonList(AOServPermission.Permission.add_credit_card);
    }
}