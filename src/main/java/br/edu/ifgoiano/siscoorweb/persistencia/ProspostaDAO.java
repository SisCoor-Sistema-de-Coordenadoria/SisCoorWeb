/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho;
import br.edu.ifgoiano.siscoorweb.servlets.UploadServletPTC;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Jehymeson Gil
 */
public class ProspostaDAO {
    
    Connection connection;
    private PropostaTrabalho proposta;
    
    public ProspostaDAO(PropostaTrabalho proposta){
        this.connection = new ConnectionFactory().getConnectionFactory();
        proposta = new PropostaTrabalho();
    }

    public ProspostaDAO() {
        this.connection = new ConnectionFactory().getConnectionFactory();
    }

    public PropostaTrabalho getProposta() {
        return proposta;
    }

    public void setProposta(PropostaTrabalho proposta) {
        this.proposta = proposta;
    }
    
    /**
     * Inserção de dados na tabela Proposta de TC
     * @return 
     */
    public boolean insereDados(){
        
        String sql = "INSERT INTO proposta("
                + "titulo, "
                + "id_aluno_1, "
                + "id_aluno_2, "
                + "id_Orientador_1, "
                + "id_Orientador_2, "
                + "data_Envio, "
                + "aceite, "
                + "caminho) VALUES (?,?,?,?,?,?,?,?)";
        
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, proposta.getTituloPTC());
            stmt.setInt(2, proposta.getAluno1().getIdAluno());
            stmt.setInt(3, proposta.getAluno2().getIdAluno());
            stmt.setInt(4, proposta.getOrientador().getIdServidor());
            stmt.setInt(5, proposta.getCoorientador().getIdServidor());
            stmt.setDate(6, (Date) proposta.getDataEnvio());
            stmt.setInt(7, 0);
            stmt.setString(8, proposta.getCaminhoArquivo());
            stmt.executeUpdate();
            stmt.close();
            connection.close();
            
            return true;
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        
    }
    
    /**
     * Apagando dados na tabela Proposta de TC
     * @return 
     */
    public boolean deletaDados(){
        return false;
    }
    
    /**
     * Atualizando de dados na tabela Proposta de TC
     * @return 
     */
    public boolean atualizaDados(){
        return false;
    }
    
    /**
     * Pesquisa de dados na tabela Proposta de TC
     * @return 
     */
    public boolean buscaDados(){
        return false;
    }
}
