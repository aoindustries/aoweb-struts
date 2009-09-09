package com.aoindustries.website.struts;

/*
 * Copyright 2009 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import java.io.Serializable;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import org.apache.struts.util.MessageResources;

/**
 * Sets the keywords for the page.
 *
 * @author  AO Industries, Inc.
 */
public class ResourceBundleMessageResources extends MessageResources implements Serializable {

    private static final long serialVersionUID = 1L;

    public ResourceBundleMessageResources(ResourceBundleMessageResourcesFactory factory, String config) {
        this(factory, config, false);
    }

    public ResourceBundleMessageResources(ResourceBundleMessageResourcesFactory factory, String config, boolean returnNull) {
        super(factory, config, returnNull);
    }

    public String getMessage(Locale locale, String key) {
        String value = null;
        try {
            ResourceBundle applicationResources = ResourceBundle.getBundle(config, locale);
            value = applicationResources.getString(key);
        } catch(MissingResourceException err) {
            // string remains null
        }

        if(value!=null) return value;
        if(returnNull) return null;
        return "???"+locale.toString()+"."+key+"???";
    }
}
