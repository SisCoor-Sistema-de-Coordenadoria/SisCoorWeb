/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.Curso;
import br.edu.ifgoiano.siscoorweb.modelos.Disciplina;
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
 * @author Diego
 */
public class CursoDAO 
{
    Connection connection;
    
    public CursoDAO()
    {
        this.connection = new ConnectionFactory().getConnectionFactory();
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
       String sql = "SELECT * FROM curso WHERE nome=? AND turno=? AND numero_de_Periodos=?;";
        
       Curso cur = new Curso();
       
       try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,curso.getNome());
            stmt.setString(2, curso.getTurno());
            stmt.setInt(3, curso.getNumDePeriodos());
            
            ResultSet rs = stmt.executeQuery();
            rs.first();
            
            cur.setIdProfessorCoordenador(rs.getInt("professor_Coordenador"));
            cur.setNome(rs.getString("nome"));
            cur.setTurno(rs.getString("turno"));
            cur.setNumDePeriodos(rs.getInt("numero_de_Periodos"));
      
        } catch (SQLException ex) {
            Logger.getLogger(CursoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return cur;
    }
    
   public ArrayList<Curso> getLista() {
        String sql = "SELECT * FROM curso ORDER BY nome asc";
        ArrayList<Curso> listaCursos = new ArrayList<Curso>();
        
        try {
            
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            ServidorDao servidorDAO = new ServidorDao();

            while (rs.next()) {

                Curso curso = new Curso();
                Servidor servidor = new Servidor();
                
                curso.setIdCurso(rs.getInt("id_Curso"));
                curso.setNome(rs.getString("nome"));
                curso.setTurno(rs.getString("turno"));
                curso.setNumDePeriodos(rs.getInt("numero_de_Periodos"));
                servidor=servidorDAO.buscaPorId(rs.getInt("professor_Coordenador"));
                
                curso.setNomeCoordenador(servidor.getNome());
                listaCursos.add(curso);
            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(CursoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaCursos;
    }
    
    public Curso buscarPorId(int id){
       String sql = "SELECT * FROM curso WHERE id_Curso LIKE ?;";
        
       Curso curso = new Curso();

       try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1,id);
            
            ResultSet rs = stmt.executeQuery();
            rs.first();
            
            curso.setIdCurso(rs.getInt("id_Curso"));
            curso.setNome(rs.getString("nome"));
            curso.setTurno(rs.getString("turno"));
            curso.setNumDePeriodos(rs.getInt("numero_de_Periodos"));
            curso.setIdProfessorCoordenador(rs.getInt("professor_Coordenador"));
      
        } catch (SQLException ex) {
            Logger.getLogger(CursoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return curso;
    }
    
    public Curso buscarCoordenadorId(int id){
       String sql = "SELECT * FROM curso WHERE professor_Coordenador LIKE ?;";
        
       Curso curso = new Curso();

       try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1,id);
            
            ResultSet rs = stmt.executeQuery();
            rs.first();
            
            curso.setIdCurso(rs.getInt("id_Curso"));
            curso.setNome(rs.getString("nome"));
            curso.setTurno(rs.getString("turno"));
            curso.setNumDePeriodos(rs.getInt("numero_de_Periodos"));
            curso.setIdProfessorCoordenador(rs.getInt("professor_Coordenador"));
      
        } catch (SQLException ex) {
            Logger.getLogger(CursoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return curso;
    }
    
    public boolean removerPorId(int id) {
        String sql = "DELETE FROM curso WHERE id_Curso=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(CursoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    public void alterarPorId(Curso curso) {
        String sql = "UPDATE `curso` SET `nome`=?,`turno`=?, `professor_Coordenador`=?, `numero_de_Periodos`=? WHERE id_Curso=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            stmt.setString(1, curso.getNome());
            stmt.setString(2, curso.getTurno());
            stmt.setInt(3, curso.getIdProfessorCoordenador());
            stmt.setInt(4, curso.getNumDePeriodos());
            stmt.setInt(5, curso.getIdCurso());

            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(CursoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
