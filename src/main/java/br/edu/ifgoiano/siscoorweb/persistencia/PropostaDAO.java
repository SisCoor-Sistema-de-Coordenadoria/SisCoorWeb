/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Jehymeson Gil
 */
public class PropostaDAO {

    Connection connection;
    private PropostaTrabalho proposta;

    public PropostaDAO(PropostaTrabalho proposta) {
        this.connection = new ConnectionFactory().getConnectionFactory();
        proposta = new PropostaTrabalho();
    }

    public PropostaDAO() {
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
     *
     * @return
     */
    public boolean insereDados(PropostaTrabalho proposta) {
        String sql = "INSERT INTO Proposta(titulo, id_aluno_1, "
                + (proposta.getAluno2().getIdAluno() == 0 ? "" : "id_aluno_2,")
                + "id_Orientador_1, "
                + (proposta.getCoorientador().getIdServidor() == 0 ? "" : "id_Orientador_2,")
                + "data_Envio, hora_envio, aceite, caminho) VALUES (?,?,"
                + (proposta.getAluno2().getIdAluno() == 0 ? "" : "?,")
                + "?,"
                + (proposta.getCoorientador().getIdServidor() == 0 ? "" : "?,")
                + "?,?,?,?)";
        
            System.out.println(sql);
        
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, proposta.getTituloPTC());
            stmt.setInt(2, proposta.getAluno1().getIdAluno());
            if (proposta.getAluno2().getIdAluno() == 0 && proposta.getCoorientador().getIdServidor() == 0) {
                stmt.setInt(3, proposta.getOrientador().getIdServidor());
                stmt.setString(4, proposta.getDataEnvio());
                stmt.setString(5, proposta.getHoraEnvio());
                stmt.setInt(6, 0);
                stmt.setString(7, proposta.getCaminhoArquivo());
            } else if (proposta.getAluno2().getIdAluno() == 0 && proposta.getCoorientador().getIdServidor() != 0) {
                stmt.setInt(3, proposta.getOrientador().getIdServidor());
                stmt.setInt(4, proposta.getCoorientador().getIdServidor());
                stmt.setString(5, proposta.getDataEnvio());
                stmt.setString(6, proposta.getHoraEnvio());
                stmt.setInt(7, 0);
                stmt.setString(8, proposta.getCaminhoArquivo());
            } else if (proposta.getAluno2().getIdAluno() != 0 && proposta.getCoorientador().getIdServidor() == 0) {
                stmt.setInt(3, proposta.getAluno2().getIdAluno());
                stmt.setInt(4, proposta.getOrientador().getIdServidor());
                stmt.setString(5, proposta.getDataEnvio());
                stmt.setString(6, proposta.getHoraEnvio());
                stmt.setInt(7, 0);
                stmt.setString(8, proposta.getCaminhoArquivo());
            } else {
                stmt.setInt(3, proposta.getAluno2().getIdAluno());
                stmt.setInt(4, proposta.getOrientador().getIdServidor());
                stmt.setInt(5, proposta.getCoorientador().getIdServidor());
                stmt.setString(6, proposta.getDataEnvio());
                stmt.setString(7, proposta.getHoraEnvio());
                stmt.setInt(8, 0);
                stmt.setString(9, proposta.getCaminhoArquivo());
            }

            stmt.execute();
            stmt.close();
            connection.close();

            return true;
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

    }

    /**
     * Apagando dados na tabela Proposta de TC
     *
     * @return
     */
    public boolean deletaDados() {
        return false;
    }

    /**
     * Atualizando de dados na tabela Proposta de TC
     *
     * @return
     */
    public boolean atualizaDados() {
        return false;
    }

    /**
     * Pesquisa de dados na tabela Proposta de TC
     *
     * @return
     */
    public boolean buscaDados() {
        return false;
    }
}
