package controllers;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    private static final Logger log = Logger.getLogger(HomeController.class);
    @RequestMapping(path = "register", method = RequestMethod.GET)
    public String register(){
        log.info("Opening index.jsp page");
        return "register";
    }

    @RequestMapping(path = "index", method = RequestMethod.GET)
    public String home(){
        return "index";
    }
}
