/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.modelos;

/**
 * @author Jehymeson Gil
 */
public class PropostaTrabalho {
    private int idProposta, idAluno01, idOrientador,
            idCoorientador, idAluno2;
    private String titulo, caminhoArquivo,dataEnvio;
    private boolean aceite;

    public int getIdProposta() {
        return idProposta;
    }

    public void setIdProposta(int idProposta) {
        this.idProposta = idProposta;
    }

    public int getIdAluno01() {
        return idAluno01;
    }

    public void setIdAluno01(int idAluno01) {
        this.idAluno01 = idAluno01;
    }

    public int getIdOrientador() {
        return idOrientador;
    }

    public void setIdOrientador(int idOrientador) {
        this.idOrientador = idOrientador;
    }

    public int getIdCoorientador() {
        return idCoorientador;
    }

    public void setIdCoorientador(int idCoorientador) {
        this.idCoorientador = idCoorientador;
    }

    public int getIdAluno2() {
        return idAluno2;
    }

    public void setIdAluno2(int idAluno2) {
        this.idAluno2 = idAluno2;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCaminhoArquivo() {
        return caminhoArquivo;
    }

    public void setCaminhoArquivo(String caminhoArquivo) {
        this.caminhoArquivo = caminhoArquivo;
    }

    public String getDataEnvio() {
        return dataEnvio;
    }

    public void setDataEnvio(String dataEnvio) {
        this.dataEnvio = dataEnvio;
    }

    public boolean isAceite() {
        return aceite;
    }

    public void setAceite(boolean aceite) {
        this.aceite = aceite;
    }
    
    public  void submeterProposta(){
        
    }
    
    public void gerarFichaAceite(){
        
    }
    
    public void avaliarProposta(){
        
    }
}
