DROP TABLE IF EXISTS animais CASCADE;

CREATE TABLE animais (

  registo DECIMAL PRIMARY KEY,

  nome VARCHAR(50),

  sexo VARCHAR(10),

  nascimento VARCHAR(10),

  local VARCHAR(3)

);

--Inserção dos animais::
--Tigres::

INSERT INTO animais VALUES (123456, 'Taji', 'masculino', 'captura', 'A3');
INSERT INTO animais VALUES (222456, 'Mali', 'feminino', 'captura', 'A3');
INSERT INTO animais VALUES (322456, 'Aka', 'feminino', 'cativeiro', 'A3');
INSERT INTO animais VALUES (422456, 'TaTa', 'masculino', 'cativeiro', 'A4');
INSERT INTO animais VALUES (432456, 'Cáta', 'masculino', 'captura', 'A5');
INSERT INTO animais VALUES (522456, 'Kata', 'feminino', 'cativeiro', 'A5');
INSERT INTO animais VALUES (622456, 'Mata', 'masculino', 'catoiveiro', 'A4');

--Hipos::

INSERT INTO animais VALUES (123444, 'Hipo', 'masculino', 'captura', 'A1');
INSERT INTO animais VALUES (223444, 'Tapi', 'feminino', 'captura', 'A1');
INSERT INTO animais VALUES (323444, 'Hita', 'feminino', 'cativeiro', 'A1');

--Veados::

INSERT INTO animais VALUES (123666, 'Kaki', 'masculino', 'captura', 'A2');
INSERT INTO animais VALUES (223666, 'Kalu', 'feminino', 'captura', 'A2');
INSERT INTO animais VALUES (323666, 'Kilu', 'feminino', 'cativeiro', 'A2');
INSERT INTO animais VALUES (423666, 'Luka', 'feminino', 'captura', 'A2');
INSERT INTO animais VALUES (524666, 'Kuli', 'masculino', 'cativeiro', 'A2');

--Araras::

INSERT INTO animais VALUES (123555, 'Ará', 'masculino', 'captura', 'A6');
INSERT INTO animais VALUES (133555, 'Zará', 'masculino', 'captura', 'A6');
INSERT INTO animais VALUES (223555, 'Rará', 'feminino', 'captura', 'A6');
INSERT INTO animais VALUES (323555, 'Rara', 'masculino', 'cativeiro', 'A6');
INSERT INTO animais VALUES (423555, 'Zula', 'feminino', 'cativeiro', 'A6');
INSERT INTO animais VALUES (523555, 'Zura', 'feminino', 'cativeiro', 'A6');

DROP TABLE IF EXISTS classe_bio CASCADE;

CREATE TABLE classe_bio(

  especie VARCHAR(50),

  classe VARCHAR(50),

  ordem VARCHAR(50),

  familia VARCHAR(50),

  registo DECIMAL,

  PRIMARY KEY (especie, registo),

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT 

);

--Inserção das classes biologicas::

