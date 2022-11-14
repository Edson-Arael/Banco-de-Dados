create database cinema;

use cinema;

create table estudio
(
cod_id int primary key auto_increment,
nome varchar(45),
proprietario varchar(45),
faturamentoanterior decimal(10,2),
datafuncadacao date
);

create table filmes
(
cod_id int primary key auto_increment,
meses int,
nome varchar(45),
anolancamento year,
custototal decimal(10,2),
cod_idestudio int,
 foreign key (cod_idestudio) references estudio(cod_id)
);

create table atore
(
cod_id int primary key auto_increment,
nome varchar(45),
nacionalidade varchar(45),
idade int,
sexo char(1)
);

create table atuam
(
cod_id int primary key auto_increment,
cod_atores int,
foreign key (cod_atores) references atore( cod_id),
cod_filmes int,
foreign key (cod_filmes) references filmes(cod_id),
cache decimal(10,2),
personagem varchar(45)
);

rename table atore to atores;

use cinema;

select e.nome, e.datafundacao, e.faturamentoanterior
 from estudio e;
 
# Mostrar nome do estúdio, nome do filme, ano de lançamento em ordenado por estúdio e filme.

 select  e.nome, f.nome, f.anolancamento
 from estudio as e
join filmes as f 
on e.cod_id = f.cod_id
order by e.nome, f.nome;

#c) Mostrar nome do ator, sexo, personagem e seu cache.
 select a.nome, a.sexo, atu.personagem, atu.cache
 from atores as a
 join atuam as atu
 on a.cod_id = atu.cod_id;
 
 # Mostrar o ano de lançamento do filme mais antigo.
  select f.anolancamento
  from filmes as f
order by f. anolancamento;

# Mostrar o nome do personagem, seu cache e nome do proprietário do estúdio dos filmes que o ator Wagner Moura fez.
select atu.personagem, atu.cache, e.proprietario, a.nome
from atuam as atu
join estudio as e
on atu.cod_id = e.cod_id
join atores as a
on a.cod_id= 4;

#f) Mostrar a quantidade de filmes que foram lançados entre 1998 e 2008.
select f.anolancamento 
from filmes as f
where f.anolancamento between 1998 and 2008;

#g) Mostrar a quantidade de atores do sexo feminino que atuaram em filmes produzidos pelo estúdio Universal.
 select *
 from atores as a
 where sexo like 'f';
 
 #h) Mostrar o codigo do estúdio, o codigo do filme, o código do ator, nome do ator que tem nacionalidade americana.
  select e.cod_id, f.cod_id, a.cod_id, a.nacionalidade, a.nome
  from estudio as e
  join filmes as f
  on e.cod_id = f.cod_id
  join atores as a
  on nacionalidade ='americana';
  
  #i) Mostrar o nome do filme e o nome do ator que recebeu mais do que R$ 190000.00 de cache para fazê-lo.

select f.nome, a.nome, atu.cache
from filmes as f
join atores as a
on f.cod_id = a.cod_id
join atuam as atu
on cache >= '190000,00';

#j) Mostrar o nome do estúdio, nome do filme, nome do ator, personagem que atuaram no filme Homem de Ferro.
select e.nome,
f.nome,
a.nome,
atu.personagem
from estudio as e
join filmes as f
on e.cod_id = f.cod_id
join atores as a
on a.cod_id = f.cod_id
join atuam as atu
on personagem ='Homem de Ferro';
#k) Mostrar qual é o cache mais alto recebido.
select max(cache)
from atuam;

#l) Mostrar o nome do estúdio, proprietário, nome do filme, meses, custo total, personagem, nome do ator, nacionalidade, idade e sexo para os estúdios que tiveram a data de fundação após 01-02-1980.
select e.nome, e.proprietario,
f.nome,f.meses,f.custototal,
atu.personagem,
a.nome,a.nacionalidade, a.idade,a.sexo
from atores as a
join filmes as f
on a.cod_id =f.cod_id
join atuam as atu
on atu.cod_id =f.cod_id
join estudio as e
on datafuncadacao >= '1980-02-01';




