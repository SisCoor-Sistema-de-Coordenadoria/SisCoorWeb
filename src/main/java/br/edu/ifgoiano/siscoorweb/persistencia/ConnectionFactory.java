/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Jehymeson Gil
 */
public class ConnectionFactory {
    
    public Connection getConnectionFactory(){
        try {
            
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/siscoorweb", "root", "");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
}
