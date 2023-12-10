PGDMP               	        {            db_clase    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397    db_clase    DATABASE     {   CREATE DATABASE db_clase WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE db_clase;
                postgres    false            �            1259    16418    tbm_ciudades    TABLE     w   CREATE TABLE public.tbm_ciudades (
    id_ciudad integer NOT NULL,
    nombre_ciudad character varying(50) NOT NULL
);
     DROP TABLE public.tbm_ciudades;
       public         heap    postgres    false            �            1259    16417    tbm_ciudades_id_ciudad_seq    SEQUENCE     �   CREATE SEQUENCE public.tbm_ciudades_id_ciudad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tbm_ciudades_id_ciudad_seq;
       public          postgres    false    216            �           0    0    tbm_ciudades_id_ciudad_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tbm_ciudades_id_ciudad_seq OWNED BY public.tbm_ciudades.id_ciudad;
          public          postgres    false    215            �            1259    16425    tbm_estudiantes    TABLE     �   CREATE TABLE public.tbm_estudiantes (
    id_est integer NOT NULL,
    nombre_estudiante character varying(50) NOT NULL,
    apellido_estudiante character varying(50) NOT NULL,
    cedula character(10) NOT NULL,
    fk_ciudad integer NOT NULL
);
 #   DROP TABLE public.tbm_estudiantes;
       public         heap    postgres    false            �            1259    16424    tbm_estudiantes_id_est_seq    SEQUENCE     �   CREATE SEQUENCE public.tbm_estudiantes_id_est_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tbm_estudiantes_id_est_seq;
       public          postgres    false    218            �           0    0    tbm_estudiantes_id_est_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tbm_estudiantes_id_est_seq OWNED BY public.tbm_estudiantes.id_est;
          public          postgres    false    217                       2604    16421    tbm_ciudades id_ciudad    DEFAULT     �   ALTER TABLE ONLY public.tbm_ciudades ALTER COLUMN id_ciudad SET DEFAULT nextval('public.tbm_ciudades_id_ciudad_seq'::regclass);
 E   ALTER TABLE public.tbm_ciudades ALTER COLUMN id_ciudad DROP DEFAULT;
       public          postgres    false    216    215    216                        2604    16428    tbm_estudiantes id_est    DEFAULT     �   ALTER TABLE ONLY public.tbm_estudiantes ALTER COLUMN id_est SET DEFAULT nextval('public.tbm_estudiantes_id_est_seq'::regclass);
 E   ALTER TABLE public.tbm_estudiantes ALTER COLUMN id_est DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    16418    tbm_ciudades 
   TABLE DATA           @   COPY public.tbm_ciudades (id_ciudad, nombre_ciudad) FROM stdin;
    public          postgres    false    216   �       �          0    16425    tbm_estudiantes 
   TABLE DATA           l   COPY public.tbm_estudiantes (id_est, nombre_estudiante, apellido_estudiante, cedula, fk_ciudad) FROM stdin;
    public          postgres    false    218           �           0    0    tbm_ciudades_id_ciudad_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tbm_ciudades_id_ciudad_seq', 7, true);
          public          postgres    false    215            �           0    0    tbm_estudiantes_id_est_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tbm_estudiantes_id_est_seq', 16, true);
          public          postgres    false    217            "           2606    16423    tbm_ciudades tbm_ciudades_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tbm_ciudades
    ADD CONSTRAINT tbm_ciudades_pkey PRIMARY KEY (id_ciudad);
 H   ALTER TABLE ONLY public.tbm_ciudades DROP CONSTRAINT tbm_ciudades_pkey;
       public            postgres    false    216            $           2606    16430 $   tbm_estudiantes tbm_estudiantes_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tbm_estudiantes
    ADD CONSTRAINT tbm_estudiantes_pkey PRIMARY KEY (id_est);
 N   ALTER TABLE ONLY public.tbm_estudiantes DROP CONSTRAINT tbm_estudiantes_pkey;
       public            postgres    false    218            %           2606    16431 .   tbm_estudiantes tbm_estudiantes_fk_ciudad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbm_estudiantes
    ADD CONSTRAINT tbm_estudiantes_fk_ciudad_fkey FOREIGN KEY (fk_ciudad) REFERENCES public.tbm_ciudades(id_ciudad);
 X   ALTER TABLE ONLY public.tbm_estudiantes DROP CONSTRAINT tbm_estudiantes_fk_ciudad_fkey;
       public          postgres    false    4642    216    218            �   S   x�3�t/M�L,,���2�,�,��2�t�MJ2L8�KS��L9��J�\�s3���̀*S�RS��9}��2�b���� �X      �     x���Mj�0��O��	�e�w�B�҆vY���@��Jv��Uΐ�u����N�{3��$v���>'�FB�6uU*��"�v���x�Qt�9r���{��>�o����6�vƣ��>��(�����߉���h�RT�Q��̡�SV�S������B:$V�P��sķ>�A��ֆ�Zlu,8��7Z)��$3|,]3����*c')�0����2�n�4%st��<ꓕ�V�5����~�
ݙ����I��(���yB���t�     