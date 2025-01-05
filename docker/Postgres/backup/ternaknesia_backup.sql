--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'jantan',
    'betina'
);


ALTER TYPE public.gender OWNER TO postgres;

--
-- Name: kesehatan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.kesehatan AS ENUM (
    'jantan',
    'betina'
);


ALTER TYPE public.kesehatan OWNER TO postgres;

--
-- Name: stress_level; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.stress_level AS ENUM (
    'tidak',
    'ringan',
    'berat'
);


ALTER TYPE public.stress_level OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: berat_badan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.berat_badan (
    id integer NOT NULL,
    cow_id integer NOT NULL,
    tanggal date NOT NULL,
    value numeric(10,2) NOT NULL
);


ALTER TABLE public.berat_badan OWNER TO postgres;

--
-- Name: berat_badan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.berat_badan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.berat_badan_id_seq OWNER TO postgres;

--
-- Name: berat_badan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.berat_badan_id_seq OWNED BY public.berat_badan.id;


--
-- Name: birahi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.birahi (
    cow_id bigint,
    tanggal date,
    value text,
    id integer NOT NULL
);


ALTER TABLE public.birahi OWNER TO postgres;

--
-- Name: birahi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.birahi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.birahi_id_seq OWNER TO postgres;

--
-- Name: birahi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.birahi_id_seq OWNED BY public.birahi.id;


--
-- Name: catatan_dokter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catatan_dokter (
    id bigint NOT NULL,
    cow_id bigint,
    tanggal date,
    value text
);


ALTER TABLE public.catatan_dokter OWNER TO postgres;

--
-- Name: catatan_dokter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.catatan_dokter ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.catatan_dokter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: catatan_peternak; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catatan_peternak (
    cow_id bigint,
    tanggal date,
    value text,
    id integer NOT NULL
);


ALTER TABLE public.catatan_peternak OWNER TO postgres;

--
-- Name: catatan_peternak_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catatan_peternak_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.catatan_peternak_id_seq OWNER TO postgres;

--
-- Name: catatan_peternak_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catatan_peternak_id_seq OWNED BY public.catatan_peternak.id;


--
-- Name: cows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cows (
    cow_id bigint NOT NULL,
    gender text NOT NULL,
    nfc_id text,
    umur integer
);
ALTER TABLE ONLY public.cows ALTER COLUMN gender SET STORAGE PLAIN;


ALTER TABLE public.cows OWNER TO postgres;

--
-- Name: cows_cow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cows ALTER COLUMN cow_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cows_cow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: kesehatan_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kesehatan_status (
    cow_id bigint,
    tanggal date,
    value text,
    id integer NOT NULL
);


ALTER TABLE public.kesehatan_status OWNER TO postgres;

--
-- Name: kesehatan_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kesehatan_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kesehatan_status_id_seq OWNER TO postgres;

--
-- Name: kesehatan_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kesehatan_status_id_seq OWNED BY public.kesehatan_status.id;


--
-- Name: pakan_hijauan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pakan_hijauan (
    id bigint NOT NULL,
    cow_id bigint,
    tanggal date,
    value double precision
);


ALTER TABLE public.pakan_hijauan OWNER TO postgres;

--
-- Name: pakan_hijauan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pakan_hijauan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pakan_hijauan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pakan_sentrat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pakan_sentrat (
    id bigint NOT NULL,
    cow_id bigint,
    tanggal date,
    value double precision
);


ALTER TABLE public.pakan_sentrat OWNER TO postgres;

--
-- Name: pakan_sentrat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pakan_sentrat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pakan_sentrat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stress (
    cow_id bigint,
    tanggal date,
    value text,
    id integer NOT NULL
);


ALTER TABLE public.stress OWNER TO postgres;

--
-- Name: stress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stress_id_seq OWNER TO postgres;

--
-- Name: stress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stress_id_seq OWNED BY public.stress.id;


--
-- Name: susu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.susu (
    id bigint NOT NULL,
    cow_id bigint,
    tanggal date,
    value double precision
);


ALTER TABLE public.susu OWNER TO postgres;

--
-- Name: susu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.susu ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.susu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email text,
    password text,
    nama text,
    role text,
    alamat text,
    no_hp numeric
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: berat_badan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.berat_badan ALTER COLUMN id SET DEFAULT nextval('public.berat_badan_id_seq'::regclass);


--
-- Name: birahi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.birahi ALTER COLUMN id SET DEFAULT nextval('public.birahi_id_seq'::regclass);


--
-- Name: catatan_peternak id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catatan_peternak ALTER COLUMN id SET DEFAULT nextval('public.catatan_peternak_id_seq'::regclass);


--
-- Name: kesehatan_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kesehatan_status ALTER COLUMN id SET DEFAULT nextval('public.kesehatan_status_id_seq'::regclass);


--
-- Name: stress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stress ALTER COLUMN id SET DEFAULT nextval('public.stress_id_seq'::regclass);


--
-- Data for Name: berat_badan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.berat_badan (id, cow_id, tanggal, value) FROM stdin;
9	5	2024-12-23	200.00
11	5	2024-12-29	21.00
12	5	2024-12-30	123.00
\.


--
-- Data for Name: birahi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.birahi (cow_id, tanggal, value, id) FROM stdin;
5	2024-12-30	Ya	1
\.


--
-- Data for Name: catatan_dokter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catatan_dokter (id, cow_id, tanggal, value) FROM stdin;
\.


