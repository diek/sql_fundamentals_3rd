--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.20
-- Dumped by pg_dump version 12.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- Name: l_constants; Type: TABLE; Schema: public; Owner: derrick
--

CREATE TABLE public.l_constants (
    business_name character varying(30),
    business_start_date date,
    lunch_budget money,
    owner_name character varying(30)
);


ALTER TABLE public.l_constants OWNER TO derrick;

--
-- Name: l_departments; Type: TABLE; Schema: public; Owner: derrick
--

CREATE TABLE public.l_departments (
    dept_code character varying(3) NOT NULL,
    department_name character varying(30)
);


ALTER TABLE public.l_departments OWNER TO derrick;

--
-- Name: l_employees; Type: TABLE; Schema: public; Owner: derrick
--

CREATE TABLE public.l_employees (
    employee_id smallint NOT NULL,
    first_name character varying(10) NOT NULL,
    last_name character varying(20) NOT NULL,
    dept_code character varying(3) NOT NULL,
    hire_date date,
    credit_limit money,
    phone_number character varying(4),
    manager_id smallint,
    CONSTRAINT nn_l_employees_first_name CHECK ((first_name IS NOT NULL)),
    CONSTRAINT nn_l_employees_last_name CHECK ((last_name IS NOT NULL))
);


ALTER TABLE public.l_employees OWNER TO derrick;

--
-- Name: l_employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: derrick
--

CREATE SEQUENCE public.l_employees_employee_id_seq
    START WITH 211
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.l_employees_employee_id_seq OWNER TO derrick;

--
-- Name: l_employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrick
--

ALTER SEQUENCE public.l_employees_employee_id_seq OWNED BY public.l_employees.employee_id;


--
-- Name: l_foods; Type: TABLE; Schema: public; Owner: derrick
--

CREATE TABLE public.l_foods (
    supplier_id character varying(3) NOT NULL,
    product_code character varying(2) NOT NULL,
    menu_item smallint,
    description character varying(20),
    price money,
    price_increase money,
    CONSTRAINT check_l_foods_price_max_price CHECK ((price < money(10.00)))
);


ALTER TABLE public.l_foods OWNER TO derrick;

--
-- Name: l_lunch_items; Type: TABLE; Schema: public; Owner: derrick
--

CREATE TABLE public.l_lunch_items (
    lunch_id smallint NOT NULL,
    item_number smallint NOT NULL,
    supplier_id character varying(3),
    product_code character varying(2),
    quantity smallint
);


ALTER TABLE public.l_lunch_items OWNER TO derrick;

--
-- Name: l_lunches; Type: TABLE; Schema: public; Owner: derrick
--

CREATE TABLE public.l_lunches (
    lunch_id smallint NOT NULL,
    lunch_date date,
    employee_id smallint NOT NULL,
    date_entered timestamp without time zone,
    CONSTRAINT nn_l_lunches_employee_id CHECK ((employee_id IS NOT NULL))
);


ALTER TABLE public.l_lunches OWNER TO derrick;

--
-- Name: l_lunches_lunch_id_seq; Type: SEQUENCE; Schema: public; Owner: derrick
--

CREATE SEQUENCE public.l_lunches_lunch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.l_lunches_lunch_id_seq OWNER TO derrick;

--
-- Name: l_lunches_lunch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrick
--

ALTER SEQUENCE public.l_lunches_lunch_id_seq OWNED BY public.l_lunches.lunch_id;


--
-- Name: l_suppliers; Type: TABLE; Schema: public; Owner: derrick
--

CREATE TABLE public.l_suppliers (
    supplier_id character varying(3) NOT NULL,
    supplier_name character varying(30)
);


ALTER TABLE public.l_suppliers OWNER TO derrick;

--
-- Name: seq_employee_id; Type: SEQUENCE; Schema: public; Owner: derrick
--

CREATE SEQUENCE public.seq_employee_id
    START WITH 211
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_employee_id OWNER TO derrick;

--
-- Name: seq_menu_item; Type: SEQUENCE; Schema: public; Owner: derrick
--

CREATE SEQUENCE public.seq_menu_item
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_menu_item OWNER TO derrick;

--
-- Name: l_employees employee_id; Type: DEFAULT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_employees ALTER COLUMN employee_id SET DEFAULT nextval('public.l_employees_employee_id_seq'::regclass);


--
-- Name: l_lunches lunch_id; Type: DEFAULT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_lunches ALTER COLUMN lunch_id SET DEFAULT nextval('public.l_lunches_lunch_id_seq'::regclass);


--
-- Data for Name: l_constants; Type: TABLE DATA; Schema: public; Owner: derrick
--

COPY public.l_constants (business_name, business_start_date, lunch_budget, owner_name) FROM stdin;
Citywide Uniforms	1998-06-01	$200.00	Susan Brown
\.


--
-- Data for Name: l_departments; Type: TABLE DATA; Schema: public; Owner: derrick
--

