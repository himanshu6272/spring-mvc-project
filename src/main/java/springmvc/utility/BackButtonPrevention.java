package springmvc.utility;

import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin","/view"})
public class BackButtonPrevention implements Filter {
	private static final Logger log = Logger.getLogger(BackButtonPrevention.class);
	public void destroy() {	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;

		 HttpSession session=req.getSession(false);
		 if(session==null)
		 {
			res.sendRedirect("index");
		 }
		 else
		 {
			 	res.setHeader("Cache-Control","no-chache,no-store,must-revalidate");
				res.setHeader("Pragma", "no-chache");
				res.setDateHeader("Expires", 0);
				chain.doFilter(request, response);
		 }
	}
	public void init(FilterConfig fConfig) throws ServletException {	}

}
