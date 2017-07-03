/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.modelos;

import java.sql.Date;

/**
 *
 * @author joesi
 */
public class Aluno {
    private String senha;
    private String matricula;
    private int idAluno;
    private String nome;
    private String cpf;
    private String email;
    private String telefone;
    private Date dataNascimento; 
    private int tipo;
    private Curso curso;

    public Aluno(String nome) {
        this.nome = nome;
    }
    
    public Aluno(int idAluno) {
        this.idAluno = idAluno;
    }
    
    public Aluno(String nome, int idAluno){
        this.nome = nome;
        this.idAluno = idAluno;
    }

    public Aluno(String senha, String matricula, int idAluno, String nome, String cpf, String email, String telefone, Date dataNascimento, int tipo) {
        this.senha = senha;
        this.matricula = matricula;
        this.idAluno = idAluno;
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.telefone = telefone;
        this.dataNascimento = dataNascimento;
        this.tipo = tipo;
    }

    public Aluno() {
    }
    
    
    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
}
