/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
import java.sql.Connection;
import java.sql.Date;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author joesi
 */
public class AlunoDaoTest {
    
    public AlunoDaoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of auntenticacao method, of class AlunoDao.
     */
    @org.junit.Test
    public void testAuntenticacao() {
        System.out.println("auntenticacao");
        Connection connection = new ConnectionFactory().getConnectionFactory();
        Aluno a = new Aluno ();
        AlunoDao adao = new AlunoDao();
        a.setMatricula("2015");
        a.setSenha("2015");
      adao.auntenticacao(a);
       
    }

    /**
     * Test of adiciona method, of class AlunoDao.
     */
    @org.junit.Test
    public void testAdiciona() {
        System.out.println("adiciona");
         Connection connection = new ConnectionFactory().getConnectionFactory();
        Aluno a = new Aluno ();
        AlunoDao adao = new AlunoDao();
       a.setIdAluno(1);
       a.setNome("joaozinho");
       a.setCpf("020964879580");
       a.setEmail("joao@gmail.com");
       a.setSenha("pinga");
       a.setDataNascimento(new Date(1997, 5, 8));
       a.setTipo(0);
       a.setMatricula("123213");
       a.setTelefone("999099087");
    }
    
}
