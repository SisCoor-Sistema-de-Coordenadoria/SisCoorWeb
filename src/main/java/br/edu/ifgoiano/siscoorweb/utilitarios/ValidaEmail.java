/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.utilitarios;

/**
 *
 * @author Tarcisio
 */
public class ValidaEmail {

    public static boolean validaEmail(String semail) {
        
        boolean erroEmail = false;
        
        if (semail.contains("@") && semail.contains(".") && !semail.isEmpty()) {
            if ((semail.indexOf("@") != semail.lastIndexOf("@")) || (semail.indexOf("@") >= semail.lastIndexOf(".") || (semail.indexOf(".") - semail.indexOf("@") < 2) || (semail.indexOf("@") == 0 || semail.indexOf(".") == semail.length() - 1))) {
                erroEmail = true;
            } else {
                char[] emailChar = semail.toCharArray();
                for (int i = 0; i < emailChar.length - 1; i++) {
                    if (emailChar[i] == '.' && emailChar[i + 1] == '.') {
                        erroEmail = true;
                        break;
                    }
                }
            }
        }else{
            erroEmail = true;
        }
        return erroEmail;
    }
    
    
    public static void main(String[] args) {
        String email = "gabriel.vieira@ifgoiano.edu";
        
        System.out.println(validaEmail(email));
    }
}
