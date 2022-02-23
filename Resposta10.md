# Resolução Pergunta 10
## [Pagina Principal](Resolução.md)  
  

>**10.**  Indique a expressão em SQL para responder às seguintes perguntas (no relatório indique também o resultado;  
>
>**a.**  Em que locais do zoo se podem visitar aves?   

``` SQL
SELECT DISTINCT local from animais
natural INNER JOIN classe_bio
WHERE classe LIKE 'aves'
```   

|registo_local|
|-------------|
|A6|  

>**b.**  Em que locais do zoo não há carnívoros?  

``` SQL
SELECT DISTINCT local from animais
natural INNER JOIN classe_bio
WHERE ordem not like 'carnívoros'
```   

|registo_local|
|-------------|
|A6|
|A2|
|A1|  

>**c.**  Indique os irmãos da Kilu.    

``` SQL
SELECT nome from animais
natural INNER JOIN cativeiro
WHERE registo_pai = (
  SELECT registo_pai FROM cativeiro
  NATURAL INNER JOIN animais
  WHERE animais.nome = 'Kilu')
  or
  registo_mae = (SELECT registo_mae FROM cativeiro
  NATURAL INNER JOIN animais
  WHERE animais.nome = 'Kilu')
EXCEPT
SELECT nome FROM animais
WHERE nome = 'Kilu'
```   

|nome|
|----|
|Kuli|  

>**d.**  Indique os telefones do tratador responsável pela Kata.    

``` SQL
SELECT numero FROM telefones
Natural inner JOIN  tratador
Natural INNER JOIN animais
WHERE animais.nome LIKE 'Kata';
```  

|numero   |
|---------|
|266787809|  
|919999999|

>**e.**  Indique  os  telefones  do  responsável  pelo  auxiliar  responsável  pela local onde está a Kata.    

``` SQL
WITH aux as (select nif from tratador_auxiliar
NATURAL INNER JOIN animais
where tratador_auxiliar.registo_local = animais.local and nome = 'Kata')
select numero from telefones
natural inner JOIN aux
Natural INNER JOIN responsavel
where responsavel.nif_funcionario = aux.nif
```  

|numero   |
|---------|
|919999996|
|266878806|  

>**f.**  Indique os tratamentos (data e tratamento) que a Mali já fez no zoo.  
  
``` SQL
SELECT data_consulta,diagnostico FROM consultas
NATURAL INNER JOIN animais 
 WHERE nome LIKE 'Mali';
```  

|data_consulta|diagnostico|
|-------------|-----------|
|2005-08-12   |grávida    |
|2005-09-12|cálcio injectado|
|2005-12-12   |parto      |
|2006-07-12   |infecção   | 
|2006-07-12   |antibiótico injectado|  

>**g.**  Indique os nomes dos veterinários que já diagnosticaram uma gravidez a um carnívoro.    

``` SQL
SELECT nome_func FROM funcionario
JOIN consultas on consultas.nif = funcionario.nif
join classe_bio on consultas.registo = classe_bio.registo
WHERE ordem LIKE 'carnívoros'
AND
diagnostico LIKE 'grávida'
```   

|nome_funcionario|
|----------------|
|Pedro Vale      |  

>**h.**  Indique  para  cada  família  da  ordem  artiodáctilos  quantos  animais tem o zoo.    

``` SQL
SELECT familia, COUNT(ordem) AS numAnimais
FROM classe_bio
WHERE ordem LIKE 'artiodáctilos'
GROUP BY familia;
```  

|familia|numAnimais|
|-------|----------|
|cervídeos|5|
|hipopótamos|3|  

>**i.**  Indique para cada espécie quais os pares de animais que podem ser acasalados,  sabendo  que  não  se  devem  acasalar  pais  com  filhos  ou irmãos.    

``` SQL
WITH fem(femName,registo,especie) AS (SELECT animais.nome,animais.registo, especie FROM animais
NATURAL INNER JOIN classe_bio
WHERE sexo LIKE 'feminino'
ORDER BY especie),
mas(masName, registo,especie) AS (SELECT animais.nome, registo, especie FROM animais
NATURAL INNER JOIN classe_bio
WHERE sexo LIKE 'masculino'
ORDER BY especie),
catfem(nome, registo, registo_mae, registo_pai,especie) AS 
(SELECT animais.nome , animais.registo,registo_mae, registo_pai,classe_bio.especie 
FROM cativeiro  NATURAL INNER JOIN animais
NATURAL INNER JOIN classe_bio
Where sexo like 'feminino'),
catmas(nome, registo, registo_mae, registo_pai,especie) AS 
(SELECT animais.nome , animais.registo,registo_mae, registo_pai,classe_bio.especie 
FROM cativeiro  NATURAL INNER JOIN animais
NATURAL INNER JOIN classe_bio
Where sexo like 'masculino')
SELECT femName , masname, fem.especie FROM fem
JOIN mas ON fem.especie=mas.especie 
EXCEPT
SELECT fem.femName , animais.nome, fem.especie  FROM fem 
JOIN cativeiro ON fem.registo = cativeiro.registo
JOIN animais ON cativeiro.registo_pai= animais.registo
EXCEPT
SELECT animais.nome, mas.masName , mas.especie FROM mas 
JOIN cativeiro ON mas.registo = cativeiro.registo
JOIN animais ON cativeiro.registo_mae= animais.registo
EXCEPT
SELECT animais.nome,catmas.nome , catmas.especie from catmas 
JOIN cativeiro on catmas.registo_mae=cativeiro.registo_mae
JOIN animais on cativeiro.registo=animais.registo
EXCEPT
SELECT animais.nome, catmas.nome ,catmas.especie from catmas
JOIN cativeiro on catmas.registo_pai=cativeiro.registo_pai
JOIN animais on cativeiro.registo=animais.registo




```    

|Feminino|Masculino|especie           |
|--------|---------|----------------- |
|Zula	   |Zará	   |arara-azul-pequena|
|Rará	   |Zará	   |arara-azul-pequena|
|Zura	   |Zará	   |arara-azul-pequena|
|Rará	   |Ará	     |arara-azul-pequena|
|Tapi	   |Hipo	   |hipopótamo comum  |
|Luka	   |Kaki	   |veado             |
|Kalu	   |Kaki	   |veado             |
|Kalu	   |Kuli	   |veado             |
|Mali	   |Mata	   |tigre             |
|Mali	   |Cáta	   |tigre             |
|Aka	   |Cáta	   |tigre             |
|Kata	   |Cáta	   |tigre             |
|Kata	   |Taji	   |tigre             |
|Mali	   |Taji	   |tigre             |



>**j.**  Qual é a ordem com mais animais no zoo?    

``` SQL
SELECT ordem, COUNT(ordem) AS num
FROM class_biologica
GROUP by ordem
Order by num DESC
LIMIT 1;
```  

|ordem|num|
|------|---|
|artiodáctilos|8|  

>**k.**  Qual é  a  ordem  dos  animais  que  têm  mais  de  5  consultas  por  ano(diagnóstico ou tratamento).    

``` SQL
SELECT ordem, count(ordem) from classe_bio
natural INNER join consultas
where classe_bio.registo = consultas.registo
group by ordem 
HAVING COUNT(ordem)>5;
```  

|oredem   |count|
|---------|-----|
|artiodáctilos|12|
|psittaciformes|6|  

>**l.**  Indique o número de animais nascidos em cativeiro.    

``` SQL
WITH anms as (SELECT registo, count(registo) as cat from cativeiro
group by registo)
select SUM(cat) from anms
```  

|SUM|  
|---|
|10 |  

>**m.**  Qual é o animal (nome e espécie) mais velho do zoo?    

``` SQL
WITH A AS (SELECT data_nascimento AS dn , registo
FROM cativeiro
UNION
SELECT idd_estimada AS dn , registo
FROM captura)

SELECT nome FROM animais
WHERE registo=
(SELECT registo
FROM a
WHERE dn=(SELECT MIN(dn)
FROM a))
```  

|maisVelho|
|---------|
|Hipo     |  

>**n.**  Qual é o local húmido com mais mamíferos?    

``` SQL
WITH mamiferos AS(SELECT registo FROM animais
NATURAL INNER JOIN classe_bio
WHERE classe LIKE 'mamíferos'),
 mamiferosperplace AS(SELECT registo_local, COUNT(animais)AS num
FROM espacos JOIN animais
ON espacos.registo_local=animais.local
JOIN mamiferos
ON animais.registo=mamiferos.registo
WHERE espacos.clima LIKE '%húmido%'
group by registo_local)

SELECT registo_local FROM espacos
WHERE registo_local=
(SELECT registo_local
FROM mamiferosperplace
WHERE num=(SELECT MAX(num)
FROM mamiferosperplace))
```    

|registo_local|
|-------------|
|A3           |  

>**o.**  Para  cada  tratador  indique  o  número  de  mamíferos  por  que  é  responsável?    

``` SQL
WITH mamiferos AS(SELECT registo FROM animais
NATURAL INNER JOIN classe_bio
WHERE classe LIKE 'mamíferos'),
mamiferospertratador AS (SELECT nif,registo 
FROM tratador NATURAL inner join mamiferos)
SELECT nome_func, COUNT(mamiferospertratador.nif)
AS mamifpertrat
FROM funcionario JOIN mamiferospertratador
ON funcionario.nif=mamiferospertratador.nif
GROUP BY nome_func
```    

|nome_funcionario|mamifpertrat|
|----------------|------------|
|Manuel Santos   |8           |
|Joaquim Silva   |7           |

>**p.**  Indique o nome dos animais que já foram tratados por todos os veterinários?    

``` SQL
WITH constPedroVale as (Select registo from consultas
NATURAL INNER JOIN veterinarios
NATURAL INNER JOIN funcionario
WHERE funcionario.nome_func LIKE 'Pedro Vale'),
constIsabelSoares  as (Select registo from consultas
NATURAL INNER JOIN veterinarios
NATURAL INNER JOIN funcionario
WHERE funcionario.nome_func LIKE 'Isabel Soares' )
select DISTINCT nome from animais 
Natural inner join constPedroVale
NATURAL inner join constIsabelSoares
```    

|nome|
|----|
|Tapi|
|Zula|  

