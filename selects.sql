SELECT COUNT
(aluno_cpf) as "Quantidade", ativo as "Matricula Ativa"
FROM alunos
GROUP BY ativo 
ORDER BY ativo desc;


SELECT
aluno_nome as "Nome do Aluno", cursos.curso_nome as "Curso Matriculado"
from alunos
left join turma on alunos.turma_id = turma.turma_id
left join cursos on cursos.curso_id = turma.curso_id;


SELECT * from (
SELECT col.colaborador_nome as "Colaborador", count(fac.colaborador_id) as "Numero de Turmas"
from facilitadores fac
left join colaboradores col on fac.colaborador_id = col.colaborador_id
group by col.colaborador_nome
HAVING count(fac.colaborador_id) > 1) colaboradores;


/*Media de idade de um respectivo curso*/
SELECT
cur.curso_nome as "Nome do Curso", round(avg(alu.aluno_idade),2) as "Media Idade Curso"
FROM alunos alu
left join turma tur on alu.turma_id = tur.turma_id
left join cursos cur on tur.curso_id = cur.curso_id
group by cur.curso_nome;


/*Quantidade de alunos em cada estado*/
SELECT
es.estado_nome as "Estado", count(*) as "Quantidade"
from  alunos al
right join estados es on es.estado_id = al.estado_id
group by es.estado_nome


/*Quantidade de alunos por gênero*/
SELECT 
count(*) as "Quantidade", gen.genero_nome as "Gênero"
FROM generos gen
right join alunos al on al.genero_id = gen.genero_id
group by gen.genero_nome


/*Quantidade de pessoas que nasceram (em cada ano antes de ) (nos anos antes de) */
SELECT
COUNT(*) as "Quantidade", extract(year from aluno_data_nascimento) as anno
FROM alunos al
GROUP BY 2
    HAVING extract(year from aluno_data_nascimento) < 2000
order by 2 desc
  