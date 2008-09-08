package com.aoindustries.website.skintags;

/*
 * Copyright 2007-2008 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.website.Skin;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import org.apache.struts.Globals;

/**
 * Writes the skin light area.
 *
 * @author  AO Industries, Inc.
 */
public class LightAreaTag extends PageAttributesTag {

    private String width;
    private boolean nowrap;

    public LightAreaTag() {
        init();
    }

    private void init() {
        width = null;
        nowrap = false;
    }

    public int doStartTag(PageAttributes pageAttributes) throws JspException {
        Skin skin = SkinTag.getSkin(pageContext);

        HttpServletResponse resp = (HttpServletResponse)pageContext.getResponse();
        skin.beginLightArea((HttpServletRequest)pageContext.getRequest(), resp, pageContext.getOut(), width, nowrap);

        return EVAL_BODY_INCLUDE;
    }

    public int doEndTag(PageAttributes pageAttributes) throws JspException {
        try {
            Skin skin = SkinTag.getSkin(pageContext);

            HttpServletResponse resp = (HttpServletResponse)pageContext.getResponse();
            skin.endLightArea((HttpServletRequest)pageContext.getRequest(), resp, pageContext.getOut());

            return EVAL_PAGE;
        } finally {
            init();
        }
    }

    public String getWidth() {
        return width;
    }
    
    public void setWidth(String width) {
        this.width = width;
    }

    public boolean getNowrap() {
        return nowrap;
    }
    
    public void setNowrap(boolean nowrap) {
        this.nowrap = nowrap;
    }
}