COPY public.l_departments (dept_code, department_name) FROM stdin;
ACT	Accounting
EXE	Executive
MKT	Marketing
PER	Personnel
SAL	Sales
SHP	Shipping
\.


--
-- Data for Name: l_employees; Type: TABLE DATA; Schema: public; Owner: derrick
--

COPY public.l_employees (employee_id, first_name, last_name, dept_code, hire_date, credit_limit, phone_number, manager_id) FROM stdin;
201	Susan	Brown	EXE	1998-06-01	$30.00	3484	\N
202	James	Kern	SAL	1999-08-16	$25.00	8722	201
203	Martha	Woods	SHP	2009-02-02	$25.00	7591	201
204	Ellen	Owens	SAL	2008-07-01	$15.00	6830	202
205	Henry	Perkins	SAL	2006-03-01	$25.00	5286	202
206	Carol	Rose	ACT	\N	\N	\N	\N
207	Dan	Smith	SHP	2008-12-01	$25.00	2259	203
208	Fred	Campbell	SHP	2008-04-01	$25.00	1752	203
209	Paula	Jacobs	MKT	1999-03-17	$15.00	3357	201
210	Nancy	Hoffman	SAL	2007-02-16	$25.00	2974	203
\.


--
-- Data for Name: l_foods; Type: TABLE DATA; Schema: public; Owner: derrick
--

COPY public.l_foods (supplier_id, product_code, menu_item, description, price, price_increase) FROM stdin;
ASP	FS	1	Fresh Salad	$2.00	$0.25
ASP	SP	2	Soup Of The Day	$1.50	\N
ASP	SW	3	Sandwich	$3.50	$0.40
CBC	GS	4	Grilled Steak	$6.00	$0.70
CBC	SW	5	Hamburger	$2.50	$0.30
FRV	BR	6	Broccoli	$1.00	$0.05
FRV	FF	7	French Fries	$1.50	\N
JBR	AS	8	Soda	$1.25	$0.25
JBR	VR	9	Coffee	$0.85	$0.15
VSB	AS	10	dessert	$3.00	$0.50
\.


--
-- Data for Name: l_lunch_items; Type: TABLE DATA; Schema: public; Owner: derrick
--

COPY public.l_lunch_items (lunch_id, item_number, supplier_id, product_code, quantity) FROM stdin;
1	1	ASP	FS	1
1	2	ASP	SW	2
1	3	JBR	VR	2
2	1	ASP	SW	2
2	2	FRV	FF	1
2	3	JBR	VR	2
2	4	VSB	AS	1
3	1	ASP	FS	1
3	2	CBC	GS	1
3	3	FRV	FF	1
3	4	JBR	VR	1
3	5	JBR	AS	1
4	1	ASP	SP	2
4	2	CBC	SW	2
4	3	FRV	FF	1
4	4	JBR	AS	2
6	1	ASP	SP	1
6	2	CBC	GS	1
6	3	FRV	FF	1
6	4	JBR	VR	2
6	5	VSB	AS	1
7	1	ASP	FS	1
7	2	ASP	SP	1
7	3	CBC	GS	1
7	4	JBR	VR	1
7	5	VSB	AS	1
8	1	ASP	FS	1
8	2	CBC	GS	1
8	3	JBR	AS	1
9	1	ASP	FS	1
9	2	ASP	SP	1
9	3	CBC	SW	2
9	4	FRV	FF	1
9	5	JBR	VR	1
9	6	JBR	AS	1
12	1	ASP	FS	1
12	2	CBC	GS	1
12	3	JBR	VR	2
12	4	VSB	AS	1
13	1	ASP	SP	2
13	2	ASP	SW	2
13	3	FRV	FF	1
13	4	JBR	AS	1
15	1	ASP	SP	1
15	2	CBC	GS	1
15	3	FRV	FF	1
15	4	JBR	AS	2
16	1	ASP	FS	1
16	2	ASP	SW	1
16	3	CBC	SW	1
16	4	JBR	VR	1
16	5	JBR	AS	1
17	1	ASP	SP	1
17	2	CBC	GS	1
17	3	FRV	FF	1
17	4	JBR	VR	2
17	5	VSB	AS	1
20	1	ASP	FS	1
20	2	ASP	SP	1
20	3	CBC	GS	1
20	4	FRV	FF	1
20	5	JBR	AS	1
21	1	ASP	SP	1
21	2	CBC	GS	1
21	3	JBR	VR	2
21	4	VSB	AS	1
22	1	ASP	FS	1
22	2	CBC	GS	1
22	3	FRV	FF	1
22	4	JBR	VR	1
22	5	JBR	AS	1
\.


--
-- Data for Name: l_lunches; Type: TABLE DATA; Schema: public; Owner: derrick
--

