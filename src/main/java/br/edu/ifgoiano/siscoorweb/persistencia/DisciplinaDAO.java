/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.DefesaTC;
import br.edu.ifgoiano.siscoorweb.modelos.Disciplina;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Diego
 */
public class DisciplinaDAO 
{
    Connection connection;
    
    public DisciplinaDAO()
    {
        this.connection = new ConnectionFactory().getConnectionFactory();
    }
    
    public boolean adicionar(Disciplina disciplina){
       String sql = "INSERT INTO disciplinas (nome_da_Disciplina, carga_Horaria) VALUES (?,?);";
        
       try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setString(1,disciplina.getNome());
            stmt.setInt(2, disciplina.getCargaHora());
            
            stmt.execute();
            stmt.close();
            return true;
      
        } catch (SQLException ex) {
            Logger.getLogger(DisciplinaDAO.class.getName()).log(Level.SEVERE, null, ex);
           
            return false;
        }
   }
    
    public Disciplina jaExiste(Disciplina disciplina){
       String sql = "SELECT * FROM disciplinas WHERE nome_da_Disciplina=? AND carga_Horaria=?;";
        
       Disciplina discip = new Disciplina();
       
       try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,disciplina.getNome());
            stmt.setInt(2, disciplina.getCargaHora());
            
            ResultSet rs = stmt.executeQuery();
            
            discip.setNome(rs.getString("nome_da_Disciplina"));
            discip.setCargaHora(rs.getInt("carga_Horaria"));
      
        } catch (SQLException ex) {
            Logger.getLogger(DisciplinaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return discip;
   }
}
