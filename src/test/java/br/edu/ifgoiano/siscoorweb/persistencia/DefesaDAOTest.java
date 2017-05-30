/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.DefesaTC;
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
public class DefesaDAOTest {
    
    public DefesaDAOTest() {
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
     * Test of agendar method, of class DefesaDAO.
     */
    @Test
    public void testAgendar() {
        System.out.println("agendar");
       DefesaTC d = new DefesaTC();
       DefesaDAO dao= new DefesaDAO();
       d.setId(2);
       d.setLocal("if");
       d.setHorario("14:30");
       dao.agendar(d);
    }

    /**
     * Test of alterar method, of class DefesaDAO.
     */
    @Test
    public void testAlterar() {
        System.out.println("alterar");
         DefesaTC d = new DefesaTC();
       DefesaDAO dao= new DefesaDAO();
       
    }

    /**
     * Test of deletar method, of class DefesaDAO.
     */
    @Test
    public void testDeletar() {
        System.out.println("deletar");
      
    }

    /**
     * Test of listar method, of class DefesaDAO.
     */
    @Test
    public void testListar() {
        System.out.println("listar");
     
    }

    /**
     * Test of buscar method, of class DefesaDAO.
     */
    @Test
    public void testBuscar() {
        System.out.println("buscar");
      
    }

    /**
     * Test of entregar method, of class DefesaDAO.
     */
    @Test
    public void testEntregar() {
        System.out.println("entregar");

    }
    
}
