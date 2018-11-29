PGDMP         3            
    v        
   hora_bolas    9.4.20    9.5.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16393 
   hora_bolas    DATABASE     �   CREATE DATABASE hora_bolas WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE hora_bolas;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16431    comentar    TABLE     �   CREATE TABLE comentar (
    nm_texto character varying,
    dt_data date,
    tm_hora time with time zone,
    usuario_cd_usuario integer
);
    DROP TABLE public.comentar;
       public         postgres    false    6            �            1259    16423    curtir    TABLE     k   CREATE TABLE curtir (
    tm_hora time with time zone,
    dt_data date,
    usuario_cd_usuario integer
);
    DROP TABLE public.curtir;
       public         postgres    false    6            �            1259    16402    grupos    TABLE     �   CREATE TABLE grupos (
    cd_nome_grupo integer NOT NULL,
    dt_data date,
    tm_hora time with time zone,
    usuario_cd_usuario integer
);
    DROP TABLE public.grupos;
       public         postgres    false    6            �            1259    16412    post    TABLE     �   CREATE TABLE post (
    nm_texto character varying,
    tm_hora time with time zone,
    dt_data date,
    usuario_cd_usuario integer
);
    DROP TABLE public.post;
       public         postgres    false    6            �            1259    16394    usuario    TABLE     �   CREATE TABLE usuario (
    cd_usuario integer NOT NULL,
    nm_name character varying,
    cd_email integer,
    cd_telefone integer,
    cd_cpf integer,
    cd_senha integer
);
    DROP TABLE public.usuario;
       public         postgres    false    6            �          0    16431    comentar 
   TABLE DATA               K   COPY comentar (nm_texto, dt_data, tm_hora, usuario_cd_usuario) FROM stdin;
    public       postgres    false    177          �          0    16423    curtir 
   TABLE DATA               ?   COPY curtir (tm_hora, dt_data, usuario_cd_usuario) FROM stdin;
    public       postgres    false    176   9       �          0    16402    grupos 
   TABLE DATA               N   COPY grupos (cd_nome_grupo, dt_data, tm_hora, usuario_cd_usuario) FROM stdin;
    public       postgres    false    174   V       �          0    16412    post 
   TABLE DATA               G   COPY post (nm_texto, tm_hora, dt_data, usuario_cd_usuario) FROM stdin;
    public       postgres    false    175   s       �          0    16394    usuario 
   TABLE DATA               X   COPY usuario (cd_usuario, nm_name, cd_email, cd_telefone, cd_cpf, cd_senha) FROM stdin;
    public       postgres    false    173   �       n           2606    16406    pk_codgrupo 
   CONSTRAINT     T   ALTER TABLE ONLY grupos
    ADD CONSTRAINT pk_codgrupo PRIMARY KEY (cd_nome_grupo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT pk_codgrupo;
       public         postgres    false    174    174            k           2606    16401    pk_codusuario 
   CONSTRAINT     T   ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_codusuario PRIMARY KEY (cd_usuario);
 ?   ALTER TABLE ONLY public.usuario DROP CONSTRAINT pk_codusuario;
       public         postgres    false    173    173            o           1259    16447    fki_cod_usuario    INDEX     N   CREATE INDEX fki_cod_usuario ON public.post USING btree (usuario_cd_usuario);
 #   DROP INDEX public.fki_cod_usuario;
       public         postgres    false    175            l           1259    16453    fki_codusuario    INDEX     O   CREATE INDEX fki_codusuario ON public.grupos USING btree (usuario_cd_usuario);
 "   DROP INDEX public.fki_codusuario;
       public         postgres    false    174            q           2606    16442    fk_codusuario    FK CONSTRAINT     x   ALTER TABLE ONLY post
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);
 <   ALTER TABLE ONLY public.post DROP CONSTRAINT fk_codusuario;
       public       postgres    false    175    1899    173            p           2606    16448    fk_codusuario    FK CONSTRAINT     z   ALTER TABLE ONLY grupos
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);
 >   ALTER TABLE ONLY public.grupos DROP CONSTRAINT fk_codusuario;
       public       postgres    false    173    174    1899            r           2606    16464    fk_codusuario    FK CONSTRAINT     z   ALTER TABLE ONLY curtir
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);
 >   ALTER TABLE ONLY public.curtir DROP CONSTRAINT fk_codusuario;
       public       postgres    false    173    1899    176            s           2606    16469    fk_codusuario    FK CONSTRAINT     |   ALTER TABLE ONLY comentar
    ADD CONSTRAINT fk_codusuario FOREIGN KEY (usuario_cd_usuario) REFERENCES usuario(cd_usuario);
 @   ALTER TABLE ONLY public.comentar DROP CONSTRAINT fk_codusuario;
       public       postgres    false    173    177    1899            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     