
import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao;
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jehymeson Gil
 */
public class Testes {
    public static void main(String[] args) {
        Aluno aluno = new Aluno();
        Servidor servidor = new Servidor();
        
        ServidorDao servidorDao = new ServidorDao();
        ArrayList<Servidor> servidores = servidorDao.getLista();
        
        AlunoDao alunoDao = new AlunoDao();
        ArrayList<Aluno> alunos = alunoDao.getLista();
        
        for(int i = 0; i < alunos.size(); i++){
            if(alunos.get(i).getIdAluno() == 2){
                aluno.setNome(alunos.get(i).getNome());
                aluno.setSenha(alunos.get(i).getSenha());
                aluno.setCpf(alunos.get(i).getCpf());
                aluno.setDataNascimento(alunos.get(i).getDataNascimento());
                aluno.setEmail(alunos.get(i).getEmail());
                aluno.setTelefone(alunos.get(i).getTelefone());
                aluno.setTipo(alunos.get(i).getTipo());
                aluno.setIdAluno(alunos.get(i).getIdAluno());
                aluno.setMatricula(alunos.get(i).getMatricula());
            }
        }
        
        for(int i = 0; i < servidores.size(); i++){
            if(servidores.get(i).getIdServidor()== 1){
                servidor.setNome(servidores.get(i).getNome());
                servidor.setSenha(servidores.get(i).getSenha());
                servidor.setCpf(servidores.get(i).getCpf());
                servidor.setDataNascimento(servidores.get(i).getDataNascimento());
                servidor.setEmail(servidores.get(i).getEmail());
                servidor.setTelefone(servidores.get(i).getTelefone());
                servidor.setTipo(servidores.get(i).getTipo());
                servidor.setIdServidor(servidores.get(i).getIdServidor());
                servidor.setSiape(servidores.get(i).getSiape());
            }
        }
        
        System.out.println("--------------------------------------");
        System.out.println("Nome: "+aluno.getNome());
        System.out.println("ID  : "+aluno.getIdAluno());
        System.out.println("--------------------------------------");
        System.out.println("Nome: "+servidor.getNome());
        System.out.println("ID  : "+servidor.getIdServidor());
        System.out.println("--------------------------------------");
        
    }
}
