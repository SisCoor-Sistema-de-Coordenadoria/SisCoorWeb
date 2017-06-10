/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.Curso;
import br.edu.ifgoiano.siscoorweb.modelos.Disciplina;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Diego
 */
public class CursoDAO 
{
    Connection connection;
    
    public CursoDAO()
    {
        this.connection = connection;
    }
    
    public boolean adicionar(Curso curso){
       String sql = "INSERT INTO curso (nome, turno, professor_Coordenador, numero_de_Periodos) VALUES (?,?,?,?);";
        
       try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setString(1,curso.getNome());
            stmt.setString(2, curso.getTurno());
            stmt.setInt(3, curso.getIdProfessorCoordenador());
            stmt.setInt(4, curso.getNumDePeriodos());
            
            stmt.execute();
            stmt.close();
            return true;
      
        } catch (SQLException ex) {
            Logger.getLogger(CursoDAO.class.getName()).log(Level.SEVERE, null, ex);
           
            return false;
        }
   }
    
    public Curso jaExiste(Curso curso){
       String sql = "SELECT * FROM curso WHERE nome=? AND turno=? AND numeros_de_Periodos=?;";
        
       Curso cur = new Curso();
       
       try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,curso.getNome());
            stmt.setString(2, curso.getTurno());
            stmt.setInt(3, curso.getNumDePeriodos());
            
            ResultSet rs = stmt.executeQuery();
            
            cur.setNome(rs.getString("nome"));
            cur.setTurno(rs.getString("turno"));
            cur.setNumDePeriodos(rs.getInt("numero_de_Periodos"));
      
        } catch (SQLException ex) {
            Logger.getLogger(CursoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return cur;
   }
}
