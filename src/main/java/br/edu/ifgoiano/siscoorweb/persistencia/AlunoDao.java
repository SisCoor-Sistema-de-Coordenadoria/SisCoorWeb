/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.persistencia.ConnectionFactory;
import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;

/**
 *
 * @author joesi
 */
public class AlunoDao {
    private Connection connection;

    public AlunoDao() {
        this.connection = new ConnectionFactory().getConnectionFactory();
    }
     public Aluno auntenticacao(Aluno aluno){
        Aluno alunoretorno =null;
         String sql = "select * FROM aluno where matricula=? and senha=?";
   try{
     PreparedStatement stmt = connection.prepareStatement(sql);
   stmt.setString(1,aluno.getMatricula());
   stmt.setString(2,aluno.getSenha());
    ResultSet  rs =stmt.executeQuery();
    
    if (rs.next()){
    alunoretorno = new Aluno();
   alunoretorno.setMatricula(rs.getString("Matricula"));
   alunoretorno.setSenha(rs.getString("senha"));
    

    
    }System.out.println("logado com sucesso");
    
   }catch(SQLException ex){
    java.util.logging.Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
    throw new RuntimeException("Falha a buscar em AlunoDao",ex);
    
}
    return alunoretorno;
}
      public void adiciona(Aluno aluno) {
        String sql = "insert into aluno"
                + "(id_Aluno,nome,cpf,email,senha,telefone,tipo,matricula,data_de_Nascimento)"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            //prepared statement para inserção
            PreparedStatement stmt = (PreparedStatement) connection.prepareStatement(sql);
            //seta os valores
            stmt.setInt(1, aluno.getIdAluno());
            stmt.setString(2, aluno.getNome());
            stmt.setString(3, aluno.getCpf());
            stmt.setString(4, aluno.getEmail());
            stmt.setString(5, aluno.getSenha());
            stmt.setString(6, aluno.getTelefone());
            stmt.setInt(7, aluno.getTipo());
            stmt.setString(8, aluno.getMatricula());
            stmt.setDate(9, aluno.getDataNascimento());
            
            
           
            //executa
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Falha a inserir em AlunoDao",ex);
        }
    }
}