INSERT INTO classe_bio VALUES ('tigre', 'mamíferos', 'carnívoros', 'felinos', 123456);
INSERT INTO classe_bio VALUES ('tigre', 'mamíferos', 'carnívoros', 'felinos', 222456);
INSERT INTO classe_bio VALUES ('tigre', 'mamíferos', 'carnívoros', 'felinos', 322456);
INSERT INTO classe_bio VALUES ('tigre', 'mamíferos', 'carnívoros', 'felinos', 422456);
INSERT INTO classe_bio VALUES ('tigre', 'mamíferos', 'carnívoros', 'felinos', 432456);
INSERT INTO classe_bio VALUES ('tigre', 'mamíferos', 'carnívoros', 'felinos', 522456);
INSERT INTO classe_bio VALUES ('tigre', 'mamíferos', 'carnívoros', 'felinos', 622456);
INSERT INTO classe_bio VALUES ('hipopótamo comum', 'mamíferos', 'artiodáctilos', 'hipopótamos', 123444);
INSERT INTO classe_bio VALUES ('hipopótamo comum', 'mamíferos', 'artiodáctilos', 'hipopótamos', 223444);
INSERT INTO classe_bio VALUES ('hipopótamo comum', 'mamíferos', 'artiodáctilos', 'hipopótamos', 323444);
INSERT INTO classe_bio VALUES ('veado', 'mamíferos', 'artiodáctilos', 'cervídeos', 123666);
INSERT INTO classe_bio VALUES ('veado', 'mamíferos', 'artiodáctilos', 'cervídeos', 223666);
INSERT INTO classe_bio VALUES ('veado', 'mamíferos', 'artiodáctilos', 'cervídeos', 323666);
INSERT INTO classe_bio VALUES ('veado', 'mamíferos', 'artiodáctilos', 'cervídeos', 423666);
INSERT INTO classe_bio VALUES ('veado', 'mamíferos', 'artiodáctilos', 'cervídeos', 524666);
INSERT INTO classe_bio VALUES ('arara-azul-pequena', 'aves', 'psittaciformes', 'psittacidae', 123555);
INSERT INTO classe_bio VALUES ('arara-azul-pequena', 'aves', 'psittaciformes', 'psittacidae', 133555);
INSERT INTO classe_bio VALUES ('arara-azul-pequena', 'aves', 'psittaciformes', 'psittacidae', 223555);
INSERT INTO classe_bio VALUES ('arara-azul-pequena', 'aves', 'psittaciformes', 'psittacidae', 323555);
INSERT INTO classe_bio VALUES ('arara-azul-pequena', 'aves', 'psittaciformes', 'psittacidae', 423555);
INSERT INTO classe_bio VALUES ('arara-azul-pequena', 'aves', 'psittaciformes', 'psittacidae', 523555);
  

DROP TABLE IF EXISTS captura CASCADE;

CREATE TABLE captura(

  registo DECIMAL,

  local_captura VARCHAR(100),

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT,

  data_captura DATE,

  idd_estimada DATE

);

--Inserção de capturas::
--Tigres

INSERT INTO captura VALUES (123456, 'India em Agra', '2016/1/1', '2015/1/1');
INSERT INTO captura VALUES (222456, 'India em Deli', '2016/1/1', '2015/1/1');
INSERT INTO captura VALUES (432456, 'India em Calcutá', '2005/1/1', '2004/9/1');

--Hipo

INSERT INTO captura VALUES (123444, 'África em Madagascar', '2004/6/6', '2003/6/6');
INSERT INTO captura VALUES (223444, 'África em Madagascar', '2004/6/6', '2003/12/6');

--Veados

INSERT INTO captura VALUES (123666, 'Europa em Pirenéus', '2018/1/1', '2017/6/1');
INSERT INTO captura VALUES (223666, 'Europa em Ourense', '2018/1/1', '2017/6/1');
INSERT INTO captura VALUES (423666, 'Europa em Gerês', '2019/1/1', '2018/9/1');

--Araras

INSERT INTO captura VALUES (123555, 'América do Sul em Paraná', '2018/1/1', '2017/6/1');
INSERT INTO captura VALUES (133555, 'América do Sul em Paraná', '2018/1/1', '2017/9/1');
INSERT INTO captura VALUES (223555, 'América do Sul em Uruguai', '2019/1/1', '2018/11/1');  

DROP TABLE IF EXISTS cativeiro CASCADE;

CREATE TABLE cativeiro(

  registo DECIMAL PRIMARY KEY,

  registo_mae DECIMAL,

  registo_pai DECIMAL,

  data_nascimento DATE,

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT,

  FOREIGN KEY (registo_mae)REFERENCES animais ON DELETE RESTRICT,

  FOREIGN KEY (registo_pai)REFERENCES animais ON DELETE RESTRICT 

);

--Inserção dos nascios em cativeiro::
--Tigre::

INSERT INTO cativeiro VALUES (322456, 222456, 123456, '2005/12/12');
INSERT INTO cativeiro VALUES (422456, 222456, 123456, '2006/1/20');
INSERT INTO cativeiro VALUES (522456, 432456, 422456, '2007/3/2');
INSERT INTO cativeiro VALUES (622456, 522456, 123456, '2008/2/2');

