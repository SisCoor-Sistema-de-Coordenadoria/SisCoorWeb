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
        DefesaTC defesa = null;
        DefesaDAO instance = null;
        boolean expResult = false;
        boolean result = instance.agendar(defesa);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of alterar method, of class DefesaDAO.
     */
    @Test
    public void testAlterar() {
        System.out.println("alterar");
        DefesaTC defesa = null;
        DefesaDAO instance = null;
        boolean expResult = false;
        boolean result = instance.alterar(defesa);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deletar method, of class DefesaDAO.
     */
    @Test
    public void testDeletar() {
        System.out.println("deletar");
        DefesaTC defesa = null;
        DefesaDAO instance = null;
        boolean expResult = false;
        boolean result = instance.deletar(defesa);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of listar method, of class DefesaDAO.
     */
    @Test
    public void testListar() {
        System.out.println("listar");
        DefesaTC defesa = null;
        DefesaDAO instance = null;
        boolean expResult = false;
        boolean result = instance.listar(defesa);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of buscar method, of class DefesaDAO.
     */
    @Test
    public void testBuscar() {
        System.out.println("buscar");
        DefesaTC defesa = null;
        DefesaDAO instance = null;
        boolean expResult = false;
        boolean result = instance.buscar(defesa);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of entregar method, of class DefesaDAO.
     */
    @Test
    public void testEntregar() {
        System.out.println("entregar");
        DefesaTC defesa = null;
        DefesaDAO instance = null;
        boolean expResult = false;
        boolean result = instance.entregar(defesa);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
