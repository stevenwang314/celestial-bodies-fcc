--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    designations text,
    constellation text,
    diameter_lightyears integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    planet text,
    discovered integer,
    radius numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    equatorial_diameter numeric,
    mass numeric,
    orbit_period_years numeric,
    rotation_period_days numeric,
    number_of_moon integer,
    rings boolean,
    ismajor boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    launch date,
    programme text,
    orbit_km text,
    alt integer,
    isactive boolean
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    designations text,
    full_name text,
    distance_lightyears integer,
    visible_magnitude numeric,
    absolute_magnitude numeric,
    stellar_classification text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (0, 'Andromeda', ' M31, NGC 224, UGC 454, PGC 2557', ' Andromeda', 220000);
INSERT INTO public.galaxy VALUES (1, ' Antennae Galaxy', ' NGC 4038 & 4039,PGC 37967 & 37969', 'Corvus', 113446);
INSERT INTO public.galaxy VALUES (2, ' Backward Galaxy', ' NGC 4622, PGC 42701', ' Centaurus', 122732);
INSERT INTO public.galaxy VALUES (3, ' Black Eye Galaxy', ' Evil Eye Galaxy, M64, NGC 4826, PGC 44182', ' Coma Berenices', 52962);
INSERT INTO public.galaxy VALUES (4, ' Bode’s Galaxy', ' M81, NGC 3031, UGC 5318, PGC 28630', ' Ursa Major', 90000);
INSERT INTO public.galaxy VALUES (5, ' Butterfly Galaxies', ' NGC 4567 & 4568, UGC 7776 & 7777, PGC 42064 & 42069', ' Virgo', 3);
INSERT INTO public.galaxy VALUES (6, ' Cartwheel Galaxy', ' PGC 2248', ' Sculptor', 130000);
INSERT INTO public.galaxy VALUES (7, ' Centaurus A', ' NGC 5128, Arp 153, PGC 46957', ' Centaurus', 97000);
INSERT INTO public.galaxy VALUES (8, ' Cigar Galaxy', ' M82, NGC 3034, UGC 5322, PGC 28655', ' Ursa Major', 37000);
INSERT INTO public.galaxy VALUES (9, ' Circinus', ' ESO 97-G13', ' Circinus', 100000);
INSERT INTO public.galaxy VALUES (10, ' Coma Pinwheel Galaxy', ' NGC 4254, PGC 39578', ' Coma Berenices', 85000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (0, ' Moon', NULL, ' Earth', 1609, 1079.6);
INSERT INTO public.moon VALUES (1, ' Autonoe', NULL, ' Jupiter', 2001, 1.2427);
INSERT INTO public.moon VALUES (2, ' Phobos', NULL, ' Mars', 1877, 7.0008);
INSERT INTO public.moon VALUES (3, ' Deimos', NULL, ' Mars', 1877, 3.8525);
INSERT INTO public.moon VALUES (4, ' Io', NULL, ' Jupiter', 1610, 1131.9);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 'Jupiter', 1610, 969.84);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 'Jupiter', 1610, 1636.8);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 'Jupiter', 1610, 1497.7);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, 'Jupiter', 1892, 51.884);
INSERT INTO public.moon VALUES (9, 'Himalia', NULL, 'Jupiter', 1904, 52.817);
INSERT INTO public.moon VALUES (10, 'Elara', NULL, 'Jupiter', 1905, 26.719);
INSERT INTO public.moon VALUES (11, 'Pasiphae', NULL, 'Jupiter', 1908, 18.6);
INSERT INTO public.moon VALUES (12, 'Sinope', NULL, 'Jupiter', 1914, 11.8);
INSERT INTO public.moon VALUES (13, 'Lysithea', NULL, 'Jupiter', 1938, 11.185);
INSERT INTO public.moon VALUES (14, 'Carme', NULL, 'Jupiter', 1938, 14.292);
INSERT INTO public.moon VALUES (15, ' Ananke', NULL, ' Jupiter', 1951, 8.6992);
INSERT INTO public.moon VALUES (16, ' Leda', NULL, ' Jupiter', 1974, 6.2137);
INSERT INTO public.moon VALUES (17, ' Thebe', NULL, ' Jupiter', 1979, 30.634);
INSERT INTO public.moon VALUES (18, ' Adrastea', NULL, ' Jupiter', 1979, 5.0952);
INSERT INTO public.moon VALUES (19, ' Metis', NULL, ' Jupiter', 1979, 13.359);
INSERT INTO public.moon VALUES (20, ' Callirrhoe', NULL, ' Jupiter', 2000, 2.7);
INSERT INTO public.moon VALUES (21, ' Themisto', NULL, ' Jupiter', 2000, 2.4855);
INSERT INTO public.moon VALUES (22, ' Megaclite', NULL, ' Jupiter', 2000, 1.6777);
INSERT INTO public.moon VALUES (23, ' Taygete', NULL, 'Jupiter', 2000, 1.5);
INSERT INTO public.moon VALUES (24, ' Chaldene', NULL, ' Jupiter', 2000, 1);
INSERT INTO public.moon VALUES (25, ' Harpalyke', NULL, ' Jupiter', 2000, 1.2427);
INSERT INTO public.moon VALUES (26, ' Kalyke', NULL, ' Jupiter', 2000, 1.6156);
INSERT INTO public.moon VALUES (27, ' Iocaste', NULL, ' Jupiter', 2000, 1.6);
INSERT INTO public.moon VALUES (28, ' Erinome', NULL, ' Jupiter', 2000, 0.99419);
INSERT INTO public.moon VALUES (29, ' Isonoe', NULL, ' Jupiter', 2000, 1.1);
INSERT INTO public.moon VALUES (30, ' Praxidike', NULL, ' Jupiter', 2000, 8.7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (0, 'Mercury', NULL, 0.383, 0.06, 0.24, 58.65, 0, false, true);
INSERT INTO public.planet VALUES (1, 'Venus', NULL, 0.949, 0.81, 0.62, 243.02, 0, false, true);
INSERT INTO public.planet VALUES (2, 'Earth', NULL, 1, 1, 1, 1, 1, false, true);
INSERT INTO public.planet VALUES (3, 'Mars', NULL, 0.532, 0.11, 1.88, 1.03, 2, false, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', NULL, 11.209, 317.83, 11.86, 0.41, 80, true, true);
INSERT INTO public.planet VALUES (5, 'Saturn', NULL, 9.449, 95.16, 29.45, 0.44, 83, true, true);
INSERT INTO public.planet VALUES (6, 'Uranus', NULL, 4.007, 14.54, 84.02, 0.72, 27, true, true);
INSERT INTO public.planet VALUES (7, 'Neptune', NULL, 3.883, 17.15, 164.79, 0.67, 14, true, true);
INSERT INTO public.planet VALUES (8, 'Ceres', NULL, 0.0742, 0.00016, 4.6, 0.38, 0, false, false);
INSERT INTO public.planet VALUES (9, 'Orcus', NULL, 0.072, 0.0001, 247.5, 0, 1, false, false);
INSERT INTO public.planet VALUES (10, 'Pluto', NULL, 0.186, 0.0022, 247.9, 6.39, 5, false, false);
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, 0.13, 0.0007, 283.8, 0.16, 2, true, false);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (0, 'SkySat-5', NULL, '2016-09-16', 'Sky Satellite', 'SunSync', 507, true);
INSERT INTO public.satellite VALUES (1, 'FY-2G', NULL, '2014-12-31', 'CMA NRSCC', 'GEO', 35786, true);
INSERT INTO public.satellite VALUES (2, 'ISS LIS', NULL, '2017-02-19', 'International Space Station', 'DRIFT', 407, true);
INSERT INTO public.satellite VALUES (3, 'Mohammed VI-A', NULL, '2017-11-08', 'Mohammed VI', 'CRTS', 620, true);
INSERT INTO public.satellite VALUES (4, 'HJ-2A', NULL, '2020-09-27', 'Huan Jing', 'SunSync', 650, true);
INSERT INTO public.satellite VALUES (5, 'Meteor-3-6', NULL, '1994-01-25', 'RosHydroMet Roscosmos', 'DRIFT', 1210, false);
INSERT INTO public.satellite VALUES (6, 'GOES-8', NULL, '1994-04-13', 'NOAA NASA', 'GEO', 35786, false);
INSERT INTO public.satellite VALUES (7, 'Meteosat-7', NULL, '1997-09-02', 'EUMETSAT ESA', 'GEO', 35786, false);
INSERT INTO public.satellite VALUES (8, 'XMM-Newton', NULL, '1999-12-10', 'ESA', 'DRIFT', 40000, true);
INSERT INTO public.satellite VALUES (9, 'Deimos-2', NULL, '2014-06-19', 'Elecnor-Deimos', 'SunSync', 620, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (0, ' Alpheratz ', NULL, 'α And', ' Alpha Andromedae', 97, 2.07, -0.30, 'B9p');
INSERT INTO public.star VALUES (1, ' Adhil ', NULL, 'ξ And', ' Xi Andromedae', 195, 4.87, 0.98, ' K0III-IV');
INSERT INTO public.star VALUES (2, ' Mirach ', NULL, 'β And', ' Beta Andromedae', 199, 2.07, -1.86, 'M0IIIvar');
INSERT INTO public.star VALUES (3, ' Almach ', NULL, 'γ1 And', ' Gamma1 Andromedae', 355, 2.10, -3.08, 'K3IIb');
INSERT INTO public.star VALUES (4, ' Sadiradra ', NULL, 'δ And', ' Delta Andromedae', 101, 3.27, 0.81, 'K3III…');
INSERT INTO public.star VALUES (5, ' Nembus-1', NULL, '51 And', '51 Andromedae', 174, 3.59, -0.04, 'K3III');
INSERT INTO public.star VALUES (6, 'Nembus-2', NULL, ' ο And', 'Omicron Andromedae ', 692, 3.62, -3.01, 'B6pv SB');
INSERT INTO public.star VALUES (7, 'Nembus-3', NULL, ' λ And', 'Lambda Andromedae ', 84, 3.81, 1.75, 'G8III-IV');
INSERT INTO public.star VALUES (8, ' Nembus-4', NULL, 'α And', 'Mu Andromedae', 136, 3.86, 0.75, 'A5V');
INSERT INTO public.star VALUES (9, ' Nembus-5', NULL, 'ζ And', 'Zeta Andromedae', 181, 4.08, 0.35, 'K1II');
INSERT INTO public.star VALUES (10, ' Titawin', NULL, 'υ And', 'Upsilon Andromedae', 44, 4.10, 3.45, 'F8V');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: satellite satellite_satellite_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_satellite_id_key UNIQUE (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

