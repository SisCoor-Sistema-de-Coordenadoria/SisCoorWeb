/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servicospdf;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author IFgoiano
 */
public class PadraoDoc {
    public Paragraph cabecalho(){
        Paragraph p = new Paragraph();
        try {
            Image logo = Image.getInstance("../resources/logo_if/logo_urutai.png");
            logo.setWidthPercentage(50);
            logo.setAlignment(Image.ALIGN_CENTER);
            p.add(logo);
            
            p.setAlignment(Paragraph.ALIGN_CENTER);
           
        } catch (BadElementException ex) {
            Logger.getLogger(PadraoDoc.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PadraoDoc.class.getName()).log(Level.SEVERE, null, ex);
        }
      return p;   
    }
}
