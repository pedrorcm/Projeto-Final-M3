CREATE TABLE "alunos" (
  "aluno_nome" varchar,
  "aluno_email" varchar,
  "aluno_elefone" varchar,
  "aluno_cpf" varchar PRIMARY KEY,
  "aluno_data_nascimento" date,
  "aluno_idade" int,
  "turma_id" int,
  "genero_id" int,
  "estado_id" int,
  "escolaridade_id" int,
  "ativo" bool
);

CREATE TABLE "generos" (
  "genero_id" int PRIMARY KEY,
  "genero_nome" varchar
);

CREATE TABLE "facilitadores" (
  "colaborador_id" int,
  "id_turma" int,
  "id_modulo" int
);

CREATE TABLE "departamentos" (
  "departamento_id" int PRIMARY KEY,
  "departamento_nome" varchar UNIQUE,
  "departamento_area" varchar(255) NOT NULL
);

CREATE TABLE "modulos" (
  "modulo_id" int PRIMARY KEY,
  "modulo_nome" varchar UNIQUE,
  "modulo_disciplinas" varchar
);

CREATE TABLE "cursos" (
  "curso_id" int PRIMARY KEY,
  "curso_nome" varchar,
  "curso_area" varchar,
  "curso_modulos" int
);

CREATE TABLE "estados" (
  "estado_id" int PRIMARY KEY,
  "estado_nome" varchar(255) UNIQUE NOT NULL
);

CREATE TABLE "escolaridade" (
  "escolaridade_id" int PRIMARY KEY,
  "escolaridade_nome" varchar(255) UNIQUE NOT NULL
);

CREATE TABLE "colaboradores" (
  "colaborador_id" int PRIMARY KEY,
  "colaborador_nome" varchar,
  "colaborador_email" varchar,
  "colaborador_telefone" varchar,
  "colaborador_cpf" varchar,
  "colaborador_data_nascimento" date,
  "colaborador_idade" int,
  "colaborador_departamento" int,
  "id_genero" int,
  "id_estado" int,
  "id_escolaridade" int,
  "ativo" bool
);

CREATE TABLE "turma" (
  "turma_id" int PRIMARY KEY,
  "nome" varchar,
  "curso_id" int,
  "data_inicio" date,
  "data_termino" date
);

CREATE TABLE "turma_alunos" (
  "aluno_cpf" varchar,
  "turma_id" int
);

ALTER TABLE "colaboradores" ADD FOREIGN KEY ("id_genero") REFERENCES "generos" ("genero_id");

ALTER TABLE "alunos" ADD FOREIGN KEY ("genero_id") REFERENCES "generos" ("genero_id");

ALTER TABLE "colaboradores" ADD FOREIGN KEY ("colaborador_departamento") REFERENCES "departamentos" ("departamento_id");

ALTER TABLE "colaboradores" ADD FOREIGN KEY ("id_escolaridade") REFERENCES "escolaridade" ("escolaridade_id");

ALTER TABLE "alunos" ADD FOREIGN KEY ("escolaridade_id") REFERENCES "escolaridade" ("escolaridade_id");

ALTER TABLE "alunos" ADD FOREIGN KEY ("turma_id") REFERENCES "turma" ("turma_id");

ALTER TABLE "facilitadores" ADD FOREIGN KEY ("id_turma") REFERENCES "turma" ("turma_id");

ALTER TABLE "turma_alunos" ADD FOREIGN KEY ("aluno_cpf") REFERENCES "alunos" ("aluno_cpf");

ALTER TABLE "alunos" ADD FOREIGN KEY ("estado_id") REFERENCES "estados" ("estado_id");

ALTER TABLE "turma_alunos" ADD FOREIGN KEY ("turma_id") REFERENCES "turma" ("turma_id");

ALTER TABLE "turma" ADD FOREIGN KEY ("curso_id") REFERENCES "cursos" ("curso_id");

ALTER TABLE "cursos" ADD FOREIGN KEY ("curso_modulos") REFERENCES "modulos" ("modulo_id");

ALTER TABLE "colaboradores" ADD FOREIGN KEY ("id_estado") REFERENCES "estados" ("estado_id");

ALTER TABLE "facilitadores" ADD FOREIGN KEY ("id_modulo") REFERENCES "modulos" ("modulo_id");

ALTER TABLE "facilitadores" ADD FOREIGN KEY ("colaborador_id") REFERENCES "colaboradores" ("colaborador_id");
