package com.aoindustries.website;

/*
 * Copyright 2007 by AO Industries, Inc.,
 * 816 Azalea Rd, Mobile, Alabama, 36693, U.S.A.
 * All rights reserved.
 */
import com.aoindustries.util.ErrorPrinter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * Resolves the current skin, sets the request param skin, and calls subclass implementation.
 *
 * @author Dan Armstrong &lt;dan@aoindustries.com&gt;
 */
public class SkinAction extends LocaleAction {

    /**
     * The skins are loaded once per classname for efficiency.
     */
    private static final Map<String,Skin> nameToSkinMap = new HashMap<String,Skin>();

    /**
     * Gets a skin given its class name or <code>null</code> if unable to load, only one instance per unique classname.
     */
    private static Skin getSkin(String classname) {
        synchronized(nameToSkinMap) {
            Skin skin = nameToSkinMap.get(classname);
            if(skin==null) {
                try {
                    Class clazz = Class.forName(classname);
                    skin = (Skin)clazz.newInstance();
                    nameToSkinMap.put(classname, skin);
                } catch(ClassNotFoundException err) {
                    ErrorPrinter.printStackTraces(err);
                    skin = null;
                } catch(InstantiationException err) {
                    ErrorPrinter.printStackTraces(err);
                    skin = null;
                } catch(IllegalAccessException err) {
                    ErrorPrinter.printStackTraces(err);
                    skin = null;
                } catch(ClassCastException err) {
                    ErrorPrinter.printStackTraces(err);
                    skin = null;
                }
            }
            return skin;
        }
    }

    /**
     * Gets the skin for the current request.
     *
     * <ol>
     *   <li>If the parameter "layout" exists, it will get the class name for the skin from the servlet parameters and set the skin.</li>
     *   <li>If the parameter "layout" doesn't exist and a skin has been selected, then it returns the current skin.</li>
     *   <li>Sets the skin from the servlet parameters for "Default".</li>
     * </ol>
     */
    public static Skin getSkin(ServletContext servletContext, HttpServletRequest req) {
        HttpSession session = req.getSession();
        String layout = req.getParameter("layout");

        // Trim and set to null if empty
        if(layout!=null && (layout=layout.trim()).length()==0) layout=null;

        if(layout!=null) {
            String classname = servletContext.getInitParameter(SkinAction.class.getName()+"."+layout);
            if(classname!=null) {
                Skin skin = getSkin(classname);
                if(skin!=null) {
                    session.setAttribute(Constants.LAYOUT, skin.getName());
                    return skin;
                }
            }
        }

        // Try to reuse the currently selected skin
        layout = (String)session.getAttribute(Constants.LAYOUT);
        if(layout==null) {
            // Lynx and BlackBerry default to text
            String agent = req.getHeader("user-agent");
            if(
                agent!=null
                && (
                    agent.toLowerCase().indexOf("lynx") != -1
                    || agent.startsWith("BlackBerry")
                )
            ) {
                layout="Text";
            } else {
                layout="Default";
            }
            session.setAttribute(Constants.LAYOUT, layout);
        }
        // Load the layout
        String paramName = SkinAction.class.getName()+"."+layout;
        String classname = servletContext.getInitParameter(paramName);
        if(classname==null) throw new IllegalArgumentException("Unable to find classname for default skin.  Please make sure you have provided the necessary <context-param>.  Looking for parameter: "+paramName);
        Skin skin = getSkin(classname);
        if(skin==null) throw new IllegalArgumentException("Unable to load skin for classname.  Looking for classname: "+classname);
        return skin;
    }

    /**
     * Selects the <code>Skin</code>, sets the request attribute "skin", then the subclass execute method is invoked.
     * It also stores any "su" request for later processing by AuthenticatedAction.
     *
     * @see #execute(ActionMapping,ActionForm,HttpServletRequest,HttpServletResponse,Locale,Skin)
     */
    final public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response,
        Locale locale
    ) throws Exception {
        // Select Skin
        Skin skin = getSkin(getServlet().getServletContext(), request);
        request.setAttribute(Constants.SKIN, skin);

        // Is a "su" requested?
        String su=request.getParameter("su");
        if(su!=null && (su=su.trim()).length()>0) {
            request.getSession().setAttribute(Constants.SU_REQUESTED, su);
        }

        return execute(mapping, form, request, response, locale, skin);
    }

    /**
     * Once the skin is selected, this version of the execute method is invoked.
     * The default implementation of this method simply returns the mapping of "success".
     */
    public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response,
        Locale locale,
        Skin skin
    ) throws Exception {
        return mapping.findForward("success");
    }
}
