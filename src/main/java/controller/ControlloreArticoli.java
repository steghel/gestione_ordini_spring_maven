package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ControlloreArticoli {

    @RequestMapping("/inserimento_dati_articolo")
    public String inserimento_dati_cliente() {
        return "jspArticolo/inserimento_dati_articolo";
    }

    @RequestMapping("/lettura_dati_articolo")
    public String lettura_dati_cliente() {
        return "jspArticolo/lettura_dati_articolo";
    }
    
    @RequestMapping("/cancella_modifica_articolo_tag_1")
    public String cancella_modifica_cliente_tag() {
        return "jspArticolo/cancella_modifica_articolo_tag_1";
    }
    
    @RequestMapping("/cancella_modifica_articolo_tag_menuModifica")
    public String cancella_modifica_cliente_tag_menuModifica() {
        return "jspArticolo/cancella_modifica_articolo_tag_menuModifica";
    }
}
