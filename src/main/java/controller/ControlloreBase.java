package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ControlloreBase {

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/inizio")
    public String inizio() {
        return "inizio";
    }
    
}
