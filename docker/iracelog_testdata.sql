--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: analysis_proto; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.analysis_proto (
    event_id integer NOT NULL,
    record_stamp timestamp with time zone DEFAULT now() NOT NULL,
    protodata bytea NOT NULL
);


ALTER TABLE public.analysis_proto OWNER TO docker;

--
-- Name: TABLE analysis_proto; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON TABLE public.analysis_proto IS 'Analysis data in binary protobuf format';


--
-- Name: COLUMN analysis_proto.record_stamp; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON COLUMN public.analysis_proto.record_stamp IS 'Timestamp when data was persisted';


--
-- Name: c_car; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.c_car (
    id integer NOT NULL,
    event_id integer NOT NULL,
    name character varying NOT NULL,
    name_short character varying NOT NULL,
    car_id integer NOT NULL,
    c_car_class_id integer NOT NULL,
    fuel_pct numeric DEFAULT 1 NOT NULL,
    power_adjust numeric DEFAULT 0 NOT NULL,
    weight_penalty numeric DEFAULT 0 NOT NULL,
    dry_tire_sets integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.c_car OWNER TO docker;

--
-- Name: c_car_class; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.c_car_class (
    id integer NOT NULL,
    event_id integer NOT NULL,
    name character varying NOT NULL,
    car_class_id integer NOT NULL
);


ALTER TABLE public.c_car_class OWNER TO docker;

--
-- Name: c_car_class_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.c_car_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.c_car_class_id_seq OWNER TO docker;

--
-- Name: c_car_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.c_car_class_id_seq OWNED BY public.c_car_class.id;


--
-- Name: c_car_driver; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.c_car_driver (
    id integer NOT NULL,
    c_car_entry_id integer NOT NULL,
    driver_id integer NOT NULL,
    name character varying NOT NULL,
    initials character varying NOT NULL,
    abbrev_name character varying NOT NULL,
    irating integer NOT NULL,
    lic_level integer NOT NULL,
    lic_sub_level integer NOT NULL,
    lic_string character varying NOT NULL
);


ALTER TABLE public.c_car_driver OWNER TO docker;

--
-- Name: c_car_driver_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.c_car_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.c_car_driver_id_seq OWNER TO docker;

--
-- Name: c_car_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.c_car_driver_id_seq OWNED BY public.c_car_driver.id;


--
-- Name: c_car_entry; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.c_car_entry (
    id integer NOT NULL,
    event_id integer NOT NULL,
    c_car_id integer NOT NULL,
    car_idx integer NOT NULL,
    car_number character varying NOT NULL,
    car_number_raw integer NOT NULL
);


ALTER TABLE public.c_car_entry OWNER TO docker;

--
-- Name: c_car_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.c_car_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.c_car_entry_id_seq OWNER TO docker;

--
-- Name: c_car_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.c_car_entry_id_seq OWNED BY public.c_car_entry.id;


--
-- Name: c_car_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.c_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.c_car_id_seq OWNER TO docker;

--
-- Name: c_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.c_car_id_seq OWNED BY public.c_car.id;


--
-- Name: c_car_team; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.c_car_team (
    id integer NOT NULL,
    c_car_entry_id integer NOT NULL,
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.c_car_team OWNER TO docker;

--
-- Name: c_car_team_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.c_car_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.c_car_team_id_seq OWNER TO docker;

--
-- Name: c_car_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.c_car_team_id_seq OWNED BY public.c_car_team.id;


--
-- Name: car_state_proto; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.car_state_proto (
    id integer NOT NULL,
    rs_info_id integer NOT NULL,
    protodata bytea NOT NULL
);


ALTER TABLE public.car_state_proto OWNER TO docker;

--
-- Name: car_state_proto_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.car_state_proto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.car_state_proto_id_seq OWNER TO docker;

--
-- Name: car_state_proto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.car_state_proto_id_seq OWNED BY public.car_state_proto.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.event (
    id integer NOT NULL,
    event_key character varying NOT NULL,
    name character varying NOT NULL,
    description character varying,
    event_time timestamp with time zone DEFAULT now() NOT NULL,
    racelogger_version character varying NOT NULL,
    team_racing boolean DEFAULT false NOT NULL,
    multi_class boolean DEFAULT false NOT NULL,
    num_car_types integer DEFAULT 0 NOT NULL,
    num_car_classes integer DEFAULT 0 NOT NULL,
    ir_session_id integer,
    track_id integer NOT NULL,
    pit_speed numeric DEFAULT 0 NOT NULL,
    replay_min_timestamp timestamp with time zone DEFAULT now() NOT NULL,
    replay_min_session_time numeric DEFAULT 0 NOT NULL,
    replay_max_session_time numeric DEFAULT 0 NOT NULL,
    sessions jsonb NOT NULL,
    ir_sub_session_id integer DEFAULT 0 NOT NULL,
    tenant_id integer NOT NULL,
    tire_infos jsonb
);


ALTER TABLE public.event OWNER TO docker;

--
-- Name: TABLE event; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON TABLE public.event IS 'Information about a recorded event';


--
-- Name: COLUMN event.replay_min_timestamp; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON COLUMN public.event.replay_min_timestamp IS 'timestamp of the race start';


--
-- Name: COLUMN event.replay_min_session_time; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON COLUMN public.event.replay_min_session_time IS 'session time of the race start';


--
-- Name: COLUMN event.replay_max_session_time; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON COLUMN public.event.replay_max_session_time IS 'session time of the race end';


--
-- Name: event_ext; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.event_ext (
    event_id integer NOT NULL,
    extra_info jsonb DEFAULT '{}'::jsonb NOT NULL
);


ALTER TABLE public.event_ext OWNER TO docker;

--
-- Name: TABLE event_ext; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON TABLE public.event_ext IS 'additional information about a recorded event';


--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_id_seq OWNER TO docker;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: msg_state_proto; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.msg_state_proto (
    id integer NOT NULL,
    rs_info_id integer NOT NULL,
    protodata bytea NOT NULL
);


ALTER TABLE public.msg_state_proto OWNER TO docker;

--
-- Name: TABLE msg_state_proto; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON TABLE public.msg_state_proto IS 'Messages extracted from race_state_proto';


--
-- Name: msg_state_proto_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.msg_state_proto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.msg_state_proto_id_seq OWNER TO docker;

--
-- Name: msg_state_proto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.msg_state_proto_id_seq OWNED BY public.msg_state_proto.id;


--
-- Name: race_state_proto; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.race_state_proto (
    id integer NOT NULL,
    rs_info_id integer NOT NULL,
    protodata bytea NOT NULL
);


ALTER TABLE public.race_state_proto OWNER TO docker;

--
-- Name: race_state_proto_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.race_state_proto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.race_state_proto_id_seq OWNER TO docker;

--
-- Name: race_state_proto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.race_state_proto_id_seq OWNED BY public.race_state_proto.id;


--
-- Name: rs_info; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.rs_info (
    id integer NOT NULL,
    event_id integer NOT NULL,
    record_stamp timestamp with time zone DEFAULT now() NOT NULL,
    session_time numeric NOT NULL,
    time_of_day integer NOT NULL,
    air_temp numeric NOT NULL,
    track_temp numeric NOT NULL,
    track_wetness integer NOT NULL,
    precipitation numeric NOT NULL,
    session_num integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.rs_info OWNER TO docker;

--
-- Name: TABLE rs_info; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON TABLE public.rs_info IS 'Shared information for a recorded race state';


--
-- Name: rs_info_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.rs_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rs_info_id_seq OWNER TO docker;

--
-- Name: rs_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.rs_info_id_seq OWNED BY public.rs_info.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO docker;

--
-- Name: speedmap_proto; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.speedmap_proto (
    id integer NOT NULL,
    rs_info_id integer NOT NULL,
    protodata bytea NOT NULL
);


ALTER TABLE public.speedmap_proto OWNER TO docker;

--
-- Name: speedmap_proto_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.speedmap_proto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.speedmap_proto_id_seq OWNER TO docker;

--
-- Name: speedmap_proto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.speedmap_proto_id_seq OWNED BY public.speedmap_proto.id;


--
-- Name: tenant; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.tenant (
    id integer NOT NULL,
    external_id uuid NOT NULL,
    name character varying NOT NULL,
    api_key character varying NOT NULL,
    active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tenant OWNER TO docker;

--
-- Name: TABLE tenant; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON TABLE public.tenant IS 'Information about a tenant';


--
-- Name: COLUMN tenant.external_id; Type: COMMENT; Schema: public; Owner: docker
--

COMMENT ON COLUMN public.tenant.external_id IS 'for external use';


--
-- Name: tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.tenant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tenant_id_seq OWNER TO docker;

--
-- Name: tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.tenant_id_seq OWNED BY public.tenant.id;


--
-- Name: track; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.track (
    id integer NOT NULL,
    name character varying NOT NULL,
    short_name character varying NOT NULL,
    config character varying NOT NULL,
    track_length numeric NOT NULL,
    sectors jsonb NOT NULL,
    pit_speed numeric DEFAULT 0 NOT NULL,
    pit_entry numeric DEFAULT 0 NOT NULL,
    pit_exit numeric DEFAULT 0 NOT NULL,
    pit_lane_length numeric DEFAULT 0 NOT NULL
);


ALTER TABLE public.track OWNER TO docker;

--
-- Name: track_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.track_id_seq OWNER TO docker;

--
-- Name: track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.track_id_seq OWNED BY public.track.id;


--
-- Name: c_car id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car ALTER COLUMN id SET DEFAULT nextval('public.c_car_id_seq'::regclass);


--
-- Name: c_car_class id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_class ALTER COLUMN id SET DEFAULT nextval('public.c_car_class_id_seq'::regclass);


--
-- Name: c_car_driver id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_driver ALTER COLUMN id SET DEFAULT nextval('public.c_car_driver_id_seq'::regclass);


--
-- Name: c_car_entry id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_entry ALTER COLUMN id SET DEFAULT nextval('public.c_car_entry_id_seq'::regclass);


--
-- Name: c_car_team id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_team ALTER COLUMN id SET DEFAULT nextval('public.c_car_team_id_seq'::regclass);


--
-- Name: car_state_proto id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.car_state_proto ALTER COLUMN id SET DEFAULT nextval('public.car_state_proto_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: msg_state_proto id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.msg_state_proto ALTER COLUMN id SET DEFAULT nextval('public.msg_state_proto_id_seq'::regclass);


--
-- Name: race_state_proto id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.race_state_proto ALTER COLUMN id SET DEFAULT nextval('public.race_state_proto_id_seq'::regclass);


--
-- Name: rs_info id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.rs_info ALTER COLUMN id SET DEFAULT nextval('public.rs_info_id_seq'::regclass);


--
-- Name: speedmap_proto id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.speedmap_proto ALTER COLUMN id SET DEFAULT nextval('public.speedmap_proto_id_seq'::regclass);


--
-- Name: tenant id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tenant ALTER COLUMN id SET DEFAULT nextval('public.tenant_id_seq'::regclass);


--
-- Name: track id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.track ALTER COLUMN id SET DEFAULT nextval('public.track_id_seq'::regclass);


--
-- Data for Name: analysis_proto; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.analysis_proto (event_id, record_stamp, protodata) FROM stdin;
\.


--
-- Data for Name: c_car; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.c_car (id, event_id, name, name_short, car_id, c_car_class_id, fuel_pct, power_adjust, weight_penalty, dry_tire_sets) FROM stdin;
19	4	Cadillac V-Series.R	Cadillac V-Series.R	168	7	1	0	0	0
20	4	BMW M Hybrid V8	BMW M Hybrid V8	159	7	1	0	0	0
21	4	Dallara P217 LMP2	Dallara P217 LMP2	128	8	1	0	0	0
22	4	Lamborghini Huracan GT3 EVO	Lamborghini GT3	133	9	0.9800000190734863	-1	0	0
23	4	BMW M4 GT3	BMW M4 GT3	132	9	0.9800000190734863	0	0	0
24	4	Acura ARX-06	Acura ARX-06	170	7	0.9800000190734863	-3	0	0
25	4	Ferrari 296 GT3	Ferrari 296 GT3	173	9	0.9900000095367432	-1.5	0	0
26	4	Chevrolet Corvette Z06 GT3.R	Corvette GT3.R	184	9	0.9800000190734863	-0.5	0	0
27	4	Audi R8 LMS EVO II GT3	Audi R8 LMS EVO II GT3	176	9	0.9900000095367432	-1	0	0
28	4	Porsche 911 GT3 R (992)	Porsche 911 GT3 R (992)	169	9	1	-0.5	0	0
29	5	Audi R8 LMS EVO II GT3	Audi R8 LMS EVO II GT3	176	10	0.9900000095367432	-2	0	0
30	5	Chevrolet Corvette Z06 GT3.R	Corvette GT3.R	184	10	0.9800000190734863	-1.5	0	0
31	5	Ferrari 296 GT3	Ferrari 296 GT3	173	10	0.9800000190734863	-3.25	0	0
32	5	BMW M4 GT3	BMW M4 GT3	132	10	0.9900000095367432	-1	0	0
33	5	Ford Mustang GT3	Ford Mustang GT3	185	10	0.9800000190734863	0	0	0
34	5	Porsche 911 GT3 R (992)	Porsche 911 GT3 R (992)	169	10	1	-1	0	0
39	8	Porsche 911 GT3 Cup (992)	Porsche 911 GT3 Cup (992)	143	13	1	0	0	0
40	9	Porsche 911 GT3 Cup (992)	Porsche 911 GT3 Cup (992)	143	14	1	0	0	0
41	10	BMW M4 GT3	BMW M4 GT3	132	17	1	-1	0	0
42	10	Chevrolet Corvette Z06 GT3.R	Corvette GT3.R	184	17	1	-0.5	0	0
43	10	Cadillac V-Series.R	Cadillac V-Series.R	168	15	1	0	0	0
44	10	Lamborghini Huracan GT3 EVO	Lamborghini GT3	133	17	0.9900000095367432	-0.5	0	0
45	10	Dallara P217 LMP2	Dallara P217 LMP2	128	16	1	0	0	0
46	10	Ford Mustang GT3	Ford Mustang GT3	185	17	1	-1	0	0
47	10	Ferrari 296 GT3	Ferrari 296 GT3	173	17	1	-1.75	0	0
48	10	Porsche 911 GT3 R (992)	Porsche 911 GT3 R (992)	169	17	1	-0.5	0	0
49	10	Mercedes-AMG GT3 2020	Mercedes GT3 2020	156	17	0.9700000286102295	-1.25	0	0
50	10	BMW M Hybrid V8	BMW M Hybrid V8	159	15	1	-0.5	0	0
51	10	Acura ARX-06	Acura ARX-06	170	15	0.9800000190734863	0	0	0
61	12	Ferrari 296 GT3	Ferrari 296 GT3	173	19	0.9800000190734863	-0.25	0	0
62	12	BMW M4 GT3	BMW M4 GT3	132	19	0.9900000095367432	0	0	0
63	12	Audi R8 LMS EVO II GT3	Audi R8 LMS EVO II GT3	176	19	1	-0.25	0	0
64	12	Ford Mustang GT3	Ford Mustang GT3	185	19	0.9900000095367432	-1	0	0
65	12	Mercedes-AMG GT3 2020	Mercedes GT3 2020	156	19	0.9800000190734863	-0.25	0	0
66	12	Chevrolet Corvette Z06 GT3.R	Corvette GT3.R	184	19	1	-0.25	0	0
67	12	McLaren 720S GT3 EVO	McLaren 720S GT3 EVO	188	19	0.9800000190734863	-0.75	0	0
68	12	Lamborghini Huracan GT3 EVO	Lamborghini GT3	133	19	1	-0.25	0	0
69	12	Porsche 911 GT3 R (992)	Porsche 911 GT3 R (992)	169	19	0.9800000190734863	-0.75	0	0
70	13	McLaren 720S GT3 EVO	McLaren 720S GT3 EVO	188	20	1	0	0	0
71	13	Ford Mustang GT3	Ford Mustang GT3	185	20	1	0	0	0
72	13	Ferrari 296 GT3	Ferrari 296 GT3	173	20	1	0	0	0
73	13	Chevrolet Corvette Z06 GT3.R	Corvette GT3.R	184	20	1	0	0	0
74	13	Porsche 911 GT3 R (992)	Porsche 911 GT3 R (992)	169	20	1	0	0	0
75	13	Mercedes-AMG GT3 2020	Mercedes GT3 2020	156	20	1	0	0	0
76	13	Audi R8 LMS EVO II GT3	Audi R8 LMS EVO II GT3	176	20	1	0	0	0
77	14	Renault Clio R.S. V	Renault Clio R.S. V	162	21	0.38999998569488525	-4	0	0
78	14	Mazda MX-5 Cup	MX-5 Cup	67	21	0.41999998688697815	0	0	0
79	14	Toyota GR86	Toyota GR86	160	21	0.3199999928474426	0	35	0
80	15	Honda Civic Type R TCR	Honda Civic Type R TCR	147	24	0.9900000095367432	-1	0	0
81	15	Hyundai Elantra N TCR	Hyundai Elantra N TCR	146	24	1	-1	0	0
82	15	Hyundai Veloster N TCR	Hyundai Veloster N TCR	153	24	1	-1	0	0
83	15	Ligier JS P320	Ligier JS P320	165	22	1	0	0	0
84	15	Mercedes AMG GT4	Mercedes AMG GT4	157	23	0.9800000190734863	-2.75	0	0
85	15	Porsche 718 Cayman GT4	Porsche 718 Cayman GT4	119	23	0.9800000190734863	-2.75	0	0
86	15	Mclaren 570s GT4	Mclaren 570s GT4	135	23	1	-2.25	0	0
87	15	Audi RS 3 LMS TCR	Audi RS 3 LMS TCR	112	24	1	-1	0	0
88	16	BMW M4 GT3	BMW M4 GT3	132	26	1	0	0	0
89	16	Acura NSX GT3 EVO 22	Acura NSX GT3 EVO 22	194	26	0.9900000095367432	-0.75	0	0
90	16	McLaren 720S GT3 EVO	McLaren 720S GT3 EVO	188	26	0.9800000190734863	-0.5	0	0
91	16	Porsche 911 GT3 R (992)	Porsche 911 GT3 R (992)	169	26	1	-1	0	0
92	16	BMW M Hybrid V8	BMW M Hybrid V8	159	27	1	0	0	0
93	16	Ferrari 499P	Ferrari 499P	196	27	0.9900000095367432	-1	0	0
94	16	Audi R8 LMS EVO II GT3	Audi R8 LMS EVO II GT3	176	26	0.9900000095367432	-0.75	0	0
95	16	Acura ARX-06	Acura ARX-06	170	27	0.9700000286102295	-2	0	0
96	16	Dallara P217 LMP2	Dallara P217 LMP2	128	25	1	0	0	0
97	17	Audi R8 LMS EVO II GT3	Audi R8 LMS EVO II GT3	176	28	0.9900000095367432	0	10	0
98	17	Ferrari 296 GT3	Ferrari 296 GT3	173	28	0.9700000286102295	-2	15	0
99	17	Acura NSX GT3 EVO 22	Acura NSX GT3 EVO 22	194	28	0.9700000286102295	-2	23	0
100	17	McLaren 720S GT3 EVO	McLaren 720S GT3 EVO	188	28	0.9800000190734863	-1.75	10	0
101	17	Mercedes-AMG GT3 2020	Mercedes GT3 2020	156	28	0.9800000190734863	-2.25	0	0
102	17	BMW M4 GT3	BMW M4 GT3	132	28	0.9900000095367432	-1.25	7	0
103	17	Ford Mustang GT3	Ford Mustang GT3	185	28	0.9900000095367432	-1	8	0
104	17	Chevrolet Corvette Z06 GT3.R	Corvette GT3.R	184	28	1	-0.5	10	0
105	17	Porsche 911 GT3 R (992)	Porsche 911 GT3 R (992)	169	28	0.9900000095367432	-0.5	10	0
\.


--
-- Data for Name: c_car_class; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.c_car_class (id, event_id, name, car_class_id) FROM stdin;
7	4	GTP	4029
8	4	Dallara P217	2523
9	4	IMSA23	4011
10	5	GT3 Class	2708
13	8	Hosted All Cars	0
14	9	Hosted All Cars	0
15	10	GTP	4029
16	10	Dallara P217	2523
17	10	IMSA23	4011
19	12	GT3 Class	2708
20	13	GT3 Class	2708
21	14	Hosted All Cars	0
22	15	Ligier JS P320	4018
23	15	GT4 Class	2268
24	15	Touring Car	3189
25	16	Dallara P217	2523
26	16	IMSA23	4011
27	16	GTP	4029
28	17	GT3 Class	2708
\.


--
-- Data for Name: c_car_driver; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.c_car_driver (id, c_car_entry_id, driver_id, name, initials, abbrev_name, irating, lic_level, lic_sub_level, lic_string) FROM stdin;
657	263	712233	Robin Ries	RR	Ries, R	3975	15	333	B 3.33
658	264	320686	Roman Paerschke	RP	Paerschke, R	5754	14	238	B 2.38
659	265	148258	Nino Hultsch	NH	Hultsch, N	2415	19	326	A 3.26
660	266	161630	Rene Hoogenhout	RH	Hoogenhout, R	2841	19	323	A 3.23
661	267	647099	Thomas Wurm Jr	TW	Wurm, T Jr	3186	20	458	A 4.58
662	268	16149	Marcus Jirak	MJ	Jirak, M	7734	20	499	A 4.99
663	269	352503	Joel Meili	JM	Meili, J	5461	18	211	A 2.11
664	270	507978	Christian Ruzicka	CR	Ruzicka, C	4773	19	350	A 3.50
665	271	742263	Moritz Hametner	MH	Hametner, M	3132	15	324	B 3.24
666	272	118645	Pawel Rybak	PR	Rybak, P	2602	14	236	B 2.36
667	273	168508	Uwe Länger	UL	Länger, U	2306	18	258	A 2.58
668	274	402080	Carsten Wiedenhöfer	CW	Wiedenhöfer, C	3698	19	319	A 3.19
669	275	235585	Markus Riemer	MR	Riemer, M	5256	14	209	B 2.09
670	276	17529	Dirk Wessendorf	DW	Wessendorf, D	778	13	157	B 1.57
671	277	665679	TH Reinberger	TR	Reinberger, T	2634	18	243	A 2.43
672	278	323813	Tom Euler	TE	Euler, T	4377	13	129	B 1.29
673	279	842084	Max Knoth	MK	Knoth, M	4069	18	238	A 2.38
674	280	332452	Michael Henke2	MH	Henke2, M	3073	14	231	B 2.31
675	281	90004	Jan Fecker	JF	Fecker, J	3500	20	474	A 4.74
676	282	53450	Alireza Naderi	AN	Naderi, A	1534	17	130	A 1.30
677	283	739559	Robert Koppler	RK	Koppler, R	6280	18	274	A 2.74
678	284	561734	Tom Ostermann	TO	Ostermann, T	5576	18	219	A 2.19
679	285	621528	Sebastian Burkhart	SB	Burkhart, S	2102	20	442	A 4.42
680	286	786972	Christopher Wolfgruber	CW	Wolfgruber, C	4620	18	269	A 2.69
681	287	235349	Tobias Kurz	TK	Kurz, T	5223	19	363	A 3.63
682	288	156290	Jan Sentkowski	JS	Sentkowski, J	7535	20	457	A 4.57
683	289	91391	Gregor Franke	GF	Franke, G	2148	20	433	A 4.33
684	290	594662	Dominic Weber	DW	Weber, D	4626	20	414	A 4.14
685	291	118646	Christoph Klawiter	CK	Klawiter, C	3359	18	268	A 2.68
686	292	173270	Marcel Huwyler	MH	Huwyler, M	3112	20	499	A 4.99
687	293	17529	Dirk Wessendorf	DW	Wessendorf, D	778	13	157	B 1.57
688	294	90004	Jan Fecker	JF	Fecker, J	3500	20	474	A 4.74
689	295	621528	Sebastian Burkhart	SB	Burkhart, S	2102	20	442	A 4.42
690	296	594662	Dominic Weber	DW	Weber, D	4626	20	414	A 4.14
691	297	352503	Joel Meili	JM	Meili, J	5461	18	211	A 2.11
692	298	507978	Christian Ruzicka	CR	Ruzicka, C	4773	19	350	A 3.50
693	299	148258	Nino Hultsch	NH	Hultsch, N	2415	19	326	A 3.26
694	300	161630	Rene Hoogenhout	RH	Hoogenhout, R	2841	19	323	A 3.23
695	301	665679	TH Reinberger	TR	Reinberger, T	2634	18	243	A 2.43
696	302	16149	Marcus Jirak	MJ	Jirak, M	7734	20	499	A 4.99
697	303	235349	Tobias Kurz	TK	Kurz, T	5223	19	363	A 3.63
698	304	235585	Markus Riemer	MR	Riemer, M	5256	14	209	B 2.09
699	305	332452	Michael Henke2	MH	Henke2, M	3073	14	231	B 2.31
700	306	561734	Tom Ostermann	TO	Ostermann, T	5576	18	219	A 2.19
701	307	168508	Uwe Länger	UL	Länger, U	2306	18	258	A 2.58
702	308	842084	Max Knoth	MK	Knoth, M	4069	18	238	A 2.38
703	309	173270	Marcel Huwyler	MH	Huwyler, M	3112	20	499	A 4.99
704	310	91391	Gregor Franke	GF	Franke, G	2148	20	433	A 4.33
705	311	712233	Robin Ries	RR	Ries, R	3975	15	333	B 3.33
706	312	156290	Jan Sentkowski	JS	Sentkowski, J	7535	20	457	A 4.57
707	313	323813	Tom Euler	TE	Euler, T	4377	13	129	B 1.29
708	314	786972	Christopher Wolfgruber	CW	Wolfgruber, C	4620	18	269	A 2.69
709	315	742263	Moritz Hametner	MH	Hametner, M	3132	15	324	B 3.24
710	316	320686	Roman Paerschke	RP	Paerschke, R	5754	14	238	B 2.38
711	317	402080	Carsten Wiedenhöfer	CW	Wiedenhöfer, C	3698	19	319	A 3.19
712	318	739559	Robert Koppler	RK	Koppler, R	6280	18	274	A 2.74
713	319	118646	Christoph Klawiter	CK	Klawiter, C	3359	18	268	A 2.68
714	320	53450	Alireza Naderi	AN	Naderi, A	1534	17	130	A 1.30
715	321	647099	Thomas Wurm Jr	TW	Wurm, T Jr	3186	20	458	A 4.58
716	322	118645	Pawel Rybak	PR	Rybak, P	2602	14	236	B 2.36
717	323	219108	Alejandro Sánchez	AS	Sánchez, A	10044	28	480	WC 4.80
718	324	442130	Hugh Barter	HB	Barter, H	10156	20	447	A 4.47
719	325	452194	Manuel Troncoso	MT	Troncoso, M	9671	17	142	A 1.42
720	326	365108	Yoann Rouyer	YR	Rouyer, Y	8858	17	137	A 1.37
721	327	283376	Gonzalo Vergara	GV	Vergara, G	8700	20	459	A 4.59
722	328	313229	Vlad Khimichev	VK	Khimichev, V	9296	17	170	A 1.70
723	329	545280	Stanley Deslandes	SD	Deslandes, S	9090	20	413	A 4.13
724	330	581864	Benjamin Frigerio	BF	Frigerio, B	8191	20	449	A 4.49
725	331	352721	Kamil Grabowski	KG	Grabowski, K	8857	20	402	A 4.02
726	332	202872	Nathan Olson	NO	Olson, N	8686	19	364	A 3.64
727	333	221200	Gianni Vecchio	GV	Vecchio, G	10302	20	467	A 4.67
728	334	246874	Maxime Brient	MB	Brient, M	9696	20	446	A 4.46
729	335	292374	Daniel Ferguson	DF	Ferguson, D	9201	20	415	A 4.15
730	336	293522	Pablo Lazar2	PL	Lazar2, P	8831	20	499	A 4.99
731	337	352055	Diogo C. Pinto	DP	Pinto, D	10231	27	328	WC 3.28
732	338	816960	David Sobreiro	DS	Sobreiro, D	9180	20	495	A 4.95
733	339	525461	Samuel L Ward	SW	Ward, S	9010	19	346	A 3.46
734	340	338231	Tom Reiher	TR	Reiher, T	9215	20	492	A 4.92
735	341	467986	Daniel Alves Lourenco	DL	Lourenco, D	9737	20	499	A 4.99
736	342	924386	Will Murdoch	WM	Murdoch, W	8343	20	484	A 4.84
737	343	391777	Florian A Lebigre	FL	Lebigre, F	9701	22	208	P 2.08
738	344	246250	Jackson Rezende	JR	Rezende, J	7698	17	154	A 1.54
739	345	309591	Alexandre Deletraz	AD	Deletraz, A	6898	19	323	A 3.23
740	346	369995	Alessandro Bico	AB	Bico, A	10197	28	446	WC 4.46
741	347	380309	Martial Hubert	MH	Hubert, M	9231	20	499	A 4.99
742	348	599501	Olivier Piatek	OP	Piatek, O	8163	18	251	A 2.51
743	349	286978	Ian Gagnon-Renaud	IG	Gagnon-Renaud, I	8437	20	422	A 4.22
744	350	293695	Ross Woodford	RW	Woodford, R	7725	19	335	A 3.35
745	351	479231	Robin Glerum	RG	Glerum, R	9663	20	462	A 4.62
746	352	358815	Manel Cubo Torres	MT	Torres, M	7578	18	398	A 3.98
747	353	346040	Christian Steenburgh	CS	Steenburgh, C	7696	18	247	A 2.47
748	354	219696	Josh Thompson	JT	Thompson, J	9826	27	377	WC 3.77
749	355	731799	Alxander A Spetz	AS	Spetz, A	10626	18	270	A 2.70
750	356	114405	Gustavo Ariel	GA	Ariel, G	11011	27	324	WC 3.24
751	357	476429	Jere Lehtinen	JL	Lehtinen, J	9369	18	252	A 2.52
752	358	308713	Pablo Araujo3	PA	Araujo3, P	9242	20	466	A 4.66
753	359	85651	Jesse Jones	JJ	Jones, J	9521	20	499	A 4.99
754	360	202092	Lukas Lindqvist	LL	Lindqvist, L	8692	18	274	A 2.74
755	361	654554	Niklas Beu	NB	Beu, N	9203	20	499	A 4.99
756	362	313327	Felix Quirmbach	FQ	Quirmbach, F	10214	20	499	A 4.99
757	363	810818	Miguel Costa5	MC	Costa5, M	9411	18	218	A 2.18
758	364	463477	Vasilios Beletsiotis	VB	Beletsiotis, V	10259	19	350	A 3.50
759	365	373516	Rainer Talvar	RT	Talvar, R	9838	20	477	A 4.77
760	366	622235	Lucas Pérez	LP	Pérez, L	9320	14	214	B 2.14
761	367	512281	Andrea Bristot	AB	Bristot, A	9673	13	173	B 1.73
762	368	850045	Mattia Colnaghi	MC	Colnaghi, M	8060	18	212	A 2.12
763	369	169151	Josh Lad	JL	Lad, J	9652	20	430	A 4.30
764	370	598355	Aaron Vazquezz	AV	Vazquezz, A	12006	22	204	P 2.04
765	371	773877	Kevin Desnoyers	KD	Desnoyers, K	7897	18	243	A 2.43
776	325	400723	Jaidyn J Ladic	JL	Ladic, J	10100	17	172	A 1.72
778	335	414557	Nathan A Moore	NM	Moore, N	9063	20	499	A 4.99
780	361	559940	Owen Caryl	OC	Caryl, O	10593	20	416	A 4.16
784	363	378737	David Bozga	DB	Bozga, D	9662	19	347	A 3.47
785	364	410511	Parker White	PW	White, P	10739	20	499	A 4.99
787	359	255919	Alexander Thiebe	AT	Thiebe, A	9399	20	401	A 4.01
788	352	545183	Lucas Camba Moreiro	LM	Moreiro, L	9903	15	313	B 3.13
789	327	542120	Alejandro Avín Ruisánchez	AR	Ruisánchez, A	9236	20	434	A 4.34
790	366	341986	Gabi Montoro	GM	Montoro, G	9648	20	499	A 4.99
791	326	240012	Gunonso Tasdelen	GT	Tasdelen, G	9962	17	153	A 1.53
792	340	524963	Leif Sebastian	LS	Sebastian, L	8281	19	393	A 3.93
793	358	684704	Anjan Amuthan	AA	Amuthan, A	9201	18	229	A 2.29
794	323	269106	Yohann Harth	YH	Harth, Y	10616	26	244	WC 2.44
797	324	393663	Gaël Valero	GV	Valero, G	9893	20	446	A 4.46
798	371	312905	Jorge D.Garcia	JD	D.Garcia, J	8071	20	499	A 4.99
799	342	695257	Thomas Labouteley	TL	Labouteley, T	9212	20	463	A 4.63
800	354	418116	Luke A Bennett	LB	Bennett, L	10070	20	474	A 4.74
810	340	625522	Gui Lévesque	GL	Lévesque, G	9231	20	477	A 4.77
811	342	62887	Dion Fiallo	DF	Fiallo, D	7938	20	499	A 4.99
978	465	419877	Jonas Wanner	JW	Wanner, J	9135	20	430	A 4.30
979	444	674903	Ethan Critch	EC	Critch, E	6676	20	417	A 4.17
980	466	678754	Ayden Young	AY	Young, A	7123	20	499	A 4.99
981	457	529650	Luciano Witvoet	LW	Witvoet, L	9444	17	154	A 1.54
982	432	181497	Spencer McCarthy	SM	McCarthy, S	6411	19	314	A 3.14
983	460	950433	Peter J Brett	PB	Brett, P	5616	18	255	A 2.55
984	467	477554	Felix Brandstetter	FB	Brandstetter, F	5328	18	250	A 2.50
985	461	794190	Pedro Oliveira Vigário	PV	Vigário, P	6299	17	145	A 1.45
986	420	600369	Sebastian Hove	SH	Hove, S	7266	20	463	A 4.63
987	454	760659	Jonathan De Clippel	JC	Clippel, J	5242	18	210	A 2.10
988	441	622235	Lucas Pérez	LP	Pérez, L	9339	15	383	B 3.83
989	421	273391	Antonis Despotakis	AD	Despotakis, A	6920	19	364	A 3.64
990	450	414547	Thomas Imbourg	TI	Imbourg, T	6527	18	252	A 2.52
991	459	847922	Mal Dedinca	MD	Dedinca, M	7003	20	482	A 4.82
992	433	410511	Parker White	PW	White, P	10767	20	499	A 4.99
993	434	270254	Lasse Bak	LB	Bak, L	9628	22	279	P 2.79
994	462	148179	Niclas Laubisch	NL	Laubisch, N	9111	14	293	B 2.93
995	444	292374	Daniel Ferguson	DF	Ferguson, D	9219	20	411	A 4.11
996	452	455915	André da Silva	AS	Silva, A	6461	20	474	A 4.74
997	438	773877	Kevin Desnoyers	KD	Desnoyers, K	8055	19	331	A 3.31
998	426	602559	Yurica Kasdorp	YK	Kasdorp, Y	8140	19	342	A 3.42
999	458	190594	Tino Heuser	TH	Heuser, T	6643	19	375	A 3.75
1000	442	378190	Dalton Zavadil	DZ	Zavadil, D	8385	20	499	A 4.99
1001	456	63184	Florian Denard	FD	Denard, F	7778	20	493	A 4.93
1002	430	391712	James Ibram	JI	Ibram, J	5328	18	218	A 2.18
1003	435	353765	Alfonso Urrutia Mulas	AM	Mulas, A	8222	20	499	A 4.99
1004	431	525582	Pedro Moreno	PM	Moreno, P	5587	19	385	A 3.85
1005	428	95882	Bruce De Carvalho	BC	Carvalho, B	6605	20	490	A 4.90
1006	427	1065748	Elliot Norén	EN	Norén, E	7058	19	345	A 3.45
1007	449	367997	John Ehlen	JE	Ehlen, J	7461	19	315	A 3.15
1008	464	897716	Emanuele Olivieri	EO	Olivieri, E	9008	19	352	A 3.52
766	336	55879	Marcus Hamilton	MH	Hamilton, M	8639	20	499	A 4.99
795	339	402045	Lewis Woods	LW	Woods, L	9077	20	486	A 4.86
796	343	272719	Ole Steinbraten	OS	Steinbraten, O	10213	20	460	A 4.60
801	337	260835	Chris Lulham	CL	Lulham, C	10360	28	452	WC 4.52
802	356	67157	Enzo Bonito	EB	Bonito, E	9206	19	356	A 3.56
803	341	138679	Phil Denes	PD	Denes, P	10079	20	499	A 4.99
812	332	206066	Daniel Morad	DM	Morad, D	7186	20	443	A 4.43
919	420	389756	Magnus Nielsen	MN	Nielsen, M	7181	17	135	A 1.35
920	421	389979	Haris Mitropoulos	HM	Mitropoulos, H	7231	20	464	A 4.64
921	422	672319	Sven-Ole Haase	SH	Haase, S	10232	20	499	A 4.99
922	423	499652	Kody Deith	KD	Deith, K	10877	17	135	A 1.35
923	424	101152	Agustin Canapino	AC	Canapino, A	9536	20	499	A 4.99
924	424	282014	Daniel Lafuente	DL	Lafuente, D	10014	19	378	A 3.78
925	425	665039	Rene Lenz	RL	Lenz, R	9783	18	277	A 2.77
926	426	836349	Thomas Ronhaar	TR	Ronhaar, T	10697	20	462	A 4.62
927	427	724180	Kasper Rishøj-Andersen	KR	Rishøj-Andersen, K	8092	18	253	A 2.53
928	428	685974	Philip W Ansell	PA	Ansell, P	6804	19	351	A 3.51
929	429	83741	Andre Castro	AC	Castro, A	6785	18	278	A 2.78
930	430	47493	Alberto Gravili	AG	Gravili, A	6371	19	310	A 3.10
931	431	534506	Facundo Rago	FR	Rago, F	6619	15	316	B 3.16
932	432	116063	Steven Walker2	SW	Walker2, S	5671	20	478	A 4.78
933	433	361210	Daniel Pásztor	DP	Pásztor, D	9791	22	218	P 2.18
934	434	426571	Rasmus Christensen	RC	Christensen, R	9503	20	447	A 4.47
935	435	318053	Carlos  Fenollosa	CF	Fenollosa, C	9507	21	151	P 1.51
936	436	472038	Alexander Davidson	AD	Davidson, A	8456	20	431	A 4.31
937	437	919730	Beck Jacir	BJ	Jacir, B	6635	18	231	A 2.31
938	438	104438	Govand Keanie	GK	Keanie, G	7327	17	155	A 1.55
939	439	42915	Zachary Rivard	ZR	Rivard, Z	7390	18	218	A 2.18
940	440	348754	Kostas Bouzianis	KB	Bouzianis, K	5554	20	499	A 4.99
941	441	542120	Alejandro Avín Ruisánchez			9234	20	457	A 4.57
942	441	545183	Lucas Camba Moreiro	LM	Moreiro, L	9864	17	169	A 1.69
943	442	352617	Daniel Antúnez	DA	Antúnez, D	9628	20	411	A 4.11
944	443	734577	Mark Calver	MC	Calver, M	8408	20	499	A 4.99
945	444	844693	Kimi Tani	KT	Tani, K	6789	20	415	A 4.15
946	445	397925	Rafal Szoltysek			7771	17	164	A 1.64
947	446	868789	David Noesch	DN	Noesch, D	6092	19	327	A 3.27
767	345	335473	Christophe Herbigneaux	CH	Herbigneaux, C	7785	19	304	A 3.04
768	338	473796	Matias Orjuela2	MO	Orjuela2, M	9004	19	336	A 3.36
770	349	580302	Isaac Phelps	IP	Phelps, I	7220	19	322	A 3.22
771	348	121085	Patrick Hingston	PH	Hingston, P	8078	19	310	A 3.10
772	353	288975	Thibaud Prevot	TP	Prevot, T	9397	20	433	A 4.33
773	351	255978	Sami-Matti Trogen	ST	Trogen, S	9156	19	341	A 3.41
774	370	423482	Daniel Sivi-Szabo	DS	Sivi-Szabo, D	7866	20	407	A 4.07
775	329	358202	Gordon Mutch	GM	Mutch, G	8351	18	263	A 2.63
777	369	384222	Matt J. Farrow	MF	Farrow, M	9700	20	460	A 4.60
779	355	408090	Atte Kauppinen	AK	Kauppinen, A	10241	18	235	A 2.35
781	347	540631	Jordan Johnson5	JJ	Johnson5, J	7942	20	452	A 4.52
782	362	62842	Kay Kaschube	KK	Kaschube, K	9223	20	499	A 4.99
783	368	897716	Emanuele Olivieri	EO	Olivieri, E	8665	18	222	A 2.22
786	365	383318	Ryan  Barneveld	RB	Barneveld, R	9690	20	499	A 4.99
804	329	494559	Dan Amor	DA	Amor, D	8063	19	324	A 3.24
805	333	349143	Sam Kuitert	SK	Kuitert, S	9884	27	325	WC 3.25
806	369	496280	Jaden Munoz	JM	Munoz, J	10139	19	308	A 3.08
807	332	652772	Alec Bergstrom	AB	Bergstrom, A	6660	19	353	A 3.53
285	110	430146	Lucas U. Müller	LM	Müller, L	9041	20	478	A 4.78
286	111	202872	Nathan Olson	NO	Olson, N	8177	19	326	A 3.26
287	112	463477	Vasilios Beletsiotis	VB	Beletsiotis, V	10250	19	388	A 3.88
288	113	161668	Cooper Webster	CW	Webster, C	9783	27	348	WC 3.48
289	114	419877	Jonas Wanner	JW	Wanner, J	9091	20	436	A 4.36
290	115	354245	Lassi Juurinen	LJ	Juurinen, L	8599	20	499	A 4.99
291	116	288975	Thibaud Prevot	TP	Prevot, T	9320	20	499	A 4.99
292	117	334578	Dominik Hofmann	DH	Hofmann, D	10707	20	499	A 4.99
293	118	178613	Patrick Wolf	PW	Wolf, P	7244	19	345	A 3.45
294	119	695257	Thomas Labouteley	TL	Labouteley, T	8504	19	355	A 3.55
295	120	267062	Justin Adakonis	JA	Adakonis, J	6527	14	269	B 2.69
296	121	479231	Robin Glerum	RG	Glerum, R	9182	19	310	A 3.10
297	122	410511	Parker White	PW	White, P	10404	24	499	P 4.99
298	123	246250	Jackson Rezende	JR	Rezende, J	8214	18	246	A 2.46
299	124	165169	Sota Muto	SM	Muto, S	10450	20	499	A 4.99
300	125	272719	Ole Steinbraten	OS	Steinbraten, O	10058	20	480	A 4.80
301	126	432604	Arturo Melgar	AM	Melgar, A	8111	19	313	A 3.13
302	127	452194	Manuel Troncoso	MT	Troncoso, M	9916	18	218	A 2.18
303	128	239975	Salva Talens	ST	Talens, S	9101	24	409	P 4.09
304	129	262023	Alexander Wolters	AW	Wolters, A	8832	18	227	A 2.27
305	130	219108	Alejandro Sánchez	AS	Sánchez, A	9568	27	393	WC 3.93
306	131	334483	Oskari Rinne	OR	Rinne, O	9381	22	318	P 3.18
307	132	358518	Jesse Telkkälä	JT	Telkkälä, J	8374	20	429	A 4.29
308	133	416060	Luca Wunsch	LW	Wunsch, L	10029	20	466	A 4.66
309	134	408090	Atte Kauppinen	AK	Kauppinen, A	10307	20	408	A 4.08
310	135	273159	Markus Dec	MD	Dec, M	8386	19	335	A 3.35
311	136	255978	Sami-Matti Trogen	ST	Trogen, S	9129	19	332	A 3.32
312	137	308713	Pablo Araujo3	PA	Araujo3, P	9257	19	376	A 3.76
313	138	622235	Lucas Pérez	LP	Pérez, L	9012	20	403	A 4.03
314	139	313251	Sven Haase	SH	Haase, S	11536	20	493	A 4.93
315	140	196317	Tristan Iglesias	TI	Iglesias, T	9617	20	499	A 4.99
316	141	387923	Simon Kaulartz	SK	Kaulartz, S	8233	20	422	A 4.22
317	142	220097	Elvis Rankin	ER	Rankin, E	9599	19	344	A 3.44
318	143	584391	Damon Woods	DW	Woods, D	10780	20	499	A 4.99
319	144	391777	Florian A Lebigre	FL	Lebigre, F	9467	20	499	A 4.99
320	145	270254	Lasse Bak	LB	Bak, L	9547	22	388	P 3.88
321	146	746572	Wesley Kaspers	WK	Kaspers, W	7731	20	457	A 4.57
322	147	343397	Xander Reed	XR	Reed, X	8226	20	420	A 4.20
323	148	476429	Jere Lehtinen	JL	Lehtinen, J	9048	19	317	A 3.17
324	149	315952	George Karakoulas	GK	Karakoulas, G	7262	20	499	A 4.99
325	150	94445	Tomi Katila	TK	Katila, T	8716	20	424	A 4.24
326	151	339128	Kyle Bos	KB	Bos, K	7324	19	343	A 3.43
327	152	252689	Ricardo  Rico	RR	Rico, R	9434	20	436	A 4.36
328	153	499652	Kody Deith	KD	Deith, K	11084	19	368	A 3.68
329	154	496280	Jaden Munoz	JM	Munoz, J	10117	18	270	A 2.70
330	155	559940	Owen Caryl	OC	Caryl, O	10295	19	333	A 3.33
331	156	299233	Jordan Caruso	JC	Caruso, J	8396	26	249	WC 2.49
332	157	486209	Luca Kita	LK	Kita, L	10492	28	473	WC 4.73
333	158	260835	Chris Lulham	CL	Lulham, C	10085	28	414	WC 4.14
334	159	23801	Sean D Campbell	SC	Campbell, S	8696	20	499	A 4.99
335	112	282014	Daniel Lafuente	DL	Lafuente, D	10007	18	243	A 2.43
336	121	513181	Beckham Jacir	BJ	Jacir, B	11062	20	410	A 4.10
337	132	548950	Rico Wenzel	RW	Wenzel, R	8888	20	455	A 4.55
338	137	367670	Kalen Chin	KC	Chin, K	8790	20	499	A 4.99
339	141	55879	Marcus Hamilton	MH	Hamilton, M	8625	19	367	A 3.67
340	140	341986	Gabi Montoro	GM	Montoro, G	9634	20	499	A 4.99
341	152	598355	Aaron Vazquezz	AV	Vazquezz, A	11687	20	441	A 4.41
342	145	480939	Mathias Stokbæk Jensen	MJ	Jensen, M	9312	22	233	P 2.33
343	146	352512	Andrea Barilaro	AB	Barilaro, A	7537	20	490	A 4.90
344	122	589546	Leo Roussel	LR	Roussel, L	8282	19	358	A 3.58
345	110	362093	Benedikt Hitz	BH	Hitz, B	7074	20	430	A 4.30
346	136	101152	Agustin Canapino	AC	Canapino, A	9369	20	481	A 4.81
347	116	352721	Kamil Grabowski	KG	Grabowski, K	8718	20	481	A 4.81
348	115	557819	Jesse Hiiliaho	JH	Hiiliaho, J	7296	20	499	A 4.99
349	120	373722	Ethan Lampe	EL	Lampe, E	7336	18	240	A 2.40
350	134	165200	Moreno Sirica	MS	Sirica, M	9729	22	262	P 2.62
351	133	707641	Jonas Rütten	JR	Rütten, J	9445	20	483	A 4.83
352	154	384222	Matt J. Farrow	MF	Farrow, M	9806	20	461	A 4.61
353	149	79312	Chris T Shorter	CS	Shorter, C	7292	20	499	A 4.99
354	159	119236	Balazs Remenyik	BR	Remenyik, B	7687	19	395	A 3.95
355	155	654554	Niklas Beu	NB	Beu, N	9002	20	461	A 4.61
356	118	523395	Sven Knöller	SK	Knöller, S	8156	20	443	A 4.43
357	111	206066	Daniel Morad	DM	Morad, D	7177	20	437	A 4.37
358	139	153033	Simone Maria Marcenò	SM	Marcenò, S	9509	24	466	P 4.66
359	138	545183	Lucas Camba Moreiro	LM	Moreiro, L	8459	14	226	B 2.26
360	130	474984	Alex Dunne	AD	Dunne, A	10182	18	201	A 2.01
361	153	378737	David Bozga	DB	Bozga, D	9816	20	461	A 4.61
362	150	290948	Antti Ahola	AA	Ahola, A	8761	20	472	A 4.72
363	127	155293	David Toth	DT	Toth, D	9207	18	250	A 2.50
364	148	290952	Peter Zuba	PZ	Zuba, P	9126	19	306	A 3.06
365	117	313229	Vlad Khimichev	VK	Khimichev, V	9712	20	467	A 4.67
366	114	148179	Niclas Laubisch	NL	Laubisch, N	9208	18	259	A 2.59
367	125	114405	Gustavo Ariel	GA	Ariel, G	11079	28	451	WC 4.51
368	144	221200	Gianni Vecchio	GV	Vecchio, G	10256	20	499	A 4.99
369	124	369995	Alessandro Bico	AB	Bico, A	9919	27	333	WC 3.33
370	113	349143	Sam Kuitert	SK	Kuitert, S	9775	27	320	WC 3.20
371	119	303828	Nathan S Lewis	NL	Lewis, N	9356	20	499	A 4.99
372	156	525659	Michael Romanidis	MR	Romanidis, M	9964	20	499	A 4.99
373	147	444482	Michael Janney	MJ	Janney, M	9422	22	240	P 2.40
374	146	454341	Loïc Marchand	LM	Marchand, L	6234	19	362	A 3.62
375	158	352055	Diogo C. Pinto	DP	Pinto, D	9974	28	471	WC 4.71
376	153	701104	Jarno Koch2	JK	Koch2, J	9774	20	431	A 4.31
377	132	365108	Yoann Rouyer	YR	Rouyer, Y	8813	19	357	A 3.57
378	142	258728	Michele Costantini	MC	Costantini, M	9207	20	491	A 4.91
379	160	842312	Daan Vos2	DV	Vos2, D	3833	18	254	A 2.54
380	161	529361	Higo Oliveira	HO	Oliveira, H	3630	18	237	A 2.37
381	162	929450	Arnaud Blaise	AB	Blaise, A	3221	17	128	A 1.28
382	163	531864	Sebastián Maldonado Vega	SV	Vega, S	3722	20	499	A 4.99
383	164	16203	Martin Kolibal	MK	Kolibal, M	2293	18	256	A 2.56
384	165	354278	Kevin Fitamant	KF	Fitamant, K	3356	18	256	A 2.56
385	166	361527	Romain Utiel	RU	Utiel, R	3710	19	322	A 3.22
386	167	677266	Pedro H Moura	PM	Moura, P	3564	18	209	A 2.09
387	168	630519	Mateusz Bajbak	MB	Bajbak, M	4025	18	248	A 2.48
388	169	348266	Omer Akan	OA	Akan, O	6755	20	473	A 4.73
389	170	87714	Branden Fick	BF	Fick, B	4018	19	318	A 3.18
390	171	312870	David Wassermann	DW	Wassermann, D	4522	20	499	A 4.99
391	172	144853	Donni Alfer-Henriksen	DA	Alfer-Henriksen, D	3915	18	261	A 2.61
392	173	734184	Fabián Messenger	FM	Messenger, F	5116	20	412	A 4.12
393	173	839297	Santiago Serena	SS	Serena, S	2417	18	254	A 2.54
394	174	674405	Bailey Piotrowski	BP	Piotrowski, B	3458	20	499	A 4.99
395	175	644927	Sacha Davoli	SD	Davoli, S	3043	20	499	A 4.99
396	176	528939	Pascal Weyel	PW	Weyel, P	4559	20	499	A 4.99
397	177	273940	Viktor Basista	VB	Basista, V	2786	20	499	A 4.99
398	178	400140	Tom Jeremias	TJ	Jeremias, T	3295	20	499	A 4.99
399	179	777939	Joey Lotrecchiano	JL	Lotrecchiano, J	4360	14	221	B 2.21
400	180	994013	Kasper Rishøj-Andersen2	KR	Rishøj-Andersen2, K	3115	14	270	B 2.70
401	181	559369	Andrew Kenny	AK	Kenny, A	3836	20	408	A 4.08
402	182	446896	Jiri Krcek	JK	Krcek, J	3166	20	499	A 4.99
403	183	782223	Eetu Miinalainen	EM	Miinalainen, E	5039	15	353	B 3.53
404	184	116063	Steven Walker2	SW	Walker2, S	5437	18	269	A 2.69
405	185	536693	Zdenek Kaska	ZK	Kaska, Z	3670	18	250	A 2.50
406	186	512454	Heiko Hartlieb2	HH	Hartlieb2, H	3610	20	406	A 4.06
407	187	583854	Jorge Alberolaa	JA	Alberolaa, J	3639	20	493	A 4.93
408	188	808068	Jonas Wiese2	JW	Wiese2, J	3748	18	290	A 2.90
409	189	47981	Igor Shirokov	IS	Shirokov, I	3917	18	253	A 2.53
410	190	326745	Mitchel Maarschalkerweerd	MM	Maarschalkerweerd, M	3354	20	499	A 4.99
411	191	186367	Adam Donovan	AD	Donovan, A	3918	20	499	A 4.99
412	192	21423	Jai Potts	JP	Potts, J	3278	20	499	A 4.99
413	193	871105	Tristan Kissner	TK	Kissner, T	5821	17	101	A 1.01
414	194	309500	Cristian Pereira	CP	Pereira, C	3055	18	230	A 2.30
415	195	873480	Bruno Alves Ribeiro	BR	Ribeiro, B	4160	13	185	B 1.85
416	196	604599	Daan Pepels	DP	Pepels, D	3309	20	471	A 4.71
417	197	863382	Yannick Essamair	YE	Essamair, Y	3356	19	364	A 3.64
418	198	553369	Nicolas Cucatto	NC	Cucatto, N	3657	20	465	A 4.65
419	199	180064	Nic Veltenaar	NV	Veltenaar, N	4974	20	499	A 4.99
420	200	467934	Jacob Money	JM	Money, J	3533	20	499	A 4.99
421	201	371116	Ryan Moles	RM	Moles, R	3533	19	312	A 3.12
422	202	245077	Zach Plummer	ZP	Plummer, Z	4686	20	409	A 4.09
423	203	600488	Massimiliano Cappellini	MC	Cappellini, M	4272	19	336	A 3.36
424	204	157538	Josh Camm	JC	Camm, J	4638	20	499	A 4.99
425	205	381118	Finn Nørgaard-Pedersen	FN	Nørgaard-Pedersen, F	4634	20	433	A 4.33
426	206	978323	Nicolai Pedersen6	NP	Pedersen6, N	4578	15	307	B 3.07
427	207	813687	Thibaut Wargny2	TW	Wargny2, T	4312	14	273	B 2.73
428	208	868398	Dominik Hameder	DH	Hameder, D	4581	20	465	A 4.65
429	197	303471	Allan ROUSSEL2	AR	ROUSSEL2, A	3930	19	314	A 3.14
430	190	569294	Andrew Madel	AM	Madel, A	3566	18	242	A 2.42
431	195	520043	Juan Pablo Navarro	JN	Navarro, J	3503	17	147	A 1.47
432	169	1083326	Ulas Özyildirim	UÖ	Özyildirim, U	2204	11	351	C 3.51
433	184	287015	Russell J Cowell	RC	Cowell, R	3529	20	499	A 4.99
434	179	929520	Lucas Derksen2	LD	Derksen2, L	2769	18	282	A 2.82
435	166	376502	Guilian Mourre	GM	Mourre, G	4072	20	424	A 4.24
436	187	368332	Ignacio Rodríguez	IR	Rodríguez, I	3679	20	484	A 4.84
437	182	319752	Josh R Flynn	JF	Flynn, J	3719	20	491	A 4.91
438	165	202980	François Perdriau	FP	Perdriau, F	2759	19	346	A 3.46
439	202	369941	Cristian Neculaita	CN	Neculaita, C	3031	18	220	A 2.20
440	160	879882	Isaiah Batchelor	IB	Batchelor, I	3168	13	196	B 1.96
441	206	776043	Daniel Boje Hansen	DH	Hansen, D	3453	19	356	A 3.56
442	199	447135	Terje Sæterhaug	TS	Sæterhaug, T	3733	19	336	A 3.36
443	170	409393	Maximilian Bailey	MB	Bailey, M	3640	10	256	C 2.56
444	204	84341	Christopher Kasch	CK	Kasch, C	3781	20	499	A 4.99
445	163	437361	Vicente Sepulveda	VS	Sepulveda, V	3295	19	338	A 3.38
446	175	581007	Miguel Mejias	MM	Mejias, M	3314	17	152	A 1.52
447	174	803397	Leonardo Dragotta	LD	Dragotta, L	3342	15	310	B 3.10
448	177	316148	Matej Surhanak	MS	Surhanak, M	3685	20	497	A 4.97
449	164	90004	Jan Fecker	JF	Fecker, J	3480	20	482	A 4.82
450	203	561110	Adolfo Roig	AR	Roig, A	4029	13	148	B 1.48
451	194	23673	Miguel Bento	MB	Bento, M	3798	18	252	A 2.52
452	186	257610	Marcel Ortstadt	MO	Ortstadt, M	3431	20	499	A 4.99
453	193	829652	Daniel Ronsdorf	DR	Ronsdorf, D	4067	11	361	C 3.61
454	185	411760	Martin Krejca	MK	Krejca, M	4028	19	303	A 3.03
455	207	408380	Hugo Xhrouet	HX	Xhrouet, H	4646	18	227	A 2.27
456	188	635517	Lukas Weiss	LW	Weiss, L	4429	17	192	A 1.92
457	178	170870	Jonas Sandstede	JS	Sandstede, J	2808	14	205	B 2.05
458	198	867375	Ayrton Araya	AA	Araya, A	3343	18	243	A 2.43
459	176	955555	Nicolas Dörr	ND	Dörr, N	2519	19	352	A 3.52
460	162	969292	Bruno Taby	BT	Taby, B	3085	18	245	A 2.45
461	171	709017	Oliver Szarka	OS	Szarka, O	3702	20	499	A 4.99
462	208	917057	Paris L Boukouvalas	PB	Boukouvalas, P	4019	19	309	A 3.09
466	205	476916	Laurens Kostwinder	LK	Kostwinder, L	3110	18	214	A 2.14
467	180	722237	Rasmus Juul-Thomsen	RJ	Juul-Thomsen, R	4212	18	237	A 2.37
468	197	865572	Mathieu Schroder	MS	Schroder, M	3629	19	372	A 3.72
472	184	88807	Matt Elmore	ME	Elmore, M	4137	20	423	A 4.23
473	192	31539	Terry Taylor	TT	Taylor, T	3467	19	378	A 3.78
463	167	137985	Carlos Barreto	CB	Barreto, C	3495	18	252	A 2.52
464	168	1061209	Jakub Kozlowski3	JK	Kozlowski3, J	3487	15	321	B 3.21
465	201	617801	Joe Newman	JN	Newman, J	3343	17	188	A 1.88
469	196	370322	Myles Owens	MO	Owens, M	3766	14	238	B 2.38
470	183	344767	Kim Furu	KF	Furu, K	3401	20	499	A 4.99
471	189	47635	Sergey Soldatov	SS	Soldatov, S	3060	20	405	A 4.05
474	191	806378	David E Rankin	DR	Rankin, D	4975	15	335	B 3.35
475	175	366065	David Rodriguez Castro	DC	Castro, D	5809	20	429	A 4.29
476	161	332325	Marcos Adami	MA	Adami, M	3784	14	250	B 2.50
477	166	335241	Kevin Chartier	KC	Chartier, K	3582	20	419	A 4.19
478	207	847103	Gaby Loncke	GL	Loncke, G	2674	19	347	A 3.47
479	179	772070	Aidan Pohl	AP	Pohl, A	4209	13	170	B 1.70
480	172	537038	Simon Mertins	SM	Mertins, S	3466	19	342	A 3.42
481	173	893140	Gian Franco Garretta	GG	Garretta, G	5605	14	224	B 2.24
482	187	615605	Iván Figueroa	IF	Figueroa, I	3310	20	499	A 4.99
483	165	772239	Franck Pedrazzini	FP	Pedrazzini, F	4041	20	499	A 4.99
484	202	73652	Ciprian Broscaru	CB	Broscaru, C	2510	18	254	A 2.54
485	160	888170	Oliver Stone	OS	Stone, O	4075	18	221	A 2.21
486	186	355148	Josef Koenig	JK	Koenig, J	3603	18	234	A 2.34
487	206	735400	Kasper Kern	KK	Kern, K	3102	15	309	B 3.09
488	170	379794	Kev Brooks	KB	Brooks, K	4878	20	479	A 4.79
489	163	485731	Pato Campos Del Rio	PR	Rio, P	4782	20	436	A 4.36
490	164	226149	Marcus Schaum	MS	Schaum, M	3452	20	499	A 4.99
491	203	589164	Massimo Garbellini	MG	Garbellini, M	2784	20	438	A 4.38
492	188	320354	Emil Madsen	EM	Madsen, E	2926	18	277	A 2.77
493	185	565124	Vojtech Koci	VK	Koci, V	3978	20	499	A 4.99
494	199	413539	Kevin Roelandt	KR	Roelandt, K	4021	20	448	A 4.48
495	167	649152	Leandro C Pinheiro	LP	Pinheiro, L	2789	18	276	A 2.76
496	201	688261	Sam A Sherwood	SS	Sherwood, S	4006	20	427	A 4.27
497	162	487231	Baptiste Cherrier Beringer	BB	Beringer, B	3599	17	188	A 1.88
498	208	900575	Sam Rose	SR	Rose, S	2813	19	317	A 3.17
499	182	334848	Robert Papajewski	RP	Papajewski, R	3367	18	207	A 2.07
500	204	245372	Nick Sigley	NS	Sigley, N	3273	20	437	A 4.37
501	180	976136	Andreas Pedersen4	AP	Pedersen4, A	3725	19	339	A 3.39
502	174	486203	Coop Hartley	CH	Hartley, C	4030	18	266	A 2.66
503	183	27554	Henri Salmela	HS	Salmela, H	3115	20	499	A 4.99
504	197	320585	Gilles Pierard	GP	Pierard, G	3516	19	391	A 3.91
505	202	280504	Dan Dracea	DD	Dracea, D	5231	17	179	A 1.79
506	192	155901	Nathaniel Schram	NS	Schram, N	3767	20	468	A 4.68
507	171	442035	Alexander Feuchter	AF	Feuchter, A	2662	17	142	A 1.42
508	204	852120	Mario Codarin	MC	Codarin, M	2966	18	221	A 2.21
509	172	326997	Philip Villadsen	PV	Villadsen, P	3509	20	499	A 4.99
510	165	385353	Chaussonnet Vincent	CV	Vincent, C	5454	20	499	A 4.99
511	206	772281	Rasmus B. Pedersen	RP	Pedersen, R	3347	18	220	A 2.20
512	170	778469	Tom Slaiter	TS	Slaiter, T	2309	18	200	A 2.00
513	164	16149	Marcus Jirak	MJ	Jirak, M	7706	20	499	A 4.99
514	199	657901	Callum J Dunn	CD	Dunn, C	2864	20	459	A 4.59
515	194	530507	Luan Hott	LH	Hott, L	2863	10	229	C 2.29
516	185	375384	Tomas Mocek	TM	Mocek, T	3046	20	499	A 4.99
517	163	627817	Benjamin Tobar	BT	Tobar, B	3011	19	312	A 3.12
518	167	533336	Caio Sofiato2	CS	Sofiato2, C	4349	11	333	C 3.33
519	173	893304	Wenceslao Pascual	WP	Pascual, W	2851	19	344	A 3.44
520	162	396131	Mathieu Domingos	MD	Domingos, M	4406	17	167	A 1.67
521	180	1065748	Elliot Norén	EN	Norén, E	3671	15	341	B 3.41
522	196	686915	Nick Kerstens	NK	Kerstens, N	3225	19	301	A 3.01
523	182	379283	Dave Schwartz	DS	Schwartz, D	4460	19	333	A 3.33
524	169	365220	Serhat Budak	SB	Budak, S	3578	20	434	A 4.34
525	167	656293	Fellipe Spetriniv	FS	Spetriniv, F	3348	14	247	B 2.47
526	178	323969	Stefan Wernstedt	SW	Wernstedt, S	4956	19	372	A 3.72
527	193	373989	Benedikt Niehues	BN	Niehues, B	1631	14	258	B 2.58
528	189	493960	Semeon Mihailov	SM	Mihailov, S	4392	20	499	A 4.99
529	176	506429	Sebastian Schewe	SS	Schewe, S	3454	18	237	A 2.37
530	191	616940	Connor DM Craven	CC	Craven, C	2524	15	339	B 3.39
531	161	336524	Vinicius Machado	VM	Machado, V	2877	20	430	A 4.30
532	176	415002	Kai Scheunemann	KS	Scheunemann, K	4155	20	499	A 4.99
533	194	529836	Joao Brito6	JB	Brito6, J	4632	10	243	C 2.43
534	199	500164	Ayden Refaie	AR	Refaie, A	3201	20	499	A 4.99
535	178	308291	Tobi Manthey	TM	Manthey, T	3517	20	499	A 4.99
536	193	857815	Lemi Mischke	LM	Mischke, L	4599	19	320	A 3.20
537	188	966335	Marcus Fisker Nielsen	MN	Nielsen, M	3228	18	270	A 2.70
538	189	270383	Aleksey Seleznev	AS	Seleznev, A	3720	19	330	A 3.30
539	162	844975	Alexis Declercq	AD	Declercq, A	4083	18	212	A 2.12
540	175	289892	Santiago Sanchez Stein	SS	Stein, S	3015	18	221	A 2.21
541	191	648097	Kyle Felvus	KF	Felvus, K	3390	13	140	B 1.40
542	161	690115	Washington Pereira Carvalho	WC	Carvalho, W	4682	17	122	A 1.22
543	166	798542	Nizar Elhaddad	NE	Elhaddad, N	3416	17	165	A 1.65
544	167	570991	Guilherme Elizeu	GE	Elizeu, G	4406	20	455	A 4.55
545	182	446127	Harley Smith	HS	Smith, H	3381	19	319	A 3.19
546	189	587108	Nikolay Filippov	NF	Filippov, N	3275	18	218	A 2.18
547	183	619303	Juho Huttunen2	JH	Huttunen2, J	3147	20	496	A 4.96
769	331	808670	Santeri Martikainen	SM	Martikainen, S	8711	20	446	A 4.46
808	328	334578	Dominik Hofmann	DH	Hofmann, D	10691	20	460	A 4.60
809	368	734577	Mark Calver	MC	Calver, M	8229	20	499	A 4.99
948	447	228628	Brandon Blakesley	BB	Blakesley, B	5495	20	499	A 4.99
949	447	490227	Eduardo Peccorini	EP	Peccorini, E	5887	20	410	A 4.10
950	448	584450	Gabriel Streitmatter	GS	Streitmatter, G	8022	20	410	A 4.10
951	449	734422	Yannick Mund	YM	Mund, Y	7358	20	499	A 4.99
952	450	431992	Augustin Bernier	AB	Bernier, A	9692	20	479	A 4.79
953	451	53455	Norbert Leitner	NL	Leitner, N	7093	19	316	A 3.16
954	452	715432	Ricardo Bettencourt Silva	RS	Silva, R	6525	20	499	A 4.99
955	453	242569	Gilles Le Blanc			6354	17	112	A 1.12
956	454	372451	Vince Scorsad	VS	Scorsad, V	7003	20	499	A 4.99
957	455	374393	Antoine Lacharite	AL	Lacharite, A	7514	14	235	B 2.35
958	456	78137	Yannick Lapchin	YL	Lapchin, Y	8023	18	232	A 2.32
959	457	420983	Ryan Woodrow			5969	18	238	A 2.38
960	458	315952	George Karakoulas	GK	Karakoulas, G	7137	19	347	A 3.47
961	459	708773	Francis Mcginn	FM	Mcginn, F	7877	19	338	A 3.38
962	460	346896	Cameron Martineau	CM	Martineau, C	6704	19	326	A 3.26
963	461	858949	Gonçalo C Ferreira	GF	Ferreira, G	5414	18	245	A 2.45
964	462	584391	Damon Woods	DW	Woods, D	10795	20	473	A 4.73
965	463	440352	Lorenzo Manfredotti	LM	Manfredotti, L	9218	20	403	A 4.03
966	464	512281	Andrea Bristot	AB	Bristot, A	9265	14	272	B 2.72
967	465	384338	Paul V Lange	PL	Lange, P	8223	19	366	A 3.66
968	466	552932	Øystein Herfjord	ØH	Herfjord, Ø	6022	20	401	A 4.01
969	467	570861	Roland Ramsauer	RR	Ramsauer, R	7097	20	405	A 4.05
970	451	857815	Lemi Mischke	LM	Mischke, L	5878	18	281	A 2.81
971	453	350329	Erwin Lucas Liszkowicz	EL	Liszkowicz, E	7039	20	465	A 4.65
972	440	722640	Panos Kirkos	PK	Kirkos, P	6230	19	356	A 3.56
973	446	186155	Kevin Tavares	KT	Tavares, K	6536	20	499	A 4.99
974	445	707141	Bartosz Zamaro	BZ	Zamaro, B	5554	17	112	A 1.12
975	448	421964	Gün Tasdelen	GT	Tasdelen, G	9326	17	125	A 1.25
976	443	392134	Pierpaolo Reppucci	PR	Reppucci, P	9178	20	456	A 4.56
977	437	369995	Alessandro Bico	AB	Bico, A	10098	27	350	WC 3.50
1009	422	327272	Jarno Koch	JK	Koch, J	5705	20	493	A 4.93
1010	439	372998	Christopher Severt	CS	Severt, C	5005	18	266	A 2.66
1011	423	378737	David Bozga	DB	Bozga, D	9666	19	315	A 3.15
1012	429	79390	Jaden Conwright	JC	Conwright, J	5356	20	456	A 4.56
1013	453	520653	Alex Rassi	AR	Rassi, A	4965	19	364	A 3.64
1014	463	625522	Gui Lévesque	GL	Lévesque, G	9241	20	499	A 4.99
1015	455	338424	Andrew Caron	AC	Caron, A	8496	23	349	P 3.49
1016	436	347510	Gabriel Erdelyi	GE	Erdelyi, G	8433	19	355	A 3.55
1017	451	103117	Ricardo Ferreira	RF	Ferreira, R	7373	20	499	A 4.99
1018	458	448956	Dodi Ferdi	DF	Ferdi, D	6120	20	499	A 4.99
1019	449	957920	Malte Johansson	MJ	Johansson, M	8058	17	105	A 1.05
1020	425	532041	Adrian Gericke	AG	Gericke, A	9444	19	312	A 3.12
1021	437	816960	David Sobreiro	DS	Sobreiro, D	9221	20	486	A 4.86
1022	459	1033551	Diogo Faria	DF	Faria, D	5118	19	321	A 3.21
1023	435	347135	Nicolás Rubilar	NR	Rubilar, N	9723	19	341	A 3.41
1024	463	310170	Alex Gal	AG	Gal, A	9099	18	212	A 2.12
1025	468	209356	Gerald Chevalier	GC	Chevalier, G	6464	20	499	A 4.99
1026	469	794351	Erhan Taskin	ET	Taskin, E	4512	19	329	A 3.29
1027	470	79868	Javier Soto	JS	Soto, J	5253	18	271	A 2.71
1028	471	322064	Luca Thinggaard	LT	Thinggaard, L	4553	19	362	A 3.62
1029	472	490873	Erik Enders	EE	Enders, E	6609	20	437	A 4.37
1030	473	289748	A.J. Stravato	AS	Stravato, A	5463	19	354	A 3.54
1031	474	292137	Jakub Szelerski	JS	Szelerski, J	5289	20	499	A 4.99
1032	475	285168	Jérôme Charvet	JC	Charvet, J	4586	19	337	A 3.37
1033	476	937682	Daniel Espes	DE	Espes, D	4264	15	330	B 3.30
1034	477	1053878	Jannik Steinhoff	JS	Steinhoff, J	5516	18	251	A 2.51
1035	478	512523	Michael Vlasak2	MV	Vlasak2, M	4841	20	446	A 4.46
1036	479	543295	Harald Mathisen	HM	Mathisen, H	4346	19	314	A 3.14
1037	480	331981	Robert Viski	RV	Viski, R	4069	20	406	A 4.06
1038	481	598766	Luca Naddeo	LN	Naddeo, L	7342	19	355	A 3.55
1039	482	865925	Nathan Cadene	NC	Cadene, N	4729	18	289	A 2.89
1040	483	316654	Matthias Junge	MJ	Junge, M	5841	20	467	A 4.67
1041	484	889286	Tom Cecchetto	TC	Cecchetto, T	6035	20	499	A 4.99
1042	485	365100	Twan van den Beld	TB	Beld, T	5282	17	192	A 1.92
1043	486	305218	Tom Schwarz	TS	Schwarz, T	4890	18	267	A 2.67
1044	487	927311	Vladislav Kuksa	VK	Kuksa, V	4044	18	230	A 2.30
1045	488	922659	Gabri Martinez	GM	Martinez, G	3927	17	182	A 1.82
1046	489	615772	Luca Wunsch2	LW	Wunsch2, L	5706	15	353	B 3.53
1047	490	344701	Orlando Telheiro	OT	Telheiro, O	4894	20	499	A 4.99
1048	491	383841	Denis Van Asch	DA	Asch, D	4874	20	417	A 4.17
1049	492	916313	Nicolas Cinquini	NC	Cinquini, N	4564	20	480	A 4.80
1050	493	834516	Nathan Biggart	NB	Biggart, N	4438	20	499	A 4.99
1051	494	126856	Tuan Tran	TT	Tran, T	5645	19	390	A 3.90
1052	495	265808	Benoit Le Pezennec	BP	Pezennec, B	6079	18	274	A 2.74
1053	496	393379	Haroldas Jotautas	HJ	Jotautas, H	5675	20	449	A 4.49
1054	497	197655	Kai Dalziel	KD	Dalziel, K	7002	14	278	B 2.78
1055	498	737329	Jonas Gundert	JG	Gundert, J	5682	19	345	A 3.45
1056	499	590035	Joncarlo Schooler	JS	Schooler, J	7172	20	440	A 4.40
1057	500	828181	Edinho Salvio Correia	EC	Correia, E	5248	19	319	A 3.19
1058	501	571085	Bruckner Bertalan	BB	Bertalan, B	4883	13	145	B 1.45
1059	502	186604	Marcin Gadzinski	MG	Gadzinski, M	4384	15	330	B 3.30
1060	503	669711	Rapha el Schiffer	RS	Schiffer, R	5736	19	330	A 3.30
1061	504	633220	Gerard Sardeny Saez	GS	Saez, G	6218	17	129	A 1.29
1062	505	565302	Tomas Stranava	TS	Stranava, T	5571	19	319	A 3.19
1063	506	816121	Bram De Jong	BJ	Jong, B	4538	20	415	A 4.15
1064	507	517856	Adam Kotarski	AK	Kotarski, A	7414	15	350	B 3.50
1065	508	144094	E Bennett Parsons	EP	Parsons, E	4652	19	323	A 3.23
1066	509	302826	Gines Ruiz Nuñez	GN	Nuñez, G	3972	19	343	A 3.43
1067	510	275094	Rich Warmingham	RW	Warmingham, R	5258	20	458	A 4.58
1068	511	438626	Theo Cauret	TC	Cauret, T	5194	19	345	A 3.45
1069	512	181516	Matthias Beer	MB	Beer, M	4861	20	499	A 4.99
1070	513	19636	Reinhard Hiebl			5533	20	499	A 4.99
1071	514	566535	Emiliano Russo Ybarra			4510	19	376	A 3.76
1072	515	291213	Ajay Marston	AM	Marston, A	3976	20	449	A 4.49
1073	516	498058	Alberto Moreno S	AS	S, A	6321	20	499	A 4.99
1074	517	451086	Thorsten Ulrich	TU	Ulrich, T	6154	19	321	A 3.21
1075	518	595283	Patrick Gannon	PG	Gannon, P	5184	20	403	A 4.03
1076	519	595372	Daniel J Ferguson	DF	Ferguson, D	5103	18	286	A 2.86
1077	520	888655	Sam Edwards3	SE	Edwards3, S	3962	20	419	A 4.19
1078	521	569568	Thorsten Geib	TG	Geib, T	4926	20	412	A 4.12
1079	522	137605	Diego Krug	DK	Krug, D	4099	17	191	A 1.91
1080	523	49498	Patrick Richter	PR	Richter, P	7104	19	393	A 3.93
1081	524	887601	George T Tyler	GT	Tyler, G	5246	13	150	B 1.50
1082	525	374532	Pedro H. Oliiveira	PO	Oliiveira, P	4756	19	354	A 3.54
1083	526	918654	Vinicius Neto	VN	Neto, V	4675	19	374	A 3.74
1084	521	378222	Markus Groß	MG	Groß, M	5066	15	362	B 3.62
1085	513	929995	Paul Wanderdüne	PW	Wanderdüne, P	4100	19	362	A 3.62
1086	471	476967	Søren Broby2	SB	Broby2, S	3456	20	447	A 4.47
1087	479	466222	Thomas Grondaleeles	TG	Grondaleeles, T	3258	11	385	C 3.85
1088	483	301398	Viktor Gerdt	VG	Gerdt, V	3130	19	324	A 3.24
1089	478	874091	Christian Güthlein	CG	Güthlein, C	5083	19	343	A 3.43
1090	508	432242	Martin Tilling2	MT	Tilling2, M	4026	20	457	A 4.57
1091	496	319316	Marcello. Caserta.	MC	Caserta, M	5231	19	356	A 3.56
1092	510	274414	Steve Le-Vallee	SL	Le-Vallee, S	5264	20	499	A 4.99
1093	494	242335	Andrea Aymon	AA	Aymon, A	6953	20	499	A 4.99
1094	497	433692	Murphy Nichols	MN	Nichols, M	4453	17	154	A 1.54
1095	515	719283	Ryan A Miles	RM	Miles, R	3934	20	473	A 4.73
1096	489	564294	Liam O Willmann	LW	Willmann, L	9130	14	298	B 2.98
1097	485	105191	James cullen4	Jc	cullen4, J	5332	18	227	A 2.27
1098	503	418303	Gerrit Wolff	GW	Wolff, G	3265	18	273	A 2.73
1099	498	829652	Daniel Ronsdorf	DR	Ronsdorf, D	4135	16	480	B 4.80
1100	490	376121	Marco M Mendes	MM	Mendes, M	5410	20	433	A 4.33
1101	510	212032	Johnny Brandon	JB	Brandon, J	5182	19	334	A 3.34
1102	472	347537	Philipp Klinger	PK	Klinger, P	7829	20	438	A 4.38
1103	479	444367	Marcus Ahlmann Saeter	MS	Saeter, M	5588	15	347	B 3.47
1104	527	16149	Marcus Jirak	MJ	Jirak, M	7734	20	499	A 4.99
1105	528	594662	Dominic Weber	DW	Weber, D	4626	20	414	A 4.14
1106	529	842084	Max Knoth	MK	Knoth, M	4882	18	204	A 2.04
1107	530	58404	Martin Krönke	MK	Krönke, M	9348	20	499	A 4.99
1108	531	378559	Anton Zschemisch	AZ	Zschemisch, A	2544	18	289	A 2.89
1109	532	168508	Uwe Länger	UL	Länger, U	2314	18	264	A 2.64
1110	533	173270	Marcel Huwyler	MH	Huwyler, M	3112	20	499	A 4.99
1111	534	940818	Felix Hanke	FH	Hanke, F	2143	14	271	B 2.71
1112	535	90004	Jan Fecker	JF	Fecker, J	3478	20	494	A 4.94
1113	536	242314	Christian Lippert	CL	Lippert, C	1747	20	411	A 4.11
1114	537	366060	Alexander Rolly	AR	Rolly, A	1805	20	484	A 4.84
1115	538	443589	Leon Harhoff	LH	Harhoff, L	4394	19	345	A 3.45
1116	539	18451	Thomas Haupt	TH	Haupt, T	2076	18	264	A 2.64
1117	540	30068	Elmar Erlekotte	EE	Erlekotte, E	7181	20	499	A 4.99
1118	541	262351	Sven Schetter	SS	Schetter, S	1606	20	442	A 4.42
1119	542	259338	Marc Landskron	ML	Landskron, M	2161	18	258	A 2.58
1120	543	149026	Benjamin Kirsten	BK	Kirsten, B	2649	18	200	A 2.00
1121	544	305218	Tom Schwarz	TS	Schwarz, T	4481	20	412	A 4.12
1122	545	19286	Markus Papenbrock	MP	Papenbrock, M	5631	20	479	A 4.79
1123	546	80166	Danny Giusa	DG	Giusa, D	6005	20	455	A 4.55
1124	547	261230	Rainer Deter	RD	Deter, R	2368	20	499	A 4.99
1125	546	262562	Milos Pavlovic	MP	Pavlovic, M	5722	19	342	A 3.42
1126	528	561734	Tom Ostermann	TO	Ostermann, T	5601	14	262	B 2.62
1127	531	328660	Felix Schendel	FS	Schendel, F	2033	19	370	A 3.70
1128	543	118646	Christoph Klawiter	CK	Klawiter, C	3359	18	268	A 2.68
1129	539	59848	Daniel Moeller	DM	Moeller, D	1629	16	499	B 4.99
1130	536	793399	Andre Bohne	AB	Bohne, A	1567	18	253	A 2.53
1131	537	354497	Sebastian Blauhut	SB	Blauhut, S	2045	20	457	A 4.57
1132	534	332452	Michael Henke2	MH	Henke2, M	2983	14	200	B 2.00
1133	535	226149	Marcus Schaum	MS	Schaum, M	3451	20	499	A 4.99
1134	529	647099	Thomas Wurm Jr	TW	Wurm, T Jr	3305	20	481	A 4.81
1135	548	566725	Damien Viry	DV	Viry, D	5312	19	351	A 3.51
1136	549	314974	Corentin Guinez	CG	Guinez, C	9156	19	347	A 3.47
1137	550	216236	Florian Bodin	FB	Bodin, F	7909	20	499	A 4.99
1138	551	594606	Theodor Bergersen	TB	Bergersen, T	7745	16	441	B 4.41
1139	552	223385	Fernando Antolí Busquets	FB	Busquets, F	7340	19	348	A 3.48
1140	553	323481	Enrico Trenti	ET	Trenti, E	5412	20	412	A 4.12
1141	554	169781	Jamie Fluke	JF	Fluke, J	9741	20	499	A 4.99
1142	555	865258	Jamie Christison	JC	Christison, J	9408	18	228	A 2.28
1143	556	584391	Damon Woods	DW	Woods, D	11023	19	355	A 3.55
1144	557	298521	Eric Neu	EN	Neu, E	7122	20	499	A 4.99
1145	558	708773	Francis Mcginn	FM	Mcginn, F	7109	13	159	B 1.59
1146	559	147760	Brandon Roseborough	BR	Roseborough, B	6901	19	345	A 3.45
1147	560	672319	Sven-Ole Haase	SH	Haase, S	10131	17	146	A 1.46
1148	561	544713	Lucas Taelman	LT	Taelman, L	8245	18	231	A 2.31
1149	562	156290	Jan Sentkowski	JS	Sentkowski, J	7594	20	439	A 4.39
1150	563	260872	Ayhancan Guven	AG	Guven, A	10100	24	441	P 4.41
1151	564	193385	Pablo Araujo Castro	PC	Castro, P	7574	14	216	B 2.16
1152	565	602559	Yurica Kasdorp	YK	Kasdorp, Y	9039	18	202	A 2.02
1153	566	367245	Dylan Birse	DB	Birse, D	8289	19	393	A 3.93
1154	567	773877	Kevin Desnoyers	KD	Desnoyers, K	8032	18	234	A 2.34
1155	568	295310	Timo Heyden	TH	Heyden, T	8014	19	373	A 3.73
1156	569	138308	Pascal Stix	PS	Stix, P	8359	20	404	A 4.04
1157	570	454318	Teemu Myllykangas	TM	Myllykangas, T	7601	17	150	A 1.50
1158	571	465352	Filipe RC Barreto	FB	Barreto, F	6829	18	240	A 2.40
1159	572	499652	Kody Deith	KD	Deith, K	10901	19	368	A 3.68
1160	573	240638	Erick Goldner	EG	Goldner, E	7365	20	429	A 4.29
1161	574	252701	Gonzalo Fabi	GF	Fabi, G	7167	15	318	B 3.18
1162	575	327883	Ivan Machado Perez	IP	Perez, I	8027	19	324	A 3.24
1163	576	16775	Dario Frattini	DF	Frattini, D	6297	13	182	B 1.82
1164	577	599501	Olivier Piatek	OP	Piatek, O	9058	18	263	A 2.63
1165	578	797363	Aaron Lopez2	AL	Lopez2, A	7746	14	225	B 2.25
1166	579	473011	Claudio Mack	CM	Mack, C	7114	20	499	A 4.99
1167	580	456098	Theodor Jensen	TJ	Jensen, T	6002	18	240	A 2.40
1168	581	666727	Vladislav T Shopov	VS	Shopov, V	7554	19	311	A 3.11
1169	582	705480	Matias Penttilä	MP	Penttilä, M	8013	20	499	A 4.99
1170	583	394708	Szilard Nagy	SN	Nagy, S	7216	20	494	A 4.94
1171	584	61575	Logan McKinzie	LM	McKinzie, L	7123	19	305	A 3.05
1172	585	434013	Daniel W Harris	DH	Harris, D	7642	18	227	A 2.27
1173	586	121085	Patrick Hingston	PH	Hingston, P	8554	20	427	A 4.27
1174	587	415847	Chris Beets	CB	Beets, C	7023	19	338	A 3.38
1175	588	393663	Gaël Valero	GV	Valero, G	10006	20	446	A 4.46
1176	589	532960	Agustín Fernandez	AF	Fernandez, A	7273	17	145	A 1.45
1177	590	53455	Norbert Leitner	NL	Leitner, N	7113	19	376	A 3.76
1178	591	111542	Nils Koch	NK	Koch, N	7962	20	494	A 4.94
1179	592	452293	Austin J Young	AY	Young, A	6905	17	154	A 1.54
1180	593	324559	Benjamin Caura	BC	Caura, B	5984	18	251	A 2.51
1181	594	16111	Alex Ardoin	AA	Ardoin, A	5105	18	282	A 2.82
1182	595	362721	Konstantin Stolzenburg	KS	Stolzenburg, K	8221	20	486	A 4.86
1183	596	901208	Byron Pearce	BP	Pearce, B	7085	20	477	A 4.77
1184	597	435159	Daniel Lomba	DL	Lomba, D	6260	20	407	A 4.07
1185	598	361747	Kevin Dauguet	KD	Dauguet, K	5655	20	401	A 4.01
1186	599	74968	Nick Thissen	NT	Thissen, N	5261	18	246	A 2.46
1187	600	227079	Miguel M Freitas	MF	Freitas, M	7721	18	253	A 2.53
1188	601	142818	Alberto Senao	AS	Senao, A	9008	15	344	B 3.44
1189	602	346040	Christian Steenburgh	CS	Steenburgh, C	7690	20	481	A 4.81
1190	603	258491	DJ Alessandrini	DA	Alessandrini, D	7367	19	388	A 3.88
1191	604	38283	Jon Boetefuer	JB	Boetefuer, J	6991	18	254	A 2.54
1192	605	560678	Alexander Peregrina	AP	Peregrina, A	9143	20	471	A 4.71
1193	606	28696	Jack Sedgwick	JS	Sedgwick, J	7329	19	321	A 3.21
1194	607	789845	Carlos Mouesca	CM	Mouesca, C	7536	14	252	B 2.52
1195	608	452293	Austin J Young	AY	Young, A	6714	17	130	A 1.30
1196	609	16620	Scott Michaels	SM	Michaels, S	7015	19	356	A 3.56
1197	610	1065748	Elliot Norén	EN	Norén, E	7645	19	311	A 3.11
1198	611	221200	Gianni Vecchio	GV	Vecchio, G	10330	20	448	A 4.48
1199	612	734577	Mark Calver	MC	Calver, M	8403	20	491	A 4.91
1200	613	467622	Roger Fjeldstad Kristiansen	RK	Kristiansen, R	8922	22	293	P 2.93
1201	614	731799	Alxander A Spetz	AS	Spetz, A	11047	17	148	A 1.48
1202	615	496280	Jaden Munoz	JM	Munoz, J	9929	18	209	A 2.09
1203	616	847922	Mal Dedinca	MD	Dedinca, M	7007	20	404	A 4.04
1204	617	332693	Paulo Munoz	PM	Munoz, P	6460	17	152	A 1.52
1205	618	383318	Ryan  Barneveld	RB	Barneveld, R	9669	20	495	A 4.95
1206	619	525461	Samuel L Ward	SW	Ward, S	9011	20	455	A 4.55
1207	620	334578	Dominik Hofmann	DH	Hofmann, D	10437	18	241	A 2.41
1208	621	559940	Owen Caryl	OC	Caryl, O	10259	18	230	A 2.30
1209	622	419877	Jonas Wanner	JW	Wanner, J	9145	20	418	A 4.18
1210	623	101152	Agustin Canapino	AC	Canapino, A	9570	20	499	A 4.99
1211	624	35491	Graham Carroll	GC	Carroll, G	8387	20	456	A 4.56
1212	625	148179	Niclas Laubisch	NL	Laubisch, N	8977	17	121	A 1.21
1213	626	287772	James R Baldwin	JB	Baldwin, J	7687	19	354	A 3.54
1214	627	513181	Beckham Jacir	BJ	Jacir, B	11852	28	464	WC 4.64
1215	628	810818	Miguel Costa5	MC	Costa5, M	10057	16	423	B 4.23
1216	629	587619	Harald Creton	HC	Creton, H	7856	17	151	A 1.51
1217	630	581864	Benjamin Frigerio	BF	Frigerio, B	7991	18	244	A 2.44
1218	631	499652	Kody Deith	KD	Deith, K	10951	19	335	A 3.35
1219	632	386300	Nacho Gaspar	NG	Gaspar, N	7250	19	304	A 3.04
1220	633	982218	Ruben Paulino	RP	Paulino, R	7357	18	230	A 2.30
1221	634	62845	Balazs Palla	BP	Palla, B	8763	17	162	A 1.62
1222	635	341986	Gabi Montoro	GM	Montoro, G	9606	19	348	A 3.48
1223	636	79322	Dino Lombardi	DL	Lombardi, D	10075	24	424	P 4.24
1224	637	55879	Marcus Hamilton	MH	Hamilton, M	8682	19	345	A 3.45
1225	638	313251	Sven Haase	SH	Haase, S	12004	20	499	A 4.99
1226	639	452194	Manuel Troncoso	MT	Troncoso, M	9719	17	145	A 1.45
1227	640	665039	Rene Lenz	RL	Lenz, R	9820	20	461	A 4.61
1228	641	59638	Norbi Kiss	NK	Kiss, N	9734	20	412	A 4.12
1229	642	494559	Dan Amor	DA	Amor, D	8796	18	235	A 2.35
1230	643	391777	Florian A Lebigre	FL	Lebigre, F	9748	26	285	WC 2.85
1231	644	654554	Niklas Beu	NB	Beu, N	9260	20	499	A 4.99
1232	645	365108	Yoann Rouyer	YR	Rouyer, Y	8762	19	330	A 3.30
1233	646	338883	Markus Søholm	MS	Søholm, M	8583	20	499	A 4.99
1234	647	736287	Andre Wolff	AW	Wolff, A	8003	20	499	A 4.99
1235	648	352721	Kamil Grabowski	KG	Grabowski, K	9131	20	435	A 4.35
1236	649	314974	Corentin Guinez	CG	Guinez, C	9223	19	337	A 3.37
1237	650	260835	Chris Lulham	CL	Lulham, C	10389	28	465	WC 4.65
1238	651	416060	Luca Wunsch	LW	Wunsch, L	10048	18	275	A 2.75
1239	652	414547	Thomas Imbourg	TI	Imbourg, T	7111	20	423	A 4.23
1240	653	424000	Nicolas Mateo	NM	Mateo, N	11017	26	262	WC 2.62
1241	654	23801	Sean D Campbell	SC	Campbell, S	9100	20	499	A 4.99
1242	655	251942	Raphael Rennhofer	RR	Rennhofer, R	9750	20	499	A 4.99
1243	656	580302	Isaac Phelps	IP	Phelps, I	8119	18	206	A 2.06
1244	657	287082	Tobias Martinez	TM	Martinez, T	7981	18	218	A 2.18
1245	658	313229	Vlad Khimichev	VK	Khimichev, V	9110	17	157	A 1.57
1246	659	362709	Niklas Denneler	ND	Denneler, N	6416	19	356	A 3.56
1247	660	869043	Benedek Vida	BV	Vida, B	9038	17	143	A 1.43
1248	661	657544	Martin Kadlecík	MK	Kadlecík, M	9139	20	435	A 4.35
1249	662	476429	Jere Lehtinen	JL	Lehtinen, J	9400	19	357	A 3.57
1250	663	165169	Sota Muto	SM	Muto, S	10542	20	405	A 4.05
1251	664	584391	Damon Woods	DW	Woods, D	11000	19	334	A 3.34
1252	665	666056	Maxence Godiinho	MG	Godiinho, M	9373	19	355	A 3.55
1253	666	202092	Lukas Lindqvist	LL	Lindqvist, L	8622	19	340	A 3.40
1254	667	156290	Jan Sentkowski	JS	Sentkowski, J	7612	20	411	A 4.11
1255	638	701104	Jarno Koch2	JK	Koch2, J	10003	20	456	A 4.56
1256	648	603194	Matteo Kuenzer	MK	Kuenzer, M	9026	19	345	A 3.45
1257	642	598355	Aaron Vazquezz	AV	Vazquezz, A	12203	22	214	P 2.14
1258	630	591201	Andrew Dawson4	AD	Dawson4, A	9063	19	359	A 3.59
1259	637	746572	Wesley Kaspers	WK	Kaspers, W	9016	20	499	A 4.99
1260	624	440352	Lorenzo Manfredotti	LM	Manfredotti, L	9241	20	434	A 4.34
1261	622	384338	Paul V Lange	PL	Lange, P	8280	20	444	A 4.44
1262	646	310170	Alex Gal	AG	Gal, A	9113	18	295	A 2.95
1263	609	214897	Sacha Gorlé	SG	Gorlé, S	6769	19	325	A 3.25
1264	647	273175	Sven Winter	SW	Winter, S	8340	20	499	A 4.99
1265	645	868185	Roland Alfredsson	RA	Alfredsson, R	10112	20	432	A 4.32
1266	654	290952	Peter Zuba	PZ	Zuba, P	9311	19	307	A 3.07
1267	633	523395	Sven Knöller	SK	Knöller, S	8203	20	478	A 4.78
1268	617	708185	Denis Robin Wolf	DW	Wolf, D	7564	20	499	A 4.99
1269	638	358518	Jesse Telkkälä	JT	Telkkälä, J	8493	20	423	A 4.23
1270	658	525659	Michael Romanidis	MR	Romanidis, M	9999	19	378	A 3.78
1271	641	74294	Alexander Voß	AV	Voß, A	9400	20	457	A 4.57
1272	640	142356	Patrick Heinrich	PH	Heinrich, P	8973	20	470	A 4.70
1273	632	398982	Pol Munné	PM	Munné, P	7047	20	499	A 4.99
1274	639	347135	Nicolás Rubilar	NR	Rubilar, N	9621	19	331	A 3.31
1275	631	270254	Lasse Bak	LB	Bak, L	10081	22	225	P 2.25
1276	649	347128	Marvin Strehl	MS	Strehl, M	8740	18	246	A 2.46
1277	612	524963	Leif Sebastian	LS	Sebastian, L	8255	17	133	A 1.33
1278	657	521975	Fabrizio Belziti	FB	Belziti, F	8410	19	386	A 3.86
1279	653	252689	Ricardo Rico R.	RR	R, R	9503	20	445	A 4.45
1280	627	369995	Alessandro Bico	AB	Bico, A	10061	27	389	WC 3.89
1281	661	120693	Martin Sirotek	MS	Sirotek, M	7050	20	499	A 4.99
1282	666	844693	Kimi Tani	KT	Tani, K	8089	19	321	A 3.21
1283	667	290852	Sören Kolodziej	SK	Kolodziej, S	8135	20	499	A 4.99
1284	659	473011	Claudio Mack	CM	Mack, C	7171	20	450	A 4.50
1285	664	402045	Lewis Woods	LW	Woods, L	9077	20	468	A 4.68
1286	610	494920	Jonas Wiese	JW	Wiese, J	6661	19	357	A 3.57
1287	656	557819	Jesse Hiiliaho	JH	Hiiliaho, J	7460	20	450	A 4.50
1288	626	45742	Sacha Lehmann	SL	Lehmann, S	8070	20	499	A 4.99
1289	652	431992	Augustin Bernier	AB	Bernier, A	9775	20	442	A 4.42
1290	625	121085	Patrick Hingston	PH	Hingston, P	8524	19	332	A 3.32
1291	651	564294	Liam O Willmann	LW	Willmann, L	9418	20	464	A 4.64
1292	636	493177	Robin Maas2	RM	Maas2, R	8424	20	494	A 4.94
1293	608	328894	Graham D Sanders	GS	Sanders, G	8774	18	242	A 2.42
1294	644	258728	Michele Costantini	MC	Costantini, M	9243	20	423	A 4.23
1295	621	352506	Pedro Sanchez Albert	PA	Albert, P	8551	18	287	A 2.87
1296	662	339980	Pablo Espes	PE	Espes, P	8645	17	120	A 1.20
1297	616	705302	Eetu Eskelinen	EE	Eskelinen, E	7606	20	460	A 4.60
1298	615	479231	Robin Glerum	RG	Glerum, R	9730	19	310	A 3.10
1299	613	383670	Conner Karnik	CK	Karnik, C	7776	18	240	A 2.40
1300	629	589546	Leo Roussel	LR	Roussel, L	8352	20	404	A 4.04
1301	642	423482	Daniel Sivi-Szabo	DS	Sivi-Szabo, D	8005	18	231	A 2.31
1302	634	919225	Oláh Dániel2	OD	Dániel2, O	7939	19	303	A 3.03
1303	619	442328	Lukas A Thomsen	LT	Thomsen, L	9106	18	248	A 2.48
1304	628	240012	Gunonso Tasdelen	GT	Tasdelen, G	10009	19	312	A 3.12
1305	665	338231	Tom Reiher	TR	Reiher, T	9399	19	348	A 3.48
1306	643	219696	Josh Thompson	JT	Thompson, J	9809	27	342	WC 3.42
1307	663	473796	Matias Orjuela2	MO	Orjuela2, M	9534	20	499	A 4.99
1308	609	362532	Samuel Graña	SG	Graña, S	5996	19	357	A 3.57
1309	622	85651	Jesse Jones	JJ	Jones, J	9545	20	486	A 4.86
1310	620	467986	Daniel Alves Lourenco	DL	Lourenco, D	9912	20	455	A 4.55
1311	623	84414	Maximilian Muir	MM	Muir, M	7107	19	326	A 3.26
1312	650	352055	Diogo C. Pinto	DP	Pinto, D	10322	27	326	WC 3.26
1313	654	418337	Dumitru A Dimcenco	DD	Dimcenco, D	10628	19	345	A 3.45
1314	617	635791	Pedro Valencia	PV	Valencia, P	6908	18	209	A 2.09
1315	630	504982	Oscar Py	OP	Py, O	9127	27	328	WC 3.28
1316	624	141923	Maarten van Loozenoord	ML	Loozenoord, M	8496	19	344	A 3.44
1317	649	373369	Daniel Sommer	DS	Sommer, D	7448	20	499	A 4.99
1318	635	545183	Lucas Camba Moreiro	LM	Moreiro, L	9904	20	478	A 4.78
1319	632	209451	Jaume Dalmases Torres	JT	Torres, J	9023	19	398	A 3.98
1320	641	311718	Bruno Spengler	BS	Spengler, B	8555	20	499	A 4.99
1321	631	426571	Rasmus Christensen	RC	Christensen, R	10108	20	499	A 4.99
1322	657	249916	Fernando Borda	FB	Borda, F	7188	20	499	A 4.99
1323	639	400723	Jaidyn J Ladic	JL	Ladic, J	10119	20	449	A 4.49
1324	653	288975	Thibaud Prevot	TP	Prevot, T	9575	20	489	A 4.89
1325	627	463477	Vasilios Beletsiotis	VB	Beletsiotis, V	10483	19	300	A 3.00
1326	664	707641	Jonas Rütten	JR	Rütten, J	9463	20	430	A 4.30
1327	659	259479	Nils May	NM	May, N	7802	19	378	A 3.78
1328	667	490873	Erik Enders	EE	Enders, E	6672	20	423	A 4.23
1329	648	808670	Santeri Martikainen	SM	Martikainen, S	8707	20	469	A 4.69
1330	656	454318	Teemu Myllykangas	TM	Myllykangas, T	7601	14	296	B 2.96
1331	652	335473	Christophe Herbigneaux	CH	Herbigneaux, C	8129	18	240	A 2.40
1332	625	352617	Daniel Antúnez	DA	Antúnez, D	9615	20	448	A 4.48
1333	613	207100	Fabio Besuch	FB	Besuch, F	7949	20	499	A 4.99
1334	636	153033	Simone Maria Marcenò	SM	Marcenò, S	9400	24	488	P 4.88
1335	608	434013	Daniel W Harris	DH	Harris, D	7514	18	266	A 2.66
1336	644	272719	Ole Steinbraten	OS	Steinbraten, O	10300	20	429	A 4.29
1337	621	695257	Thomas Labouteley	TL	Labouteley, T	9212	20	437	A 4.37
1338	614	408090	Atte Kauppinen	AK	Kauppinen, A	10912	18	248	A 2.48
1339	616	537213	John A Bennett	JB	Bennett, J	7702	18	233	A 2.33
1340	662	414557	Nathan A Moore	NM	Moore, N	9054	20	499	A 4.99
1341	611	349143	Sam Kuitert	SK	Kuitert, S	10027	27	355	WC 3.55
1342	663	816960	David Sobreiro	DS	Sobreiro, D	9216	20	470	A 4.70
1343	608	147760	Brandon Roseborough	BR	Roseborough, B	7008	19	350	A 3.50
1344	659	855876	Luis Karl	LK	Karl, L	8378	14	294	B 2.94
1345	656	614848	Alessandro Romanelli	AR	Romanelli, A	8051	19	316	A 3.16
1346	635	622235	Lucas Pérez	LP	Pérez, L	9438	18	254	A 2.54
1347	649	432847	Adam J Isaksson	AI	Isaksson, A	8856	19	349	A 3.49
1348	641	328176	Lucas Hermann	LH	Hermann, L	9000	20	411	A 4.11
1349	643	114405	Gustavo Ariel	GA	Ariel, G	11151	27	334	WC 3.34
1350	666	286978	Ian Gagnon-Renaud	IG	Gagnon-Renaud, I	8701	18	272	A 2.72
1351	637	387923	Simon Kaulartz	SK	Kaulartz, S	8481	18	241	A 2.41
1352	629	658315	Ghiless Jeanney	GJ	Jeanney, G	7803	18	204	A 2.04
1353	633	178613	Patrick Wolf	PW	Wolf, P	7587	19	354	A 3.54
1354	631	282014	Daniel Lafuente	DL	Lafuente, D	10030	20	455	A 4.55
1355	667	347537	Philipp Klinger	PK	Klinger, P	8006	20	475	A 4.75
1356	628	378737	David Bozga	DB	Bozga, D	9701	19	325	A 3.25
1357	661	292374	Daniel Ferguson	DF	Ferguson, D	9308	17	134	A 1.34
1358	636	354245	Lassi Juurinen	LJ	Juurinen, L	8912	20	499	A 4.99
1359	648	599501	Olivier Piatek	OP	Piatek, O	8965	18	245	A 2.45
1360	637	454341	Loïc Marchand	LM	Marchand, L	6468	20	468	A 4.68
1361	626	515884	Matteo Frigerio	MF	Frigerio, M	7674	18	212	A 2.12
1362	633	693475	Hamilton Akabueze	HA	Akabueze, H	7510	18	228	A 2.28
1363	610	724180	Kasper Rishøj-Andersen	KR	Rishøj-Andersen, K	8351	14	272	B 2.72
1364	634	155293	David Toth	DT	Toth, D	9543	17	151	A 1.51
1365	619	684704	Anjan Amuthan	AA	Amuthan, A	9188	18	220	A 2.20
1366	627	361210	Daniel Pásztor	DP	Pásztor, D	9656	26	229	WC 2.29
1367	663	410511	Parker White	PW	White, P	10789	20	499	A 4.99
1368	611	161668	Cooper Webster	CW	Webster, C	10037	27	306	WC 3.06
1369	666	338424	Andrew Caron	AC	Caron, A	8833	23	339	P 3.39
1370	650	168966	Max Verstappen	MV	Verstappen, M	9418	20	499	A 4.99
1371	609	509410	Samuel Michaels	SM	Michaels, S	8750	20	499	A 4.99
1372	662	776393	Patrik Thomsen	PT	Thomsen, P	8703	18	260	A 2.60
1373	630	610813	Ronnie E Smith	RS	Smith, R	6241	18	207	A 2.07
1374	626	404053	Callum Reid Garton	CG	Garton, C	7116	17	122	A 1.22
1376	619	367670	Kalen Chin	KC	Chin, K	8758	18	235	A 2.35
1375	654	812682	Gabriel C. Streitmatter	GS	Streitmatter, G	9033	20	499	A 4.99
1377	634	348370	Tamas Simon	TS	Simon, T	9326	19	334	A 3.34
1378	610	420944	Marcus Fischer Nielsen	MN	Nielsen, M	7224	20	419	A 4.19
1379	616	843891	Siro Zambra	SZ	Zambra, S	7223	19	329	A 3.29
1380	642	540631	Jordan Johnson5	JJ	Johnson5, J	8030	18	281	A 2.81
1381	620	138679	Phil Denes	PD	Denes, P	10079	20	494	A 4.94
1382	651	255919	Alexander Thiebe	AT	Thiebe, A	9309	20	414	A 4.14
1383	668	79322	Dino Lombardi	DL	Lombardi, D	10087	23	323	P 3.23
1384	669	402045	Lewis Woods	LW	Woods, L	9078	20	470	A 4.70
1385	670	487879	James F Beumee	JB	Beumee, J	7902	19	316	A 3.16
1386	671	121280	Emanuele Petri	EP	Petri, E	8049	20	499	A 4.99
1387	672	279166	Lukas Prada	LP	Prada, L	9303	19	366	A 3.66
1388	673	165169	Sota Muto	SM	Muto, S	10546	20	445	A 4.45
1389	674	499652	Kody Deith	KD	Deith, K	10950	19	329	A 3.29
1390	675	440352	Lorenzo Manfredotti	LM	Manfredotti, L	9333	20	499	A 4.99
1391	676	354245	Lassi Juurinen	LJ	Juurinen, L	8974	20	482	A 4.82
1392	677	685974	Philip W Ansell	PA	Ansell, P	6935	19	357	A 3.57
1393	678	156290	Jan Sentkowski	JS	Sentkowski, J	7627	20	430	A 4.30
1394	679	391777	Florian A Lebigre	FL	Lebigre, F	9771	26	293	WC 2.93
1395	680	545183	Lucas Camba Moreiro	LM	Moreiro, L	9901	20	485	A 4.85
1396	681	584391	Damon Woods	DW	Woods, D	11001	19	365	A 3.65
1397	682	155293	David Toth	DT	Toth, D	9619	20	499	A 4.99
1398	683	109169	Dayne Warren	DW	Warren, D	8141	18	202	A 2.02
1399	684	525461	Samuel L Ward	SW	Ward, S	9072	19	343	A 3.43
1400	685	655846	Sacha Anglesy	SA	Anglesy, S	8210	20	423	A 4.23
1401	686	347135	Nicolás Rubilar	NR	Rubilar, N	9862	18	243	A 2.43
1402	687	101152	Agustin Canapino	AC	Canapino, A	9531	20	406	A 4.06
1403	688	23801	Sean D Campbell	SC	Campbell, S	9145	20	499	A 4.99
1404	689	378190	Dalton Zavadil	DZ	Zavadil, D	9034	19	368	A 3.68
1405	690	196317	Tristan Iglesias	TI	Iglesias, T	10044	26	245	WC 2.45
1406	691	421735	Elliott Vayron	EV	Vayron, E	9121	26	257	WC 2.57
1407	692	341986	Gabi Montoro	GM	Montoro, G	9594	19	343	A 3.43
1408	693	237499	Jeff Giassi	JG	Giassi, J	8871	20	421	A 4.21
1409	694	114405	Gustavo Ariel	GA	Ariel, G	11188	27	344	WC 3.44
1410	695	334483	Oskari Rinne	OR	Rinne, O	9409	20	486	A 4.86
1411	696	194657	Marc Perez	MP	Perez, M	8988	20	499	A 4.99
1412	697	408090	Atte Kauppinen	AK	Kauppinen, A	10896	19	363	A 3.63
1413	698	169237	Joshua K Rogers	JR	Rogers, J	10283	18	283	A 2.83
1414	699	138679	Phil Denes	PD	Denes, P	10073	20	491	A 4.91
1415	700	657544	Martin Kadlecík	MK	Kadlecík, M	9483	19	366	A 3.66
1416	701	430146	Lucas U. Müller	LM	Müller, L	9035	20	453	A 4.53
1417	702	919730	Beck Jacir	BJ	Jacir, B	6866	20	445	A 4.45
1418	703	701104	Jarno Koch2	JK	Koch2, J	9989	20	448	A 4.48
1419	704	442130	Hugh Barter	HB	Barter, H	10356	18	238	A 2.38
1420	705	310170	Alex Gal	AG	Gal, A	9150	20	485	A 4.85
1421	706	62845	Balazs Palla	BP	Palla, B	8841	19	367	A 3.67
1422	707	74294	Alexander Voß	AV	Voß, A	9413	20	491	A 4.91
1423	708	386300	Nacho Gaspar	NG	Gaspar, N	8004	20	499	A 4.99
1424	709	159005	Carlos Diegues	CD	Diegues, C	7992	19	385	A 3.85
1425	710	734577	Mark Calver	MC	Calver, M	8772	20	421	A 4.21
1426	711	462900	Luca Alpert	LA	Alpert, L	9603	20	454	A 4.54
1427	712	378737	David Bozga	DB	Bozga, D	9710	19	325	A 3.25
1428	713	352617	Daniel Antúnez	DA	Antúnez, D	9593	20	442	A 4.42
1429	714	586542	Zach Rattray-White	ZR	Rattray-White, Z	7431	19	383	A 3.83
1430	715	486209	Luca Kita	LK	Kita, L	10399	27	385	WC 3.85
1431	716	349143	Sam Kuitert	SK	Kuitert, S	10010	27	316	WC 3.16
1432	717	270254	Lasse Bak	LB	Bak, L	10089	22	238	P 2.38
1433	685	194516	Djawad Karoni	DK	Karoni, D	7515	20	499	A 4.99
1434	688	672319	Sven-Ole Haase	SH	Haase, S	9772	18	247	A 2.47
1435	707	111542	Nils Koch	NK	Koch, N	7841	20	459	A 4.59
1436	689	382529	Martin Stefanko	MS	Stefanko, M	10224	20	499	A 4.99
1437	674	282014	Daniel Lafuente	DL	Lafuente, D	10029	20	422	A 4.22
1438	690	416197	Julien Soenen	JS	Soenen, J	8280	27	370	WC 3.70
1439	717	426571	Rasmus Christensen	RC	Christensen, R	10102	20	451	A 4.51
1440	701	419877	Jonas Wanner	JW	Wanner, J	9149	19	330	A 3.30
1441	686	252689	Ricardo Rico R.	RR	R, R	9516	19	353	A 3.53
1442	691	957920	Malte Johansson	MJ	Johansson, M	9019	17	140	A 1.40
1443	683	371869	Charlie Collins	CC	Collins, C	9337	19	350	A 3.50
1444	669	707641	Jonas Rütten	JR	Rütten, J	9464	19	335	A 3.35
1445	673	410511	Parker White	PW	White, P	10793	20	499	A 4.99
1446	682	919225	Dániel Oláh	DO	Oláh, D	8065	19	344	A 3.44
1447	692	349184	Cristian Lamela	CL	Lamela, C	8109	18	278	A 2.78
1448	700	352721	Kamil Grabowski	KG	Grabowski, K	9146	20	439	A 4.39
1449	696	358815	Manel Cubo Torres	MT	Torres, M	7555	20	496	A 4.96
1450	713	258482	Rodrigo Meezs	RM	Meezs, R	9725	17	156	A 1.56
1451	714	865258	Jamie Christison	JC	Christison, J	9423	18	244	A 2.44
1452	681	367245	Dylan Birse	DB	Birse, D	8299	18	246	A 2.46
1453	693	177963	Angelo Michel	AM	Michel, A	7519	19	352	A 3.52
1454	698	61454	Mitchell deJong	Md	deJong, M	10272	26	245	WC 2.45
1455	697	548968	Alxander Spetz	AS	Spetz, A	11075	18	220	A 2.20
1456	708	209451	Jaume Dalmases Torres	JT	Torres, J	9095	20	450	A 4.50
1457	705	393663	Gaël Valero	GV	Valero, G	10045	20	419	A 4.19
1458	711	251942	Raphael Rennhofer	RR	Rennhofer, R	9631	20	495	A 4.95
1459	703	418337	Dumitru A Dimcenco	DD	Dimcenco, D	10732	20	488	A 4.88
1460	676	532041	Adrian Gericke	AG	Gericke, A	10000	19	353	A 3.53
1461	671	256474	Roberto Ferrari	RF	Ferrari, R	7992	20	483	A 4.83
1462	672	120693	Martin Sirotek	MS	Sirotek, M	7036	20	462	A 4.62
1463	677	339128	Kyle Bos	KB	Bos, K	8237	19	348	A 3.48
1464	684	367670	Kalen Chin	KC	Chin, K	8756	18	242	A 2.42
1465	680	542120	Alejandro Avín Ruisánchez	AR	Ruisánchez, A	9208	20	472	A 4.72
1467	675	272719	Ole Steinbraten	OS	Steinbraten, O	10242	20	457	A 4.57
1470	710	748803	Alexandre Nicolas	AN	Nicolas, A	7448	20	499	A 4.99
1471	679	717571	Edoardo Leo	EL	Leo, E	9538	18	293	A 2.93
1475	668	421964	Gün Tasdelen	GT	Tasdelen, G	9595	17	161	A 1.61
1476	694	352055	Diogo C. Pinto	DP	Pinto, D	10327	28	453	WC 4.53
1466	678	366619	Andreas Fink	AF	Fink, A	8030	19	375	A 3.75
1468	699	373516	Rainer Talvar	RT	Talvar, R	9807	20	414	A 4.14
1469	715	219108	Alejandro Sánchez	AS	Sánchez, A	10092	28	431	WC 4.31
1472	670	524963	Leif Sebastian	LS	Sebastian, L	8622	17	146	A 1.46
1473	687	47751	Alex Arana	AA	Arana, A	9465	20	499	A 4.99
1474	706	348370	Tamas Simon	TS	Simon, T	9331	19	375	A 3.75
1477	716	221200	Gianni Vecchio	GV	Vecchio, G	10304	20	446	A 4.46
1478	691	583189	Gabriel Salomon	GS	Salomon, G	8823	20	465	A 4.65
1479	701	85651	Jesse Jones	JJ	Jones, J	9746	19	320	A 3.20
1480	684	346040	Christian Steenburgh	CS	Steenburgh, C	7707	19	366	A 3.66
1481	704	313229	Vlad Khimichev	VK	Khimichev, V	9260	20	469	A 4.69
1482	713	773877	Kevin Desnoyers	KD	Desnoyers, K	8041	19	364	A 3.64
1483	672	374393	Antoine Lacharite	AL	Lacharite, A	8012	19	397	A 3.97
1484	669	416060	Luca Wunsch	LW	Wunsch, L	10043	18	230	A 2.30
\.


--
-- Data for Name: c_car_entry; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.c_car_entry (id, event_id, c_car_id, car_idx, car_number, car_number_raw) FROM stdin;
263	8	39	14	906	906
264	8	39	17	17	17
265	8	39	23	923	923
266	8	39	25	33	33
267	8	39	26	44	44
268	8	39	1	15	15
269	8	39	4	1	1
270	8	39	10	28	28
271	8	39	16	916	916
272	8	39	20	31	31
273	8	39	30	30	30
274	8	39	2	9	9
275	8	39	9	11	11
276	8	39	11	934	934
277	8	39	28	21	21
278	8	39	24	919	919
279	8	39	8	918	918
280	8	39	12	13	13
281	8	39	13	25	25
282	8	39	22	935	935
283	8	39	7	2	2
284	8	39	19	7	7
285	8	39	27	20	20
286	8	39	5	908	908
287	8	39	6	3	3
288	8	39	21	136	136
289	8	39	29	29	29
290	8	39	3	4	4
291	8	39	15	14	14
292	8	39	18	32	32
293	9	40	11	934	934
294	9	40	13	25	25
295	9	40	27	20	20
296	9	40	3	4	4
297	9	40	4	1	1
298	9	40	10	28	28
299	9	40	23	923	923
300	9	40	25	33	33
301	9	40	28	21	21
302	9	40	1	15	15
303	9	40	6	3	3
304	9	40	9	11	11
305	9	40	12	13	13
306	9	40	19	7	7
307	9	40	30	30	30
308	9	40	8	918	918
309	9	40	18	32	32
310	9	40	29	29	29
311	9	40	14	906	906
312	9	40	21	136	136
313	9	40	24	919	919
314	9	40	5	908	908
315	9	40	16	916	916
316	9	40	17	17	17
317	9	40	2	9	9
318	9	40	7	2	2
319	9	40	15	14	14
320	9	40	22	935	935
321	9	40	26	44	44
322	9	40	20	31	31
323	10	46	31	99	99
324	10	46	33	98	98
325	10	44	36	169	169
326	10	47	43	002	3002
327	10	42	46	22	22
328	10	50	5	069	3069
329	10	45	18	198	198
330	10	45	24	909	909
331	10	45	17	5	5
332	10	45	27	19	19
333	10	46	32	72	72
334	10	50	8	299	299
335	10	43	10	23	23
336	10	51	11	33	33
337	10	50	2	20	20
338	10	45	16	66	66
339	10	48	45	114	114
340	10	46	48	97	97
341	10	50	4	89	89
342	10	45	20	95	95
110	4	21	31	25	25
111	4	21	32	27	27
112	4	26	39	4	4
113	4	25	43	70	70
114	4	21	20	16	16
115	4	21	30	45	45
116	4	21	24	22	22
117	4	24	2	3	3
118	4	24	13	26	26
119	4	20	9	10	10
120	4	19	16	2	2
121	4	21	17	66	66
122	4	21	21	5	5
123	4	21	29	6	6
124	4	26	37	1	1
125	4	24	1	21	21
126	4	24	8	9	9
127	4	25	47	269	269
128	4	22	48	97	97
129	4	25	49	369	369
130	4	22	41	99	99
131	4	23	44	7	7
132	4	21	28	005	3005
133	4	27	45	13	13
134	4	19	4	11	11
135	4	24	11	24	24
136	4	21	19	14	14
137	4	21	23	114	114
138	4	21	27	23	23
139	4	22	34	001	3001
140	4	28	46	33	33
141	4	24	10	737	737
142	4	21	18	8	8
143	4	27	40	44	44
144	4	25	42	69	69
145	4	22	50	17	17
146	4	24	15	75	75
147	4	21	25	118	118
148	4	24	7	19	19
149	4	19	14	28	28
150	4	21	26	004	3004
151	4	21	33	29	29
152	4	25	35	169	169
153	4	22	38	002	3002
154	4	19	5	12	12
155	4	20	6	89	89
156	4	21	22	18	18
157	4	22	36	98	98
343	10	46	35	4	4
344	10	45	26	18	18
345	10	45	28	188	188
346	10	46	29	1	1
347	10	50	12	298	298
348	10	45	22	16	16
349	10	45	25	17	17
350	10	50	13	15	15
351	10	45	14	8	8
352	10	45	19	12	12
353	10	45	21	124	124
354	10	46	34	70	70
355	10	50	1	3	3
356	10	50	3	21	21
357	10	50	9	14	14
358	10	42	44	9	9
359	10	46	41	44	44
360	10	46	47	123	123
361	10	50	7	7	7
362	10	41	38	96	96
363	10	44	39	001	3001
364	10	46	30	2	2
365	10	41	37	10	10
366	10	46	40	6	6
367	10	44	42	120	120
368	10	49	49	13	13
158	4	24	3	20	20
159	4	24	12	15	15
160	5	31	8	12	12
161	5	32	9	8	8
162	5	32	15	9	9
163	5	34	17	33	33
164	5	31	29	127	127
165	5	31	2	1	1
166	5	31	4	3	3
167	5	32	25	66	66
168	5	31	37	19	19
169	5	32	42	23	23
170	5	31	44	24	24
171	5	34	46	123	123
172	5	32	16	73	73
173	5	31	19	224	224
174	5	29	24	445	445
175	5	34	35	4	4
176	5	32	38	994	994
177	5	34	41	22	22
178	5	29	43	181	181
179	5	34	7	7	7
180	5	31	11	717	717
181	5	29	13	77	77
182	5	31	28	808	808
183	5	30	33	17	17
184	5	33	6	6	6
185	5	31	12	144	144
186	5	31	36	18	18
187	5	31	39	20	20
188	5	31	45	720	720
189	5	31	14	55	55
190	5	33	31	91	91
191	5	30	40	21	21
192	5	31	47	25	25
193	5	31	48	26	26
194	5	33	49	27	27
195	5	32	5	5	5
196	5	31	32	218	218
197	5	29	22	777	777
198	5	31	27	2	2
199	5	31	10	281	281
200	5	31	20	13	13
201	5	31	18	11	11
202	5	34	21	10	10
203	5	31	23	14	14
204	5	29	26	15	15
205	5	31	30	16	16
206	5	34	34	718	718
207	5	31	1	151	151
208	5	31	3	802	802
369	10	50	6	11	11
370	10	45	15	199	199
371	10	45	23	129	129
420	12	67	25	16	16
421	12	62	27	7	7
422	12	66	28	001	3001
423	12	66	2	002	3002
424	12	67	4	86	86
425	12	66	5	004	3004
426	12	67	10	3	3
427	12	61	23	717	717
428	12	69	29	113	113
429	12	61	41	17	17
430	12	69	47	909	909
431	12	61	39	314	314
432	12	64	40	15	15
433	12	61	1	1	1
434	12	66	6	2	2
435	12	68	11	069	3069
436	12	63	16	4	4
437	12	61	17	5	5
438	12	67	20	114	114
439	12	69	44	39	39
440	12	62	45	77	77
441	12	62	7	14	14
442	12	67	12	212	212
443	12	67	13	151	151
444	12	63	24	223	223
445	12	69	34	12	12
446	12	67	36	279	279
447	12	67	48	19	19
448	12	66	15	003	3003
449	12	61	21	220	220
450	12	64	22	8	8
451	12	67	30	257	257
452	12	67	33	11	11
453	12	67	43	551	551
454	12	65	42	998	998
455	12	63	18	23	23
456	12	69	19	788	788
457	12	62	26	6	6
458	12	67	31	9	9
459	12	67	35	177	177
460	12	69	37	38	38
461	12	67	46	18	18
462	12	61	3	44	44
463	12	66	8	99	99
464	12	67	9	35	35
465	12	61	14	20	20
466	12	61	32	10	10
467	12	67	38	13	13
468	13	70	7	977	977
469	13	71	43	28	28
470	13	70	21	13	13
471	13	70	58	36	36
472	13	71	4	248	248
473	13	71	16	9	9
474	13	71	20	12	12
475	13	71	40	888	888
476	13	72	48	31	31
477	13	70	15	7	7
478	13	70	30	19	19
479	13	70	49	32	32
480	13	74	53	8	8
481	13	71	2	229	229
482	13	70	37	25	25
483	13	76	51	984	984
484	13	70	13	5	5
485	13	70	19	11	11
486	13	70	31	20	20
487	13	71	54	33	33
488	13	74	59	111	111
489	13	70	6	44	44
490	13	70	27	16	16
491	13	70	33	22	22
492	13	70	41	969	969
493	13	75	45	01	2001
494	13	70	10	921	921
495	13	70	12	4	4
496	13	73	17	266	266
497	13	70	18	10	10
498	13	71	35	244	244
499	13	70	3	2	2
500	13	70	22	75	75
501	13	70	32	21	21
502	13	70	46	30	30
503	13	70	50	68	68
504	13	70	9	3	3
505	13	73	14	6	6
506	13	71	42	27	27
507	13	70	1	1	1
508	13	70	47	729	729
509	13	71	55	010	3010
510	13	70	24	15	15
511	13	70	25	277	277
512	13	71	34	23	23
513	13	70	38	777	777
514	13	70	44	29	29
515	13	71	57	35	35
516	13	72	8	205	205
517	13	70	11	233	233
518	13	70	26	110	110
519	13	71	28	17	17
520	13	70	56	34	34
521	13	70	29	18	18
522	13	70	52	988	988
523	13	70	5	84	84
524	13	74	23	14	14
525	13	70	36	24	24
526	13	70	39	26	26
527	14	78	2	15	15
528	14	78	6	102	102
529	14	79	16	208	208
530	14	78	17	17	17
531	14	77	1	13	13
532	14	77	3	60	60
533	14	77	4	4	4
534	14	79	7	7	7
535	14	79	11	128	128
536	14	79	12	68	68
537	14	77	13	14	14
538	14	78	15	95	95
539	14	77	19	19	19
540	14	78	20	77	77
541	14	77	8	369	369
542	14	79	10	10	10
543	14	79	5	5	5
544	14	78	9	9	9
545	14	79	14	135	135
546	14	78	18	82	82
547	14	77	21	302	302
548	15	83	19	58	58
549	15	85	28	8	8
550	15	86	38	23	23
551	15	84	40	25	25
552	15	83	7	36	36
553	15	83	18	57	57
554	15	84	26	6	6
555	15	84	27	7	7
556	15	84	22	1	1
557	15	87	59	42	42
558	15	83	8	45	45
559	15	83	11	50	50
560	15	84	24	3	3
561	15	84	35	16	16
562	15	83	6	30	30
563	15	84	25	4	4
564	15	84	42	31	31
565	15	84	31	11	11
566	15	84	34	15	15
567	15	84	36	18	18
568	15	84	37	20	20
569	15	83	1	14	14
570	15	83	5	29	29
571	15	83	12	51	51
572	15	84	23	2	2
573	15	82	54	35	35
574	15	80	57	40	40
575	15	83	2	19	19
576	15	83	13	52	52
577	15	86	30	10	10
578	15	84	39	24	24
579	15	84	46	43	43
580	15	83	15	54	54
581	15	84	43	32	32
582	15	80	51	21	21
583	15	81	56	39	39
584	15	82	58	41	41
585	15	83	4	28	28
586	15	84	33	13	13
587	15	84	47	47	47
588	15	87	49	5	5
589	15	81	55	38	38
590	15	81	60	44	44
591	15	83	3	22	22
592	15	83	10	49	49
593	15	83	16	55	55
594	15	83	21	60	60
595	15	80	50	17	17
596	15	83	9	46	46
597	15	83	14	53	53
598	15	83	17	56	56
599	15	83	20	59	59
600	15	81	52	26	26
601	15	86	32	12	12
602	15	84	41	27	27
603	15	86	44	34	34
604	15	86	48	48	48
605	15	86	29	9	9
606	15	86	45	37	37
607	15	80	53	33	33
608	16	95	19	24	24
609	16	95	21	04	2004
610	16	96	34	717	717
611	16	94	39	169	169
612	16	88	55	150	150
613	16	88	56	007	3007
614	16	95	1	6	6
615	16	92	4	5	5
616	16	93	20	26	26
617	16	93	22	28	28
618	16	88	44	10	10
619	16	89	52	4	4
620	16	92	2	89	89
621	16	93	8	90	90
622	16	95	11	120	120
623	16	95	15	160	160
624	16	93	14	51	51
625	16	96	25	12	12
626	16	96	33	908	908
627	16	88	36	1	1
628	16	89	42	005	3005
629	16	96	30	19	19
630	16	96	32	909	909
631	16	88	37	25	25
632	16	90	59	83	83
633	16	95	18	11	11
634	16	96	27	18	18
635	16	94	46	14	14
636	16	95	9	002	3002
637	16	95	16	21	21
638	16	96	23	004	3004
639	16	88	43	269	269
640	16	88	48	006	3006
641	16	88	50	7	7
642	16	96	28	199	199
643	16	94	38	171	171
644	16	93	5	50	50
645	16	93	12	003	3003
646	16	93	13	99	99
647	16	95	17	116	116
648	16	96	26	16	16
649	16	89	54	76	76
650	16	92	3	20	20
651	16	88	47	3	3
652	16	96	29	8	8
653	16	88	40	069	3069
654	16	95	7	001	3001
655	16	96	24	15	15
656	16	96	31	223	223
657	16	88	58	22	22
658	16	95	6	9	9
659	16	96	35	27	27
660	16	88	51	13	13
661	16	88	57	123	123
662	16	93	10	17	17
663	16	88	41	2	2
664	16	88	45	44	44
665	16	88	49	299	299
666	16	88	53	23	23
667	16	91	60	101	101
668	17	97	11	002	3002
669	17	97	21	33	33
670	17	98	39	2	2
671	17	103	45	91	91
672	17	101	47	123	123
673	17	105	3	1	1
674	17	97	4	25	25
675	17	98	13	50	50
676	17	104	23	005	3005
677	17	97	48	113	113
678	17	98	50	35	35
679	17	105	16	71	71
680	17	97	19	4	4
681	17	97	28	44	44
682	17	97	34	19	19
683	17	105	35	21	21
684	17	105	38	114	114
685	17	105	49	23	23
686	17	101	15	9	9
687	17	97	20	5	5
688	17	97	22	001	3001
689	17	99	24	11	11
690	17	105	30	18	18
691	17	105	32	8	8
692	17	97	33	17	17
693	17	97	44	24	24
694	17	105	2	72	72
695	17	102	12	89	89
696	17	97	42	14	14
697	17	101	1	6	6
698	17	105	6	92	92
699	17	102	10	10	10
700	17	101	26	12	12
701	17	97	27	77	77
702	17	105	41	22	22
703	17	97	5	003	3003
704	17	101	14	069	3069
705	17	97	18	98	98
706	17	104	29	13	13
707	17	102	36	7	7
708	17	100	37	83	83
709	17	101	43	96	96
710	17	97	46	150	150
711	17	103	17	16	16
712	17	97	25	004	3004
713	17	97	31	15	15
714	17	97	40	20	20
715	17	97	7	99	99
716	17	105	8	70	70
717	17	97	9	3	3
\.


--
-- Data for Name: c_car_team; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.c_car_team (id, c_car_entry_id, team_id, name) FROM stdin;
263	263	0	Robin Ries
264	264	0	Roman Paerschke
265	265	0	Nino Hultsch
266	266	0	Rene Hoogenhout
267	267	0	Thomas Wurm Jr
268	268	0	Marcus Jirak
269	269	0	Joel Meili
270	270	0	Christian Ruzicka
271	271	0	Moritz Hametner
272	272	0	Pawel Rybak
273	273	0	Uwe Länger
274	274	0	Carsten Wiedenhöfer
275	275	0	Markus Riemer
276	276	0	Dirk Wessendorf
277	277	0	TH Reinberger
278	278	0	Tom Euler
279	279	0	Max Knoth
280	280	0	Michael Henke2
281	281	0	Jan Fecker
282	282	0	Alireza Naderi
283	283	0	Robert Koppler
284	284	0	Tom Ostermann
285	285	0	Sebastian Burkhart
286	286	0	Christopher Wolfgruber
287	287	0	Tobias Kurz
288	288	0	Jan Sentkowski
289	289	0	Gregor Franke
290	290	0	Dominic Weber
291	291	0	Christoph Klawiter
292	292	0	Marcel Huwyler
293	293	0	Dirk Wessendorf
294	294	0	Jan Fecker
295	295	0	Sebastian Burkhart
296	296	0	Dominic Weber
297	297	0	Joel Meili
298	298	0	Christian Ruzicka
299	299	0	Nino Hultsch
300	300	0	Rene Hoogenhout
301	301	0	TH Reinberger
302	302	0	Marcus Jirak
303	303	0	Tobias Kurz
304	304	0	Markus Riemer
305	305	0	Michael Henke2
306	306	0	Tom Ostermann
307	307	0	Uwe Länger
308	308	0	Max Knoth
309	309	0	Marcel Huwyler
310	310	0	Gregor Franke
311	311	0	Robin Ries
312	312	0	Jan Sentkowski
313	313	0	Tom Euler
314	314	0	Christopher Wolfgruber
315	315	0	Moritz Hametner
316	316	0	Roman Paerschke
317	317	0	Carsten Wiedenhöfer
318	318	0	Robert Koppler
319	319	0	Christoph Klawiter
320	320	0	Alireza Naderi
321	321	0	Thomas Wurm Jr
322	322	0	Pawel Rybak
323	323	308185	Apex Racing Team  99
324	324	265442	Apex Racing Team  98
325	325	323482	Drago Racing 169
326	326	307424	Grid-and-Go.com VC  002
327	327	374518	Simufy eSports $11
328	328	315672	DRAGO RACING
329	329	330230	Apex Racing Team  198
330	330	215382	EFFECT SIMULATIONS  909
331	331	198757	Williams Esports Academy
332	332	70791	Moradness
333	333	241165	Team Redline 72
334	334	270801	Apex Racing Team  299
335	335	388818	WSR Esports ButtKicker $23
336	336	152878	MSS Mivano Azzurro
337	337	304083	BMW M Team Redline 20
338	338	316939	Williams Esports Academy
339	339	266746	Team PGZ 114
340	340	388886	Apex Racing Academy  97
341	341	236332	BMW M Team BS+COMPETITION
342	342	213540	BS+COMPETITION
110	110	310528	Dörr Esports White
111	111	288205	Moradness M Squad
112	112	115117	Williams Esports BenQ
113	113	368096	Team Redline 70
114	114	251182	Dörr Esports Blue
115	115	333543	Sontek Racing
116	116	316927	Williams Esports Academy
117	117	367539	DRAGO RACING 6
118	118	175130	HS Racing pain
119	119	226131	MAHLE RACING TEAM
120	120	340333	DeltaSport  2
121	121	316939	Williams Esports Academy LMP
122	122	198757	Williams Esports Academy
123	123	293317	Delinte eSports by TK
124	124	146866	Williams Esports Chillblast
125	125	368419	Team Redline 21
126	126	367541	DRAGO RACING 9
127	127	323482	DRAGO RACING 269
343	343	368419	Team Redline 71
344	344	388596	Delinte eSports by TK
345	345	302921	Deletraz Automotive by Majors Garage
346	346	115117	Williams Esports Racing Prodigy
347	347	384131	Apex Racing Academy  298
128	128	308185	Apex Racing Team  97
129	129	315672	DRAGO Hops Customs
130	130	318330	Apex Racing Team  99
131	131	213173	BS+CECCATO
132	132	322284	Grid-and-Go.com eSports  005
133	133	363205	Falken Simracing Team Blue
134	134	155811	Williams Esports Chillblast
135	135	240885	Race Clutch Blue
136	136	353429	Williams Esports Chillblast
137	137	266746	Team PGZ 114
138	138	126080	Simufy Esports $14
139	139	278790	SimRaceShop.de by GnG  001
140	140	348507	Simufy Esports
141	141	152878	Cube Controls Mivano  737
142	142	275072	VRS Coanda $8
143	143	314337	Falken Simracing Team Teal
144	144	241165	Team Redline 69
145	145	251802	FYRA SimSport
146	146	169791	Cube Controls Mivano  75
147	147	280151	VRS Coanda $118
148	148	270209	Race Clutch Black
149	149	111705	SCHERER eSPORT Yellow
150	150	317041	Grid-and-Go.com eSports  004
151	151	312401	Fiercely Forward Pink
152	152	329966	DRAGO RACING 169
153	153	307424	Virtualcoach.gg by GnG  002
154	154	247548	Williams Esports BenQ
155	155	236332	BMW M Team BS+COMPETITION
156	156	280149	VRS Coanda $18
157	157	265442	Apex Racing Team  98
158	158	304083	Team Redline 20
159	159	270215	Race Clutch Red
160	160	308085	TeamRedX.com Simsport 903
161	161	265490	Delta Racing
162	162	358799	Unity Racing by Venym  RED
163	163	190622	Final Bell Simracing Team RED
164	164	10045	AlpineEagleRacing
165	165	180836	Delta V Racing  4
166	166	202593	The Rolling Goat
167	167	301020	Delinte eSports by TK  66
168	168	367836	Apex One x KE
169	169	375283	Kuru Murad Racing
170	170	143514	Sham Racing
171	171	299031	Racing Republic
172	172	120449	NSR RED - SIM-PERFORMANCE.DK
173	173	339730	Abstract Gaming x SARTxMC
174	174	266710	Orion Race Team  445
175	175	62098	JRT Stark Racing
176	176	134268	NJB Performance by Rennpixel.de
177	177	271488	Reverse Racing
178	178	283400	Torque Simsport White
179	179	370703	Pohl Sim Racing Gold
180	180	259313	IFR eSports
181	181	291091	Composite Performance 77
182	182	173009	Neon Nights Miami
183	183	196493	Finnish Endurance Academy Blue
184	184	206847	Spectre Six
185	185	270114	jD SimRacing  144
186	186	148181	ugly  racing
187	187	229636	Escuadrón Psicomotriz
188	188	293638	IFR eSports Red
189	189	106162	Wizards Team FE
190	190	210977	Colourshock Racing Team
191	191	275996	Olympus eSports Atlas
192	192	91511	Three Oceans Racing
193	193	209138	M J Downforce
194	194	119364	W2 e-ProGP
195	195	323720	TM Motorsport Gold Team
196	196	339602	SimRace Sweden eSports
197	197	308344	Valkyrie Exype  777
198	198	371060	Patagonia Samurai eRacing  2
199	199	350148	NOMAD Academy 281
200	200	149181	Sapphire SimSport Alpha
201	201	290777	Protech Motorsport
202	202	79442	Zecarul eSports
203	203	249054	KAP Racing eSports
204	204	46113	Pure Motorsport White
205	205	137687	Obsidian Edge Black
206	206	318311	IFR eSports Blue
207	207	214818	Team Coach22  Blue
208	208	289961	TeamRedX.com Simsport 902
348	348	269963	Beckham Jacir fan club
349	349	388296	WSR Esports ButtKicker $223
350	350	270209	Race Clutch Black
351	351	247548	Williams Esports BenQ
352	352	361929	Simufy eSports LMP2
353	353	289962	Team PGZ 124
354	354	374517	Team Redline 70
355	355	92922	Williams Esports Chillblast
356	356	388877	Team Redline 21
357	357	270215	Race Clutch Red
358	358	291444	Team PGZ 119
359	359	314337	Falken Simracing Team
360	360	388879	WSR Esports ButtKicker $123
361	361	213173	BS+COMPETITION
362	362	213170	BS+TURNER
363	363	322284	Grid-and-Go.com VC  001
364	364	146866	Williams Esports PitFit
365	365	226131	MAHLE RACING TEAM
366	366	348506	Simufy Esports  22
367	367	294177	MAG-Performance SRT
368	368	375045	MAG-Performance  Red
369	369	155811	Williams Gaming Club
370	370	365576	Apex Racing Team  199
371	371	383869	Team PGZ 129
420	420	280685	Fiercely Forward Gold
421	421	309616	Greek Freaks Racing
422	422	322284	Grid-and-Go.com VC  001
423	423	307424	Grid-and-Go.com VC  002
424	424	392765	Team 86
425	425	367538	Grid-and-Go.com VC  004
426	426	392752	BRRT BRRT it s the Ford
427	427	259313	IFR eSports
428	428	279416	Fiercely Forward Blue
429	429	364266	Tatum x Vesta US
430	430	215382	EFFECT SIMULATIONS  909
431	431	308296	Voracious Racing Team  314
432	432	80235	HydroRace Geodesic Racing
433	433	247548	Williams Esports PitFit
434	434	392858	Gederne
435	435	323482	DRAGO RACING 069
436	436	363544	WSR Esports Buttkicker $123
437	437	115117	Williams Esports Racing Prodigy
438	438	383869	Team PGZ 114
439	439	265609	ST Racing Esports - Blue
440	440	388187	Greek Freaks Racing  77
441	441	126080	Simufy eSports
442	442	312401	Fiercely Forward Pink
443	443	375045	MAG - Performance SRT
444	444	388818	WSR Esports ButtKicker $223
445	445	379114	Simracing.school
446	446	201817	Maniti Racing Red
447	447	144391	Fiercely Forward Yellow
448	448	317041	Grid-and-Go.com VC  003
449	449	310610	Dörr Esports Academy
450	450	302921	Deletraz Automotive by Majors Garage
451	451	136829	Impulse Racing by WaldherrArt $257
452	452	314667	Fiercely Forward Purple
453	453	333551	Project Valorous $551
454	454	297930	BOUTSEN VDS by UNDERCUT  SILVER
455	455	392493	WSR Esports ButtKicker $23
456	456	320750	Live-SimRacing Arnage
457	457	337668	WOR x JSM Motorsport
458	458	310531	LionGP - fenster.com
459	459	361456	Parnell Racing
460	460	392755	ST Racing Esports - Pink
461	461	305113	Genus Vincere GT3
462	462	314337	Falken Simracing Team
463	463	368095	Apex Racing Academy  99
464	464	349973	MAG - Performance SRT
465	465	310528	Dörr Esports
466	466	392287	WSR Esports ButtKicker $323
467	467	347663	FRIC SimRacing
468	468	307896	Valkyrie Exype Simucube series
469	469	220604	Push n Box Orange
470	470	222752	SRP team (simracing-pro.com)
471	471	207971	Nordic Racing
472	472	28630	Team Heusinkveld  248
473	473	240459	Ultimate Giga Chads Dream Team
474	474	391923	Underdriving Underperforming
475	475	296837	BENSO Racing  888
476	476	393999	Karlistos Racing Team
477	477	187018	Team RaYcing CYAN
478	478	350312	Addicted Racing Crew  046
479	479	393642	CL team Norway
480	480	173844	Spin n Tow Motorsport Gold
481	481	247213	Scuderia Volpe by P1Sim
482	482	339308	Fast Lane
483	483	124122	DensuSimRacing Rainbow
484	484	364948	chasing charlie
485	485	283565	Blame the Setup
486	486	232182	SWRZ
487	487	363282	Team Kuksa
488	488	295984	GMF Team
489	489	214793	3rd class SimRacer (Kaliméra)
490	490	143359	CORE MOTORSPORTS
491	491	339112	GTrs - The Racing Spirit - DVA
492	492	310922	STK e-Racing Team GT  969
493	493	302694	Biggart
494	494	268600	921 Racing
495	495	219516	Scuderia Volpe By BLP
496	496	330431	Absolute Motorsport Acelith
497	497	169598	MurphDog Motorsports
498	498	209138	M J Downforce
499	499	333750	PRG x Mazda Motorsports
500	500	288378	WR Brasil
501	501	92660	Spin n Tow Motorsport
502	502	315332	Gandzia Racing Team
503	503	59866	GermanSimRacing  Purple
504	504	235714	Team Gerard Sardeny Saez
505	505	217284	I.S.A. AUTO
506	506	333552	Project Valorous $552
507	507	90869	Impulse Racing $68
508	508	298950	THLF eSports Eurasia
509	509	288863	Asturias Racing
510	510	104487	XVR Sim-Racing
511	511	350552	Fast Lane Black
512	512	350020	Melanzani Racing by Voltronic 01
513	513	174639	GetPole Racing  FFF
514	514	371352	Team Emiliano Russo Ybarra
515	515	281815	Scuderia Tempesta Rosa  097
516	516	383579	XBD Racing GT3
517	517	322651	Team RaYcing PURPLE
518	518	339060	RPM Racing Black
519	519	320598	WSR Esports ButtKicker - Fergy
520	520	324212	Sam Edwards Racing
521	521	251163	Melanzani Racing by Voltronic 03
522	522	349705	DarkSide SimRacing 2kB
523	523	366231	Unity
524	524	343969	GTT
525	525	247494	eLerium e-sports
526	526	322383	Full Cabaré Racing
527	527	20034	AlpineEagleRacing  127
528	528	228896	Hexagon SimRacing 1-4
529	529	335304	W S e-Motorsport
530	530	164718	Coanda Esports
531	531	341406	Team Nasichi
532	532	17747	Hexagon SimRacing 5
533	533	22831	Team Marcel Huwyler
534	534	399355	Coma Racing 2
535	535	63580	AlpineEagleRacing Xmas
536	536	184607	CGC-Rennsport Purple
537	537	197445	Turtle Power Racing
538	538	318423	Entropy eRacing
539	539	223758	Turtle Power Racing Bravo
540	540	63719	Team RSO
541	541	385965	VRL Performance Chefsache
542	542	385808	Team Marc Landskron
543	543	13077	Coma Racing
544	544	232182	team swrz
545	545	42762	Sionis racing
546	546	21600	PROsport SimRacing   Red
547	547	331682	Eagle Motorsports
548	548	0	Damien Viry
549	549	0	Corentin Guinez
550	550	0	Florian Bodin
551	551	0	Theodor Bergersen
552	552	0	Fernando Antolí Busquets
553	553	0	Enrico Trenti
554	554	0	Jamie Fluke
555	555	0	Jamie Christison
556	556	0	Damon Woods
557	557	0	Eric Neu
558	558	0	Francis Mcginn
559	559	0	Brandon Roseborough
560	560	0	Sven-Ole Haase
561	561	0	Lucas Taelman
562	562	0	Jan Sentkowski
563	563	0	Ayhancan Guven
564	564	0	Pablo Araujo Castro
565	565	0	Yurica Kasdorp
566	566	0	Dylan Birse
567	567	0	Kevin Desnoyers
568	568	0	Timo Heyden
569	569	0	Pascal Stix
570	570	0	Teemu Myllykangas
571	571	0	Filipe RC Barreto
572	572	0	Kody Deith
573	573	0	Erick Goldner
574	574	0	Gonzalo Fabi
575	575	0	Ivan Machado Perez
576	576	0	Dario Frattini
577	577	0	Olivier Piatek
578	578	0	Aaron Lopez2
579	579	0	Claudio Mack
580	580	0	Theodor Jensen
581	581	0	Vladislav T Shopov
582	582	0	Matias Penttilä
583	583	0	Szilard Nagy
584	584	0	Logan McKinzie
585	585	0	Daniel W Harris
586	586	0	Patrick Hingston
587	587	0	Chris Beets
588	588	0	Gaël Valero
589	589	0	Agustín Fernandez
590	590	0	Norbert Leitner
591	591	0	Nils Koch
592	592	0	Austin J Young
593	593	0	Benjamin Caura
594	594	0	Alex Ardoin
595	595	0	Konstantin Stolzenburg
596	596	0	Byron Pearce
597	597	0	Daniel Lomba
598	598	0	Kevin Dauguet
599	599	0	Nick Thissen
600	600	0	Miguel M Freitas
601	601	0	Alberto Senao
602	602	0	Christian Steenburgh
603	603	0	DJ Alessandrini
604	604	0	Jon Boetefuer
605	605	0	Alexander Peregrina
606	606	0	Jack Sedgwick
607	607	0	Carlos Mouesca
608	608	80235	HydroRace Geodesic Racing
609	609	390828	CrowdStrike Racing
610	610	259313	IFR eSports
611	611	241165	Team Redline 169
612	612	375045	MAG - Performance SRT
613	613	401318	Grid-and-Go.com eSports  007
614	614	329966	DRAGO RACING 6
615	615	92922	Williams Esports Chillblast
616	616	316927	Williams Esports Academy LMDH
617	617	318666	Fiercely Forward Silver
618	618	226131	MAHLE RACING TEAM
619	619	266746	PGZ x P1doks.com
620	620	236332	BMW M Team BS+COMPETITION
621	621	213540	BS+SUNSET
622	622	310528	Dörr Esports GTP
623	623	384654	SOELPEC Precision Racing  160
624	624	404233	Scuderia Ferrari HP Esports Team
625	625	312401	Fiercely Forward Pink
626	626	190914	EFFECT SIMULATIONS  908
627	627	115117	Williams Esports Racing Prodigy
628	628	401317	Grid-and-Go.com eSports  005
629	629	301277	INET Motorsport BLUE
630	630	215382	EFFECT SIMULATIONS  909
631	631	405462	Veloce Thrustmaster
632	632	60606	ZENNITH ESPORTS
633	633	143360	Fiercely Forward Red
634	634	401669	SZESE E-Sport
635	635	126080	Simufy eSports
636	636	305380	Grid-and-Go.com eSports  002
637	637	169791	Mivano Rosso
638	638	290239	Grid-and-Go.com eSports  004
639	639	323482	DRAGO RACING 269
640	640	401320	Grid-and-Go.com eSports  006
641	641	213173	BS+COMPETITION
642	642	365576	Apex Racing Team  199
643	643	374517	Team Redline 171
644	644	366927	Scuderia Ferrari HP Esports Team
645	645	157941	Grid-and-Go.com eSports  003
646	646	278936	Apex Racing Team  99
647	647	281393	SCHERER eSPORT Blue
648	648	198757	Williams Esports Academy LMP2
649	649	160824	SimRC
650	650	304083	BMW M Team Redline 20
651	651	314337	Dörr Esports GTD
652	652	302921	Deletraz Automotive by Majors Garage
653	653	367539	Drago Racing 069
654	654	401316	Grid-and-Go.com eSports  001
655	655	286871	SCHERER eSPORT
656	656	368276	WSR Esports Abruzzi $223
657	657	308296	Voracious Racing Team  314
658	658	315672	DRAGO RACING 9
659	659	339015	INSTINCT x Mechanic Racing
660	660	280685	Fiercely Forward Gold
661	661	388818	WSR Esports Next Level Racing $123
662	662	316939	Williams Esports Academy
663	663	155811	Williams Gaming Club
664	664	363205	Falken Simracing Team
665	665	140451	Apex Racing Team  299
666	666	392493	WSR Esports ButtKicker $23
667	667	69049	Team Heusinkveld  101
668	668	305380	Grid-and-Go.com eSports  002
669	669	363205	Falken Simracing Team Green
670	670	355249	Altitude FreeM Esports  111
671	671	272212	Sabelt ESPORTS  91
672	672	388818	WSR Esports Next Level Racing $123
673	673	115117	Williams Esports Racing Prodigy
674	674	405462	Veloce Thrustmaster  25
675	675	366927	Scuderia Ferrari HP Esports Team
676	676	401317	Grid-and-Go.com eSports  005
677	677	279416	Fiercely Forward Blue
678	678	69048	Team Heusinkveld  35
679	679	334586	Team Redline 71
680	680	354126	Simufy eSports $133
681	681	394821	Falken Simracing Team Red
682	682	401670	SZESE E-Sport Green
683	683	411919	Porsche Coanda $91
684	684	266746	PGZ x P1doks.com
685	685	339308	Fast Lane RT
686	686	329966	DRAGO RACING  9
687	687	384654	SOELPEC Precision Racing  160
688	688	401316	Grid-and-Go.com eSports  001
689	689	280685	Fiercely Forward Gold
690	690	280149	Coanda Esports $18
691	691	280151	Coanda Esports $8
692	692	348507	Simufy Esports $11
693	693	307424	Grid-and-Go.com eSports  006
694	694	413271	Team Redline 72
695	695	236332	BMW M Team BS+COMPETITION
696	696	126080	Simufy eSports $14
697	697	323482	DRAGO RACING  6
698	698	411998	Porsche Coanda $92
699	699	226131	MAHLE RACING TEAM
700	700	289724	WSR Esports ButtKicker $23
701	701	390726	Falken Simracing Team Yellow
702	702	247548	Williams Esports PitFit
703	703	157941	Grid-and-Go.com eSports  003
704	704	367539	DRAGO RACING  069
705	705	280433	Apex Racing Team  98
706	706	401667	SZESE E-Sport White
707	707	213540	BS+COMPETITION
708	708	60606	Zennith Esports
709	709	315672	DRAGO RACING  96
710	710	375045	MAG - Performance BLACK
711	711	111704	SCHERER eSPORT
712	712	290239	Grid-and-Go.com eSports  004
713	713	312401	Fiercely Forward Pink
714	714	310528	Dörr Esports
715	715	318327	Apex Racing Team  99
716	716	241165	Team Redline 70
717	717	392858	VELOCE THRUSTMASTER  35
\.


--
-- Data for Name: car_state_proto; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.car_state_proto (id, rs_info_id, protodata) FROM stdin;
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.event (id, event_key, name, description, event_time, racelogger_version, team_racing, multi_class, num_car_types, num_car_classes, ir_session_id, track_id, pit_speed, replay_min_timestamp, replay_min_session_time, replay_max_session_time, sessions, ir_sub_session_id, tenant_id, tire_infos) FROM stdin;
4	1336293677b84a05a452d7e8b6679419	6 Hrs of the Glen	Top Split	2024-06-15 14:40:57.157754+02	0.11.2	t	t	14	3	240985229	434	64.37000274658203	2024-06-15 14:44:47.216094+02	327.26666259765625	22106.56640625	[{"name": "PRACTICE"}, {"num": 1, "name": "QUALIFY"}, {"num": 2, "name": "RACE"}]	0	1	\N
5	2c0946a2134b7bf42f8c6ea522a30d46	2024 Spa 24	2024 Spa 24 (Fecker/Jirak/Kolibal/Schaum)	2024-07-20 14:47:08.047269+02	0.12.0	t	f	10	1	244570692	165	60	2024-07-20 14:49:48.86468+02	211.56666564941406	86307.0234375	[{"name": "PRACTICE"}, {"num": 1, "name": "QUALIFY"}, {"num": 2, "name": "RACE"}]	0	1	\N
15	83211e5d888fe44e5c7863570923b3e1	Roar Before The 24	Top split 1200 GMT	2025-01-11 13:27:42.594275+01	0.18.0	f	t	11	3	261849777	192	87.9800033569336	2025-01-11 13:42:40.127317+01	202.11666870117188	8974.1669921875	[{"name": "PRACTICE", "type": 1, "session_time": 1800}, {"num": 1, "laps": 2, "name": "QUALIFY", "type": 3, "session_time": 480}, {"num": 2, "name": "RACE", "type": 5, "session_time": 8640}]	0	1	\N
8	8f56b6e1ee29afc02694a7c03a0db2bef	VRPC Sprint Zandvoort		2024-10-10 20:31:46.95456+02	1.0.0-DEV	f	f	2	1	252494973	485	60	1970-01-01 01:00:00+01	0	0	[{"name": "PRACTICE"}, {"num": 1, "name": "QUALIFY"}, {"num": 2, "name": "HEAT 1"}, {"num": 3, "name": "HEAT 2"}, {"num": 4, "name": "WARMUP"}, {"num": 5, "name": "FEATURE"}]	0	1	\N
12	0a7ecad1-5ccb-48e4-b0fd-c7a68c4d657e	Fuji 8h	Top split 1200 GMT	2024-11-16 13:06:10.525847+01	0.17.0	t	f	10	1	256419747	444	60	2024-11-16 13:42:24.416204+01	218.39999389648438	29138.150390625	[{"name": "PRACTICE", "type": 1, "session_time": 1800}, {"num": 1, "laps": 2, "name": "QUALIFY", "type": 3, "session_time": 480}, {"num": 2, "name": "RACE", "type": 5, "session_time": 28800}]	0	1	\N
10	dda5602f46cb01e23e4050f04938a947	Petit Le Mans 2024	Top split 1200 UTC	2024-10-19 14:41:53.174021+02	0.16.0	t	t	15	3	253429068	127	72	2024-10-19 14:43:33.081486+02	286.2166748046875	36381.6171875	[{"name": "PRACTICE", "type": 1, "session_time": 1800}, {"num": 1, "laps": 2, "name": "QUALIFY", "type": 3, "session_time": 480}, {"num": 2, "name": "RACE", "type": 5, "session_time": 36000}]	0	1	\N
9	8f56b6e1ee29afc02694a7c03a0db2be	VRPC Main Zandvoort		2024-10-10 21:06:22.334373+02	1.0.0-DEV	f	f	2	1	252494973	485	60	1970-01-01 01:00:00+01	0	0	[{"name": "PRACTICE"}, {"num": 1, "name": "QUALIFY"}, {"num": 2, "name": "HEAT 1"}, {"num": 3, "name": "HEAT 2"}, {"num": 4, "name": "WARMUP"}, {"num": 5, "name": "FEATURE"}]	0	1	\N
17	821d2d55-a6cc-42db-8c2a-5bc4d2697172	Bathurst 12 Hour	Top Split 1200 GMT	2025-02-22 13:21:18.901047+01	0.20.0	t	f	11	1	266372293	219	50	2025-02-22 13:42:21.683037+01	180.78334045410156	43620.234375	[{"name": "PRACTICE", "type": 1, "session_time": 1800}, {"num": 1, "laps": 2, "name": "QUALIFY", "type": 3, "session_time": 480}, {"num": 2, "name": "RACE", "type": 5, "session_time": 43200}]	75059018	1	\N
13	487f8ce9fa7eb564f66ded2c3690ea7e	GT Endurance	Testrecording	2024-11-24 18:11:14.335083+01	0.18.0	t	f	10	1	257333275	95	72	2024-11-24 18:17:54.170332+01	356.0833435058594	11334.25	[{"name": "PRACTICE", "type": 1, "session_time": 180}, {"num": 1, "laps": 2, "name": "QUALIFY", "type": 3, "session_time": 480}, {"num": 2, "name": "RACE", "type": 5, "session_time": 10800}]	0	1	\N
14	cfdcac46db17ee6de72353bedaabed5f	VR e.V. Christmas 500	Special multicar event	2024-12-27 17:35:37.422558+01	0.18.0	t	f	4	1	260231790	525	72	2024-12-27 17:39:43.845204+01	263.6333312988281	12993.4833984375	[{"name": "PRACTICE", "type": 1, "session_time": 7200}, {"num": 1, "name": "QUALIFY", "type": 2, "session_time": 1800}, {"num": 2, "laps": 72, "name": "RACE", "type": 5, "session_time": 16200}]	0	1	\N
16	257f71339e32c494ea4dd80c08b989f7	Daytona 24	Top split 1200 GMT	2025-01-18 13:42:14.56755+01	0.18.0	t	t	17	3	262604776	192	87.9800033569336	2025-01-18 13:43:21.280417+01	210.60000610351562	86740.015625	[{"name": "PRACTICE", "type": 1, "session_time": 1800}, {"num": 1, "laps": 2, "name": "QUALIFY", "type": 3, "session_time": 480}, {"num": 2, "name": "RACE", "type": 5, "session_time": 86400}]	0	1	\N
\.


--
-- Data for Name: event_ext; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.event_ext (event_id, extra_info) FROM stdin;
4	{"pit_info": {"exit": 0.040652134, "entry": 0.9533058, "lane_length": 472.54376}}
8	{"pit_info": {"exit": 0.039575685, "entry": 0.5253491, "lane_length": 2164.894}}
9	{"pit_info": {"exit": 0.03719135, "entry": 0.03719117, "lane_length": 0.00075280666}}
10	{"pit_info": {"exit": 0.08830483, "entry": 0.9851886, "lane_length": 418.6519}}
13	{"pit_info": {"exit": 0.048121233, "entry": 0.9727582, "lane_length": 436.35208}}
14	{"pit_info": {"exit": 0.14373602, "entry": 0.9877294, "lane_length": 1081.1261}}
15	{"pit_info": {"exit": 0.09861686, "entry": 0.96615046, "lane_length": 753.7338}}
16	{"pit_info": {"exit": 0.09851404, "entry": 0.040147044, "lane_length": 332.10822}}
17	{"pit_info": {"exit": 0.05036382, "entry": 0.0012403915, "lane_length": 301.61786}}
\.


--
-- Data for Name: msg_state_proto; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.msg_state_proto (id, rs_info_id, protodata) FROM stdin;
\.


--
-- Data for Name: race_state_proto; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.race_state_proto (id, rs_info_id, protodata) FROM stdin;
\.


--
-- Data for Name: rs_info; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.rs_info (id, event_id, record_stamp, session_time, time_of_day, air_temp, track_temp, track_wetness, precipitation, session_num) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.schema_migrations (version, dirty) FROM stdin;
7	f
\.


--
-- Data for Name: speedmap_proto; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.speedmap_proto (id, rs_info_id, protodata) FROM stdin;
\.


--
-- Data for Name: tenant; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.tenant (id, external_id, name, api_key, active) FROM stdin;
1	0c131495-7898-4892-8d29-845dffa4fb7c	default	402e1ccf54c28c1cddff2754dad03d23d944268b071813391bab964b3fd42566	t
\.


--
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.track (id, name, short_name, config, track_length, sectors, pit_speed, pit_entry, pit_exit, pit_lane_length) FROM stdin;
127	Road Atlanta	Road Atlanta	Full Course	4060	[{}, {"num": 1, "start_pct": 0.167875}, {"num": 2, "start_pct": 0.442307}, {"num": 3, "start_pct": 0.787105}]	0	0.9853200316429138	0.08843293786048889	418.6383972167969
345	Circuit de Barcelona-Catalunya	Barcelona	Full Course	4570	[{}, {"num": 1, "start_pct": 0.343873}, {"num": 2, "start_pct": 0.722794}]	0	0.989805281162262	0.07001013308763504	366.5361633300781
165	Circuit de Spa-Francorchamps	Spa	Endurance	6930	[{}, {"num": 1, "start_pct": 0.310613}, {"num": 2, "start_pct": 0.522299}, {"num": 3, "start_pct": 0.692902}, {"num": 4, "start_pct": 0.931096}]	60	0.9878518581390381	0.14430426061153412	1084.2152099609375
219	Mount Panorama Circuit	Bathurst		6140	[{}, {"num": 1, "start_pct": 0.181861}, {"num": 2, "start_pct": 0.360013}, {"num": 3, "start_pct": 0.52112}, {"num": 4, "start_pct": 0.595056}, {"num": 5, "start_pct": 0.829202}]	0	0.0011994679225608706	0.05038594827055931	302.0049743652344
239	Autodromo Nazionale Monza	Monza Full		5750	[{}, {"num": 1, "start_pct": 0.345492}, {"num": 2, "start_pct": 0.475864}, {"num": 3, "start_pct": 0.657524}, {"num": 4, "start_pct": 0.853068}]	0	0.9825570583343506	0.05764971673488617	431.78277587890625
229	Circuit of the Americas	COTA	Grand Prix	5410	[{}, {"num": 1, "start_pct": 0.191623}, {"num": 2, "start_pct": 0.425879}, {"num": 3, "start_pct": 0.649817}]	0	0.9957528114318848	0.07206349074840546	412.8407897949219
341	Silverstone Circuit	Silverstone	Arena Grand Prix	5800	[{}, {"num": 1, "start_pct": 0.134735}, {"num": 2, "start_pct": 0.293053}, {"num": 3, "start_pct": 0.609174}, {"num": 4, "start_pct": 0.830708}]	0	0.9423061013221741	0.06548073887825012	714.4129028320312
163	Circuit de Spa-Francorchamps	Spa	Grand Prix Pit	6930	[{}, {"num": 1, "start_pct": 0.310613}, {"num": 2, "start_pct": 0.522299}, {"num": 3, "start_pct": 0.692902}, {"num": 4, "start_pct": 0.931096}]	0	0.9877581596374512	0.04338998347520828	385.5285339355469
106	Watkins Glen	Watkins	Cup	3900	[{}, {"num": 1, "start_pct": 0.41428}, {"num": 2, "start_pct": 0.771016}]	0	0.9416868686676025	0.05235389247536659	431.60137939453125
212	Autódromo José Carlos Pace	Interlagos	Grand Prix	4220	[{}, {"num": 1, "start_pct": 0.278071}, {"num": 2, "start_pct": 0.431505}, {"num": 3, "start_pct": 0.609232}, {"num": 4, "start_pct": 0.725358}]	0	0.00023069234157446772	0.06967119872570038	293.0389404296875
18	Road America	Road America	Full Course	6410	[{}, {"num": 1, "start_pct": 0.143086}, {"num": 2, "start_pct": 0.326681}, {"num": 3, "start_pct": 0.478771}, {"num": 4, "start_pct": 0.760854}, {"num": 5, "start_pct": 0.865939}]	0	0.9601155519485474	0.051568493247032166	586.21337890625
266	Autodromo Enzo e Dino Ferrari	Imola Full		4860	[{}, {"num": 1, "start_pct": 0.238799}, {"num": 2, "start_pct": 0.417892}, {"num": 3, "start_pct": 0.6445}, {"num": 4, "start_pct": 0.778207}]	0	0.9325642585754395	0.04621968790888786	552.3653564453125
199	Zolder Circuit	Zolder	Grand Prix	3950	[{}, {"num": 1, "start_pct": 0.400444}, {"num": 2, "start_pct": 0.541846}, {"num": 3, "start_pct": 0.720842}, {"num": 4, "start_pct": 0.871049}]	0	0.9499630928039551	0.07017277181148529	474.8282470703125
403	Red Bull Ring	Spielberg	Grand Prix	4280	[{}, {"num": 1, "start_pct": 0.271918}, {"num": 2, "start_pct": 0.668198}]	0	0.982345461845398	0.06599727272987366	358.0297546386719
390	Hockenheimring Baden-Württemberg	Hockenheim-Ring	Grand Prix	4530	[{}, {"num": 1, "start_pct": 0.225832}, {"num": 2, "start_pct": 0.707461}]	0	0.9875652194023132	0.05711817741394043	315.07489013671875
95	Sebring International Raceway	Sebring	International	5790	[{}, {"num": 1, "start_pct": 0.130902}, {"num": 2, "start_pct": 0.3069}, {"num": 3, "start_pct": 0.44224}, {"num": 4, "start_pct": 0.53158}, {"num": 5, "start_pct": 0.658844}, {"num": 6, "start_pct": 0.876665}]	72	0.9728086590766907	0.0481458343565464	436.2022399902344
168	Suzuka International Racing Course	Suzuka	Grand Prix	5750	[{}, {"num": 1, "start_pct": 0.175453}, {"num": 2, "start_pct": 0.371582}, {"num": 3, "start_pct": 0.477953}, {"num": 4, "start_pct": 0.624897}, {"num": 5, "start_pct": 0.814373}]	80	0.9943236112594604	0.06321115046739578	396.1033630371094
255	Nürburgring Grand Prix No Chicane	GP No Chicane		5070	[{}, {"num": 1, "start_pct": 0.283763}, {"num": 2, "start_pct": 0.432067}, {"num": 3, "start_pct": 0.63701}, {"num": 4, "start_pct": 0.843575}]	0	0.9878153800964355	0.06213068962097168	376.77862548828125
192	Daytona International Speedway	Daytona	Road Course	5690	[{}, {"num": 1, "start_pct": 0.137196}, {"num": 2, "start_pct": 0.273519}, {"num": 3, "start_pct": 0.353413}, {"num": 4, "start_pct": 0.630555}]	87.98	0.9660395979881287	0.09857510775327682	754.1270751953125
434	Watkins Glen	Watkins	Boot	5410	[{}, {"num": 1, "start_pct": 0.298486}, {"num": 2, "start_pct": 0.47226}, {"num": 3, "start_pct": 0.68461}, {"num": 4, "start_pct": 0.838991}]	64.37	0.9532827734947205	0.040639787912368774	472.6014404296875
268	Circuit des 24 Heures du Mans	24 Heures		13550	[{}, {"num": 1, "start_pct": 0.130304}, {"num": 2, "start_pct": 0.263124}, {"num": 3, "start_pct": 0.408216}, {"num": 4, "start_pct": 0.530068}, {"num": 5, "start_pct": 0.686259}, {"num": 6, "start_pct": 0.815876}]	60	0	0	0
485	Circuit Zandvoort	Zandvoort	Grand Prix	4210	[{}, {"num": 1, "start_pct": 0.355549}, {"num": 2, "start_pct": 0.698221}]	60	0.99347293	0.049316563	235.10168
444	Fuji Speedway	Fuji	Grand Prix	4480	[{}, {"num": 1, "start_pct": 0.314079}, {"num": 2, "start_pct": 0.677624}]	60	0.9919880032539368	0.100249744951725	485.0126037597656
525	Circuit de Spa-Francorchamps	Spa	Endurance	6930	[{}, {"num": 1, "start_pct": 0.313074}, {"num": 2, "start_pct": 0.522863}, {"num": 3, "start_pct": 0.723112}]	72	0.9877293705940247	0.14373601973056793	1081.1260986328125
233	Donington Park Racing Circuit	Donington	Grand Prix	3940	[{}, {"num": 1, "start_pct": 0.237986}, {"num": 2, "start_pct": 0.495375}, {"num": 3, "start_pct": 0.794538}]	60	0.9781940579414368	0.04311241954565048	255.77835083007812
\.


--
-- Name: c_car_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.c_car_class_id_seq', 28, true);


--
-- Name: c_car_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.c_car_driver_id_seq', 1484, true);


--
-- Name: c_car_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.c_car_entry_id_seq', 717, true);


--
-- Name: c_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.c_car_id_seq', 105, true);


--
-- Name: c_car_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.c_car_team_id_seq', 717, true);


--
-- Name: car_state_proto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.car_state_proto_id_seq', 2606, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.event_id_seq', 17, true);


--
-- Name: msg_state_proto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.msg_state_proto_id_seq', 8360, true);


--
-- Name: race_state_proto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.race_state_proto_id_seq', 472510, true);


--
-- Name: rs_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.rs_info_id_seq', 472522, true);


--
-- Name: speedmap_proto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.speedmap_proto_id_seq', 15932, true);


--
-- Name: tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.tenant_id_seq', 1, true);


--
-- Name: track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.track_id_seq', 1, false);


--
-- Name: analysis_proto analysis_proto_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.analysis_proto
    ADD CONSTRAINT analysis_proto_pkey PRIMARY KEY (event_id);


--
-- Name: c_car_class c_car_class_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_class
    ADD CONSTRAINT c_car_class_pkey PRIMARY KEY (id);


--
-- Name: c_car_driver c_car_driver_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_driver
    ADD CONSTRAINT c_car_driver_pkey PRIMARY KEY (id);


--
-- Name: c_car_entry c_car_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_entry
    ADD CONSTRAINT c_car_entry_pkey PRIMARY KEY (id);


--
-- Name: c_car c_car_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car
    ADD CONSTRAINT c_car_pkey PRIMARY KEY (id);


--
-- Name: c_car_team c_car_team_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_team
    ADD CONSTRAINT c_car_team_pkey PRIMARY KEY (id);


--
-- Name: car_state_proto car_state_proto_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.car_state_proto
    ADD CONSTRAINT car_state_proto_pkey PRIMARY KEY (id);


--
-- Name: event event_event_key_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_event_key_key UNIQUE (event_key);


--
-- Name: event_ext event_ext_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.event_ext
    ADD CONSTRAINT event_ext_pkey PRIMARY KEY (event_id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: msg_state_proto msg_state_proto_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.msg_state_proto
    ADD CONSTRAINT msg_state_proto_pkey PRIMARY KEY (id);


--
-- Name: race_state_proto race_state_proto_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.race_state_proto
    ADD CONSTRAINT race_state_proto_pkey PRIMARY KEY (id);


--
-- Name: rs_info rs_info_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.rs_info
    ADD CONSTRAINT rs_info_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: speedmap_proto speedmap_proto_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.speedmap_proto
    ADD CONSTRAINT speedmap_proto_pkey PRIMARY KEY (id);


--
-- Name: tenant tenant_api_key_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT tenant_api_key_unique UNIQUE (api_key);


--
-- Name: tenant tenant_external_id_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT tenant_external_id_unique UNIQUE (external_id);


--
-- Name: tenant tenant_name_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT tenant_name_unique UNIQUE (name);


--
-- Name: tenant tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT tenant_pkey PRIMARY KEY (id);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);


--
-- Name: car_proto_rs_info_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX car_proto_rs_info_idx ON public.car_state_proto USING btree (rs_info_id);


--
-- Name: msg_proto_rs_info_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX msg_proto_rs_info_idx ON public.msg_state_proto USING btree (rs_info_id);


--
-- Name: race_state_rs_info_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX race_state_rs_info_idx ON public.race_state_proto USING btree (rs_info_id);


--
-- Name: rs_info_event_id_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX rs_info_event_id_idx ON public.rs_info USING btree (event_id);


--
-- Name: speedmap_proto_rs_info_idx; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX speedmap_proto_rs_info_idx ON public.speedmap_proto USING btree (rs_info_id);


--
-- Name: analysis_proto analysis_proto_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.analysis_proto
    ADD CONSTRAINT analysis_proto_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: c_car_class c_car_class_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_class
    ADD CONSTRAINT c_car_class_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: c_car c_car_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car
    ADD CONSTRAINT c_car_class_id_fkey FOREIGN KEY (c_car_class_id) REFERENCES public.c_car_class(id);


--
-- Name: c_car_driver c_car_driver_car_entry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_driver
    ADD CONSTRAINT c_car_driver_car_entry_id_fkey FOREIGN KEY (c_car_entry_id) REFERENCES public.c_car_entry(id);


--
-- Name: c_car_entry c_car_entry_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_entry
    ADD CONSTRAINT c_car_entry_car_id_fkey FOREIGN KEY (c_car_id) REFERENCES public.c_car(id);


--
-- Name: c_car_entry c_car_entry_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_entry
    ADD CONSTRAINT c_car_entry_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: c_car c_car_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car
    ADD CONSTRAINT c_car_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: c_car_team c_car_team_car_entry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.c_car_team
    ADD CONSTRAINT c_car_team_car_entry_id_fkey FOREIGN KEY (c_car_entry_id) REFERENCES public.c_car_entry(id);


--
-- Name: car_state_proto car_state_proto_rs_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.car_state_proto
    ADD CONSTRAINT car_state_proto_rs_info_id_fkey FOREIGN KEY (rs_info_id) REFERENCES public.rs_info(id);


--
-- Name: event_ext event_ext_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.event_ext
    ADD CONSTRAINT event_ext_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: event event_tenant_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_tenant_id_fk FOREIGN KEY (tenant_id) REFERENCES public.tenant(id);


--
-- Name: event event_track_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.track(id);


--
-- Name: msg_state_proto msg_state_proto_rs_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.msg_state_proto
    ADD CONSTRAINT msg_state_proto_rs_info_id_fkey FOREIGN KEY (rs_info_id) REFERENCES public.rs_info(id);


--
-- Name: race_state_proto race_state_proto_rs_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.race_state_proto
    ADD CONSTRAINT race_state_proto_rs_info_id_fkey FOREIGN KEY (rs_info_id) REFERENCES public.rs_info(id);


--
-- Name: rs_info rs_info_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.rs_info
    ADD CONSTRAINT rs_info_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: speedmap_proto speedmap_proto_rs_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.speedmap_proto
    ADD CONSTRAINT speedmap_proto_rs_info_id_fkey FOREIGN KEY (rs_info_id) REFERENCES public.rs_info(id);


--
-- PostgreSQL database dump complete
--

