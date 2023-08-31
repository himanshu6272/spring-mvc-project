package springmvc.controllers;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import springmvc.models.Address;
import springmvc.models.User;
import springmvc.services.UserService;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    UserService userService;
    private static final Logger log = Logger.getLogger(MainController.class);
    @RequestMapping(path = "register", method = RequestMethod.GET)
    public String register(){
        log.info("Opening index.jsp page");
        return "register";
    }

    @RequestMapping(path = "/")
    public String home(){
        return "index";
    }
    @RequestMapping("/index")
    public String home2(){
        return "index";
    }
    @RequestMapping("/login")
    public String loginPage(){
        return "login";
    }

    @RequestMapping(path = "/create", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String createUser(@ModelAttribute User user,  @RequestParam("profieImage") CommonsMultipartFile file){
        byte[] data = file.getBytes();
        user.setImage(data);
        log.info(user.getAddresses());

        log.info(user);
        this.userService.registerUser(user);
        log.info("Creating user");
        return "login";
    }
    @RequestMapping(path = "/admin", method = RequestMethod.GET)
    public String adminPage(Model model){
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin";
    }

    @RequestMapping(path = "/view/{id}", method = RequestMethod.GET)
    public String viewUserPage(@PathVariable("id") int id, Model model){

        User user = this.userService.getUserById(id);
        String imgUrl = "/profilePhotos/user.png";
        log.info(user);
        List<Address> addresses = user.getAddresses();
        model.addAttribute("user", user);
        model.addAttribute("addresses", addresses);
        model.addAttribute("imgUrl", imgUrl);

        return "view";
    }
}
