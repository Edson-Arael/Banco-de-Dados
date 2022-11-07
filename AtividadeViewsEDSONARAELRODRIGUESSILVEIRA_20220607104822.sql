use cinema;

#liste o nome dos atores, nacionalidade, que recebem cache maior ou igual a 300mil dol
create view MaisBemPagos as
select a.nome, a.nacionalidade,
atu.cache
from atores as a
inner join atuam as atu
on a.cod_id = atu.cod_atores
where atu.cache >=300000.00;


select *
from MaisBemPagos;

#liste o nome do personagem, cache do filme MIB

create view MIB as
select atu.personagem, atu.cache,
f.nome as 'Nome do Filme'
from atuam as atu
inner join filmes f 
on atu.cod_filmes = f.cod_id
where atu.cod_filmes = 3;

drop view MIB;

select *
from MIB;

#liste o , proprietario, data de funcação e filmes do estudio MGM
create view ProPrietario as 
select e.proprietario, e.datafundacao, f.nome
from estudio e
inner join filmes f
on e.cod_id = f.cod_id
where e.nome = 'MGM';
select*
from ProPrietario;


select e.proprietario, e.datafundacao, f.nome
from estudio e
inner join filmes f
on e.cod_id = f.cod_idestudio
where e.nome = 'MGM';

