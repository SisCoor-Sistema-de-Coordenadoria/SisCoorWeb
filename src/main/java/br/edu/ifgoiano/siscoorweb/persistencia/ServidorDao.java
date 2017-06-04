/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.persistencia.ConnectionFactory;

import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author joesi
 */
public class ServidorDao {

    private Connection connection;

    public ServidorDao() {
        this.connection = new ConnectionFactory().getConnectionFactory();
    }

    /**
     * Autentica servidor do banco de dados
     * @param servidor
     * @return 
     */
    public Servidor autenticacao(Servidor servidor) {
        Servidor servidor_retorno = null;
        String sql = "SELECT * FROM Servidor WHERE suap = ? AND senha = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, servidor.getSiape());
            stmt.setString(2, servidor.getSenha());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                servidor_retorno = new Servidor();
                servidor_retorno.setIdServidor(rs.getInt("id_Servidor"));
              servidor_retorno.setNome(rs.getString("nome"));
              servidor_retorno.setSenha(rs.getString("senha"));
              servidor_retorno.setEmail(rs.getString("email"));
              servidor_retorno.setCpf(rs.getString("cpf"));
              servidor_retorno.setTelefone(rs.getString("telefone"));
              servidor_retorno.setTipo(rs.getInt("tipo"));
              servidor_retorno.setSiape(rs.getString("suap"));
              servidor_retorno.setDataNascimento(rs.getDate("data_nascimento"));
              
            }
              return servidor_retorno;            

        } catch (SQLException ex) {
            Logger.getLogger(ServidorDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    /**
     * Adiciona Servidor ao banco de dados
     * @param servidor 
     */
    public void adiciona(Servidor servidor) {
        String sql = "insert into Servidor"
                + "(id,nome,cpf,email,suap,,senha,telefone,tipo,data_de_Nascimento)"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            //prepared statement para inserção
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            //seta os valores
            stmt.setInt(1, servidor.getIdServidor());
            stmt.setString(2, servidor.getNome());
            stmt.setString(3, servidor.getCpf());
            stmt.setString(4, servidor.getEmail());
            stmt.setString(5, servidor.getSiape());
            stmt.setString(6, servidor.getSenha());
            stmt.setString(7, servidor.getTelefone());
            stmt.setInt(8, servidor.getTipo());
            stmt.setDate(9, servidor.getDataNascimento());

            //executa
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(ServidorDao.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Falha a inserir em ServidorDao", ex);
        }
    }
    
    /**
     * Retorna Lista de Servidores Cadastrados
     * @return 
     */
    public ArrayList<Servidor> getLista(){
        String sql = "SELECT * FROM Servidor";
        
        try {
            ArrayList<Servidor> servidores = new ArrayList();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Servidor servidor = new Servidor();
                servidor.setIdServidor(rs.getInt("id_Servidor"));
                servidor.setNome(rs.getString("nome"));
                servidor.setCpf(rs.getString("cpf"));
                servidor.setEmail(rs.getString("email"));
                servidor.setSenha(rs.getString("senha"));
                servidor.setTelefone(rs.getString("telefone"));
                servidor.setTipo(rs.getInt("tipo"));
                servidor.setSiape(rs.getString("suap"));
                servidor.setDataNascimento(rs.getDate("data_nascimento"));
                servidores.add(servidor);
            }
            rs.close();
            stmt.close();
            return servidores;
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
