package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ControlloreAziende {

    @RequestMapping("/inserimento_dati_azienda")
    public String inserimento_dati_cliente() {
        return "jspAzienda/inserimento_dati_azienda";
    }

    @RequestMapping("/lettura_dati_azienda")
    public String lettura_dati_cliente() {
        return "jspAzienda/lettura_dati_azienda";
    }
    
    @RequestMapping("/cancella_modifica_azienda_tag")
    public String cancella_modifica_cliente_tag() {
        return "jspAzienda/cancella_modifica_azienda_tag";
    }
    
    @RequestMapping("/cancella_modifica_azienda_tag_menuModifica")
    public String cancella_modifica_cliente_tag_menuModifica() {
        return "jspAzienda/cancella_modifica_azienda_tag_menuModifica";
    }
}
