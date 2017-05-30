/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.persistencia;

import br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho;
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
public class PropostaDAOTest {
    
    public PropostaDAOTest() {
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
     * Test of getProposta method, of class PropostaDAO.
     */
    @Test
    public void testGetProposta() {
        System.out.println("getProposta");
        PropostaDAO instance = new PropostaDAO();
        PropostaTrabalho expResult = null;
        PropostaTrabalho result = instance.getProposta();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setProposta method, of class PropostaDAO.
     */
    @Test
    public void testSetProposta() {
        System.out.println("setProposta");
        PropostaTrabalho proposta = null;
        PropostaDAO instance = new PropostaDAO();
        instance.setProposta(proposta);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insereDados method, of class PropostaDAO.
     */
    @Test
    public void testInsereDados() {
        System.out.println("insereDados");
        PropostaTrabalho proposta = null;
        PropostaDAO instance = new PropostaDAO();
        boolean expResult = false;
        boolean result = instance.insereDados(proposta);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deletaDados method, of class PropostaDAO.
     */
    @Test
    public void testDeletaDados() {
        System.out.println("deletaDados");
        PropostaDAO instance = new PropostaDAO();
        boolean expResult = false;
        boolean result = instance.deletaDados();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of atualizaDados method, of class PropostaDAO.
     */
    @Test
    public void testAtualizaDados() {
        System.out.println("atualizaDados");
        PropostaDAO instance = new PropostaDAO();
        boolean expResult = false;
        boolean result = instance.atualizaDados();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of buscaDados method, of class PropostaDAO.
     */
    @Test
    public void testBuscaDados() {
        System.out.println("buscaDados");
        PropostaDAO instance = new PropostaDAO();
        boolean expResult = false;
        boolean result = instance.buscaDados();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
