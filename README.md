# 📅 Scripts PL/SQL – Tabela de Dimensão de Tempo

Este repositório contém dois scripts **PL/SQL** criados para demonstrar a manipulação de tabelas e variáveis no **Oracle Database**, utilizando a tabela de exemplo `t_dim_tempo`.  
Os exemplos mostram desde a **criação da tabela** até a **leitura e exibição de informações formatadas** com o pacote `DBMS_OUTPUT`.

![Oracle PL/SQL](https://img.shields.io/badge/Oracle-PL%2FSQL-red?style=flat-square)
![Status](https://img.shields.io/badge/Status-Completo-brightgreen?style=flat-square)

---

## 📘 Estrutura do Projeto

### 🧩 Script 1 – Criação e Exibição Completa de Dados
📄 **Arquivo:** `dim_tempo_completo.sql`

Cria a tabela `t_dim_tempo`, insere uma linha com a **data de amanhã** e utiliza uma variável do tipo `%ROWTYPE` para buscar todos os campos da tabela.  
Em seguida, exibe as informações formatadas no console.

```sql
dbms_output.put_line(
  'O dia será ' || rec_dim_tempo.nr_dia_semana || 
  ', em uma ' || rec_dim_tempo.nm_dia_semana || 
  ', no mês de ' || rec_dim_tempo.nm_mes_extenso
);
```

## 🧠 Conceitos usados:

- Criação de tabelas (CREATE TABLE)
- Inserção de registros (INSERT INTO)
- Variável %ROWTYPE
- Uso de SELECT INTO
- Exibição com DBMS_OUTPUT.PUT_LINE

## ⚙️ Como Executar

1. Abra o SQL Developer ou outra ferramenta de acesso ao Oracle Database.

2. Copie o conteúdo de um dos scripts e cole em uma nova worksheet.

3. Execute o comando e confira na saida do console

## 🎯 Objetivo Didático

Este projeto tem finalidade **educacional**, ensinando:

- Estrutura e criação de tabelas no Oracle
- Tipos de variáveis em PL/SQL (`%ROWTYPE` e `%TYPE`)
- Uso de `SELECT INTO`
- Exibição de resultados com `DBMS_OUTPUT`
- Manipulação de datas (`SYSDATE`, `TRUNC`, `TO_CHAR`)

## 🧑‍💻 Autor

**Leonardo Gregori**  
📍 Criado para estudo e prática de PL/SQL no Oracle Database (fins educativos)
