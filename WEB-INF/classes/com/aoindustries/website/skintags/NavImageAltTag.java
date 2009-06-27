package com.aoindustries.website.skintags;

/*
 * Copyright 2007-2009 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import java.util.Locale;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import org.apache.struts.Globals;

/**
 * Sets the navImageAlt for a page.
 *
 * @author  AO Industries, Inc.
 */
public class NavImageAltTag extends BodyTagSupport {

    public NavImageAltTag() {
    }

    public int doStartTag() {
        return EVAL_BODY_BUFFERED;
    }

    public int doEndTag() throws JspException {
        String navImageAlt = getBodyContent().getString().trim();
        AddParentTag addParentTag = (AddParentTag)findAncestorWithClass(this, AddParentTag.class);
        if(addParentTag!=null) {
            addParentTag.setNavImageAlt(navImageAlt);
        } else {
            AddSiblingTag addSiblingTag = (AddSiblingTag)findAncestorWithClass(this, AddSiblingTag.class);
            if(addSiblingTag!=null) {
                addSiblingTag.setNavImageAlt(navImageAlt);
            } else {
                PageAttributesBodyTag.getPageAttributes(pageContext).setNavImageAlt(navImageAlt);
            }
        }
        return EVAL_PAGE;
    }
}
