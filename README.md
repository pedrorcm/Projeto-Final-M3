

# <font color="#DAA520">Resilia - Projeto do Módulo-3</font>

![](https://raw.githubusercontent.com/Avext/Imagens-de-apresenta-es/main/resiliam3s72.png)



## Índice de Conteúdos

[Sildes](https://www.canva.com/design/DAFKeEzwhlc/RtHTGOYka1V6bHbT_0o9QQ/edit?utm_content=DAFKeEzwhlc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

1. [Objetivo do Projeto](#objproj)
2. [Descrição do Projeto](#descproj)
    1. [Tema abordado](#temabo)
3. [Estrutura do projeto](#estproj)
    1. [Estrutura do banco](#estban)
    2. [Entidades e relacionamentos](#entrel)
    3. [Consultas](#consul)


## Objetivo do Projeto <a name="objproj"></a>

Este projeto foi feito como parte integrante da avaliação do Módulo 3 do curso Data Analytics da Resilia Educação da turma 20. Este projeto foi desenvolvido pelo Squad 7, que é composto pelos estudantes:

- [Allyson Santana Rodrigues](https://github.com/ally-sr);

- [Camilo Sergio Regis Macedo](https://github.com/Camilord1);

- [Carlos Henrique Augustin](https://github.com/cxrlxx);

- [Pedro Rocha Campos](https://github.com/pedrorcm);

- [Thiago Vasconcelos](https://github.com/Avext).


## Descrição do Projeto <a name="descproj"></a>

Este é um projeto de construção de um banco de dados para gerenciamento da estrutura de ensino da empresa Resilia Educação, com o objetivo de modernizar o processo de armazenamento de dados da empresa.

### Tema abordado <a name="temabo"></a>

Atualmente são armazenadas diversas informações da empresa como dados sobre os alunos, facilitadores, departamentos, módulos e cursos em planilhas. Essas informações são colocadas em planilhas diferentes o que gera uma certa dificuldade na manipulação e consulta dos dados.

A partir deste projeto procuramos organizar de forma lógica o modelo de negócios da empresa a fim de melhorar, facilitar e modernizar e interação com os dados. Sendo esses objetivos viabilizados através de um banco de dados SQL.

Como resultados deste projeto pretende-se gerar informações estratégicas para a área de ensino da Resilia. As principais consultas que iremos realizar são:

◆ Selecionar a quantidade total de estudantes cadastrados no banco;

◆ Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;

◆ Selecionar quais facilitadores atuam em mais de uma turma;

◆ Selecionar a média de idade de um respectivo curso;

◆ Selecionar a quantidade de alunos em cada estado;

◆ Selecionar a quantidade de alunos por gênero;

◆ Selecionar a quantidade de Quantidade de pessoas que nasceram em determinado ano.


## Estrutura do projeto <a name="estproj"></a>


A ferramenta utilizada para a modelagem do banco foi o [  ](https://dbdiagram.io/home)dbdiagram.io - Database Relationship Diagrams Design Tool e como sistema gerenciador do banco de dados foi utilizado o PostgreSQL 14.5 juntamente com o pgAdmin 4 como plataforma de administração do banco de dados. Com essas ferramentas foi possível executar:

● Modelagem completa do banco de dados com entidades, atributos e relacionamentos;

● Scripts SQL de criação das tabelas com seus atributos e chaves;

● Resultado de das consultas propostas na realização do projeto.

### Estrutura do banco <a name="estban"></a>

O banco de dados está estruturado de acordo com o diagrama a seguir:
		
![](https://raw.githubusercontent.com/Avext/Imagens-de-apresenta-es/main/m3s73.png)

Astrutura completa está disponível abaixo:

[Modelo DBDiagram](https://dbdiagram.io/d/62f55dcdc2d9cf52fa90877d).

### Entidades e relacionamentos <a name="entrel"></a>

Como pode sr observado no MER, este é composto por 11 entidades com relacionamentos entre si. Sendo esquematizado da seguinte forma:

- A entidade colaborabores é composta pelos atributos e tipos: 

  		colaborador_id int 
  		colaborador_nome varchar
  		colaborador_email varchar
  		colaborador_telefone varchar
  		colaborador_cpf varchar
  		colaborador_data_nascimento date
  		colaborador_idade int
  		colaborador_departamento int (Atributo que informa o departamento do colaborador a partir de uma chave estrangeira ligada à tabela departamento)
  		id_genero int (Atributo que informa gênero do colaborador a partir de uma chave estrangeira ligada à tabela gêneros)
  		id_estado int (Atributo que informa o estado do colaborador a partir de uma chave estrangeira ligada à tabela estados)
  		id_escolaridade int (Atributo que informa a escolaridade do colaborador a partir de uma chave estrangeira ligada à tabela estados)
  		ativo bool (Atributo que informa se o colaborador está ativo com TRUE ou FALSE)
		
- A entidade alunos é composta pelos atributos e tipos: 

		aluno_nome varchar
		aluno_email varchar
		aluno_elefone varchar
		aluno_cpf varchar pk 
		aluno_data_nascimento date
		aluno_idade int
		turma_id int (Atributo que informa a turma atual que o aluno está vinculado a partir de uma chave estrangeira ligada à tabela turma)
		genero_id int (Atributo que informa gênero do aluno a partir de uma chave estrangeira ligada à tabela gêneros)
		estado_id int (Atributo que informa o estado do aluno a partir de uma chave estrangeira ligada à tabela estados)
		escolaridade_id int (Atributo que informa a escolaridade do aluno a partir de uma chave estrangeira ligada à tabela estados)
		ativo bool (Atributo que informa se o aluno está ativo em algum curso com TRUE ou FALSE)
		
- A entidade gêneros informa o gênero do colaborador ou aluno a que é vinculada e é composta pelos atributos e tipos: 

		genero_id int pk
		genero_nome varchar (opções)

- A entidade estados informa o estado de residência do colaborador ou aluno a que é vinculada e é composta pelos atributos e tipos: 

		estado_id int pk 
		estado_nome varchar(255) [not null, unique]
		
- A entidade escolaridade informa a escolaridade do colaborador ou aluno a que é vinculada e é composta pelos atributos e tipos:

		escolaridade_id int pk
		escolaridade_nome varchar(255) [not null, unique]
		
- A entidade departamentos informa os departamentos existentes na Resilia e é composta pelos atributos e tipos:

		departamento_id int
		departamento_nome varchar [unique]
		departamento_area varchar(255) [not null]
		
- A entidade cursos informa os cursos existentes na Resilia e é composta pelos atributos e tipos:

		curso_id int pk
		curso_nome varchar
		curso_area varchar
		curso_modulos int (Atributo que informa os módulos que compõem o curso a partir de uma chave estrangeira ligada à tabela modulos)
		
- A entidade modulos informa os módulos que compõem os cursos existentes na Resilia e é composta pelos atributos e tipos:

		modulo_id int
		modulo_nome varchar [unique]
		modulo_disciplinas varchar
		
- A entidade turma informa as turmas que formadas pela Resilia para determinado curso e é composta pelos atributos e tipos:

		turma_id int pk
		nome varchar
		curso_id int (Atributo que informa o curso que está turma está vinculada a partir de uma chave estrangeira ligada à tabela cursos)
		data_inicio date
		data_termino date
		
- A entidade turma_alunos informa todos os alunos que estão e/ou estiveram em uma determinada turma da Resilia e é composta pelos atributos e tipos:

		aluno_cpf varchar (Atributo que informa o cpf do aluno e está vinculado a partir de uma chave estrangeira ligada à tabela alunos)
		turma_id int (Atributo que informa a turma a qual o aluno e está vinculado a partir de uma chave estrangeira ligada à tabela turma)
		
- A entidade facilitadores informa quais a turmas e módulos que o facilitador possui vínculo é composta pelos atributos e tipos:

		colaborador_id int pk (Atributo que informa o id do facilitador e está vinculado a partir de uma chave estrangeira ligada à tabela colaboradores)
		id_turma int (Atributo que informa o id da turma a qual o facilitador está vinculado a partir de uma chave estrangeira ligada à tabela turma)
		id_modulo int (Atributo que informa o id do módulo o qual o facilitador está vinculado a partir de uma chave estrangeira ligada à tabela módulos)

### Consultas <a name="consul"></a>

- Listamos aqui as consultas realizadas e os seus respectivos códigos excutados no pgAdmin 4:

◆ Selecionar a quantidade total de estudantes cadastrados no banco;

		SELECT COUNT
		(aluno_cpf) as "Quantidade", ativo as "Matricula Ativa"
		FROM alunos
		GROUP BY ativo 
		ORDER BY ativo desc;

◆ Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;

		SELECT
		aluno_nome as "Nome do Aluno", cursos.curso_nome as "Curso Matriculado"
		from alunos
		left join turma on alunos.turma_id = turma.turma_id
		left join cursos on cursos.curso_id = turma.curso_id;


◆ Selecionar quais facilitadores atuam em mais de uma turma;

		SELECT * from (
		SELECT col.colaborador_nome as "Colaborador", count(fac.colaborador_id) as "Numero de Turmas"
		from facilitadores fac
		left join colaboradores col on fac.colaborador_id = col.colaborador_id
		group by col.colaborador_nome
		HAVING count(fac.colaborador_id) > 1) colaboradores;

◆ Selecionar a média de idade de um respectivo curso;

		SELECT
		cur.curso_nome as "Nome do Curso", round(avg(alu.aluno_idade),2) as "Media Idade Curso"
		FROM alunos alu
		left join turma tur on alu.turma_id = tur.turma_id
		left join cursos cur on tur.curso_id = cur.curso_id
		group by cur.curso_nome;

◆ Selecionar a quantidade de alunos em cada estado;

		SELECT
		es.estado_nome as "Estado", count(*) as "Quantidade"
		from  alunos al
		right join estados es on es.estado_id = al.estado_id
		group by es.estado_nome

◆ Selecionar a quantidade de alunos por gênero;

		SELECT 
		count(*) as "Quantidade", gen.genero_nome as "Gênero"
		FROM generos gen
		right join alunos al on al.genero_id = gen.genero_id
		group by gen.genero_nome

◆ Selecionar a quantidade de Quantidade de pessoas que nasceram em determinado ano.

		SELECT
		COUNT(*) as "Quantidade", extract(year from aluno_data_nascimento) as anno
		FROM alunos al
		GROUP BY 2
		    HAVING extract(year from aluno_data_nascimento) < 2000
		order by 2 desc

