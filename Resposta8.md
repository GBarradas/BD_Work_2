- **animais**(*registo*, nome, sexo, local)  

``` SQL
CREATE TABLE animais (

  registo DECIMAL PRIMARY KEY,

  nome VARCHAR(50),

  sexo VARCHAR(10),

  nascimento VARCHAR(10),

  local VARCHAR(3)

);
```  

- **classe_bio**(*especie*, classe, ordem, familia, registo)  

``` SQL
CREATE TABLE classe_bio(

  especie VARCHAR(50),

  classe VARCHAR(50),

  ordem VARCHAR(50),

  familia VARCHAR(50),

  registo DECIMAL,

  PRIMARY KEY (especie, registo),

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT 

);
```  

- **captura**(*registo*, local_captura, data_captura, idade_estimada)  

``` SQL
CREATE TABLE captura(

  registo DECIMAL,

  local_captura VARCHAR(100),

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT,

  data_captura DATE,

  idd_estimada DATE

);

```  

- **cativeiro**(*registo*, registo_mae, registo_pai)  

``` SQL
CREATE TABLE cativeiro(

  registo DECIMAL PRIMARY KEY,

  registo_mae DECIMAL,

  registo_pai DECIMAL,

  data_nascimento DATE,

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT,

  FOREIGN KEY (registo_mae)REFERENCES animais ON DELETE RESTRICT,

  FOREIGN KEY (registo_pai)REFERENCES animais ON DELETE RESTRICT 

);
```  

- **espacos**(*registo_local*, area, meio, clima)  

``` SQL
CREATE TABLE espacos(

  registo_local VARCHAR(5) PRIMARY KEY,

  area DECIMAL,

  meio VARCHAR(50),

  clima VARCHAR(50)

  --FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT

);
```  

- **funcionario**(nome_func, inicio_func, *nif*)  

``` SQL
CREATE TABLE funcionario (

  nome_func VARCHAR(50),

  inicio_func DATE,

  nif DECIMAL PRIMARY KEY

);
```  

- **telf_funcionario**(*nif, telemovel*)  

``` SQL
CREATE TABLE telefones (

  numero DECIMAL,

  nif DECIMAL,

  PRIMARY KEY (numero,nif),

  FOREIGN KEY (nif) REFERENCES funcionario ON DELETE RESTRICT

);
```  

- **responsavel**(nif_responsvel, *nif_funcionario*)  

``` SQL
CREATE TABLE responsavel(

	nif_responsavel DECIMAL,

  	nif_funcionario DECIMAL PRIMARY KEY,

  	FOREIGN KEY (nif_responsavel) REFERENCES funcionario ON DELETE RESTRICT,

  	FOREIGN KEY (nif_funcionario) REFERENCES funcionario ON DELETE RESTRICT

);
```  

- **tratador**(nif, animal)  

``` SQL
CREATE TABLE tratador (

  nif DECIMAL,

  registo DECIMAL,

  FOREIGN KEY (nif) REFERENCES funcionario ON DELETE RESTRICT,

  FOREIGN KEY (registo) REFERENCES animais ON DELETE RESTRICT

);
```  

- **tratador_auxiliar**(nif, registo_local)  

``` SQL
CREATE TABLE tratador_auxiliar (

  nif DECIMAL,

  registo_local VARCHAR(5),

  FOREIGN KEY (nif) REFERENCES funcionario ON DELETE RESTRICT,

  FOREIGN KEY (registo_local) REFERENCES espacos ON DELETE RESTRICT

);
```  

- **veterinarios**(*nif*)  

``` SQL
CREATE TABLE veterinarios(

  nif DECIMAL PRIMARY KEY,

  FOREIGN KEY(nif) REFERENCES funcionario ON DELETE RESTRICT

);
```  

- **consultas**(nif, registo, registo_local, data_consulta, diagonostico)  

``` SQL
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
```
