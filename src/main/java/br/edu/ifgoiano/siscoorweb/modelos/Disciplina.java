/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.edu.ifgoiano.siscoorweb.modelos;

/**
 *
 * @author Tarcisio
 */
public class Disciplina {
    private String nome;
    private int idDisciplina;
    private String responsavel;
    private int cargaHora;
    private String semestre;

    public Disciplina(String nome) {
        this.nome = nome;
    }

    public Disciplina() {
    }

    public Disciplina(String nome, String responsavel, int cargaHora, String semestre) {
        this.nome = nome;
        this.responsavel = responsavel;
        this.cargaHora = cargaHora;
        this.semestre = semestre;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdDisciplina() {
        return idDisciplina;
    }

    public void setIdDisciplina(int idDisciplina) {
        this.idDisciplina = idDisciplina;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public int getCargaHora() {
        return cargaHora;
    }

    public void setCargaHora(int cargaHora) {
        this.cargaHora = cargaHora;
    }
    
    
}
