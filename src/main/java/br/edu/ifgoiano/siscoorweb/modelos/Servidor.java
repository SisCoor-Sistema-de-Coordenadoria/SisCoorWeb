/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.edu.ifgoiano.siscoorweb.modelos;

import java.util.Date;

/**
 *
 * @author Tarcisio
 */
public class Servidor {
    private int idServidor;
    private String nome;
    private String cpf;
    private String email;
    private String siape;
    private String senha;
    private String telefone;
    private int tipo;
    private Date dataNascimento;

    public Servidor(int idServidor, String nome, String cpf, String email, String suap, String senha, String telefone, int tipo, Date dataNascimento) {
        this.idServidor = idServidor;
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.siape = suap;
        this.senha = senha;
        this.telefone = telefone;
        this.tipo = tipo;
        this.dataNascimento = dataNascimento;
    }

    public Servidor() {
    }
    
    public Servidor(String nome){
        this.nome = nome;
    }

    public int getIdServidor() {
        return idServidor;
    }

    public void setIdServidor(int idServidor) {
        this.idServidor = idServidor;
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

    public String getSiape() {
        return siape;
    }

    public void setSiape(String siape) {
        this.siape = siape;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
    
    
}
