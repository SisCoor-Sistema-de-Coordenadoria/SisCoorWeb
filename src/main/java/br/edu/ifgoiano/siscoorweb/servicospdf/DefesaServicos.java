/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servicospdf;

import br.edu.ifgoiano.siscoorweb.modelos.DefesaTC;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author IFgoiano
 */
public class DefesaServicos {
    public boolean gerarAta(DefesaTC def){
        Document doc = new Document();
       
        return true;
    }
    
    public boolean gerarFichaAprovacao(){
        return true;
    }
    
    public boolean gerarQuadroDefesas(ArrayList<DefesaTC> lista){
        Document doc = new Document();
        try {
            doc.close();
            PdfWriter.getInstance(doc, new FileOutputStream("QuadroDeDefesas.pdf"));
            
            
            
        } catch (FileNotFoundException ex) {
            doc.close();
            Logger.getLogger(DefesaServicos.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (DocumentException ex) {
            doc.close();
            Logger.getLogger(DefesaServicos.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return true;
    }
}
