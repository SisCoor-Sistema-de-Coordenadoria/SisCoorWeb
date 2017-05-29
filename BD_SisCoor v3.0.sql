
DROP DATABASE IF EXISTS siscoorweb;

CREATE DATABASE siscoorweb;

use siscoorweb;

CREATE TABLE Disciplinas (
  id_Disciplina INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_da_Disciplina VARCHAR(50) NULL,
  carga_Horaria INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Disciplina)
);

CREATE TABLE Laboratorio (
  id_Laboratorio INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome TEXT NULL,
  tipo TEXT NULL,
  predio TEXT NULL,
  PRIMARY KEY(id_Laboratorio)
);

CREATE TABLE Servidor (
  id_Servidor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NULL,
  cpf VARCHAR(11) NULL,
  email VARCHAR(40) NULL,
  suap VARCHAR(10) NULL,
  senha TEXT NULL,
  telefone VARCHAR(11) NULL,
  tipo INTEGER(1) UNSIGNED NULL,
  data_nascimento DATE NULL,
  PRIMARY KEY(id_Servidor)
);

CREATE TABLE Aluno (
  id_Aluno INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NULL,
  cpf VARCHAR(11) NULL,
  email VARCHAR(40) NULL,
  senha TEXT NULL,
  telefone VARCHAR(11) NULL,
  tipo INTEGER(1) UNSIGNED NULL,
  matricula INTEGER(20) UNSIGNED NULL,
  data_de_Nascimento DATE NULL,
  PRIMARY KEY(id_Aluno)
);

