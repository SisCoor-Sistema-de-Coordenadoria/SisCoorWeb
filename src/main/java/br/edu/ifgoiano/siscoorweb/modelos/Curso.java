/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.modelos;

/**
 *
 * @author Tarcísio
 */
public class Curso {
    private int idCurso;
    private String nome;
    private String turno;
    //private Coordenador coordenador;

    public Curso(int idCurso, String nome, String turno) {
        this.idCurso = idCurso;
        this.nome = nome;
        this.turno = turno;
    }

    public Curso(String nome, String turno) {
        this.nome = nome;
        this.turno = turno;
    }
    
    public Curso() {
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }
}
