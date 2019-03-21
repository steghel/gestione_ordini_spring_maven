package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ControlloreClienti {

    @RequestMapping("/inserimento_dati_cliente")
    public String inserimento_dati_cliente() {
        return "jspCliente/inserimento_dati_cliente";
    }

    @RequestMapping("/lettura_dati_cliente")
    public String lettura_dati_cliente() {
        return "jspCliente/lettura_dati_cliente";
    }
    
    @RequestMapping("/cancella_modifica_cliente_tag")
    public String cancella_modifica_cliente_tag() {
        return "jspCliente/cancella_modifica_cliente_tag";
    }
    
    @RequestMapping("/cancella_modifica_cliente_tag_menuModifica")
    public String cancella_modifica_cliente_tag_menuModifica() {
        return "jspCliente/cancella_modifica_cliente_tag_menuModifica";
    }
}
