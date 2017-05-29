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
import java.util.logging.Level;

/**
 *
 * @author joesi
 */
public class ServidorDao {
    private Connection connection;

    public ServidorDao() {
        this.connection = new ConnectionFactory().getConnectionFactory();
    }
     public Servidor auntenticacao(Servidor servidor){
        Servidor servidorretorno =null;
         String sql = "select * FROM servidor where suap=? and senha=?";
   try{
     PreparedStatement stmt = connection.prepareStatement(sql);
   stmt.setString(1,servidor.getSiape());
   stmt.setString(2,servidor.getSenha());
    ResultSet  rs =stmt.executeQuery();
    
    if (rs.next()){
    servidorretorno = new Servidor();
   servidorretorno.setSiape(rs.getString("Suap"));
   servidorretorno.setSenha(rs.getString("senha"));
    

    
    }System.out.println("logado com sucesso");
    
   }catch(SQLException ex){
    java.util.logging.Logger.getLogger(ServidorDao.class.getName()).log(Level.SEVERE, null, ex);
    throw new RuntimeException("Falha a buscar em ServidorDao",ex);
    
}
    return servidorretorno;
}
     public void adiciona(Servidor servidor) {
        String sql = "insert into servidor"
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
            throw new RuntimeException("Falha a inserir em ServidorDao",ex);
        }
    }
}
