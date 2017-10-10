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

    public Servidor auntenticacao(Servidor servidor) {
        Servidor servidorretorno = null;
        String sql = "SELECT * FROM servidor WHERE suap=? and senha=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, servidor.getSiape());
            stmt.setString(2, servidor.getSenha());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
            
                servidorretorno = new Servidor();
                servidorretorno.setSiape(rs.getString("Suap"));
                servidorretorno.setSenha(rs.getString("senha"));

            }
            
            System.out.println("logado com sucesso");

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(ServidorDao.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Falha a buscar em ServidorDao", ex);

        }
        return servidorretorno;
    }
    
    public Servidor buscaPorNome(Servidor servidor) {
        
        Servidor servidorretorno = null;
        String sql = "SELECT * FROM servidor WHERE nome LIKE ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, servidor.getNome());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                servidorretorno = new Servidor();
                servidorretorno.setIdServidor(rs.getInt("id_Servidor"));
                servidorretorno.setNome(rs.getString("nome"));
                servidorretorno.setCpf(rs.getString("cpf"));               
                servidorretorno.setEmail(rs.getString("email"));
                servidorretorno.setSiape(rs.getString("suap"));
                servidorretorno.setTelefone(rs.getString("telefone"));
                servidorretorno.setTipo(rs.getInt("tipo"));
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(ServidorDao.class.getName()).log(Level.SEVERE, null, ex);

        }
        return servidorretorno;
    }

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
    
    public ArrayList<Servidor> getLista(){
        String sql = "SELECT * FROM servidor ORDER BY nome asc";

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
    
    public Servidor buscaPorId(int id) {
        
        Servidor servidorretorno = null;
        String sql = "select * FROM servidor where id_Servidor=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                servidorretorno = new Servidor();
                servidorretorno.setIdServidor(rs.getInt("id_Servidor"));
                servidorretorno.setNome(rs.getString("nome"));
                servidorretorno.setCpf(rs.getString("cpf"));               
                servidorretorno.setEmail(rs.getString("email"));
                servidorretorno.setSiape(rs.getString("suap"));
                servidorretorno.setTelefone(rs.getString("telefone"));
                servidorretorno.setTipo(rs.getInt("tipo"));
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(ServidorDao.class.getName()).log(Level.SEVERE, null, ex);

        }
        return servidorretorno;
    }
    
    public boolean removerPorId(int id) {
        String sql = "DELETE FROM servidor WHERE id_Servidor=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServidorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    } 
    
    public boolean cpfJaCadastrado(String cpf){
        String sql = "SELECT * FROM Servidor where cpf like ?";
        
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setString(1,cpf);
            
            ResultSet rs = stmt.executeQuery();
            
            boolean existe = rs.first();
            
            System.out.println(existe);
            
            rs.close();
            stmt.close();
            return existe;
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean emailJaCadastrado(String email){
        String sql = "SELECT * FROM Servidor where email like ?";
        
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setString(1,email);
            
            ResultSet rs = stmt.executeQuery();
            
            boolean existe = rs.first();
            
            System.out.println(existe);
            
            rs.close();
            stmt.close();
            return existe;
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean siapeJaCadastrado(String siape){
        String sql = "SELECT * FROM Servidor where suap like ?";
        
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setString(1,siape);
            
            ResultSet rs = stmt.executeQuery();
            
            boolean existe = rs.first();
            
            System.out.println(existe);
            
            rs.close();
            stmt.close();
            return existe;
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
}
