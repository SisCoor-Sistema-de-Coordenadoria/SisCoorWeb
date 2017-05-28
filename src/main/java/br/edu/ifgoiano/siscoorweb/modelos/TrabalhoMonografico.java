/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.modelos;

/**
 *
 * @author IFgoiano
 */
public class TrabalhoMonografico {
    private int id;
    private PropostaTrabalho proposta;
    private Aluno aluno1;
    private Aluno aluno2;
    private Servidor orientador;
    private Servidor coorientador;
    private String titulo;
    private String caminho;
    private boolean aprovacao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public PropostaTrabalho getProposta() {
        return proposta;
    }

    public void setProposta(PropostaTrabalho proposta) {
        this.proposta = proposta;
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

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCaminho() {
        return caminho;
    }

    public void setCaminho(String caminho) {
        this.caminho = caminho;
    }

    public boolean isAprovacao() {
        return aprovacao;
    }

    public void setAprovacao(boolean aprovacao) {
        this.aprovacao = aprovacao;
    }
    
    
           
}
