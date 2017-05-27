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
public class Servidor {
    private String suap;
    private String senha;
    private int id;
    private String nome;
    private String cpf;
    private String email;
    private String telefone;
    private int tipo;
    private Date DatadeNascimento;
    
    /**
     * @return the suap
     */
    public String getSuap() {
        return suap;
    }

    /**
     * @param suap the suap to set
     */
    public void setSuap(String suap) {
        this.suap = suap;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the DatadeNascimento
     */
    public Date getDatadeNascimento() {
        return DatadeNascimento;
    }

    /**
     * @param DatadeNascimento the DatadeNascimento to set
     */
    public void setDatadeNascimento(Date DatadeNascimento) {
        this.DatadeNascimento = DatadeNascimento;
    }

    /**
     * @return the suap
     */
    
}
