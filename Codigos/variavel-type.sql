-- Cria uma tabela chamada t_dim_tempo para armazenar informações de data e tempo
/* drop table t_dim_tempo cascade constraints; 
   -- Use esse comando caso já tenha executado este script alguma outra vez 
   -- (ele apaga a tabela anterior antes de criar novamente)
*/ 
create table t_dim_tempo
( 
  dt_evento date primary key,           -- Data do evento (chave primária da tabela)
  nr_dia_semana number(1),              -- Número do dia da semana (1 a 7)
  nm_dia_semana varchar2(20),           -- Nome do dia da semana (ex: segunda-feira)
  nm_mes_extenso varchar2(20)           -- Nome do mês por extenso (ex: outubro)
);

-- Insere uma linha de exemplo na tabela com dados da data atual (sysdate)
insert into t_dim_tempo(dt_evento, nr_dia_semana, nm_dia_semana, nm_mes_extenso)
values (
  sysdate,                              -- Data atual do sistema
  to_char(sysdate,'d'),                 -- Dia da semana em número (1–7)
  to_char(sysdate,'day'),               -- Nome do dia da semana (ex: monday, em inglês)
  to_char(sysdate,',month')             -- vírgula extra antes de 'month' (não necessário)
);

-- Habilita a saída de texto no console (para usar dbms_output.put_line)
SET SERVEROUTPUT ON;

-- Início do bloco PL/SQL para manipular os dados da tabela
DECLARE
	v_dt_evento t_dim_tempo.dt_evento%TYPE;  
	-- Declara uma variável chamada v_dt_evento com o mesmo tipo de dado da coluna dt_evento (DATE)
BEGIN
	-- Busca a data do evento na tabela, filtrando pela data atual
	SELECT dt_evento
	INTO v_dt_evento
	FROM t_dim_tempo
	WHERE trunc(dt_evento) = trunc(sysdate);  
	-- A função TRUNC remove a parte da hora da data, permitindo comparar apenas o dia

	-- Exibe no console a data obtida do SELECT
	dbms_output.put_line('A data do evento: ' || v_dt_evento);
END;
/
