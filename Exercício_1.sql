create table setor(
codSetor int primary key,
nome varchar(80),
supervisor varchar(80)
);

create table medico(
CRM int primary key,
nome varchar(80),
especialidade varchar(80)
);

create table setorMedico(
codSetor int references setor(codSetor),
CRM int references medico(CRM),
primary key(codSetor, CRM)
);

create table paciente(
codPaciente int primary key,
nome varchar(80),
dataNasc date
);

create table atendimento(
codAtendimento int primary key,
data date,
valor int,
tipo varchar(50),
atendAnterior int references atendimento(codAtendimento),
CRM int references medico(CRM),
codPaciente int references paciente(codPaciente)
);

create table telefoneMedico(
telefone varchar(10) primary key,
CRM int references medico(CRM)
);




insert into setor values
(001,'Pediatria','Pedro'),
(010,'Fisoterapeuta','Gustavo'),
(011,'Neurologia','Santos');


insert into medico values
(3333,'João','Dentista'),
(4444,'Luis','Pediatria'),
(5555,'Carlos','Psiquiatra');

insert into setorMedico values
(001,3333),
(010,4444),
(011,5555);

insert into paciente values
(24, 'Julio', '2002-05-18'),
(25, 'Maria', '2002-05-19'),
(26, 'Douglas', '2002-05-20');

insert into atendimento values
(1, '2012-05-18', 55, 'Fiado',NULL, 3333, 24),
(2, '2012-06-18', 65, 'Débito',1, 5555, 25),
(3, '2012-05-18', 87, 'Vista',2, 4444, 26);

insert into telefoneMedico values
('91234-5678',3333),
('94321-8765', 5555),
('91432-8567', 4444);

select codPaciente from paciente where nome = 'Maria';

select CRM, especialidade from medico where nome = 'João';

select valor+(valor*0.15) from atendimento;

select nome from medico where especialidade = 'Pediatria';

select s.nome as 'Nome do Setor',
s.codSetor as 'Código do Setor',
m.nome as 'Nome do Médico'
from setor s
inner join medico m
on(m.CRM = 5555 and )
