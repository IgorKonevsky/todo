PGDMP                          y            postgres    12.4    12.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            !           1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            "           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2849                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            #           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    16441    schedule    TABLE     V   CREATE TABLE public.schedule (
    schedule text NOT NULL,
    login text NOT NULL
);
    DROP TABLE public.schedule;
       public         heap    postgres    false            �            1259    16447 	   subjectok    TABLE     �   CREATE TABLE public.subjectok (
    subject text NOT NULL,
    schedule text NOT NULL,
    cloud text,
    days text[],
    "time" text[]
);
    DROP TABLE public.subjectok;
       public         heap    postgres    false            �            1259    16453    task    TABLE     �   CREATE TABLE public.task (
    task text NOT NULL,
    subject text NOT NULL,
    description text NOT NULL,
    deadline date NOT NULL,
    "time" time without time zone,
    img text,
    schedule text NOT NULL
);
    DROP TABLE public.task;
       public         heap    postgres    false            �            1259    16459    userok    TABLE     T   CREATE TABLE public.userok (
    login text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.userok;
       public         heap    postgres    false                      0    16441    schedule 
   TABLE DATA                 public          postgres    false    203                    0    16447 	   subjectok 
   TABLE DATA                 public          postgres    false    204   2                 0    16453    task 
   TABLE DATA                 public          postgres    false    205   L                 0    16459    userok 
   TABLE DATA                 public          postgres    false    206   f       �
           2606    16466    schedule schedule_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule);
 @   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_pkey;
       public            postgres    false    203            �
           2606    16468    subjectok subject_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.subjectok
    ADD CONSTRAINT subject_pkey PRIMARY KEY (subject);
 @   ALTER TABLE ONLY public.subjectok DROP CONSTRAINT subject_pkey;
       public            postgres    false    204            �
           2606    16470    task task_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public            postgres    false    205            �
           2606    16472    userok user_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.userok
    ADD CONSTRAINT user_pkey PRIMARY KEY (login);
 :   ALTER TABLE ONLY public.userok DROP CONSTRAINT user_pkey;
       public            postgres    false    206            �
           1259    16473    fki_sch name    INDEX     H   CREATE INDEX "fki_sch name" ON public.subjectok USING btree (schedule);
 "   DROP INDEX public."fki_sch name";
       public            postgres    false    204            �
           2606    16474    subjectok newFK    FK CONSTRAINT     z   ALTER TABLE ONLY public.subjectok
    ADD CONSTRAINT "newFK" FOREIGN KEY (schedule) REFERENCES public.schedule(schedule);
 ;   ALTER TABLE ONLY public.subjectok DROP CONSTRAINT "newFK";
       public          postgres    false    204    2703    203            �
           2606    16479 	   task subj    FK CONSTRAINT     q   ALTER TABLE ONLY public.task
    ADD CONSTRAINT subj FOREIGN KEY (subject) REFERENCES public.subjectok(subject);
 3   ALTER TABLE ONLY public.task DROP CONSTRAINT subj;
       public          postgres    false    204    205    2706            �
           2606    16484    schedule user    FK CONSTRAINT     p   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT "user" FOREIGN KEY (login) REFERENCES public.userok(login);
 9   ALTER TABLE ONLY public.schedule DROP CONSTRAINT "user";
       public          postgres    false    2710    206    203               
   x���             
   x���             
   x���             
   x���         