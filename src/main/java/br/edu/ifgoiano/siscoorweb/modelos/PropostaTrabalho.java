/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.modelos;

import java.util.Date;

/**
 * @author Jehymeson Gil
 */
public class PropostaTrabalho {
    private Aluno aluno1 = new Aluno();
    private Aluno aluno2;
    private Servidor orientador = new Servidor();
    private Servidor coorientador;
    private Date dataEnvio, horaEnvio;
    private int idProposta;
    private String tituloPTC, caminhoArquivo;
    private boolean aceite;

    public int getIdProposta() {
        return idProposta;
    }

    public void setIdProposta(int idProposta) {
        this.idProposta = idProposta;
    }

    public String getTituloPTC() {
        return tituloPTC;
    }

    public void setTitulo(String tituloPTC) {
        this.tituloPTC = tituloPTC;
    }

    public String getCaminhoArquivo() {
        return caminhoArquivo;
    }

    public void setCaminhoArquivo(String caminhoArquivo) {
        this.caminhoArquivo = caminhoArquivo;
    }

    public Date getDataEnvio() {
        return dataEnvio;
    }

    public void setDataEnvio(Date dataEnvio) {
        this.dataEnvio = dataEnvio;
    }

    public boolean isAceite() {
        return aceite;
    }

    public void setAceite(boolean aceite) {
        this.aceite = aceite;
    }

    public Aluno getAluno1() {
        return aluno1;
    }

    public void setAluno1(Aluno aluno1) {
        this.aluno1 = aluno1;
    }

    public Aluno getAluno2() {
        return aluno2;
    }

    public void setAluno2(Aluno aluno2) {
        this.aluno2 = aluno2;
    }

    public Servidor getOrientador() {
        return orientador;
    }

    public void setOrientador(Servidor orientador) {
        this.orientador = orientador;
    }

    public Servidor getCoorientador() {
        return coorientador;
    }

    public void setCoorientador(Servidor coorientador) {
        this.coorientador = coorientador;
    }

    public Date getHoraEnvio() {
        return horaEnvio;
    }

    public void setHoraEnvio(Date horaEnvio) {
        this.horaEnvio = horaEnvio;
    }
}
