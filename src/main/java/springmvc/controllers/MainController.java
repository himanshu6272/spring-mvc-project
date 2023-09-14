package springmvc.controllers;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import springmvc.models.Address;
import springmvc.models.User;
import springmvc.services.UserService;
import springmvc.utility.CheckValidation;
import springmvc.utility.EncryptPwd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

@Controller
public class MainController {

    Base64.Encoder encoder =Base64.getEncoder();
    Base64.Decoder decoder = Base64.getDecoder();
    @Autowired
    CheckValidation validation;
    @Autowired
    EncryptPwd encryptPwd;
    @Autowired
    UserService userService;
    private static final Logger log = Logger.getLogger(MainController.class);
    @RequestMapping(path = "register", method = RequestMethod.GET)
    public String register(){
        return "register";
    }

    @RequestMapping({"/","/index"})
    public String index()
    {
        return "index";
    }
    @RequestMapping("/login")
    public String loginPage(){
        return "login";
    }
    @RequestMapping("/forgot")
    public String forgotPage(){
        return "forgot";
    }
    @RequestMapping("/reset/{email}")
    public String resetPassPage(@PathVariable("email") String email, Model model){
        model.addAttribute("email", email);
        return "reset";
    }



    @RequestMapping(path = "/create", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String createUser(@Valid @ModelAttribute User user, BindingResult br, @RequestParam("profieImage") CommonsMultipartFile file, Model model, @RequestParam("cnfPassword") String cnfPassword){
        List<String> errors = new ArrayList<String>();
        String message =validation.validData(user,cnfPassword);
        log.info(br);
        if (br.hasErrors()){
            List<FieldError> fieldErrors =br.getFieldErrors();
            for(FieldError err: fieldErrors)
            {
                errors.add(err.getDefaultMessage());
            }
            log.info(errors);
            model.addAttribute("errors", errors);
            model.addAttribute("user", user);
            return "register";
        }else if (!message.equals("valid")){
            errors.add(message);
            model.addAttribute("errors",errors);
            model.addAttribute("user",user);
            return "register";
        }else {
            byte[] data = file.getBytes();
            String encryptedPwd = this.encryptPwd.encryption(user.getPassword());
            user.setPassword(encryptedPwd);
            user.setImage(data);
            this.userService.registerUser(user);
            log.info("Creating user");
            model.addAttribute("success", "User Registered Successfully");
            return "register";
        }

    }

    @RequestMapping(path = "/edit", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String editUser(@ModelAttribute User user, @RequestParam("profieImage") CommonsMultipartFile file, Model model, HttpServletRequest request, @RequestParam("aid") String [] addressid){
        String[] street = request.getParameterValues("street");
        String[] city = request.getParameterValues("city");
        String[] state = request.getParameterValues("state");
        String[] country = request.getParameterValues("country");
        String[] zip = request.getParameterValues("zip");
        String[] addressId = request.getParameterValues("aid");
        for (int i = 0; i < street.length; i++){
            Address address = new Address();
            address.setAid(Integer.parseInt(addressId[i]));
            address.setStreet(street[i]);
            address.setCity(city[i]);
            address.setCountry(country[i]);
            address.setZip(zip[i]);
            address.setState(state[i]);
            address.setUser(user);
            this.userService.updateAddress(address);
        }
        List<Address> addresses = this.userService.getUserAddress(user.getId());
        int index=0;
        int oldAddressid[] = new int[addresses.size()];
        int addressIdLength= addressid.length;
        int count=0;
        for(Address address:addresses)
        {
            oldAddressid[index]=address.getAid();
            if(count<addressIdLength && addressid[count].length()!=0)
            {
                int addrssid=Integer.parseInt(addressid[count]);
                if(oldAddressid[index]==addrssid)
                {
                    count++;
                }
                else
                {
                    this.userService.deleteAddress(address);     //user Address deleted
                }
            }
            else
            {
                this.userService.deleteAddress(address);   //user Address deleted
            }
            index++;
        }
        User oldUser = this.userService.getUserById(user.getId());
        byte[] data = file.getBytes();
        user.setEmail(oldUser.getEmail());
        if (user.getRole() == null){
            user.setRole(oldUser.getRole());
        }
        user.setSecurityQuestion(oldUser.getSecurityQuestion());
        user.setSecurityAnswer(oldUser.getSecurityAnswer());
        user.setPassword(oldUser.getPassword());
        user.setImage(data);
        this.userService.updateUser(user);
        request.getSession().setAttribute("success", "User Updated Successfully");
        log.info("editing user");
        return "redirect:/view";
    }
    @RequestMapping(path = "/admin", method = RequestMethod.GET)
    public String adminPage(Model model, HttpSession session){
        String loggedIn = (String) session.getAttribute("loggedIn");
        int id = (int) session.getAttribute("adminId");
        log.info(id);
            User existingUser = this.userService.getUserById(id);
            List<User> users = this.userService.getAllUsers();
            List<User> userList = new ArrayList<>();
            for (int i = 0; i < users.size(); i++) {
                if (Objects.equals(users.get(i).getRole(), "ADMIN")){
                    continue;
                }
                userList.add(users.get(i));
            }

            model.addAttribute("users", userList);
            model.addAttribute("admin", existingUser);
            return "admin";
        }



    @RequestMapping(path = "/view", method = RequestMethod.GET)
    public String viewUserPage(HttpSession session, Model model){
        int id = (int) session.getAttribute("userId");
        log.info(id);
        User user = this.userService.getUserById(id);
        String base64Image = "data:image/jpg;base64,"+Base64.getEncoder().encodeToString(user.getImage())+"";
//        log.info(user);
        List<Address> addresses = user.getAddresses();
        model.addAttribute("user", user);
        model.addAttribute("addresses", addresses);
        model.addAttribute("imgUrl", base64Image);

        return "view";
    }
    @RequestMapping(path = "/view/{id}", method = RequestMethod.GET)
    public String viewPage(HttpSession session, @PathVariable("id") int id){
        session.setAttribute("userId", id);
        return "redirect:/view";
    }

    @RequestMapping(path = "/loginUser", method = RequestMethod.POST)
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session){
        User user = this.userService.getUserByEmail(email);
        String encryptedPwd = this.encryptPwd.encryption(password);
        if (user != null && encryptedPwd.equals(user.getPassword())){
            if (Objects.equals(user.getRole(), "USER")) {
                session.setAttribute("loggedIn", "USER");
                session.setAttribute("userId", user.getId());
                return "redirect:/view";
            }else {
                session.setAttribute("loggedIn", "ADMIN");
                session.setAttribute("adminId", user.getId());
                return "redirect:/admin";
            }
        }else {
            model.addAttribute("errorMessage", "Invalid credential");
            log.info("Invalid credential");
            return "login";
        }
    }

    @RequestMapping(path = "/error", method = RequestMethod.GET)
    public String errorPage(){
        return "error_404";
    }

    @RequestMapping(path = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "index";
    }

    @RequestMapping(path = "/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") int id){
        User user = this.userService.getUserById(id);
        this.userService.deleteUser(user);
        return "redirect:/admin";
    }

