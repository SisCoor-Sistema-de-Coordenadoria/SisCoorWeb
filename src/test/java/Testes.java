
import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao;
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jehymeson Gil
 */
public class Testes {
    public static void main(String[] args) {
        String btn = "excluir_49";
        
        String[] valores = btn.split("_|_\\s");
        
        System.out.println(valores[0]);
        System.out.println(valores[1]);
        
    }
}