CREATE TABLE Restricao_do_Professor (
  id_Restricao_do_Professor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  id_do_Professor INTEGER UNSIGNED NULL,
  turno VARCHAR(20) NULL,
  dia VARCHAR(20) NULL,
  PRIMARY KEY(id_Restricao_do_Professor),
  INDEX Restricao_do_Professor_FKIndex1(id_do_Professor),
  FOREIGN KEY(id_do_Professor)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Curso (
  id_Curso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  turno VARCHAR(30) NULL,
  professor_Coordenador INTEGER UNSIGNED NULL,
  numero_de_Periodos INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Curso),
  INDEX Curso_FKIndex1(professor_Coordenador),
  FOREIGN KEY(professor_Coordenador)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Restricao_de_Aula_do_Professor (
  id_Restricao_de_Aula_do_Professor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  hora_Inicial VARCHAR(10) NULL,
  hora_Final VARCHAR(10) NULL,
  id_do_Professor INTEGER UNSIGNED NULL,
  dia VARCHAR(20) NULL,
  PRIMARY KEY(id_Restricao_de_Aula_do_Professor),
  INDEX Restricao_de_Aula_do_Professor_FKIndex1(id_do_Professor),
  FOREIGN KEY(id_do_Professor)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Monitoria (
  id_monitoria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  id_aluno INTEGER UNSIGNED NULL,
  id_disciplina INTEGER UNSIGNED NULL,
  id_orientador INTEGER UNSIGNED NULL,
  carga_horaria_semanal INTEGER UNSIGNED NULL,
  categoria VARCHAR(20) NULL,
  ano_letivo INTEGER UNSIGNED NULL,
  data_inicio DATE NULL,
  data_final DATE NULL,
  PRIMARY KEY(id_monitoria),
  INDEX Monitoria_FKIndex1(id_disciplina),
  INDEX Monitoria_FKIndex2(id_aluno),
  INDEX Monitoria_FKIndex3(id_orientador),
  FOREIGN KEY(id_disciplina)
    REFERENCES Disciplinas(id_Disciplina)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_aluno)
    REFERENCES Aluno(id_Aluno)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_orientador)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Reserva_de_Laboratorio (
  id_Reserva_de_Laboratorio INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  id_Laboratorio INTEGER UNSIGNED NOT NULL,
  hora_Inicial VARCHAR(10) NULL,
  hora_Final VARCHAR(10) NULL,
  id_Professor INTEGER UNSIGNED NULL,
  id_Disciplina INTEGER UNSIGNED NULL,
  dia_da_semana VARCHAR(20) NULL,
  data_2 DATE NULL,
  PRIMARY KEY(id_Reserva_de_Laboratorio),
  INDEX Reserva_de_Laboratorio_FKIndex1(id_Laboratorio),
  INDEX Reserva_de_Laboratorio_FKIndex2(id_Professor),
  INDEX Reserva_de_Laboratorio_FKIndex3(id_Disciplina),
  FOREIGN KEY(id_Laboratorio)
    REFERENCES Laboratorio(id_Laboratorio)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_Professor)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_Disciplina)
    REFERENCES Disciplinas(id_Disciplina)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Proposta (
  id_Proposta INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(60) NOT NULL,
  data_Envio DATE NULL,
  hora_Envio TIME NULL,
  aceite TINYINT UNSIGNED NULL,
  id_aluno_1 INTEGER UNSIGNED NOT NULL,
  id_aluno_2 INTEGER UNSIGNED NULL,
  id_Orientador_1 INTEGER UNSIGNED NOT NULL,
  id_Orientador_2 INTEGER UNSIGNED NULL,
  caminho TEXT NULL,
  PRIMARY KEY(id_Proposta),
  INDEX Proposta_FKIndex1(id_Orientador_1),
  INDEX Proposta_FKIndex4(id_Orientador_2),
  FOREIGN KEY(id_Aluno_1)
    REFERENCES Aluno(id_Aluno)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_Aluno_2)
    REFERENCES Aluno(id_Aluno)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_Orientador_1)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_Orientador_2)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Trabalho_Monografico (
  id_trabalho_monografico INTEGER UNSIGNED NOT NULL,
  id_proposta INTEGER UNSIGNED NULL,
  id_aluno_1 INTEGER UNSIGNED NOT NULL,
  id_aluno_2 INTEGER UNSIGNED NULL,
  id_orientador_1 INTEGER UNSIGNED NOT NULL,
  id_orientador_2 INTEGER UNSIGNED NULL,
  titulo TEXT NULL,
  aprovacao TINYINT UNSIGNED NULL,
  caminho TEXT NULL,
  PRIMARY KEY(id_trabalho_monografico),
  INDEX Trabalho_Monografico_FKIndex1(id_aluno_1),
  INDEX Trabalho_Monografico_FKIndex2(id_aluno_2),
  INDEX Trabalho_Monografico_FKIndex3(id_orientador_2),
  INDEX Trabalho_Monografico_FKIndex4(id_orientador_1),
  INDEX Trabalho_Monografico_FKIndex5(id_proposta),
  FOREIGN KEY(id_aluno_1)
    REFERENCES Aluno(id_Aluno)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_aluno_2)
    REFERENCES Aluno(id_Aluno)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_orientador_2)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_orientador_1)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_proposta)
    REFERENCES Proposta(id_Proposta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Quadro_de_atendimento_monitoria (
  id_quadro_de_atendimento_monitoria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  id_monitoria INTEGER UNSIGNED NULL,
  laboratorio TEXT NULL,
  observacoes TEXT NULL,
  PRIMARY KEY(id_quadro_de_atendimento_monitoria),
  INDEX Quadro_de_atendimento_monitoria_FKIndex1(id_monitoria),
  FOREIGN KEY(id_monitoria)
    REFERENCES Monitoria(id_monitoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Turma (
  id_Turma INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  periodo INTEGER UNSIGNED NULL,
  ano INTEGER UNSIGNED NULL,
  semestre INTEGER UNSIGNED NULL,
  id_Curso INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Turma),
  INDEX Turma_FKIndex1(id_Curso),
  FOREIGN KEY(id_Curso)
    REFERENCES Curso(id_Curso)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Conteudo_da_Monitoria (
  id_quadro_de_atendimento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  conteudo TEXT NULL,
  metodo VARCHAR(20) NULL,
  INDEX Conteudo_da_Monitoria_FKIndex1(id_quadro_de_atendimento),
  FOREIGN KEY(id_quadro_de_atendimento)
    REFERENCES Quadro_de_atendimento_monitoria(id_quadro_de_atendimento_monitoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Dias_de_Atendimento (
  id_quadro_de_atendimento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  dia_da_semana VARCHAR(25) NULL,
  data_do_atendimento DATE NULL,
  INDEX Dias_de_Atendimento_FKIndex1(id_quadro_de_atendimento),
  FOREIGN KEY(id_quadro_de_atendimento)
    REFERENCES Quadro_de_atendimento_monitoria(id_quadro_de_atendimento_monitoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Agendar_Defesa (
  id_agendar_defesa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  local_da_defesa TEXT NULL,
  data_da_defesa DATE NULL,
  horario_da_defesa TIME NULL,
  id_trabalho_monografico INTEGER UNSIGNED NULL,
  id_proposta INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_agendar_defesa),
  INDEX Agendar_Defesa_FKIndex1(id_trabalho_monografico),
  FOREIGN KEY(id_trabalho_monografico)
    REFERENCES Trabalho_Monografico(id_trabalho_monografico)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_Proposta)
    REFERENCES Proposta(id_Proposta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Horario_de_Aula (
  id_Turma INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  hora_Inicial VARCHAR(10) NULL,
  hora_Final VARCHAR(10) NULL,
  dia VARCHAR(20) NULL,
  id_Professor INTEGER UNSIGNED NULL,
  id_Disciplina INTEGER UNSIGNED NULL,
  INDEX Horario_de_Aula_FKIndex1(id_Turma),
  INDEX Horario_de_Aula_FKIndex2(id_Professor),
  INDEX Horario_de_Aula_FKIndex3(id_Disciplina),
  FOREIGN KEY(id_Turma)
    REFERENCES Turma(id_Turma)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_Disciplina)
    REFERENCES Disciplinas(id_Disciplina)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_Professor)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Banca (
  id_agendar_defesa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  id_servidor INTEGER UNSIGNED NULL,
  INDEX Banca_FKIndex1(id_servidor),
  INDEX Banca_FKIndex2(id_agendar_defesa),
  FOREIGN KEY(id_servidor)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_agendar_defesa)
    REFERENCES Agendar_Defesa(id_agendar_defesa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


