copy "TABLE"
from 'FILE_PATH\TABLE.csv'
delimiter ';'
csv header;

/*
Para quem vai corrigir:
baixar os .csv no repositório do projeto,
e substituir o FILE_PATH pela pasta onde foram baixados.
Depois, substituir os "Table's" pelo nome das tabelas:

alunos
colaboradores
cursos
departamentos
escolaridade
estados
facilitadores
generos
modulos
turma
turma_alunos

*/

SELECT *
from turma_alunos