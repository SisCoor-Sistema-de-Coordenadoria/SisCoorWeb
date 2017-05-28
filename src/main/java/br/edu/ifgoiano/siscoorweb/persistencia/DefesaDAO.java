/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.DefesaTC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author IFgoiano
 */
public class DefesaDAO {
    Connection connection;

    public DefesaDAO(Connection connection) {
        this.connection = connection;
    }
   
    /**
     * Agendar nova defesa de trabalho de curso
     * @return 
     */
   public boolean agendar(DefesaTC defesa){
       String sql = "INSERT INTO agendarDefesa(local_da_defesa, data_da_defesa,"
               + " horario_da_defesa, id_trabalho_monografico, id_proposta) "
               + "VALUES (?,?,?,?,?);";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            Date data = new Date();
            
            stmt.setString(1,defesa.getLocal());
            stmt.setDate(2, (java.sql.Date) data,defesa.getData());
            stmt.setString(3,defesa.getHorario());
            stmt.setInt(4,defesa.getTrabalho().getId());
            stmt.setInt(5,defesa.getProposta().getIdProposta());
            
            stmt.execute();
            stmt.close();
           return true;
      
        } catch (SQLException ex) {
            Logger.getLogger(DefesaDAO.class.getName()).log(Level.SEVERE, null, ex);
           
            return false;
        }
   }
   
   /**
     * Alterar dados na tabela agendarDefesa
     * @return 
     */
   public boolean alterar(DefesaTC defesa){
       String sql = "UPDATE agendarDefesa local_da_defesa=?, data_da_defesa=?,"
               + " horario_da_defesa=? WHERE id_agendar_defesa=?;";
      
        try {
            Date data = new Date();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, defesa.getLocal());
            stmt.setDate(2, (java.sql.Date) data, defesa.getData());
            stmt.setString(3, defesa.getHorario());
            stmt.setInt(4, defesa.getId());
            
            return true;
         
        } catch (SQLException ex) {
            Logger.getLogger(DefesaDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
   }
   
   /**
     * Deletar de dados na tabela agendarDefesa
     * @return 
     */
   public boolean deletar(DefesaTC defesa){
       
       return true;
   }
   
   /**
     * Deletar de dados na tabela agendarDefesa
     * @return 
     */
   public boolean listar(DefesaTC defesa){
       return true;
   }
   
   /**
     * Deletar de dados na tabela agendarDefesa
     * @return 
     */
   public boolean buscar(DefesaTC defesa){
       return true;
   }
   
   /**
     * Transportar dados de defesa para trabalho monográfico, quando o mesmo for defendido
     * @return 
     */
   public boolean entregar(DefesaTC defesa){
       return true;
   }
   
   
       
}
