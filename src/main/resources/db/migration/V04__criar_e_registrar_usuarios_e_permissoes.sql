CREATE TABLE public.usuario
(
    codigo bigint NOT NULL,
    email character varying(255) COLLATE pg_catalog."default",
    nome character varying(255) COLLATE pg_catalog."default",
    senha character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT usuario_pkey PRIMARY KEY (codigo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuario
    OWNER to postgres;

CREATE TABLE public.permissao
(
    codigo bigint NOT NULL,
    descricao character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT permissao_pkey PRIMARY KEY (codigo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.permissao
    OWNER to postgres;

CREATE TABLE public.usuario_permissao
(
    codigo_usuario bigint NOT NULL,
    codigo_permissao bigint NOT NULL,
    CONSTRAINT fk5tjrvuwlx1yp72mrf8t8vj93e FOREIGN KEY (codigo_permissao)
        REFERENCES public.permissao (codigo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkeogfr4akeqn19xr3wmyx0n8bo FOREIGN KEY (codigo_usuario)
        REFERENCES public.usuario (codigo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuario_permissao
    OWNER to postgres;

INSERT INTO usuario (codigo, nome, email, senha) values (1, 'Administrador', 'admin@algamoney.com', '$2a$10$X607ZPhQ4EgGNaYKt3n4SONjIv9zc.VMWdEuhCuba7oLAL5IvcL5.');
INSERT INTO usuario (codigo, nome, email, senha) values (2, 'Maria Silva', 'maria@algamoney.com', '$2a$10$Zc3w6HyuPOPXamaMhh.PQOXvDnEsadztbfi6/RyZWJDzimE8WQjaq');

INSERT INTO permissao (codigo, descricao) values (1, 'ROLE_CADASTRAR_CATEGORIA');
INSERT INTO permissao (codigo, descricao) values (2, 'ROLE_PESQUISAR_CATEGORIA');

INSERT INTO permissao (codigo, descricao) values (3, 'ROLE_CADASTRAR_PESSOA');
INSERT INTO permissao (codigo, descricao) values (4, 'ROLE_REMOVER_PESSOA');
INSERT INTO permissao (codigo, descricao) values (5, 'ROLE_PESQUISAR_PESSOA');

INSERT INTO permissao (codigo, descricao) values (6, 'ROLE_CADASTRAR_LANCAMENTO');
INSERT INTO permissao (codigo, descricao) values (7, 'ROLE_REMOVER_LANCAMENTO');
INSERT INTO permissao (codigo, descricao) values (8, 'ROLE_PESQUISAR_LANCAMENTO');

-- admin
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 1);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 2);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 3);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 4);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 5);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 6);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 7);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (1, 8);

-- maria
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 2);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 5);
INSERT INTO usuario_permissao (codigo_usuario, codigo_permissao) values (2, 8);