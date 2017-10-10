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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author TarcÃ­sio
 */
public class Curso {
    private int idCurso;
    private String nome;
    private String turno;
    private int idProfessorCoordenador;
    private int numDePeriodos;
    private String nomeCoordenador;
    //private Coordenador coordenador;

    public Curso(int idCurso, String nome, String turno, int idProfessorCoordenador, int numDePeriodos) {
        this.idCurso = idCurso;
        this.nome = nome;
        this.turno = turno;
        this.idProfessorCoordenador = idProfessorCoordenador;
        this.numDePeriodos = numDePeriodos;
    }

    public Curso(String nome, String turno, int idProfessorCoordenador, int numDePeriodos) {
        this.nome = nome;
        this.turno = turno;
        this.idProfessorCoordenador = idProfessorCoordenador;
        this.numDePeriodos = numDePeriodos;
    }

    public Curso(String nome, String turno) {
        this.nome = nome;
        this.turno = turno;
    }
    
 
    public Curso() {
    }

    public String getNomeCoordenador() {
        return nomeCoordenador;
    }

    public void setNomeCoordenador(String nom_coordenador) {
        this.nomeCoordenador = nom_coordenador;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public int getIdProfessorCoordenador() {
        return idProfessorCoordenador;
    }

    public void setIdProfessorCoordenador(int idProfessorCoordenador) {
        this.idProfessorCoordenador = idProfessorCoordenador;
    }

    public int getNumDePeriodos() {
        return numDePeriodos;
    }

    public void setNumDePeriodos(int numDePeriodos) {
        this.numDePeriodos = numDePeriodos;
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