--Hipo::

INSERT INTO cativeiro VALUES (323444, 223444, 123444, '2006/9/1');

--Veado::

INSERT INTO cativeiro VALUES (323666, 223666, 123666, '2008/4/3');
INSERT INTO cativeiro VALUES (524666, 423666, 123666, '2008/3/4');

--Araras::

INSERT INTO cativeiro VALUES (323555, 223555, 123555, '2009/5/7');
INSERT INTO cativeiro VALUES (423555, 223555, 123555, '2009/5/7');
INSERT INTO cativeiro VALUES (523555, 223555, 123555, '2009/5/7');  

DROP TABLE IF EXISTS espacos CASCADE;

CREATE TABLE espacos(

  registo_local VARCHAR(5) PRIMARY KEY,

  area DECIMAL,

  meio VARCHAR(50),

  clima VARCHAR(50)

  --FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT

);

--Inserção dos espaços do zoo::

INSERT INTO espacos VALUES ('A3', 1200, 'terrestre', 'quente e húmido');
INSERT INTO espacos VALUES ('A4', 1100, 'terrestre', 'quente e húmido');
INSERT INTO espacos VALUES ('A5', 1200, 'terrestre', 'quente e húmido');
INSERT INTO espacos VALUES ('A1', 2000, 'misto', 'quente e seco');
INSERT INTO espacos VALUES ('A2', 1500, 'terrestre', 'frio e seco');
INSERT INTO espacos VALUES ('A6', 500, 'terrestre', 'quente e húmido');

DROP TABLE IF EXISTS funcionario CASCADE;

CREATE TABLE funcionario (

  nome_func VARCHAR(50),

  inicio_func DATE,

  nif DECIMAL PRIMARY KEY

);

--Inserção dos Funcionarios::
--Tratadores

INSERT INTO funcionario VALUES('Joaquim Silva', '2003/2/1', 123123123);
INSERT INTO funcionario VALUES('Manuel Santos', '2003/4/1', 123123124);
INSERT INTO funcionario VALUES('Maria Gomes', '2003/1/1', 123123125);

--Tratador Auxiliar

INSERT INTO funcionario VALUES('Mariana Silva', '2004/2/1', 123123126);
INSERT INTO funcionario VALUES('Jorge Gomes', '2004/3/1', 123123127);
INSERT INTO funcionario VALUES('Francisco Jorge', '2004/3/1', 123123128);

--Administrativos

INSERT INTO funcionario VALUES('Manuel Ferreira', '2004/2/1', 123123129);
INSERT INTO funcionario VALUES('Manuela Torres', '2004/4/1', 123123130);

--Veterinários

INSERT INTO funcionario VALUES('Pedro Vale', '2004/5/1', 123123131);
INSERT INTO funcionario VALUES('Isabel Soares', '2004/5/1', 123123132);

DROP TABLE IF EXISTS telefones CASCADE;

CREATE TABLE telefones (

  numero DECIMAL,

  nif DECIMAL,

  PRIMARY KEY (numero,nif),

  FOREIGN KEY (nif) REFERENCES funcionario ON DELETE RESTRICT

);

--Inserção dos numeros de telefone::
--Tratadores::

INSERT INTO telefones VALUES(266787809, 123123123);
INSERT INTO telefones VALUES(919999999, 123123123);
INSERT INTO telefones VALUES(266787808, 123123124);
INSERT INTO telefones VALUES(919999998, 123123124);
INSERT INTO telefones VALUES(266787807, 123123125);
INSERT INTO telefones VALUES(919999997, 123123125);

--Tratador Auxiliar::

INSERT INTO telefones VALUES(266878806, 123123126);
INSERT INTO telefones VALUES(919999996, 123123126);
INSERT INTO telefones VALUES(266787807, 123123127);
INSERT INTO telefones VALUES(919999995, 123123127);
INSERT INTO telefones VALUES(266787806, 123123128);
INSERT INTO telefones VALUES(919999994, 123123128);

