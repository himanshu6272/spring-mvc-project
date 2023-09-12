package springmvc.utility;

import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter({"/","/index","/login","/register","/forgot","/reset"})
public class PreventUrlRedirection implements Filter {
    private static final Logger log = Logger.getLogger(BackButtonPrevention.class);
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;

        HttpSession session=req.getSession(false);
        Object obj = null;
        if (session!=null){
            obj = session.getAttribute("loggedIn");
        }
        if (obj != null){
            String loggedIn = (String) obj;
            if (loggedIn.equals("ADMIN")){
                res.sendRedirect("admin");
            }else {
                res.sendRedirect("view");
            }
        }
        else
        {
            res.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
            res.setHeader("Pragma", "no-chache");
            res.setDateHeader("Expires", 0);
            chain.doFilter(request, response);
        }
    }
}
