/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
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
public class AlunoDao {

    private Connection connection;

    public AlunoDao() {
        this.connection = new ConnectionFactory().getConnectionFactory();
    }

    /**
     * Autentica aluno do banco de dados
     *
     * @param aluno
     * @return
     */
    public Aluno auntenticacao(Aluno aluno) {
        Aluno aluno_retorno = null;
        String sql = "select * FROM aluno where matricula=? and senha=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, aluno.getMatricula());
            stmt.setString(2, aluno.getSenha());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                aluno_retorno = new Aluno();
                aluno_retorno.setIdAluno(rs.getInt("id_Aluno"));
                aluno_retorno.setNome(rs.getString("nome"));
                aluno_retorno.setCpf(rs.getString("cpf"));
                aluno_retorno.setEmail(rs.getString("email"));
                aluno_retorno.setSenha(rs.getString("senha"));
                aluno_retorno.setTelefone(rs.getString("telefone"));
                aluno_retorno.setTipo(rs.getInt("tipo"));
                aluno_retorno.setMatricula(rs.getString("matricula"));
                aluno_retorno.setDataNascimento(rs.getDate("data_de_Nascimento"));
            }
            return aluno_retorno;

        } catch (SQLException ex) {
            Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
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
            throw new RuntimeException("Falha a inserir em AlunoDao", ex);
        }
    }

    /**
     * Retorna Lista de Alunos do banco de dados
     *
     * @return
     */
    public ArrayList<Aluno> getLista() {
        String sql = "SELECT * FROM aluno";

        try {
            ArrayList<Aluno> alunos = new ArrayList();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setIdAluno(rs.getInt("id_Aluno"));
                aluno.setNome(rs.getString("nome"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setEmail(rs.getString("email"));
                aluno.setSenha(rs.getString("senha"));
                aluno.setTelefone(rs.getString("telefone"));
                aluno.setTipo(rs.getInt("tipo"));
                aluno.setMatricula(rs.getString("matricula"));
                aluno.setDataNascimento(rs.getDate("data_de_Nascimento"));
                alunos.add(aluno);
            }
            rs.close();
            stmt.close();
            return alunos;
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Aluno getAluno(int idAluno) {
        Aluno aluno = new Aluno();
        String sql = "SELECT * FROM aluno WHERE id_Aluno = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, idAluno);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                aluno.setIdAluno(rs.getInt("id_Aluno"));
                aluno.setNome(rs.getString("nome"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setEmail(rs.getString("email"));
                aluno.setSenha(rs.getString("senha"));
                aluno.setTelefone(rs.getString("telefone"));
                aluno.setTipo(rs.getInt("tipo"));
                aluno.setMatricula(rs.getString("matricula"));
                aluno.setDataNascimento(rs.getDate("data_de_Nascimento"));
            }
            rs.close();
            stmt.close();
            return aluno;
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
