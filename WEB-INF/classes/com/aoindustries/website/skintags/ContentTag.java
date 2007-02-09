package com.aoindustries.website.skintags;

/*
 * Copyright 2007 by AO Industries, Inc.,
 * 816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.io.ChainWriter;
import com.aoindustries.util.StringUtility;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import com.aoindustries.website.*;
import org.apache.struts.Globals;
import org.apache.struts.util.MessageResources;

/**
 * @author  AO Industries, Inc.
 */
public class ContentTag extends PageAttributesTag {

    /**
     * Parses a String of comma-separated integers into an <code>int[]</code>.
     */
    static int[] parseColspans(String colspans) {
        List<String> tokens = StringUtility.splitStringCommaSpace(colspans);
        int[] array = new int[tokens.size()];
        for(int c=0;c<tokens.size();c++) array[c]=Integer.parseInt(tokens.get(c));
        return array;
    }

    private String colspans;
    private int[] colspansParsed;
    private String width;

    public ContentTag() {
        init();
    }

    private void init() {
        colspans = "1";
        colspansParsed = new int[] {1};
        width = null;
    }

    public int doStartTag(PageAttributes pageAttributes) throws JspException {
        try {
            ChainWriter out = new ChainWriter(pageContext.getOut());
            Skin skin = (Skin)pageContext.getAttribute(Constants.SKIN, PageContext.REQUEST_SCOPE);
            if(skin==null) {
                HttpSession session = pageContext.getSession();
                Locale locale = (Locale)session.getAttribute(Globals.LOCALE_KEY);
                MessageResources applicationResources = (MessageResources)pageContext.getRequest().getAttribute("/ApplicationResources");
                throw new JspException(applicationResources.getMessage(locale, "skintags.unableToFindSkinInRequest"));
            }

            HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
            skin.startContent(req, out, pageAttributes, colspansParsed, width);

            return EVAL_BODY_INCLUDE;
        } catch(IOException err) {
            throw new JspException(err);
        }
    }

    public int doEndTag(PageAttributes pageAttributes) throws JspException {
        try {
            ChainWriter out = new ChainWriter(pageContext.getOut());
            Skin skin = (Skin)pageContext.getAttribute(Constants.SKIN, PageContext.REQUEST_SCOPE);
            if(skin==null) throw new JspException("Unable to find skin in the request attributes");

            HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
            skin.endContent(req, out, pageAttributes, colspansParsed);

            return EVAL_PAGE;
        } catch(IOException err) {
            throw new JspException(err);
        } finally {
            init();
        }
    }

    public String getColspans() {
        return colspans;
    }

    int[] getColspansParsed() {
        return colspansParsed;
    }

    public void setColspans(String colspans) {
        this.colspans = colspans;
        this.colspansParsed = parseColspans(colspans);
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }
}