--Administrativos::

INSERT INTO telefones VALUES(266787806, 123123129);
INSERT INTO telefones VALUES(919999996, 123123129);
INSERT INTO telefones VALUES(266787806, 123123130);
INSERT INTO telefones VALUES(919999996, 123123130);

--Veterinários::

INSERT INTO telefones VALUES(266787816, 123123131);
INSERT INTO telefones VALUES(919999986, 123123131);
INSERT INTO telefones VALUES(266787826, 123123132);
INSERT INTO telefones VALUES(919999976, 123123132);

DROP TABLE IF EXISTS responsavel CASCADE;

CREATE TABLE responsavel(

	nif_responsavel DECIMAL,

  	nif_funcionario DECIMAL PRIMARY KEY,

  	FOREIGN KEY (nif_responsavel) REFERENCES funcionario ON DELETE RESTRICT,

  	FOREIGN KEY (nif_funcionario) REFERENCES funcionario ON DELETE RESTRICT

);

--Inserção dos responsáveis::

INSERT INTO responsavel VALUES(123123125,123123123);
INSERT INTO responsavel VALUES(123123125,123123124);
INSERT INTO responsavel VALUES(123123130,123123125);
INSERT INTO responsavel VALUES(123123130,123123126);
INSERT INTO responsavel VALUES(123123130,123123127);
INSERT INTO responsavel VALUES(123123130,123123128);
INSERT INTO responsavel VALUES(123123130,123123129);
INSERT INTO responsavel VALUES(123123129,123123130);
INSERT INTO responsavel VALUES(123123129,123123131);
INSERT INTO responsavel VALUES(123123131,123123132);

DROP TABLE IF EXISTS administrativos CASCADE;
CREATE TABLE administrativos(
  nif DECIMAL PRIMARY KEY,
  FOREIGN KEY (nif) REFERENCES funcionario ON DELETE RESTRICT
);

--Inserção dos admistrativos::
INSERT INTO administrativos VALUES(123123129);
INSERT INTO administrativos VALUES(123123130);

DROP TABLE IF EXISTS tratador CASCADE;

CREATE TABLE tratador (

  nif DECIMAL,

  registo DECIMAL,

  FOREIGN KEY (nif) REFERENCES funcionario ON DELETE RESTRICT,

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT

);

--Inserção dos Tratadores::

INSERT INTO tratador VALUES(123123123,123456);
INSERT INTO tratador VALUES(123123123,222456);
INSERT INTO tratador VALUES(123123123,322456);
INSERT INTO tratador VALUES(123123123,422456);
INSERT INTO tratador VALUES(123123123,432456);
INSERT INTO tratador VALUES(123123123,522456);
INSERT INTO tratador VALUES(123123123,622456);
INSERT INTO tratador VALUES(123123124,123444);
INSERT INTO tratador VALUES(123123124,223444);
INSERT INTO tratador VALUES(123123124,323444);
INSERT INTO tratador VALUES(123123124,123666);
INSERT INTO tratador VALUES(123123124,223666);
INSERT INTO tratador VALUES(123123124,323666);
INSERT INTO tratador VALUES(123123124,423666);
INSERT INTO tratador VALUES(123123124,524666);
INSERT INTO tratador VALUES(123123125,123555);
INSERT INTO tratador VALUES(123123125,133555);
INSERT INTO tratador VALUES(123123125,223555);
INSERT INTO tratador VALUES(123123125,323555);
INSERT INTO tratador VALUES(123123125,523555);
INSERT INTO tratador VALUES(123123125,523555);

DROP TABLE IF EXISTS tratador_auxiliar CASCADE;

CREATE TABLE tratador_auxiliar (

  nif DECIMAL,

  registo_local VARCHAR(5),

  FOREIGN KEY (nif) REFERENCES funcionario ON DELETE RESTRICT,

  FOREIGN KEY (registo_local) REFERENCES espacos ON DELETE RESTRICT

);