--
-- Data for Name: catatan_peternak; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catatan_peternak (cow_id, tanggal, value, id) FROM stdin;
5	2024-12-20	Catatan penting	1
\.


--
-- Data for Name: cows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cows (cow_id, gender, nfc_id, umur) FROM stdin;
5	betina	\N	20
6	betina	\N	30
\.


--
-- Data for Name: kesehatan_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kesehatan_status (cow_id, tanggal, value, id) FROM stdin;
6	2024-12-23	sakit	2
5	2025-01-03	Sehat	28
\.


--
-- Data for Name: pakan_hijauan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pakan_hijauan (id, cow_id, tanggal, value) FROM stdin;
3	5	2024-12-30	11
1	5	2024-12-29	10
\.


--
-- Data for Name: pakan_sentrat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pakan_sentrat (id, cow_id, tanggal, value) FROM stdin;
1	5	2024-12-29	3
3	5	2024-12-30	12
\.


--
-- Data for Name: stress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stress (cow_id, tanggal, value, id) FROM stdin;
5	2025-01-01	Ringan	7
\.


--
-- Data for Name: susu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.susu (id, cow_id, tanggal, value) FROM stdin;
6	5	2024-12-30	12
2	5	2024-12-23	11
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, nama, role, alamat, no_hp) FROM stdin;
\.


--
-- Name: berat_badan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.berat_badan_id_seq', 12, true);


--
-- Name: birahi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.birahi_id_seq', 28, true);


--
-- Name: catatan_dokter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catatan_dokter_id_seq', 1, false);


--
-- Name: catatan_peternak_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catatan_peternak_id_seq', 4, true);


--
-- Name: cows_cow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cows_cow_id_seq', 6, true);


--
-- Name: kesehatan_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kesehatan_status_id_seq', 36, true);


--
-- Name: pakan_hijauan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pakan_hijauan_id_seq', 4, true);


--
-- Name: pakan_sentrat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pakan_sentrat_id_seq', 3, true);


--
-- Name: stress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stress_id_seq', 30, true);


--
-- Name: susu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.susu_id_seq', 8, true);


--
-- Name: berat_badan berat_badan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.berat_badan
    ADD CONSTRAINT berat_badan_pkey PRIMARY KEY (id);


--
-- Name: birahi birahi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.birahi
    ADD CONSTRAINT birahi_pkey PRIMARY KEY (id);


--
-- Name: catatan_dokter catatan_dokter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catatan_dokter
    ADD CONSTRAINT catatan_dokter_pkey PRIMARY KEY (id);


--
-- Name: catatan_peternak catatan_peternak_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catatan_peternak
    ADD CONSTRAINT catatan_peternak_pkey PRIMARY KEY (id);


--
-- Name: cows id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cows
    ADD CONSTRAINT id PRIMARY KEY (cow_id);


--
-- Name: kesehatan_status kesehatan_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kesehatan_status
    ADD CONSTRAINT kesehatan_status_pkey PRIMARY KEY (id);


--
-- Name: pakan_sentrat pakan_sentrat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pakan_sentrat
    ADD CONSTRAINT pakan_sentrat_pkey PRIMARY KEY (id);


--
-- Name: stress stress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stress
    ADD CONSTRAINT stress_pkey PRIMARY KEY (id);


--
-- Name: susu susu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.susu
    ADD CONSTRAINT susu_pkey PRIMARY KEY (id);


--
-- Name: berat_badan unique_berat_cow_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.berat_badan
    ADD CONSTRAINT unique_berat_cow_date UNIQUE (cow_id, tanggal);


--
-- Name: birahi unique_cow_id_tanggal_birahi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.birahi
    ADD CONSTRAINT unique_cow_id_tanggal_birahi UNIQUE (cow_id, tanggal);


--
-- Name: catatan_peternak unique_cow_id_tanggal_catatan_peternak; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catatan_peternak
    ADD CONSTRAINT unique_cow_id_tanggal_catatan_peternak UNIQUE (cow_id, tanggal);


--
-- Name: kesehatan_status unique_cow_id_tanggal_kesehatan_status; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kesehatan_status
    ADD CONSTRAINT unique_cow_id_tanggal_kesehatan_status UNIQUE (cow_id, tanggal);


--
-- Name: stress unique_cow_id_tanggal_stress; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stress
    ADD CONSTRAINT unique_cow_id_tanggal_stress UNIQUE (cow_id, tanggal);


--
-- Name: pakan_hijauan unique_hijauan_cow_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pakan_hijauan
    ADD CONSTRAINT unique_hijauan_cow_date UNIQUE (cow_id, tanggal);


--
-- Name: pakan_sentrat unique_sentrate_cow_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pakan_sentrat
    ADD CONSTRAINT unique_sentrate_cow_date UNIQUE (cow_id, tanggal);


--
-- Name: susu unique_susu_cow_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.susu
    ADD CONSTRAINT unique_susu_cow_date UNIQUE (cow_id, tanggal);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: birahi fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.birahi
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- Name: catatan_dokter fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catatan_dokter
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- Name: catatan_peternak fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catatan_peternak
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- Name: kesehatan_status fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kesehatan_status
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- Name: pakan_hijauan fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pakan_hijauan
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- Name: pakan_sentrat fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pakan_sentrat
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- Name: stress fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stress
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- Name: susu fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.susu
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- Name: berat_badan fk_cow_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.berat_badan
    ADD CONSTRAINT fk_cow_id FOREIGN KEY (cow_id) REFERENCES public.cows(cow_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

