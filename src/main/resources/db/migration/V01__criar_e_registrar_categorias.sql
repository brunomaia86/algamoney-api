
CREATE SEQUENCE public.categoria_codigo_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.categoria_codigo_seq
  OWNER TO postgres;



CREATE TABLE public.categoria
(
  codigo bigint NOT NULL DEFAULT nextval('categoria_codigo_seq'::regclass),
  nome character varying(20) NOT NULL,
  CONSTRAINT categoria_pkey PRIMARY KEY (codigo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.categoria
  OWNER TO postgres;


INSERT INTO categoria (nome) values ('Lazer');
INSERT INTO categoria (nome) values ('Alimentação');
INSERT INTO categoria (nome) values ('Supermercado');
INSERT INTO categoria (nome) values ('Farmácia');
INSERT INTO categoria (nome) values ('Outros');