COPY public.l_lunches (lunch_id, lunch_date, employee_id, date_entered) FROM stdin;
1	2011-11-16	201	2011-10-13 10:35:24
2	2011-11-16	207	2011-10-13 10:35:39
3	2011-11-16	203	2011-10-13 10:35:45
4	2011-11-16	204	2011-10-13 10:35:58
6	2011-11-16	202	2011-10-13 10:36:41
7	2011-11-16	210	2011-10-13 10:38:52
8	2011-11-25	201	2011-10-14 11:15:37
9	2011-11-25	208	2011-10-14 14:23:36
12	2011-11-25	204	2011-10-14 15:02:53
13	2011-11-25	207	2011-10-18 08:42:11
15	2011-11-25	205	2011-10-21 16:23:50
16	2011-12-05	201	2011-10-21 16:23:59
17	2011-12-05	210	2011-10-21 16:35:26
20	2011-12-05	205	2011-10-24 09:55:27
21	2011-12-05	203	2011-10-24 11:43:13
22	2011-12-05	208	2011-10-24 14:37:32
\.


--
-- Data for Name: l_suppliers; Type: TABLE DATA; Schema: public; Owner: derrick
--

COPY public.l_suppliers (supplier_id, supplier_name) FROM stdin;
ARR	Alice & Ray's Restaurant
ASP	A Soup Place
CBC	certified Beef Company
FRV	Frank Reed's Vegetables
FSN	Frank & Sons
JBR	Just Beverages
JPS	Jim Parker's Shop
VSB	virginia Street Bakery
\.


--
-- Name: l_employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrick
--

SELECT pg_catalog.setval('public.l_employees_employee_id_seq', 1, false);


--
-- Name: l_lunches_lunch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrick
--

SELECT pg_catalog.setval('public.l_lunches_lunch_id_seq', 1, false);


--
-- Name: seq_employee_id; Type: SEQUENCE SET; Schema: public; Owner: derrick
--

SELECT pg_catalog.setval('public.seq_employee_id', 211, false);


--
-- Name: seq_menu_item; Type: SEQUENCE SET; Schema: public; Owner: derrick
--

SELECT pg_catalog.setval('public.seq_menu_item', 11, false);


--
-- Name: l_departments l_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_departments
    ADD CONSTRAINT l_departments_pkey PRIMARY KEY (dept_code);


--
-- Name: l_employees l_employees_pkey; Type: CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_employees
    ADD CONSTRAINT l_employees_pkey PRIMARY KEY (employee_id);


--
-- Name: l_lunches l_lunches_pkey; Type: CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_lunches
    ADD CONSTRAINT l_lunches_pkey PRIMARY KEY (lunch_id);


--
-- Name: l_foods pk_l_foods; Type: CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_foods
    ADD CONSTRAINT pk_l_foods PRIMARY KEY (supplier_id, product_code);


--
-- Name: l_lunch_items pk_l_lunch_items; Type: CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_lunch_items
    ADD CONSTRAINT pk_l_lunch_items PRIMARY KEY (lunch_id, item_number);


--
-- Name: l_suppliers pk_l_suppliers; Type: CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_suppliers
    ADD CONSTRAINT pk_l_suppliers PRIMARY KEY (supplier_id);


--
-- Name: l_employees unique_l_employees_full_name; Type: CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_employees
    ADD CONSTRAINT unique_l_employees_full_name UNIQUE (first_name, last_name);


--
-- Name: l_employees unique_l_employees_phone_num; Type: CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_employees
    ADD CONSTRAINT unique_l_employees_phone_num UNIQUE (phone_number);


--
-- Name: l_employees fk_l_employees_dept_code; Type: FK CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_employees
    ADD CONSTRAINT fk_l_employees_dept_code FOREIGN KEY (dept_code) REFERENCES public.l_departments(dept_code);


--
-- Name: l_employees fk_l_employees_manager_id; Type: FK CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_employees
    ADD CONSTRAINT fk_l_employees_manager_id FOREIGN KEY (manager_id) REFERENCES public.l_employees(employee_id);


--
-- Name: l_foods fk_l_foods_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_foods
    ADD CONSTRAINT fk_l_foods_suppliers FOREIGN KEY (supplier_id) REFERENCES public.l_suppliers(supplier_id) ON DELETE CASCADE;


--
-- Name: l_lunch_items fk_l_lunch_items_foods; Type: FK CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_lunch_items
    ADD CONSTRAINT fk_l_lunch_items_foods FOREIGN KEY (supplier_id, product_code) REFERENCES public.l_foods(supplier_id, product_code);


--
-- Name: l_lunch_items fk_l_lunch_items_lunches; Type: FK CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_lunch_items
    ADD CONSTRAINT fk_l_lunch_items_lunches FOREIGN KEY (lunch_id) REFERENCES public.l_lunches(lunch_id);


--
-- Name: l_lunches fk_l_lunches_employees; Type: FK CONSTRAINT; Schema: public; Owner: derrick
--

ALTER TABLE ONLY public.l_lunches
    ADD CONSTRAINT fk_l_lunches_employees FOREIGN KEY (employee_id) REFERENCES public.l_employees(employee_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

