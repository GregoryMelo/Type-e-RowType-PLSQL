-- cria uma tabela de exemplo
/* drop table t_dim_tempo cascade constraints; 
   -- Use esse comando caso já tenha executado este script alguma outra vez 
   -- (ele apaga a tabela anterior antes de criar novamente)
*/
create table t_dim_tempo
( dt_evento date primary key,            -- Data do evento (chave primária)
  nr_dia_semana number(1),               -- Número do dia da semana (1 a 7)
  nm_dia_semana varchar2(20),            -- Nome do dia da semana (ex: Segunda)
  nm_mes_extenso varchar2(20)            -- Nome do mês por extenso (ex: Janeiro)
);

SET SERVEROUTPUT ON;

-- Inclui uma nova linha na tabela t_dim_tempo
insert into t_dim_tempo(dt_evento, nr_dia_semana, nm_dia_semana, nm_mes_extenso)
values (
  sysdate + 1,                                    -- Data de amanhã
  to_char(sysdate + 1, 'd'),                      -- Dia da semana em número (1–7)
  trim(to_char(sysdate + 1, 'day')),              -- Nome do dia da semana (removendo espaços extras)
  initcap(trim(to_char(sysdate + 1, 'month')))    -- Nome do mês com inicial maiúscula e sem espaços
);

DECLARE
	rec_dim_tempo t_dim_tempo%ROWTYPE; -- Cria uma variável com a estrutura da tabela t_dim_tempo
BEGIN
    SELECT * -- Busca todas as colunas das tabelas
    INTO rec_dim_tempo
    FROM t_dim_tempo;

    -- Exibe as informações formatadas no console
    dbms_output.put_line(
      'O dia será ' || rec_dim_tempo.nr_dia_semana || 
      ', em uma ' || rec_dim_tempo.nm_dia_semana || 
      ', no mês de ' || rec_dim_tempo.nm_mes_extenso
    );
END;
/