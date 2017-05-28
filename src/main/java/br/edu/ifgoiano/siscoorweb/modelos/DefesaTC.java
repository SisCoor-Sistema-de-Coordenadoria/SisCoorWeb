/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.modelos;

import java.util.Calendar;

/**
 *
 * @author IFgoiano
 */
public class DefesaTC {
    private PropostaTrabalho proposta;
    private String local;
    private Calendar data;
    private String horario;
    private Banca banca;
    private int id;
    private TrabalhoMonografico trabalho;

    public PropostaTrabalho getProposta() {
        return proposta;
    }

    public void setProposta(PropostaTrabalho proposta) {
        this.proposta = proposta;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public Calendar getData() {
        return data;
    }

    public void setData(Calendar data) {
        this.data = data;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public Banca getBanca() {
        return banca;
    }

    public void setBanca(Banca banca) {
        this.banca = banca;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TrabalhoMonografico getTrabalho() {
        return trabalho;
    }

    public void setTrabalho(TrabalhoMonografico trabalho) {
        this.trabalho = trabalho;
    }

        
}