--Inserção dos Tratadores Auxiliares::

INSERT INTO tratador_auxiliar VALUES(123123126,'A3');
INSERT INTO tratador_auxiliar VALUES(123123126,'A4');
INSERT INTO tratador_auxiliar VALUES(123123126,'A5');
INSERT INTO tratador_auxiliar VALUES(123123127,'A1');
INSERT INTO tratador_auxiliar VALUES(123123128,'A2');
INSERT INTO tratador_auxiliar VALUES(123123128,'A6');

DROP TABLE IF EXISTS veterinarios CASCADE;

CREATE TABLE veterinarios(

  nif DECIMAL PRIMARY KEY,

  FOREIGN KEY(nif) REFERENCES funcionario ON DELETE RESTRICT

);

--Inserção dos vet::

INSERT INTO veterinarios VALUES(123123131);
INSERT INTO veterinarios VALUES(123123132); 

DROP TABLE IF EXISTS consultas CASCADE;

CREATE TABLE consultas (

  nif DECIMAL,

  registo DECIMAL,

  registo_local VARCHAR(5),

  FOREIGN KEY (nif) REFERENCES veterinarios ON DELETE RESTRICT,

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT,

  FOREIGN KEY (registo_local) REFERENCES espacos ON DELETE RESTRICT,

  data_consulta DATE,

  diagnostico VARCHAR(1000)

);

--Inserção das consultas::

INSERT INTO consultas VALUES(123123131, 222456, 'A3', '2005/8/12', 'grávida');
INSERT INTO consultas VALUES(123123131, 222456, 'A3', '2005/9/12', 'cálcio injetado');
INSERT INTO consultas VALUES(123123131, 222456, 'A3', '2005/12/12', 'parto');
INSERT INTO consultas VALUES(123123131, 222456, 'A3', '2006/7/12', 'infecção');
INSERT INTO consultas VALUES(123123131, 222456, 'A3', '2006/7/12', 'antibiótico injectado');
INSERT INTO consultas VALUES(123123131, 123666, 'A2', '2009/5/12', 'infecção');
INSERT INTO consultas VALUES(123123131, 123666, 'A2', '2009/5/12', 'antibiótico injectado');
INSERT INTO consultas VALUES(123123131, 123555, 'A5', '2009/5/12', 'infecção');
INSERT INTO consultas VALUES(123123131, 123555, 'A5', '2009/5/12', 'antibiótico injectado');
INSERT INTO consultas VALUES(123123131, 423555, 'A5', '2009/5/12', 'infecção');
INSERT INTO consultas VALUES(123123131, 423555, 'A5', '2009/5/12', 'antibiótico injectado');
INSERT INTO consultas VALUES(123123131, 223444, 'A1', '2007/8/12', 'infecção');
INSERT INTO consultas VALUES(123123131, 223444, 'A1', '2007/8/12', 'antibiótico injectado');
INSERT INTO consultas VALUES(123123132, 223444, 'A1', '2006/7/12', 'grávida');
INSERT INTO consultas VALUES(123123132, 223444, 'A1', '2006/7/12', 'cálcio injectado');
INSERT INTO consultas VALUES(123123132, 223444, 'A1', '2006/9/12', 'parto');
INSERT INTO consultas VALUES(123123132, 223444, 'A1', '2007/7/12', 'infecção');
INSERT INTO consultas VALUES(123123132, 223444, 'A1', '2007/7/12', 'antibiótico injectado');
INSERT INTO consultas VALUES(123123132, 223444, 'A1', '2007/7/12', 'grávida');
INSERT INTO consultas VALUES(123123132, 223444, 'A1', '2007/7/12', 'cálcio injectado');
INSERT INTO consultas VALUES(123123132, 223444, 'A1', '2007/9/12', 'parto');
INSERT INTO consultas VALUES(123123132, 423555, 'A5', '2009/6/12', 'infecção');
INSERT INTO consultas VALUES(123123132, 423555, 'A5', '2009/6/12', 'antibiótico injectado');