    @RequestMapping(path = "/forgotPassword", method = RequestMethod.POST)
    public String forgotPassword(@RequestParam("email") String email, @RequestParam("securityQuestion") String question,
                                 @RequestParam("securityAnswer") String answer, Model model, HttpSession session, HttpServletRequest request){
        User user = this.userService.getUserByEmail(email);
        if(this.userService.userExist(email)){
            if (question.equals(user.getSecurityQuestion()) && answer.equals(user.getSecurityAnswer())){
                String encodeEmail = encoder.encodeToString(email.getBytes(Charset.forName("UTF-8")));
                String url = request.getRequestURL().toString();
                String stringToRemove = "forgotPassword";
                String modifiedURL = url.replace(stringToRemove, "")+"reset/"+encodeEmail;
                log.info(modifiedURL);
//                session.setAttribute("email", email);
                model.addAttribute("success", "Reset link is sent to the log");
            }else {
                model.addAttribute("error", "Invalid Credential");
            }
        }else {
            model.addAttribute("error", "User Does not exists with this email");
        }
        return "forgot";
    }

    @RequestMapping(path = "/reset/Password", method = RequestMethod.POST)
    public String resetPassword(@RequestParam("email") String email, @RequestParam("password") String password){
        byte[] bytes = decoder.decode(email);
        String decodedEmail = new String(bytes, StandardCharsets.UTF_8);
        String encryptedPwd = this.encryptPwd.encryption(password);
        this.userService.updatePassword(decodedEmail,encryptedPwd);
        return "redirect:/login";
    }


}
