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
import java.util.ArrayList;
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
            rs.first();
            
            discip.setNome(rs.getString("nome_da_Disciplina"));
            discip.setCargaHora(rs.getInt("carga_Horaria"));
      
        } catch (SQLException ex) {
            Logger.getLogger(DisciplinaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return discip;
    }
    
    public ArrayList<Disciplina> getLista() {
        String sql = "SELECT * FROM disciplinas ORDER BY nome_da_Disciplina asc";
        ArrayList<Disciplina> listaDisciplinas = new ArrayList<Disciplina>();
        
        try {
            
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Disciplina disciplina = new Disciplina();
                
                disciplina.setIdDisciplina(rs.getInt("id_Disciplina"));
                disciplina.setNome(rs.getString("nome_da_Disciplina"));
                disciplina.setCargaHora(rs.getInt("carga_Horaria"));
                
                listaDisciplinas.add(disciplina);
            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DisciplinaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDisciplinas;
    }
    
    public Disciplina buscarPorId(int id){
       String sql = "SELECT * FROM disciplinas WHERE id_Disciplina=?;";
        
       Disciplina discip = new Disciplina();
       
       try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1,id);
            
            ResultSet rs = stmt.executeQuery();
            rs.first();
            
            discip.setIdDisciplina(rs.getInt("id_Disciplina"));
            discip.setNome(rs.getString("nome_da_Disciplina"));
            discip.setCargaHora(rs.getInt("carga_Horaria"));
      
        } catch (SQLException ex) {
            Logger.getLogger(DisciplinaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return discip;
    }
    
    public boolean removerPorId(int id) {
        String sql = "DELETE FROM disciplinas WHERE id_Disciplina=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DisciplinaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    public void alterarPorId(Disciplina disciplina) {
        String sql = "UPDATE `disciplinas` SET `nome_da_Disciplina`=?,`carga_Horaria`=? WHERE id_Disciplina=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setString(1, disciplina.getNome());
            stmt.setInt(2, disciplina.getCargaHora());
            stmt.setInt(3, disciplina.getIdDisciplina());

            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DisciplinaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
