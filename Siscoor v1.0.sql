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

CREATE TABLE Disciplinas (
  id_Disciplina INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_da_Disciplina VARCHAR(50) NULL,
  carga_Horaria INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Disciplina)
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
  id_Servidor_2 INTEGER UNSIGNED NULL,
  titulo VARCHAR(60) NULL,
  data_Envio DATE NULL,
  aceite TINYINT UNSIGNED NULL,
  senha TEXT NULL,
  telefone VARCHAR(11) NULL,
  tipo INTEGER(1) UNSIGNED NULL,
  id_aluno_1 INTEGER UNSIGNED NOT NULL,
  data_de_Nascimento DATE NULL,
  id_aluno_2 INTEGER UNSIGNED NULL,
  id_Orientador_1 INTEGER UNSIGNED NOT NULL,
  id_Orientador_2 INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Proposta),
  INDEX Proposta_FKIndex1(id_Orientador_1),
  INDEX Proposta_FKIndex2(id_Servidor_2),
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
  FOREIGN KEY(id_Servidor_2)
    REFERENCES Servidor(id_Servidor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


