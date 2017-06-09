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
    private String cargaHora;

    public Disciplina(String nome) {
        this.nome = nome;
    }

    public Disciplina() {
    }

    public Disciplina(String nome, String cargaHora) {
        this.nome = nome;
        this.cargaHora = cargaHora;
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

    public String getCargaHora() {
        return cargaHora;
    }

    public void setCargaHora(String cargaHora) {
        this.cargaHora = cargaHora;
    }
    
    
}
