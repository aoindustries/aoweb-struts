package com.aoindustries.website.aowebtags;

/*
 * Copyright 2009 by AO Industries, Inc.,
 * 7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.io.ChainWriter;
import com.aoindustries.util.Sequence;
import com.aoindustries.util.UnsynchronizedSequence;
import java.io.IOException;
import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @author  AO Industries, Inc.
 */
public class DateTimeTag extends BodyTagSupport {

    /**
     * The request attribute name used to store the sequence.
     */
    private static final String SEQUENCE_REQUEST_ATTRIBUTE_NAME = DateTimeTag.class.getName()+".sequence";

    public DateTimeTag() {
    }

    @Override
    public int doStartTag() {
        return EVAL_BODY_BUFFERED;
    }

    @Override
    public int doEndTag() throws JspException {
        try {
            String millisString = getBodyContent().getString().trim();
            long millis;
            if(millisString.length()==0) millis = -1;
            else millis = Long.parseLong(millisString);
            // Resolve the sequence
            ServletRequest request = pageContext.getRequest();
            Sequence sequence = (Sequence)request.getAttribute(SEQUENCE_REQUEST_ATTRIBUTE_NAME);
            if(sequence==null) request.setAttribute(SEQUENCE_REQUEST_ATTRIBUTE_NAME, sequence = new UnsynchronizedSequence());
            // Resolve the scriptOut
            ScriptGroupTag scriptGroupTag = (ScriptGroupTag)findAncestorWithClass(this, ScriptGroupTag.class);
            if(scriptGroupTag!=null) {
                ChainWriter.writeDateTimeJavaScript(millis, sequence, pageContext.getOut(), scriptGroupTag.getScriptOut());
            } else {
                StringBuilder scriptOut = new StringBuilder();
                ChainWriter.writeDateTimeJavaScript(millis, sequence, pageContext.getOut(), scriptOut);
                if(scriptOut.length()>0) {
                    JspWriter out = pageContext.getOut();
                    out.print("<script type='text/javascript'>\n"
                            + "  // <![CDATA[\n");
                    out.print(scriptOut);
                    out.print("  // ]]>\n"
                            + "</script>\n");
                }
            }
            return EVAL_PAGE;
        } catch(IOException err) {
            throw new JspException(err);
        }
    }
}