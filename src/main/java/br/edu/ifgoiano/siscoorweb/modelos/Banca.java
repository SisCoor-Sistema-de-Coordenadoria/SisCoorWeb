/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.modelos;

import java.util.ArrayList;

/**
 *
 * @author IFgoiano
 */
public class Banca {
    private ArrayList<Servidor> lista;
    private PropostaTrabalho proposta;

    public ArrayList<Servidor> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Servidor> lista) {
        this.lista = lista;
    }

    public PropostaTrabalho getProposta() {
        return proposta;
    }

    public void setProposta(PropostaTrabalho proposta) {
        this.proposta = proposta;
    }
}
