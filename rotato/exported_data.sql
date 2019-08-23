--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.18
-- Dumped by pg_dump version 9.5.18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO foodieuser;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO foodieuser;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO foodieuser;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO foodieuser;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO foodieuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO foodieuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO foodieuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO foodieuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO foodieuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO foodieuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO foodieuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO foodieuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO foodieuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO foodieuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO foodieuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO foodieuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO foodieuser;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO foodieuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO foodieuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO foodieuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO foodieuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO foodieuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO foodieuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO foodieuser;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO foodieuser;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO foodieuser;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: friendship_follow; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.friendship_follow (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    followee_id integer NOT NULL,
    follower_id integer NOT NULL
);


ALTER TABLE public.friendship_follow OWNER TO foodieuser;

--
-- Name: friendship_follow_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.friendship_follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_follow_id_seq OWNER TO foodieuser;

--
-- Name: friendship_follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.friendship_follow_id_seq OWNED BY public.friendship_follow.id;


--
-- Name: friendship_friend; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.friendship_friend (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL
);


ALTER TABLE public.friendship_friend OWNER TO foodieuser;

--
-- Name: friendship_friend_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.friendship_friend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_friend_id_seq OWNER TO foodieuser;

--
-- Name: friendship_friend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.friendship_friend_id_seq OWNED BY public.friendship_friend.id;


--
-- Name: friendship_friendshiprequest; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.friendship_friendshiprequest (
    id integer NOT NULL,
    message text NOT NULL,
    created timestamp with time zone NOT NULL,
    rejected timestamp with time zone,
    viewed timestamp with time zone,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL
);


ALTER TABLE public.friendship_friendshiprequest OWNER TO foodieuser;

--
-- Name: friendship_friendshiprequest_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.friendship_friendshiprequest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_friendshiprequest_id_seq OWNER TO foodieuser;

--
-- Name: friendship_friendshiprequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.friendship_friendshiprequest_id_seq OWNED BY public.friendship_friendshiprequest.id;


--
-- Name: paytm_merchantprofile; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.paytm_merchantprofile (
    phone_number character varying(10) NOT NULL,
    merchant_id character varying(20) NOT NULL,
    key character varying(20) NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.paytm_merchantprofile OWNER TO foodieuser;

--
-- Name: paytm_paytmhistory; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.paytm_paytmhistory (
    id integer NOT NULL,
    "ORDERID" character varying(50) NOT NULL,
    "TXNDATE" timestamp with time zone NOT NULL,
    "TXNID" character varying(64) NOT NULL,
    "BANKTXNID" character varying(50),
    "BANKNAME" character varying(50),
    "RESPCODE" character varying(10) NOT NULL,
    "PAYMENTMODE" character varying(10),
    "CURRENCY" character varying(4),
    "GATEWAYNAME" character varying(15),
    "MID" character varying(20) NOT NULL,
    "RESPMSG" text NOT NULL,
    "TXNAMOUNT" character varying(10) NOT NULL,
    "STATUS" character varying(20) NOT NULL,
    "CUST_ID" character varying(64) NOT NULL,
    customer_id integer
);


ALTER TABLE public.paytm_paytmhistory OWNER TO foodieuser;

--
-- Name: paytm_paytmhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.paytm_paytmhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paytm_paytmhistory_id_seq OWNER TO foodieuser;

--
-- Name: paytm_paytmhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.paytm_paytmhistory_id_seq OWNED BY public.paytm_paytmhistory.id;


--
-- Name: restaurants_foodcourt; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_foodcourt (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(100),
    cover_pic character varying(100) NOT NULL,
    location public.geography(Point,4326),
    phone_number character varying(10) NOT NULL,
    website_url character varying(100) NOT NULL,
    city character varying(50) NOT NULL
);


ALTER TABLE public.restaurants_foodcourt OWNER TO foodieuser;

--
-- Name: restaurants_foodcourt_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_foodcourt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_foodcourt_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_foodcourt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_foodcourt_id_seq OWNED BY public.restaurants_foodcourt.id;


--
-- Name: restaurants_menu; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_menu (
    id integer NOT NULL,
    name character varying(24) NOT NULL,
    slug character varying(24) NOT NULL,
    additional_text character varying(128),
    "order" smallint NOT NULL,
    restaurant_id integer,
    CONSTRAINT restaurants_menu_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.restaurants_menu OWNER TO foodieuser;

--
-- Name: restaurants_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_menu_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_menu_id_seq OWNED BY public.restaurants_menu.id;


--
-- Name: restaurants_menucategory; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_menucategory (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    additional_text character varying(128),
    "order" integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.restaurants_menucategory OWNER TO foodieuser;

--
-- Name: restaurants_menucategory_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_menucategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_menucategory_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_menucategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_menucategory_id_seq OWNED BY public.restaurants_menucategory.id;


--
-- Name: restaurants_menuitem; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_menuitem (
    id integer NOT NULL,
    name character varying(48) NOT NULL,
    description character varying(128),
    "order" integer NOT NULL,
    price integer NOT NULL,
    image character varying(100),
    classification character varying(20) NOT NULL,
    spicy boolean NOT NULL,
    contains_peanuts boolean NOT NULL,
    gluten_free boolean NOT NULL,
    popular boolean NOT NULL
);


ALTER TABLE public.restaurants_menuitem OWNER TO foodieuser;

--
-- Name: restaurants_menuitem_category; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_menuitem_category (
    id integer NOT NULL,
    menuitem_id integer NOT NULL,
    menucategory_id integer NOT NULL
);


ALTER TABLE public.restaurants_menuitem_category OWNER TO foodieuser;

--
-- Name: restaurants_menuitem_category_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_menuitem_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_menuitem_category_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_menuitem_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_menuitem_category_id_seq OWNED BY public.restaurants_menuitem_category.id;


--
-- Name: restaurants_menuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_menuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_menuitem_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_menuitem_id_seq OWNED BY public.restaurants_menuitem.id;


--
-- Name: restaurants_order; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_order (
    amount integer NOT NULL,
    customer_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    order_id uuid NOT NULL
);


ALTER TABLE public.restaurants_order OWNER TO foodieuser;

--
-- Name: restaurants_order_items; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_order_items (
    id integer NOT NULL,
    order_id uuid NOT NULL,
    menuitem_id integer NOT NULL
);


ALTER TABLE public.restaurants_order_items OWNER TO foodieuser;

--
-- Name: restaurants_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_order_items_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_order_items_id_seq OWNED BY public.restaurants_order_items.id;


--
-- Name: restaurants_quantity; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_quantity (
    id integer NOT NULL,
    number integer NOT NULL,
    order_id uuid
);


ALTER TABLE public.restaurants_quantity OWNER TO foodieuser;

--
-- Name: restaurants_quantity_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_quantity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_quantity_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_quantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_quantity_id_seq OWNED BY public.restaurants_quantity.id;


--
-- Name: restaurants_ratings; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_ratings (
    id integer NOT NULL,
    rating integer NOT NULL,
    author_id integer NOT NULL,
    restaurant_id integer NOT NULL
);


ALTER TABLE public.restaurants_ratings OWNER TO foodieuser;

--
-- Name: restaurants_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_ratings_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_ratings_id_seq OWNED BY public.restaurants_ratings.id;


--
-- Name: restaurants_restaurant; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_restaurant (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    cover_pic character varying(100) NOT NULL,
    location public.geography(Point,4326),
    phone_number character varying(10) NOT NULL,
    website_url character varying(100) NOT NULL,
    address character varying(100),
    city character varying(50) NOT NULL,
    foodcourt_id integer,
    paytm_merchant_id character varying(20)
);


ALTER TABLE public.restaurants_restaurant OWNER TO foodieuser;

--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_restaurant_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_restaurant_id_seq OWNED BY public.restaurants_restaurant.id;


--
-- Name: restaurants_review; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.restaurants_review (
    id integer NOT NULL,
    review character varying(10000) NOT NULL,
    restaurant_id integer NOT NULL,
    writer_id integer NOT NULL
);


ALTER TABLE public.restaurants_review OWNER TO foodieuser;

--
-- Name: restaurants_review_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.restaurants_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_review_id_seq OWNER TO foodieuser;

--
-- Name: restaurants_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.restaurants_review_id_seq OWNED BY public.restaurants_review.id;


--
-- Name: socialAuth_credentialsmodel; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public."socialAuth_credentialsmodel" (
    id_id integer NOT NULL,
    credential bytea
);


ALTER TABLE public."socialAuth_credentialsmodel" OWNER TO foodieuser;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO foodieuser;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO foodieuser;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO foodieuser;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO foodieuser;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO foodieuser;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO foodieuser;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO foodieuser;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO foodieuser;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO foodieuser;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO foodieuser;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO foodieuser;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO foodieuser;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO foodieuser;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO foodieuser;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO foodieuser;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO foodieuser;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: foodieuser
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO foodieuser;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: foodieuser
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO foodieuser;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodieuser
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_follow ALTER COLUMN id SET DEFAULT nextval('public.friendship_follow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friend ALTER COLUMN id SET DEFAULT nextval('public.friendship_friend_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friendshiprequest ALTER COLUMN id SET DEFAULT nextval('public.friendship_friendshiprequest_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.paytm_paytmhistory ALTER COLUMN id SET DEFAULT nextval('public.paytm_paytmhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_foodcourt ALTER COLUMN id SET DEFAULT nextval('public.restaurants_foodcourt_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menu ALTER COLUMN id SET DEFAULT nextval('public.restaurants_menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menucategory ALTER COLUMN id SET DEFAULT nextval('public.restaurants_menucategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menuitem ALTER COLUMN id SET DEFAULT nextval('public.restaurants_menuitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menuitem_category ALTER COLUMN id SET DEFAULT nextval('public.restaurants_menuitem_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_order_items ALTER COLUMN id SET DEFAULT nextval('public.restaurants_order_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_quantity ALTER COLUMN id SET DEFAULT nextval('public.restaurants_quantity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_ratings ALTER COLUMN id SET DEFAULT nextval('public.restaurants_ratings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_restaurant ALTER COLUMN id SET DEFAULT nextval('public.restaurants_restaurant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_review ALTER COLUMN id SET DEFAULT nextval('public.restaurants_review_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add Token	8	add_token
30	Can change Token	8	change_token
31	Can delete Token	8	delete_token
32	Can view Token	8	view_token
33	Can add email confirmation	9	add_emailconfirmation
34	Can change email confirmation	9	change_emailconfirmation
35	Can delete email confirmation	9	delete_emailconfirmation
36	Can view email confirmation	9	view_emailconfirmation
37	Can add email address	10	add_emailaddress
38	Can change email address	10	change_emailaddress
39	Can delete email address	10	delete_emailaddress
40	Can view email address	10	view_emailaddress
41	Can add social account	11	add_socialaccount
42	Can change social account	11	change_socialaccount
43	Can delete social account	11	delete_socialaccount
44	Can view social account	11	view_socialaccount
45	Can add social application	12	add_socialapp
46	Can change social application	12	change_socialapp
47	Can delete social application	12	delete_socialapp
48	Can view social application	12	view_socialapp
49	Can add social application token	13	add_socialtoken
50	Can change social application token	13	change_socialtoken
51	Can delete social application token	13	delete_socialtoken
52	Can view social application token	13	view_socialtoken
53	Can add Following Relationship	14	add_follow
54	Can change Following Relationship	14	change_follow
55	Can delete Following Relationship	14	delete_follow
56	Can view Following Relationship	14	view_follow
57	Can add Friendship Request	15	add_friendshiprequest
58	Can change Friendship Request	15	change_friendshiprequest
59	Can delete Friendship Request	15	delete_friendshiprequest
60	Can view Friendship Request	15	view_friendshiprequest
61	Can add Friend	16	add_friend
62	Can change Friend	16	change_friend
63	Can delete Friend	16	delete_friend
64	Can view Friend	16	view_friend
65	Can add menu item	17	add_menuitem
66	Can change menu item	17	change_menuitem
67	Can delete menu item	17	delete_menuitem
68	Can view menu item	17	view_menuitem
69	Can add menu	18	add_menu
70	Can change menu	18	change_menu
71	Can delete menu	18	delete_menu
72	Can view menu	18	view_menu
73	Can add menu category	19	add_menucategory
74	Can change menu category	19	change_menucategory
75	Can delete menu category	19	delete_menucategory
76	Can view menu category	19	view_menucategory
77	Can add review	20	add_review
78	Can change review	20	change_review
79	Can delete review	20	delete_review
80	Can view review	20	view_review
81	Can add ratings	21	add_ratings
82	Can change ratings	21	change_ratings
83	Can delete ratings	21	delete_ratings
84	Can view ratings	21	view_ratings
85	Can add restaurant	22	add_restaurant
86	Can change restaurant	22	change_restaurant
87	Can delete restaurant	22	delete_restaurant
88	Can view restaurant	22	view_restaurant
89	Can add food court	23	add_foodcourt
90	Can change food court	23	change_foodcourt
91	Can delete food court	23	delete_foodcourt
92	Can view food court	23	view_foodcourt
93	Can add order	24	add_order
94	Can change order	24	change_order
95	Can delete order	24	delete_order
96	Can view order	24	view_order
97	Can add quantity	25	add_quantity
98	Can change quantity	25	change_quantity
99	Can delete quantity	25	delete_quantity
100	Can view quantity	25	view_quantity
101	Can add merchant profile	26	add_merchantprofile
102	Can change merchant profile	26	change_merchantprofile
103	Can delete merchant profile	26	delete_merchantprofile
104	Can view merchant profile	26	view_merchantprofile
105	Can add paytm history	27	add_paytmhistory
106	Can change paytm history	27	change_paytmhistory
107	Can delete paytm history	27	delete_paytmhistory
108	Can view paytm history	27	view_paytmhistory
109	Can add merchant profile	28	add_merchantprofile
110	Can change merchant profile	28	change_merchantprofile
111	Can delete merchant profile	28	delete_merchantprofile
112	Can view merchant profile	28	view_merchantprofile
113	Can add partial	29	add_partial
114	Can change partial	29	change_partial
115	Can delete partial	29	delete_partial
116	Can view partial	29	view_partial
117	Can add code	30	add_code
118	Can change code	30	change_code
119	Can delete code	30	delete_code
120	Can view code	30	view_code
121	Can add association	31	add_association
122	Can change association	31	change_association
123	Can delete association	31	delete_association
124	Can view association	31	view_association
125	Can add nonce	32	add_nonce
126	Can change nonce	32	change_nonce
127	Can delete nonce	32	delete_nonce
128	Can view nonce	32	view_nonce
129	Can add user social auth	33	add_usersocialauth
130	Can change user social auth	33	change_usersocialauth
131	Can delete user social auth	33	delete_usersocialauth
132	Can view user social auth	33	view_usersocialauth
133	Can add credentials model	34	add_credentialsmodel
134	Can change credentials model	34	change_credentialsmodel
135	Can delete credentials model	34	delete_credentialsmodel
136	Can view credentials model	34	view_credentialsmodel
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 136, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	!DB8rWXLx4UAlElVuEyZRvbFUMoOeehhlziExgSTm	\N	f	piyush.n.h@gmail.com	Piyush	Hanchate	piyush.n.h@gmail.com	f	t	2019-08-07 02:42:47.683897+05:30
1	pbkdf2_sha256$120000$4HjvYjl3p3n3$zIaouTuqbp3PdzHXkBmV21+D2qYveyiRxoVyFKoDAck=	2019-08-12 13:24:16.347147+05:30	t	piyush				t	t	2019-03-28 14:53:49.363082+05:30
2	pbkdf2_sha256$120000$N7LzSJU0MRFr$dVJybxUfNUH8BU7qb99pGmy6bn/zzA4Q3CzIbcKSVxQ=	2019-08-12 17:45:30.03198+05:30	f	abcd	ab	cd	abcd@gmail.com	f	t	2019-04-12 20:30:35+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
bc5a2a8347e468d972276d5f4cb4f8f60c1ad478	2019-05-13 00:53:23.656471+05:30	2
a02bd64239f1f0f353f7ddae94c3804b94aec755	2019-08-12 00:52:30.391645+05:30	3
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-03-28 14:56:56.095978+05:30	1	Kobes	1	[{"added": {}}]	22	1
2	2019-04-04 01:35:20.192651+05:30	2	Kobe's	1	[{"added": {}}]	22	1
3	2019-04-04 01:35:54.528981+05:30	2	Kobe's	2	[]	22	1
4	2019-04-04 01:36:49.087754+05:30	2	Kobe's	2	[{"changed": {"fields": ["address"]}}]	22	1
5	2019-04-04 01:38:09.655787+05:30	2	Kobe's	3		22	1
6	2019-04-09 22:41:01.936741+05:30	3	Kobe's	1	[{"added": {}}]	22	1
7	2019-04-09 22:41:36.779951+05:30	3	Kobe's	2	[]	22	1
8	2019-04-09 22:42:05.919148+05:30	4	Teriyaki	1	[{"added": {}}]	22	1
9	2019-04-09 22:42:30.030798+05:30	4	Teriyaki	2	[{"changed": {"fields": ["address"]}}]	22	1
10	2019-04-09 22:42:54.208719+05:30	4	Teriyaki	2	[{"changed": {"fields": ["address"]}}]	22	1
11	2019-04-09 22:43:28.36459+05:30	4	Teriyaki	2	[]	22	1
12	2019-04-09 22:43:51.094212+05:30	5	BBq nation	1	[{"added": {}}]	22	1
13	2019-04-10 00:19:39.179993+05:30	5	BBq nation	2	[]	22	1
14	2019-04-10 00:20:05.119536+05:30	6	Onesta	1	[{"added": {}}]	22	1
15	2019-04-10 00:29:31.044671+05:30	7	BBQ manipal	1	[{"added": {}}]	22	1
16	2019-04-10 00:30:39.792824+05:30	8	Bourbon	1	[{"added": {}}]	22	1
17	2019-04-12 20:30:36.183398+05:30	2	abcd	1	[{"added": {}}]	4	1
18	2019-04-12 20:30:48.291905+05:30	2	abcd	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	4	1
19	2019-05-02 15:03:54.416189+05:30	1	Mantri Food Court	1	[{"added": {}}]	23	1
20	2019-05-02 15:37:55.536971+05:30	9	Barbecue by Punjab Grill	1	[{"added": {}}]	22	1
21	2019-05-02 15:38:55.10232+05:30	10	The Asian Curry House	1	[{"added": {}}]	22	1
22	2019-05-03 11:26:39.38749+05:30	1	Mantri Food Court	2	[{"changed": {"fields": ["cover_pic"]}}]	23	1
23	2019-05-03 11:27:54.563373+05:30	10	The Asian Curry House	2	[{"changed": {"fields": ["cover_pic"]}}]	22	1
24	2019-05-03 11:28:12.245009+05:30	9	Barbecue by Punjab Grill	2	[{"changed": {"fields": ["cover_pic"]}}]	22	1
25	2019-05-03 11:29:46.610729+05:30	10	The Asian Curry House	2	[{"changed": {"fields": ["cover_pic"]}}]	22	1
26	2019-05-03 11:29:56.634414+05:30	9	Barbecue by Punjab Grill	2	[{"changed": {"fields": ["cover_pic"]}}]	22	1
27	2019-05-03 12:33:06.297301+05:30	10	The Asian Curry House	3		22	1
28	2019-05-03 12:33:06.313102+05:30	9	Barbecue by Punjab Grill	3		22	1
29	2019-05-03 12:38:29.949591+05:30	11	Barbecue by Punjab Grill	1	[{"added": {}}]	22	1
30	2019-05-03 12:39:13.196816+05:30	12	The Asian Curry House	1	[{"added": {}}]	22	1
31	2019-05-03 20:07:52.02722+05:30	1	Menu object (1)	1	[{"added": {}}]	18	1
32	2019-05-03 20:08:48.134054+05:30	1	Barbecue by Punjab Grill	2	[]	18	1
33	2019-05-03 20:09:36.578749+05:30	1	MenuCategory object (1)	1	[{"added": {}}]	19	1
34	2019-05-03 20:10:35.901559+05:30	1	MenuCategory object (1)	2	[]	19	1
35	2019-05-03 20:11:13.817454+05:30	1	MenuCategory object (1)	3		19	1
36	2019-05-03 20:11:31.935284+05:30	2	MenuCategory object (2)	1	[{"added": {}}]	19	1
37	2019-05-03 20:49:13.696947+05:30	1	MenuItem object (1)	1	[{"added": {}}]	17	1
38	2019-05-03 20:52:32.085343+05:30	2	Chicken Manchow Soup	1	[{"added": {}}]	17	1
39	2019-05-04 17:07:10.029763+05:30	3	Shahi Paneer	1	[{"added": {}}]	17	1
40	2019-05-04 17:11:15.546873+05:30	1	Chicken Butter Masala	2	[{"changed": {"fields": ["name", "popular"]}}]	17	1
41	2019-05-04 17:16:08.31206+05:30	3	Shahi Paneer	2	[{"changed": {"fields": ["image"]}}]	17	1
42	2019-05-04 17:16:18.553431+05:30	2	Chicken Manchow Soup	2	[{"changed": {"fields": ["image"]}}]	17	1
43	2019-05-04 17:16:26.363912+05:30	1	Chicken Butter Masala	2	[{"changed": {"fields": ["image"]}}]	17	1
44	2019-05-06 17:01:59.378567+05:30	6	6	3		24	1
45	2019-05-06 17:01:59.433876+05:30	5	5	3		24	1
46	2019-05-06 17:01:59.45552+05:30	4	4	3		24	1
47	2019-05-06 17:01:59.466196+05:30	3	3	3		24	1
48	2019-05-06 17:01:59.477449+05:30	2	2	3		24	1
49	2019-05-06 17:01:59.488819+05:30	1	1	3		24	1
50	2019-05-06 17:03:17.606592+05:30	7	7	3		24	1
51	2019-05-08 00:03:50.615924+05:30	3	piyush	1	[{"added": {}}]	26	1
52	2019-05-08 00:04:12.187351+05:30	11	Barbecue by Punjab Grill	2	[{"changed": {"fields": ["merchant"]}}]	22	1
53	2019-07-29 12:03:38.334106+05:30	3	Shahi Paneer	2	[{"changed": {"fields": ["classification"]}}]	17	1
54	2019-07-29 20:47:34.487854+05:30	4	Paneer	1	[{"added": {}}]	17	1
55	2019-07-29 20:49:17.611813+05:30	5	Chicken	1	[{"added": {}}]	17	1
56	2019-07-29 20:50:49.607918+05:30	6	Chicken	1	[{"added": {}}]	17	1
57	2019-07-29 23:47:56.320152+05:30	2	The Asian Curry House	1	[{"added": {}}]	18	1
58	2019-07-29 23:48:14.864877+05:30	3	The Asian Curry House-bar	1	[{"added": {}}]	19	1
59	2019-07-29 23:49:20.86889+05:30	7	Chicken	1	[{"added": {}}]	17	1
60	2019-08-03 17:02:54.26991+05:30	xInaNs61782653789260	abcd	1	[{"added": {}}]	28	1
61	2019-08-03 17:03:57.867849+05:30	11	Barbecue by Punjab Grill	2	[{"changed": {"fields": ["paytm_merchant"]}}]	22	1
62	2019-08-04 18:28:23.239427+05:30	49	PaytmHistory object (49)	3		27	1
63	2019-08-04 18:28:23.28663+05:30	48	PaytmHistory object (48)	3		27	1
64	2019-08-04 18:28:23.309548+05:30	47	PaytmHistory object (47)	3		27	1
65	2019-08-04 18:28:23.342105+05:30	46	PaytmHistory object (46)	3		27	1
66	2019-08-04 18:28:23.353262+05:30	45	PaytmHistory object (45)	3		27	1
67	2019-08-04 18:28:23.364428+05:30	44	PaytmHistory object (44)	3		27	1
68	2019-08-04 18:28:23.375522+05:30	43	PaytmHistory object (43)	3		27	1
69	2019-08-04 18:28:23.386637+05:30	42	PaytmHistory object (42)	3		27	1
70	2019-08-04 18:28:23.397703+05:30	41	PaytmHistory object (41)	3		27	1
71	2019-08-04 18:28:23.408854+05:30	40	PaytmHistory object (40)	3		27	1
72	2019-08-04 18:28:23.419939+05:30	39	PaytmHistory object (39)	3		27	1
73	2019-08-04 18:28:23.431028+05:30	38	PaytmHistory object (38)	3		27	1
74	2019-08-04 18:28:23.442032+05:30	37	PaytmHistory object (37)	3		27	1
75	2019-08-04 18:28:23.453298+05:30	36	PaytmHistory object (36)	3		27	1
76	2019-08-04 18:28:23.464773+05:30	35	PaytmHistory object (35)	3		27	1
77	2019-08-04 18:28:23.497657+05:30	34	PaytmHistory object (34)	3		27	1
78	2019-08-04 18:28:23.5198+05:30	33	PaytmHistory object (33)	3		27	1
79	2019-08-04 18:28:23.531077+05:30	32	PaytmHistory object (32)	3		27	1
80	2019-08-04 18:28:23.541974+05:30	31	PaytmHistory object (31)	3		27	1
81	2019-08-04 18:28:23.553231+05:30	30	PaytmHistory object (30)	3		27	1
82	2019-08-04 18:28:23.598432+05:30	29	PaytmHistory object (29)	3		27	1
83	2019-08-04 18:28:23.631089+05:30	28	PaytmHistory object (28)	3		27	1
84	2019-08-04 18:28:23.653313+05:30	27	PaytmHistory object (27)	3		27	1
85	2019-08-04 18:28:23.709607+05:30	26	PaytmHistory object (26)	3		27	1
86	2019-08-04 18:28:23.742377+05:30	25	PaytmHistory object (25)	3		27	1
87	2019-08-04 18:28:23.764983+05:30	24	PaytmHistory object (24)	3		27	1
88	2019-08-04 18:28:23.797832+05:30	23	PaytmHistory object (23)	3		27	1
89	2019-08-04 18:28:23.808853+05:30	22	PaytmHistory object (22)	3		27	1
90	2019-08-04 18:28:23.820089+05:30	21	PaytmHistory object (21)	3		27	1
91	2019-08-04 18:28:23.831022+05:30	20	PaytmHistory object (20)	3		27	1
92	2019-08-04 18:28:23.842228+05:30	19	PaytmHistory object (19)	3		27	1
93	2019-08-04 18:28:23.853435+05:30	18	PaytmHistory object (18)	3		27	1
94	2019-08-04 18:28:23.864343+05:30	17	PaytmHistory object (17)	3		27	1
95	2019-08-04 18:28:23.875465+05:30	16	PaytmHistory object (16)	3		27	1
96	2019-08-04 18:28:23.886585+05:30	15	PaytmHistory object (15)	3		27	1
97	2019-08-04 18:28:23.898093+05:30	14	PaytmHistory object (14)	3		27	1
98	2019-08-04 18:28:23.92064+05:30	13	PaytmHistory object (13)	3		27	1
99	2019-08-04 18:28:23.953448+05:30	12	PaytmHistory object (12)	3		27	1
100	2019-08-04 18:28:23.964439+05:30	11	PaytmHistory object (11)	3		27	1
101	2019-08-04 18:28:23.975716+05:30	10	PaytmHistory object (10)	3		27	1
102	2019-08-04 18:28:23.986692+05:30	9	PaytmHistory object (9)	3		27	1
103	2019-08-04 18:28:23.997875+05:30	8	PaytmHistory object (8)	3		27	1
104	2019-08-04 18:28:24.009374+05:30	7	PaytmHistory object (7)	3		27	1
105	2019-08-04 18:28:24.042425+05:30	6	PaytmHistory object (6)	3		27	1
106	2019-08-04 18:28:24.064862+05:30	5	PaytmHistory object (5)	3		27	1
107	2019-08-04 18:28:24.086794+05:30	4	PaytmHistory object (4)	3		27	1
108	2019-08-04 18:28:24.098047+05:30	3	PaytmHistory object (3)	3		27	1
109	2019-08-04 18:28:24.120099+05:30	2	PaytmHistory object (2)	3		27	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 109, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	authtoken	token
9	account	emailconfirmation
10	account	emailaddress
11	socialaccount	socialaccount
12	socialaccount	socialapp
13	socialaccount	socialtoken
14	friendship	follow
15	friendship	friendshiprequest
16	friendship	friend
17	restaurants	menuitem
18	restaurants	menu
19	restaurants	menucategory
20	restaurants	review
21	restaurants	ratings
22	restaurants	restaurant
23	restaurants	foodcourt
24	restaurants	order
25	restaurants	quantity
26	restaurants	merchantprofile
27	paytm	paytmhistory
28	paytm	merchantprofile
29	social_django	partial
30	social_django	code
31	social_django	association
32	social_django	nonce
33	social_django	usersocialauth
34	socialAuth	credentialsmodel
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 34, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-03-28 11:14:32.448522+05:30
2	auth	0001_initial	2019-03-28 11:14:33.508412+05:30
3	account	0001_initial	2019-03-28 11:14:33.93971+05:30
4	account	0002_email_max_length	2019-03-28 11:14:33.992001+05:30
5	admin	0001_initial	2019-03-28 11:14:34.217811+05:30
6	admin	0002_logentry_remove_auto_add	2019-03-28 11:14:34.27582+05:30
7	admin	0003_logentry_add_action_flag_choices	2019-03-28 11:14:34.297892+05:30
8	contenttypes	0002_remove_content_type_name	2019-03-28 11:14:34.348154+05:30
9	auth	0002_alter_permission_name_max_length	2019-03-28 11:14:34.370708+05:30
10	auth	0003_alter_user_email_max_length	2019-03-28 11:14:34.403589+05:30
11	auth	0004_alter_user_username_opts	2019-03-28 11:14:34.429891+05:30
12	auth	0005_alter_user_last_login_null	2019-03-28 11:14:34.459437+05:30
13	auth	0006_require_contenttypes_0002	2019-03-28 11:14:34.47057+05:30
14	auth	0007_alter_validators_add_error_messages	2019-03-28 11:14:34.495957+05:30
15	auth	0008_alter_user_username_max_length	2019-03-28 11:14:34.584875+05:30
16	auth	0009_alter_user_last_name_max_length	2019-03-28 11:14:34.662116+05:30
17	authtoken	0001_initial	2019-03-28 11:14:34.873876+05:30
18	authtoken	0002_auto_20160226_1747	2019-03-28 11:14:35.004294+05:30
19	friendship	0001_initial	2019-03-28 11:14:35.720049+05:30
20	sessions	0001_initial	2019-03-28 11:14:35.908286+05:30
21	sites	0001_initial	2019-03-28 11:14:35.997267+05:30
22	sites	0002_alter_domain_unique	2019-03-28 11:14:36.119388+05:30
23	socialaccount	0001_initial	2019-03-28 11:14:36.912469+05:30
24	socialaccount	0002_token_max_lengths	2019-03-28 11:14:37.030977+05:30
25	socialaccount	0003_extra_data_default_dict	2019-03-28 11:14:37.063351+05:30
26	restaurants	0001_initial	2019-03-28 14:52:12.994052+05:30
27	restaurants	0002_auto_20190403_2316	2019-04-03 23:17:04.956413+05:30
28	restaurants	0003_auto_20190403_2338	2019-04-03 23:48:15.135588+05:30
29	restaurants	0004_auto_20190403_2339	2019-04-03 23:48:15.171821+05:30
30	restaurants	0005_auto_20190403_2343	2019-04-03 23:48:15.188429+05:30
31	restaurants	0006_auto_20190404_0137	2019-04-04 01:37:51.685736+05:30
32	restaurants	0007_auto_20190501_2328	2019-05-01 23:28:54.353275+05:30
33	restaurants	0008_auto_20190502_0003	2019-05-02 00:03:13.187731+05:30
34	restaurants	0009_auto_20190502_1853	2019-05-02 18:53:30.327565+05:30
35	restaurants	0010_auto_20190503_1116	2019-05-03 11:16:20.715001+05:30
36	restaurants	0011_auto_20190503_1958	2019-05-03 19:58:31.950744+05:30
37	restaurants	0012_auto_20190503_2048	2019-05-03 20:48:31.607534+05:30
38	restaurants	0013_auto_20190504_1407	2019-05-04 14:07:14.937877+05:30
39	restaurants	0014_auto_20190504_1440	2019-05-04 14:40:29.585603+05:30
40	restaurants	0015_order_quantity	2019-05-06 11:47:13.322041+05:30
41	restaurants	0016_auto_20190507_2359	2019-05-07 23:59:24.359598+05:30
42	paytm	0001_initial	2019-05-11 14:38:56.991686+05:30
43	paytm	0002_auto_20190511_1631	2019-05-11 16:31:30.179679+05:30
44	paytm	0003_merchantprofile	2019-08-02 20:29:07.733051+05:30
45	paytm	0004_auto_20190802_2032	2019-08-02 20:32:48.369731+05:30
46	paytm	0005_auto_20190802_2037	2019-08-02 20:37:19.94214+05:30
47	paytm	0006_auto_20190802_2103	2019-08-02 21:03:09.874042+05:30
48	restaurants	0017_auto_20190802_2028	2019-08-02 23:19:02.093658+05:30
49	restaurants	0018_auto_20190802_2058	2019-08-02 23:19:02.212153+05:30
50	restaurants	0019_auto_20190802_2103	2019-08-02 23:25:22.460755+05:30
51	restaurants	0020_auto_20190802_2320	2019-08-02 23:25:22.515995+05:30
52	restaurants	0021_auto_20190803_0003	2019-08-03 00:03:22.288444+05:30
53	restaurants	0022_remove_order_items	2019-08-03 16:04:26.086482+05:30
54	restaurants	0023_order_items	2019-08-03 16:04:43.021016+05:30
55	restaurants	0024_remove_quantity_order	2019-08-03 16:11:15.589743+05:30
56	restaurants	0025_quantity_order	2019-08-03 16:13:43.370688+05:30
57	paytm	0007_auto_20190804_1947	2019-08-04 19:47:56.146364+05:30
58	paytm	0008_auto_20190804_2050	2019-08-04 20:50:57.763877+05:30
59	default	0001_initial	2019-08-06 11:02:15.247147+05:30
60	social_auth	0001_initial	2019-08-06 11:02:15.323489+05:30
61	default	0002_add_related_name	2019-08-06 11:02:15.6796+05:30
62	social_auth	0002_add_related_name	2019-08-06 11:02:15.701454+05:30
63	default	0003_alter_email_max_length	2019-08-06 11:02:15.7447+05:30
64	social_auth	0003_alter_email_max_length	2019-08-06 11:02:15.75452+05:30
65	default	0004_auto_20160423_0400	2019-08-06 11:02:15.787925+05:30
66	social_auth	0004_auto_20160423_0400	2019-08-06 11:02:15.811806+05:30
67	social_auth	0005_auto_20160727_2333	2019-08-06 11:02:15.879483+05:30
68	social_django	0006_partial	2019-08-06 11:02:16.080203+05:30
69	social_django	0007_code_timestamp	2019-08-06 11:02:16.395833+05:30
70	social_django	0008_partial_timestamp	2019-08-06 11:02:16.693017+05:30
71	social_django	0003_alter_email_max_length	2019-08-06 11:02:16.711964+05:30
72	social_django	0001_initial	2019-08-06 11:02:16.725189+05:30
73	social_django	0005_auto_20160727_2333	2019-08-06 11:02:16.735899+05:30
74	social_django	0004_auto_20160423_0400	2019-08-06 11:02:16.749843+05:30
75	social_django	0002_add_related_name	2019-08-06 11:02:16.769369+05:30
76	socialAuth	0001_initial	2019-08-07 19:14:32.954801+05:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 76, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ibkfstctznzahkog7rwreagtbs6uct3n	NzE4ZGY5YjM5NTI5NjdjYmFlYjlkNjhmNGRjMjlhOWYwM2FkZDk2Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjkxY2NhYWU3ZmRlM2MwY2FiNjM2MWFmY2FiNTIzMTdlYjRkZmZkOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-04-11 14:54:01.186309+05:30
3vyli64om2ta40cquiinsplfms47uldj	NzMxZGNkOTFhNmNmODhhYjI4MDE2OTZjMzE2NjIwZmEyZmZlZDRlMzp7ImNyZWRlbnRpYWxzIjoie1wiaWRfdG9rZW5fand0XCI6IFwiZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNklqTTBPVFJpTVdVM09EWmpaR0ZrTURreVpUUXlNemMyTm1KaVpUTTNaalUwWldRNE4ySXlNbVFpTENKMGVYQWlPaUpLVjFRaWZRLmV5SnBjM01pT2lKb2RIUndjem92TDJGalkyOTFiblJ6TG1kdmIyZHNaUzVqYjIwaUxDSmhlbkFpT2lJME5Ea3hNamcwTnpneU9URXRPVEJrWkdNM2FXYzBORGx1T1cwM09XeDBkSE4yYm1Zd1l6QnZOR2x0ZEdNdVlYQndjeTVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwaUxDSmhkV1FpT2lJME5Ea3hNamcwTnpneU9URXRPVEJrWkdNM2FXYzBORGx1T1cwM09XeDBkSE4yYm1Zd1l6QnZOR2x0ZEdNdVlYQndjeTVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwaUxDSnpkV0lpT2lJeE1EazVNRFV4TkRZMU5qWXhOVFV5TlRrd01qRWlMQ0psYldGcGJDSTZJbkJwZVhWemFDNXVMbWhBWjIxaGFXd3VZMjl0SWl3aVpXMWhhV3hmZG1WeWFXWnBaV1FpT25SeWRXVXNJbUYwWDJoaGMyZ2lPaUpYWjNSSFF6ZE9WSFZOVVVNeWFFaDFMWGhITkRGbklpd2libUZ0WlNJNklsQnBlWFZ6YUNCSVlXNWphR0YwWlNJc0luQnBZM1IxY21VaU9pSm9kSFJ3Y3pvdkwyeG9OQzVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwdkxWVjNWR3BFUW5kQlpWbDNMMEZCUVVGQlFVRkJRVUZKTDBGQlFVRkJRVUZCUmt0TkwwUmtNRzF6YVdGblJUbFJMM001TmkxakwzQm9iM1J2TG1wd1p5SXNJbWRwZG1WdVgyNWhiV1VpT2lKUWFYbDFjMmdpTENKbVlXMXBiSGxmYm1GdFpTSTZJa2hoYm1Ob1lYUmxJaXdpYkc5allXeGxJam9pWlc0aUxDSnBZWFFpT2pFMU5qVXhPREEyTlRBc0ltVjRjQ0k2TVRVMk5URTROREkxTUgwLmdKYklUdTRBM092LU5TYXRjRUV6cTE2QlYyQzJORVdnT0twaXM5T2J5MlZfaWg2TGJhZm1VMzRLYnhZd2Y5aGZnQ2k2aW5uajFzYVpZYlZ1cVRTZ1BwdFlxZHI2ODdnci1CM0Y4UERpQmhZaC11d3dGTnJ4LTNhMklwdnpTbUlnbzl4SnVaTFpnNXBMZ1NNSXM3NFR6V2dSekQxbzEyQUswX2pHaVNqRk5qZG56WmdOczliR3RsNm5pNTFVSFp6b3RCSXBISHk3WmdSOURYVWUzV0g5Y21zQ3JfVG5jLVBiT2R6cU5KNjc1eFhnSzZqTnJySm1fSkw3d1Y2RFBabUNIQVkxSXNaVWdnY3BwWTEyb2x1Q1JqY2VTSXpVOGdfcTBoNWlUZWl4LTkwQkZFNElKRDJZRWNrd2pVSXhkcEppU0pYUWluTlJxWXc2YWdCYzJzZGxYQVwiLCBcImludmFsaWRcIjogZmFsc2UsIFwiX2NsYXNzXCI6IFwiT0F1dGgyQ3JlZGVudGlhbHNcIiwgXCJfbW9kdWxlXCI6IFwib2F1dGgyY2xpZW50LmNsaWVudFwiLCBcInRva2VuX2luZm9fdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW5pbmZvXCIsIFwicmV2b2tlX3VyaVwiOiBcImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Jldm9rZVwiLCBcInJlZnJlc2hfdG9rZW5cIjogbnVsbCwgXCJ0b2tlbl9leHBpcnlcIjogXCIyMDE5LTA4LTA3VDEzOjI0OjA4WlwiLCBcInRva2VuX3VyaVwiOiBcImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Rva2VuXCIsIFwiY2xpZW50X3NlY3JldFwiOiBcIjBTZ2V1WWg2bzRqSDdDRGR0OWV0S0YzT1wiLCBcInRva2VuX3Jlc3BvbnNlXCI6IHtcInRva2VuX3R5cGVcIjogXCJCZWFyZXJcIiwgXCJpZF90b2tlblwiOiBcImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJak0wT1RSaU1XVTNPRFpqWkdGa01Ea3laVFF5TXpjMk5tSmlaVE0zWmpVMFpXUTROMkl5TW1RaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwyRmpZMjkxYm5SekxtZHZiMmRzWlM1amIyMGlMQ0poZW5BaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0poZFdRaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0p6ZFdJaU9pSXhNRGs1TURVeE5EWTFOall4TlRVeU5Ua3dNakVpTENKbGJXRnBiQ0k2SW5CcGVYVnphQzV1TG1oQVoyMWhhV3d1WTI5dElpd2laVzFoYVd4ZmRtVnlhV1pwWldRaU9uUnlkV1VzSW1GMFgyaGhjMmdpT2lKWFozUkhRemRPVkhWTlVVTXlhRWgxTFhoSE5ERm5JaXdpYm1GdFpTSTZJbEJwZVhWemFDQklZVzVqYUdGMFpTSXNJbkJwWTNSMWNtVWlPaUpvZEhSd2N6b3ZMMnhvTkM1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMHZMVlYzVkdwRVFuZEJaVmwzTDBGQlFVRkJRVUZCUVVGSkwwRkJRVUZCUVVGQlJrdE5MMFJrTUcxemFXRm5SVGxSTDNNNU5pMWpMM0JvYjNSdkxtcHdaeUlzSW1kcGRtVnVYMjVoYldVaU9pSlFhWGwxYzJnaUxDSm1ZVzFwYkhsZmJtRnRaU0k2SWtoaGJtTm9ZWFJsSWl3aWJHOWpZV3hsSWpvaVpXNGlMQ0pwWVhRaU9qRTFOalV4T0RBMk5UQXNJbVY0Y0NJNk1UVTJOVEU0TkRJMU1IMC5nSmJJVHU0QTNPdi1OU2F0Y0VFenExNkJWMkMyTkVXZ09LcGlzOU9ieTJWX2loNkxiYWZtVTM0S2J4WXdmOWhmZ0NpNmlubmoxc2FaWWJWdXFUU2dQcHRZcWRyNjg3Z3ItQjNGOFBEaUJoWWgtdXd3Rk5yeC0zYTJJcHZ6U21JZ285eEp1WkxaZzVwTGdTTUlzNzRUeldnUnpEMW8xMkFLMF9qR2lTakZOamRuelpnTnM5Ykd0bDZuaTUxVUhaem90QklwSEh5N1pnUjlEWFVlM1dIOWNtc0NyX1RuYy1QYk9kenFOSjY3NXhYZ0s2ak5yckptX0pMN3dWNkRQWm1DSEFZMUlzWlVnZ2NwcFkxMm9sdUNSamNlU0l6VThnX3EwaDVpVGVpeC05MEJGRTRJSkQyWUVja3dqVUl4ZHBKaVNKWFFpbk5ScVl3NmFnQmMyc2RsWEFcIiwgXCJzY29wZVwiOiBcIm9wZW5pZCBodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9hdXRoL3VzZXJpbmZvLnByb2ZpbGUgaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vYXV0aC91c2VyaW5mby5lbWFpbFwiLCBcImFjY2Vzc190b2tlblwiOiBcInlhMjkuR2x4ZEIyanhtQ1RlNC1kcWdHbkNIM3lYMWtkY3VDT2pBTnlsMVpKakZYQS1MV0d2U1VMOFJMNllRUGVRUmJvM21qVGZMSTljdk5yaFJmTUFlN2xqSlYzQ0o3eExPVkgtNDE5cXc2NXFxbTZ2RHQ1Mk82dVl6TGtsTWFtS2RBXCIsIFwiZXhwaXJlc19pblwiOiAzNTk4fSwgXCJzY29wZXNcIjogW1wiZW1haWxcIiwgXCJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9hdXRoL2RyaXZlLmFwcGRhdGFcIiwgXCJwcm9maWxlXCJdLCBcInVzZXJfYWdlbnRcIjogbnVsbCwgXCJhY2Nlc3NfdG9rZW5cIjogXCJ5YTI5LkdseGRCMmp4bUNUZTQtZHFnR25DSDN5WDFrZGN1Q09qQU55bDFaSmpGWEEtTFdHdlNVTDhSTDZZUVBlUVJibzNtalRmTEk5Y3ZOcmhSZk1BZTdsakpWM0NKN3hMT1ZILTQxOXF3NjVxcW02dkR0NTJPNnVZekxrbE1hbUtkQVwiLCBcImNsaWVudF9pZFwiOiBcIjQ0OTEyODQ3ODI5MS05MGRkYzdpZzQ0OW45bTc5bHR0c3ZuZjBjMG80aW10Yy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbVwiLCBcImlkX3Rva2VuXCI6IHtcInN1YlwiOiBcIjEwOTkwNTE0NjU2NjE1NTI1OTAyMVwiLCBcImdpdmVuX25hbWVcIjogXCJQaXl1c2hcIiwgXCJhdWRcIjogXCI0NDkxMjg0NzgyOTEtOTBkZGM3aWc0NDluOW03OWx0dHN2bmYwYzBvNGltdGMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb21cIiwgXCJlbWFpbFwiOiBcInBpeXVzaC5uLmhAZ21haWwuY29tXCIsIFwiYXpwXCI6IFwiNDQ5MTI4NDc4MjkxLTkwZGRjN2lnNDQ5bjltNzlsdHRzdm5mMGMwbzRpbXRjLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tXCIsIFwiZW1haWxfdmVyaWZpZWRcIjogdHJ1ZSwgXCJwaWN0dXJlXCI6IFwiaHR0cHM6Ly9saDQuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1Vd1RqREJ3QWVZdy9BQUFBQUFBQUFBSS9BQUFBQUFBQUZLTS9EZDBtc2lhZ0U5US9zOTYtYy9waG90by5qcGdcIiwgXCJsb2NhbGVcIjogXCJlblwiLCBcImZhbWlseV9uYW1lXCI6IFwiSGFuY2hhdGVcIiwgXCJpc3NcIjogXCJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb21cIiwgXCJhdF9oYXNoXCI6IFwiV2d0R0M3TlR1TVFDMmhIdS14RzQxZ1wiLCBcIm5hbWVcIjogXCJQaXl1c2ggSGFuY2hhdGVcIiwgXCJleHBcIjogMTU2NTE4NDI1MCwgXCJpYXRcIjogMTU2NTE4MDY1MH19In0=	2019-08-21 17:54:10.074681+05:30
l4frvlrnjnmaattxtyr6uugcyik0i9l4	MjcwOGNjYTZhZjlkNGRmOGE1ZmIwYTlkY2M5ZDY2YTViODFkYzA2OTp7ImNyZWRlbnRpYWxzIjoie1widG9rZW5fZXhwaXJ5XCI6IFwiMjAxOS0wOC0wN1QxNDoxMToyN1pcIiwgXCJ0b2tlbl9pbmZvX3VyaVwiOiBcImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Rva2VuaW5mb1wiLCBcImNsaWVudF9zZWNyZXRcIjogXCIwU2dldVloNm80akg3Q0RkdDlldEtGM09cIiwgXCJ0b2tlbl91cmlcIjogXCJodHRwczovL29hdXRoMi5nb29nbGVhcGlzLmNvbS90b2tlblwiLCBcInNjb3Blc1wiOiBbXCJwcm9maWxlXCIsIFwiaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vYXV0aC9kcml2ZS5hcHBkYXRhXCIsIFwiZW1haWxcIl0sIFwiaWRfdG9rZW5cIjoge1wiYXpwXCI6IFwiNDQ5MTI4NDc4MjkxLTkwZGRjN2lnNDQ5bjltNzlsdHRzdm5mMGMwbzRpbXRjLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tXCIsIFwiZW1haWxfdmVyaWZpZWRcIjogdHJ1ZSwgXCJzdWJcIjogXCIxMDk5MDUxNDY1NjYxNTUyNTkwMjFcIiwgXCJpc3NcIjogXCJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb21cIiwgXCJhdF9oYXNoXCI6IFwiX2RJVUs0REMwNUsxNTV6QS1TRjIxd1wiLCBcImVtYWlsXCI6IFwicGl5dXNoLm4uaEBnbWFpbC5jb21cIiwgXCJwaWN0dXJlXCI6IFwiaHR0cHM6Ly9saDQuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1Vd1RqREJ3QWVZdy9BQUFBQUFBQUFBSS9BQUFBQUFBQUZLTS9EZDBtc2lhZ0U5US9zOTYtYy9waG90by5qcGdcIiwgXCJleHBcIjogMTU2NTE4NzA5NCwgXCJhdWRcIjogXCI0NDkxMjg0NzgyOTEtOTBkZGM3aWc0NDluOW03OWx0dHN2bmYwYzBvNGltdGMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb21cIiwgXCJnaXZlbl9uYW1lXCI6IFwiUGl5dXNoXCIsIFwiZmFtaWx5X25hbWVcIjogXCJIYW5jaGF0ZVwiLCBcImlhdFwiOiAxNTY1MTgzNDk0LCBcImxvY2FsZVwiOiBcImVuXCIsIFwibmFtZVwiOiBcIlBpeXVzaCBIYW5jaGF0ZVwifSwgXCJfbW9kdWxlXCI6IFwib2F1dGgyY2xpZW50LmNsaWVudFwiLCBcImlkX3Rva2VuX2p3dFwiOiBcImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJak0wT1RSaU1XVTNPRFpqWkdGa01Ea3laVFF5TXpjMk5tSmlaVE0zWmpVMFpXUTROMkl5TW1RaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwyRmpZMjkxYm5SekxtZHZiMmRzWlM1amIyMGlMQ0poZW5BaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0poZFdRaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0p6ZFdJaU9pSXhNRGs1TURVeE5EWTFOall4TlRVeU5Ua3dNakVpTENKbGJXRnBiQ0k2SW5CcGVYVnphQzV1TG1oQVoyMWhhV3d1WTI5dElpd2laVzFoYVd4ZmRtVnlhV1pwWldRaU9uUnlkV1VzSW1GMFgyaGhjMmdpT2lKZlpFbFZTelJFUXpBMVN6RTFOWHBCTFZOR01qRjNJaXdpYm1GdFpTSTZJbEJwZVhWemFDQklZVzVqYUdGMFpTSXNJbkJwWTNSMWNtVWlPaUpvZEhSd2N6b3ZMMnhvTkM1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMHZMVlYzVkdwRVFuZEJaVmwzTDBGQlFVRkJRVUZCUVVGSkwwRkJRVUZCUVVGQlJrdE5MMFJrTUcxemFXRm5SVGxSTDNNNU5pMWpMM0JvYjNSdkxtcHdaeUlzSW1kcGRtVnVYMjVoYldVaU9pSlFhWGwxYzJnaUxDSm1ZVzFwYkhsZmJtRnRaU0k2SWtoaGJtTm9ZWFJsSWl3aWJHOWpZV3hsSWpvaVpXNGlMQ0pwWVhRaU9qRTFOalV4T0RNME9UUXNJbVY0Y0NJNk1UVTJOVEU0TnpBNU5IMC5QMlNKeEFLWGV1MDRIVTNyclJBeVNnYjhITXhaZFdwaUFWcW9KcEI5eEtDRGl2eDB5TENOTG1USW5WYmRFbWZwSWxkLWxJTVlDUk4zTGdoUjg1NVhnTUV6RHllYXF6TjEzMFozY0lIXzR3STlpSXFMc2NCLUxCMS0xcjdwall0SnI0S1htN095OWJtS0RITFRmWWo1NXRrbXhuS2d4SUs3cFFyTmMyUTJCeFl2c1N4MUhjRGdUaWtPLWRRekFDUk9hN243M2hJX3FvR2o1RlJPNXhKOWJURmJBRjIwRHVTSmc2d0FLcFFzZGlLaEhnckU2OVJhLW9HZmZqZXVLbmM2ZDJEbHhOUXFBYWhNdXB6ZkE3UkZfZHQtV0t4YXJ0aXl1T0szbUlibG9ZU3Z0MUFId21PbHJrbXBHYmVBUk1JQUZobzlrQjdTTkE4QnQtZHNhTHVxRFFcIiwgXCJhY2Nlc3NfdG9rZW5cIjogXCJ5YTI5LkdseGRCeFFubHFLNlJsYXNXMUhkeW9EZkJFdC1yWDNHME1RTG9rc05VZHdJOTBmelhFTVpHQzdJMHFkNThfNTV2WXpFQ1hjNmRuNTFEUTg3MVJKcThfUllRNVE1S0tTY1lZVlJ4V1ZhellVYk1paWtxREltem1XNExONlB6d1wiLCBcInJldm9rZV91cmlcIjogXCJodHRwczovL29hdXRoMi5nb29nbGVhcGlzLmNvbS9yZXZva2VcIiwgXCJpbnZhbGlkXCI6IGZhbHNlLCBcInVzZXJfYWdlbnRcIjogbnVsbCwgXCJyZWZyZXNoX3Rva2VuXCI6IG51bGwsIFwiY2xpZW50X2lkXCI6IFwiNDQ5MTI4NDc4MjkxLTkwZGRjN2lnNDQ5bjltNzlsdHRzdm5mMGMwbzRpbXRjLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tXCIsIFwidG9rZW5fcmVzcG9uc2VcIjoge1wiaWRfdG9rZW5cIjogXCJleUpoYkdjaU9pSlNVekkxTmlJc0ltdHBaQ0k2SWpNME9UUmlNV1UzT0RaalpHRmtNRGt5WlRReU16YzJObUppWlRNM1pqVTBaV1E0TjJJeU1tUWlMQ0owZVhBaU9pSktWMVFpZlEuZXlKcGMzTWlPaUpvZEhSd2N6b3ZMMkZqWTI5MWJuUnpMbWR2YjJkc1pTNWpiMjBpTENKaGVuQWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKaGRXUWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKemRXSWlPaUl4TURrNU1EVXhORFkxTmpZeE5UVXlOVGt3TWpFaUxDSmxiV0ZwYkNJNkluQnBlWFZ6YUM1dUxtaEFaMjFoYVd3dVkyOXRJaXdpWlcxaGFXeGZkbVZ5YVdacFpXUWlPblJ5ZFdVc0ltRjBYMmhoYzJnaU9pSmZaRWxWU3pSRVF6QTFTekUxTlhwQkxWTkdNakYzSWl3aWJtRnRaU0k2SWxCcGVYVnphQ0JJWVc1amFHRjBaU0lzSW5CcFkzUjFjbVVpT2lKb2RIUndjem92TDJ4b05DNW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjB2TFZWM1ZHcEVRbmRCWlZsM0wwRkJRVUZCUVVGQlFVRkpMMEZCUVVGQlFVRkJSa3ROTDBSa01HMXphV0ZuUlRsUkwzTTVOaTFqTDNCb2IzUnZMbXB3WnlJc0ltZHBkbVZ1WDI1aGJXVWlPaUpRYVhsMWMyZ2lMQ0ptWVcxcGJIbGZibUZ0WlNJNklraGhibU5vWVhSbElpd2liRzlqWVd4bElqb2laVzRpTENKcFlYUWlPakUxTmpVeE9ETTBPVFFzSW1WNGNDSTZNVFUyTlRFNE56QTVOSDAuUDJTSnhBS1hldTA0SFUzcnJSQXlTZ2I4SE14WmRXcGlBVnFvSnBCOXhLQ0RpdngweUxDTkxtVEluVmJkRW1mcElsZC1sSU1ZQ1JOM0xnaFI4NTVYZ01FekR5ZWFxek4xMzBaM2NJSF80d0k5aUlxTHNjQi1MQjEtMXI3cGpZdEpyNEtYbTdPeTlibUtESExUZllqNTV0a214bktneElLN3BRck5jMlEyQnhZdnNTeDFIY0RnVGlrTy1kUXpBQ1JPYTduNzNoSV9xb0dqNUZSTzV4SjliVEZiQUYyMER1U0pnNndBS3BRc2RpS2hIZ3JFNjlSYS1vR2ZmamV1S25jNmQyRGx4TlFxQWFoTXVwemZBN1JGX2R0LVdLeGFydGl5dU9LM21JYmxvWVN2dDFBSHdtT2xya21wR2JlQVJNSUFGaG85a0I3U05BOEJ0LWRzYUx1cURRXCIsIFwidG9rZW5fdHlwZVwiOiBcIkJlYXJlclwiLCBcInNjb3BlXCI6IFwiaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vYXV0aC91c2VyaW5mby5wcm9maWxlIGh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvdXNlcmluZm8uZW1haWwgb3BlbmlkXCIsIFwiZXhwaXJlc19pblwiOiAzNTkzLCBcImFjY2Vzc190b2tlblwiOiBcInlhMjkuR2x4ZEJ4UW5scUs2Umxhc1cxSGR5b0RmQkV0LXJYM0cwTVFMb2tzTlVkd0k5MGZ6WEVNWkdDN0kwcWQ1OF81NXZZekVDWGM2ZG41MURRODcxUkpxOF9SWVE1UTVLS1NjWVlWUnhXVmF6WVViTWlpa3FESW16bVc0TE42UHp3XCJ9LCBcIl9jbGFzc1wiOiBcIk9BdXRoMkNyZWRlbnRpYWxzXCJ9In0=	2019-08-21 18:41:34.60604+05:30
tisuy6a89bejxm4eduzv1047j2txcexu	MDJjNjc5NTM2ZDhjNGFhNzUxNjY4N2Q5ODg4M2RmNDZjM2FkNDVmMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiOTFjY2FhZTdmZGUzYzBjYWI2MzYxYWZjYWI1MjMxN2ViNGRmZmQ4In0=	2019-04-26 20:31:12.377473+05:30
c9jl12odd2s9x6dsedxy2wgdk3eurx6z	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-04-26 20:31:27.631244+05:30
sioiy39y9gt6nlqwdghekg0mpi2nht0t	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-26 23:31:05.640119+05:30
cnee2pir2dhc1wk9mmun8wo7yxydj5ez	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-26 23:36:01.897411+05:30
xo09w6dtv9q0nkpo8k20ryudvppmue78	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-26 23:37:29.721505+05:30
bouv8aqkkffdxz5gc9hf9b3wmc7vg6dr	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-04-27 12:04:25.261642+05:30
fczqcjadkvp77jayirsrw845b8a37aad	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-27 18:26:33.756388+05:30
71t6rub9qob3e15i3xad92tg90stlda3	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-04-28 00:28:54.190497+05:30
7qppgjhe1k9pew0a97z1aucfp1vkz28e	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-04-28 00:59:33.382623+05:30
xwtbfyo4nu45mex4ktia3km3bphwzebq	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-28 01:15:38.443417+05:30
lmav4wvjfhnvywld62ztopohn7qfbi7c	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-28 01:26:04.260106+05:30
x4wue0hm0ofv1pxdjroye4iag7qjdpea	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-28 01:28:36.63846+05:30
ghb47kkcrhzrsyonanj6u5dweoy2m44n	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-04-28 01:53:52.282151+05:30
hbhseeh2ufx3cop3xt14j75tpwiaurnx	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-28 12:11:30.65161+05:30
3lfr67r8kkjlfdt3c638tbn2sdi9t1n2	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-28 12:14:40.031142+05:30
v0myz7x88v2wr3min4mciy1bczn9gecn	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-28 12:16:05.785242+05:30
qy9q6xo1uvhqycciaknn4gbmhh7fmnx8	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-28 12:16:31.388959+05:30
skox1ddiqp9eey99y1o5shgvvyd261uj	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-04-28 12:30:11.063552+05:30
4owlrnc50fmjnwqt1go6g79lszxyosez	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-04-28 12:32:27.637866+05:30
v3uokjff6vjyh81ibvps2blfc3xmluvy	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-04-28 16:47:24.786857+05:30
le2m8ohy21boi2tyilxm4l51y7w1obem	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-04-29 00:09:27.762275+05:30
vyh9jg36joqy8dm3z95zb7vx43l8kjm4	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-04-29 00:16:19.807659+05:30
vgq24vs9esdc2ziecvmm47429xgsizz4	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-04-29 01:10:04.926405+05:30
55mclscla28tyzlr312j0u25km8pl0py	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-15 19:38:14.50772+05:30
hghz1b7jodewt1wopd2c2uopemqp5yb8	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-12 15:20:17.947458+05:30
8nd2p7a32xv5l6dkgjvzhzrz7sccn8gj	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 16:22:22.75179+05:30
wr1ms94srp87xrmr41aufkzailigtt5m	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 16:48:10.84012+05:30
kk8gn612c3ds7xuybjrcb9y0kbu1bxmj	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 16:49:04.596212+05:30
2g13t8ighw3ibfqeii0ksd16r10t2gdg	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 18:10:19.285472+05:30
1gvzrbdiq2r9ugaet0jh8bfksq4eha0q	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 18:12:02.723928+05:30
qnopx1135us0a0put40fun302tzap8o9	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 18:13:26.41388+05:30
pzi7iq9r9oc0cae9vq16rv4likom1ovb	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 18:15:07.225863+05:30
vt2avs490ovr0uyivanogxel5u2bdrem	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 19:14:12.228237+05:30
6qu21v35m7nynp39bymmgmu1dolokpzb	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 19:21:38.167596+05:30
96p0958llt0wewioti6bixcxkt6lof7l	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 19:27:14.611251+05:30
o3834bz1e66cryrmk7ayze6osvhwiav3	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 20:39:00.091271+05:30
529pn3npuexuat45dspiscd6veoqb1ty	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 20:40:15.272508+05:30
ldgftp86oi96a00w600w0ylzkijow7t9	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 20:45:23.590098+05:30
1lmrmgc5ab7vly5pauicy7d7n635bdic	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-12 21:21:04.16861+05:30
xdbulu3205ai351rk8it0rorb60a95my	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-14 22:45:58.650585+05:30
daqb83nap2snxvm6thgm2cxsbqat4joc	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-14 22:48:18.207321+05:30
b6z0fommo9yno8sh1dlgn2avnfp39sv5	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-14 22:48:38.008359+05:30
yw1zahu806hecw6yo5z72ekk7h81e7wg	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-14 22:55:50.096311+05:30
2l1gzqkc5qrwyfp3efw29fgnnmzpzds8	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-14 23:49:03.442201+05:30
th9zbb7y7z5o94j0ijhpcpd1jt4tpm46	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-15 19:27:57.239418+05:30
2wndxefivqxajsiqo5rjujddf8g0e3gn	YjhlNmE4NWJmZDMyZmZhNDcwYzBmNmViMDI4MmMzOGVhYWEyNWY4MDp7ImNyZWRlbnRpYWxzIjoie1wiYWNjZXNzX3Rva2VuXCI6IFwieWEyOS5HbHhkQi1tOUdXS1JnT3R6U2RxelVlS2tVXzVGdFRSU1MwNnprQ2dDXzBEVDRVcTFIbXA2d01aVGNveWY5enFWeFkzY2l2SDdzdXJTWXJZaFV3SG5HY1VMc29mdE5UMjBTVDBSNFBiMkp2RG52T3pDVkFjNkJiY2Y1Ri1vd3dcIiwgXCJpZF90b2tlbl9qd3RcIjogXCJleUpoYkdjaU9pSlNVekkxTmlJc0ltdHBaQ0k2SWpNME9UUmlNV1UzT0RaalpHRmtNRGt5WlRReU16YzJObUppWlRNM1pqVTBaV1E0TjJJeU1tUWlMQ0owZVhBaU9pSktWMVFpZlEuZXlKcGMzTWlPaUpvZEhSd2N6b3ZMMkZqWTI5MWJuUnpMbWR2YjJkc1pTNWpiMjBpTENKaGVuQWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKaGRXUWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKemRXSWlPaUl4TURrNU1EVXhORFkxTmpZeE5UVXlOVGt3TWpFaUxDSmxiV0ZwYkNJNkluQnBlWFZ6YUM1dUxtaEFaMjFoYVd3dVkyOXRJaXdpWlcxaGFXeGZkbVZ5YVdacFpXUWlPblJ5ZFdVc0ltRjBYMmhoYzJnaU9pSmlhakIzYWs1bmEzTnNSa1pTZW04M1gwMHlXRlozSWl3aWJtRnRaU0k2SWxCcGVYVnphQ0JJWVc1amFHRjBaU0lzSW5CcFkzUjFjbVVpT2lKb2RIUndjem92TDJ4b05DNW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjB2TFZWM1ZHcEVRbmRCWlZsM0wwRkJRVUZCUVVGQlFVRkpMMEZCUVVGQlFVRkJSa3ROTDBSa01HMXphV0ZuUlRsUkwzTTVOaTFqTDNCb2IzUnZMbXB3WnlJc0ltZHBkbVZ1WDI1aGJXVWlPaUpRYVhsMWMyZ2lMQ0ptWVcxcGJIbGZibUZ0WlNJNklraGhibU5vWVhSbElpd2liRzlqWVd4bElqb2laVzRpTENKcFlYUWlPakUxTmpVeE9EQTJOemdzSW1WNGNDSTZNVFUyTlRFNE5ESTNPSDAubWFSdU1ES0ZoeTJiVGdNcGNSekFET2s5T0l3OENSZnY0MkIwMnAySVJDMjhJZTV3QWJEVlpwTENUYm43M3hkbFJocmEwNUo2S1Y0QlB4NUNqdnpNY3BacXhrblRhRjFTWllsMlNmeVpZWXBDbWZGcVlGeThoRHJsWjJmbU9lY3pYbzhibW83MFVyU1pFSmlYaEVQMWU5cWtCTGRmSHZ5SGxxM1cwY0cya29WVWozd2JWZHlmN1RfT0ktdDVWTm1HVW5Rc1NObWt2UEpnSUpQdHR3SGJOTkpyOXV5Xzl3UHZlSlUzRFM5WWV6cUJpQWlYbEQ1QzlEVEw0eXZwRE1keEdJRkdzejgxVU52b3dQazBXOGNPdjdPZ0tQQnBsN3pmbEUtbE5rbHdBRUM5eF9mU3lJTnRTUmg0QjBWM0drUlctblI0ZkRJTlAxS1c1WTdBNWg4V1R3XCIsIFwidXNlcl9hZ2VudFwiOiBudWxsLCBcIl9jbGFzc1wiOiBcIk9BdXRoMkNyZWRlbnRpYWxzXCIsIFwiY2xpZW50X3NlY3JldFwiOiBcIjBTZ2V1WWg2bzRqSDdDRGR0OWV0S0YzT1wiLCBcInRva2VuX3VyaVwiOiBcImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Rva2VuXCIsIFwicmV2b2tlX3VyaVwiOiBcImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Jldm9rZVwiLCBcImNsaWVudF9pZFwiOiBcIjQ0OTEyODQ3ODI5MS05MGRkYzdpZzQ0OW45bTc5bHR0c3ZuZjBjMG80aW10Yy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbVwiLCBcInRva2VuX2luZm9fdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW5pbmZvXCIsIFwiaW52YWxpZFwiOiBmYWxzZSwgXCJyZWZyZXNoX3Rva2VuXCI6IG51bGwsIFwidG9rZW5fcmVzcG9uc2VcIjoge1wiZXhwaXJlc19pblwiOiAzNTk4LCBcImFjY2Vzc190b2tlblwiOiBcInlhMjkuR2x4ZEItbTlHV0tSZ090elNkcXpVZUtrVV81RnRUUlNTMDZ6a0NnQ18wRFQ0VXExSG1wNndNWlRjb3lmOXpxVnhZM2Npdkg3c3VyU1lyWWhVd0huR2NVTHNvZnROVDIwU1QwUjRQYjJKdkRudk96Q1ZBYzZCYmNmNUYtb3d3XCIsIFwic2NvcGVcIjogXCJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9hdXRoL3VzZXJpbmZvLnByb2ZpbGUgaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vYXV0aC91c2VyaW5mby5lbWFpbCBvcGVuaWRcIiwgXCJpZF90b2tlblwiOiBcImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJak0wT1RSaU1XVTNPRFpqWkdGa01Ea3laVFF5TXpjMk5tSmlaVE0zWmpVMFpXUTROMkl5TW1RaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwyRmpZMjkxYm5SekxtZHZiMmRzWlM1amIyMGlMQ0poZW5BaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0poZFdRaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0p6ZFdJaU9pSXhNRGs1TURVeE5EWTFOall4TlRVeU5Ua3dNakVpTENKbGJXRnBiQ0k2SW5CcGVYVnphQzV1TG1oQVoyMWhhV3d1WTI5dElpd2laVzFoYVd4ZmRtVnlhV1pwWldRaU9uUnlkV1VzSW1GMFgyaGhjMmdpT2lKaWFqQjNhazVuYTNOc1JrWlNlbTgzWDAweVdGWjNJaXdpYm1GdFpTSTZJbEJwZVhWemFDQklZVzVqYUdGMFpTSXNJbkJwWTNSMWNtVWlPaUpvZEhSd2N6b3ZMMnhvTkM1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMHZMVlYzVkdwRVFuZEJaVmwzTDBGQlFVRkJRVUZCUVVGSkwwRkJRVUZCUVVGQlJrdE5MMFJrTUcxemFXRm5SVGxSTDNNNU5pMWpMM0JvYjNSdkxtcHdaeUlzSW1kcGRtVnVYMjVoYldVaU9pSlFhWGwxYzJnaUxDSm1ZVzFwYkhsZmJtRnRaU0k2SWtoaGJtTm9ZWFJsSWl3aWJHOWpZV3hsSWpvaVpXNGlMQ0pwWVhRaU9qRTFOalV4T0RBMk56Z3NJbVY0Y0NJNk1UVTJOVEU0TkRJM09IMC5tYVJ1TURLRmh5MmJUZ01wY1J6QURPazlPSXc4Q1JmdjQyQjAycDJJUkMyOEllNXdBYkRWWnBMQ1RibjczeGRsUmhyYTA1SjZLVjRCUHg1Q2p2ek1jcFpxeGtuVGFGMVNaWWwyU2Z5WllZcENtZkZxWUZ5OGhEcmxaMmZtT2VjelhvOGJtbzcwVXJTWkVKaVhoRVAxZTlxa0JMZGZIdnlIbHEzVzBjRzJrb1ZVajN3YlZkeWY3VF9PSS10NVZObUdVblFzU05ta3ZQSmdJSlB0dHdIYk5OSnI5dXlfOXdQdmVKVTNEUzlZZXpxQmlBaVhsRDVDOURUTDR5dnBETWR4R0lGR3N6ODFVTnZvd1BrMFc4Y092N09nS1BCcGw3emZsRS1sTmtsd0FFQzl4X2ZTeUlOdFNSaDRCMFYzR2tSVy1uUjRmRElOUDFLVzVZN0E1aDhXVHdcIiwgXCJ0b2tlbl90eXBlXCI6IFwiQmVhcmVyXCJ9LCBcImlkX3Rva2VuXCI6IHtcImF6cFwiOiBcIjQ0OTEyODQ3ODI5MS05MGRkYzdpZzQ0OW45bTc5bHR0c3ZuZjBjMG80aW10Yy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbVwiLCBcImdpdmVuX25hbWVcIjogXCJQaXl1c2hcIiwgXCJmYW1pbHlfbmFtZVwiOiBcIkhhbmNoYXRlXCIsIFwiZW1haWxfdmVyaWZpZWRcIjogdHJ1ZSwgXCJpYXRcIjogMTU2NTE4MDY3OCwgXCJpc3NcIjogXCJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb21cIiwgXCJhdWRcIjogXCI0NDkxMjg0NzgyOTEtOTBkZGM3aWc0NDluOW03OWx0dHN2bmYwYzBvNGltdGMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb21cIiwgXCJleHBcIjogMTU2NTE4NDI3OCwgXCJuYW1lXCI6IFwiUGl5dXNoIEhhbmNoYXRlXCIsIFwicGljdHVyZVwiOiBcImh0dHBzOi8vbGg0Lmdvb2dsZXVzZXJjb250ZW50LmNvbS8tVXdUakRCd0FlWXcvQUFBQUFBQUFBQUkvQUFBQUFBQUFGS00vRGQwbXNpYWdFOVEvczk2LWMvcGhvdG8uanBnXCIsIFwic3ViXCI6IFwiMTA5OTA1MTQ2NTY2MTU1MjU5MDIxXCIsIFwiZW1haWxcIjogXCJwaXl1c2gubi5oQGdtYWlsLmNvbVwiLCBcImxvY2FsZVwiOiBcImVuXCIsIFwiYXRfaGFzaFwiOiBcImJqMHdqTmdrc2xGRlJ6bzdfTTJYVndcIn0sIFwic2NvcGVzXCI6IFtcInByb2ZpbGVcIiwgXCJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9hdXRoL2RyaXZlLmFwcGRhdGFcIiwgXCJlbWFpbFwiXSwgXCJfbW9kdWxlXCI6IFwib2F1dGgyY2xpZW50LmNsaWVudFwiLCBcInRva2VuX2V4cGlyeVwiOiBcIjIwMTktMDgtMDdUMTM6MjQ6MzZaXCJ9In0=	2019-08-21 17:54:38.964394+05:30
mna2gz4xtnvybnjmjfy4sv9hj6zpojk7	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-15 19:39:55.244658+05:30
x4mulbu9enu8pcsm4r11gasauc1xbg0f	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-15 21:05:18.593676+05:30
quam36smme4t7dmcclaw0hlc8de1nonp	MDJjNjc5NTM2ZDhjNGFhNzUxNjY4N2Q5ODg4M2RmNDZjM2FkNDVmMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiOTFjY2FhZTdmZGUzYzBjYWI2MzYxYWZjYWI1MjMxN2ViNGRmZmQ4In0=	2019-05-15 23:29:11.49296+05:30
9jkpvho6xh9uo9xnvswejg07ddmirbj0	MDJjNjc5NTM2ZDhjNGFhNzUxNjY4N2Q5ODg4M2RmNDZjM2FkNDVmMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiOTFjY2FhZTdmZGUzYzBjYWI2MzYxYWZjYWI1MjMxN2ViNGRmZmQ4In0=	2019-05-16 15:01:10.438204+05:30
84d30w1gqpgqpepeh170639ejnuxuwpr	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-16 15:25:22.077242+05:30
n9ee469f6k3c55pc8x066849p7drwlc2	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-16 21:13:57.374912+05:30
rlawu49z9r5mewsb03c1k8t70r7tsrgc	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-16 22:30:59.719005+05:30
uz8y7uryviph5nl8aqbtk46vofriks4y	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-17 00:42:21.991073+05:30
kt1sbn47liall82mr2f3zo0mazcf2b6j	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-17 10:39:18.622382+05:30
mlvemukj8570cxnnnzbrqnc7y0bpacgq	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-17 10:56:16.425262+05:30
i4wf7efl5aqarwivm5mle4b1ndo9al17	ZDkyNjNkNTUyZmZkZDQwNDEwZGQ2YzE2MThmMTRmY2NiYjk3YjZjNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjkxY2NhYWU3ZmRlM2MwY2FiNjM2MWFmY2FiNTIzMTdlYjRkZmZkOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-05-17 11:26:12.409802+05:30
yempw5poq8qp8uwjb3fzpaha60ql661n	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-17 11:27:04.6909+05:30
0lsjjpa7stedca2fcqop6ijr66fn4pnc	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-17 11:33:09.023583+05:30
0k8bepi33w1ujrgcqwrakwrmp6qk5qco	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-17 12:30:53.596685+05:30
s23l2ylrqmgfqtnp2e3ex5pox36k0b4g	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-17 12:48:02.720964+05:30
sgvvzoiuc3hagbvoolxz8chzogrlst3q	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-17 13:39:49.691723+05:30
52qppgtgpwb9fu3w7hncn2f2adhqz5xb	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-17 19:34:33.690848+05:30
80ypic00io452rvcie2wtzot3m96n04h	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-18 14:56:55.676914+05:30
akc11ef2nh5xpri1uecz7ki6mx3jswmy	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-18 15:40:10.34609+05:30
ti8q21wc52x799im4gpvs3ecsbp6yvf5	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-18 16:25:04.59987+05:30
6xmqk91fra4a1cst5th3bqnccl6ey60w	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-18 17:26:02.829553+05:30
wo5klqzbgdyms6zwaauh59t278vx3ig1	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-18 18:50:43.628531+05:30
rofr2urmk9qizempojdb02jev1y755gy	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-18 19:54:32.22853+05:30
r4zwzuomo9zlhsywfj6v2vjwvnpivo9w	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-18 20:54:56.642097+05:30
ycnwcft2a1tijfsmjp3ue34iv7wn5hje	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-18 21:55:21.099066+05:30
tw5vvztuaprclx5bh8qsrhrqr0u1j1i1	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-18 23:13:58.658184+05:30
2igi0fn3d3ogg10zcuj5xi2otbw828rk	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 13:31:32.543115+05:30
ppt00zvfxypn378h6cn7mrs7tov5re5l	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 17:42:35.61689+05:30
zfi0o90alfplpod4vumgqhq0wf0dfr25	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 18:45:56.510843+05:30
pzvfai5ox9xwe9mefvmqdmpe9svw1txa	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 20:07:40.465566+05:30
v03xehtszdgbt48adadu57jwotm2m9p3	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 21:12:10.717269+05:30
44j6aybul0z1zilfl7nprxefbrszaobf	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 21:12:21.162625+05:30
b1kbb01ofa29t5zy4bbtuji28r31cuz9	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 22:24:45.786781+05:30
7ikgy28r7zkbi6nb9iozbo2ztv2r5t4c	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 22:26:49.562875+05:30
ryx8bmipfggewk03jvd892wye6eo2682	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-19 22:28:11.690011+05:30
98j5ipv79gcqashsia2om1udtfa1qtxc	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-20 11:17:30.072024+05:30
2iququ3ux8p1pqpcyte8d2odptuyjz5x	ZDkyNjNkNTUyZmZkZDQwNDEwZGQ2YzE2MThmMTRmY2NiYjk3YjZjNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjkxY2NhYWU3ZmRlM2MwY2FiNjM2MWFmY2FiNTIzMTdlYjRkZmZkOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-05-20 11:54:58.24428+05:30
2iq3myo1nq58616wtxsi7dl6l1xug4sq	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-20 17:00:04.24691+05:30
ceq5r7o97k98wppj1ns7yqg3jnr1um7x	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-20 21:12:21.295821+05:30
y87rd2n1290jomufe3i4obcaawou1jhz	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-20 21:12:57.276168+05:30
1c8mxs7d2lj27ar95r9a7emmrvlsy4d8	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-21 00:21:26.029925+05:30
60r0fe1c8q8ty7qtzbdfgb477i2gipwx	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-21 02:12:29.92961+05:30
bqiwauxscwj1813lr5wsku42e5vi0ldy	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-21 13:52:06.238157+05:30
miodt01glrn59auzvidgz2oqyvg37je9	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-21 13:52:30.84517+05:30
ohn3wpz99ot4vpp5ox9113q87zqiclsr	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-21 14:59:38.19088+05:30
u2subnwge2e01vo5yl7smnbh5f3re5v0	OGNiZWUxNDM0NDY2MGVmYjQ3OWY4MjNkNzhlOTliMDY5ZTBhYTY1MTp7ImNyZWRlbnRpYWxzIjoie1widG9rZW5fZXhwaXJ5XCI6IFwiMjAxOS0wOC0wN1QxMzoyMjo1N1pcIiwgXCJpZF90b2tlbl9qd3RcIjogXCJleUpoYkdjaU9pSlNVekkxTmlJc0ltdHBaQ0k2SWpNME9UUmlNV1UzT0RaalpHRmtNRGt5WlRReU16YzJObUppWlRNM1pqVTBaV1E0TjJJeU1tUWlMQ0owZVhBaU9pSktWMVFpZlEuZXlKcGMzTWlPaUpvZEhSd2N6b3ZMMkZqWTI5MWJuUnpMbWR2YjJkc1pTNWpiMjBpTENKaGVuQWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKaGRXUWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKemRXSWlPaUl4TURrNU1EVXhORFkxTmpZeE5UVXlOVGt3TWpFaUxDSmxiV0ZwYkNJNkluQnBlWFZ6YUM1dUxtaEFaMjFoYVd3dVkyOXRJaXdpWlcxaGFXeGZkbVZ5YVdacFpXUWlPblJ5ZFdVc0ltRjBYMmhoYzJnaU9pSTRjRkI2VTJkNlNIWmFkMFE1WWtaVE9XRjRaMHBuSWl3aWJtRnRaU0k2SWxCcGVYVnphQ0JJWVc1amFHRjBaU0lzSW5CcFkzUjFjbVVpT2lKb2RIUndjem92TDJ4b05DNW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjB2TFZWM1ZHcEVRbmRCWlZsM0wwRkJRVUZCUVVGQlFVRkpMMEZCUVVGQlFVRkJSa3ROTDBSa01HMXphV0ZuUlRsUkwzTTVOaTFqTDNCb2IzUnZMbXB3WnlJc0ltZHBkbVZ1WDI1aGJXVWlPaUpRYVhsMWMyZ2lMQ0ptWVcxcGJIbGZibUZ0WlNJNklraGhibU5vWVhSbElpd2liRzlqWVd4bElqb2laVzRpTENKcFlYUWlPakUxTmpVeE9EQTFOemtzSW1WNGNDSTZNVFUyTlRFNE5ERTNPWDAuQlhHYzI0ZktBOVBvWXg3UkVHWkxDQkw1X1ZqeGI0V3pvcjNZbndqdWRPdTZpWTRCNl94NmlzQUQ1NDNfMExzdGZXUDBSRHhkM3BNUTE0UEJvRzVabndRT0RES1RrSlZUNlVQR2V5WlNTVEJzczQtV2NrTTJLYVVlSjNyQVMxOVFpMFNOTlRORXZUSWdfNElNdlhsdnYxa2FSUV91MWZVTHZFbXk0dXR4c0pOSXpCZE1vMzNkRkZpY3R0NzQtbkRKa2tGWHAyUnM5azl0MDRmQmVhSXpoZ0VnMWdlakoyLVltRDBMQUdtQktIWUJiR0NZUDE2S0R2Y1NzcFVlYXVWbUpFNXR0RUEtclZKUXRqQ1RVVWg1eUNzY0Z0WVlVQmtXc2xSd0VvNW5sSVdIZnVUaGRxUTR6OG4waUpaUEV1cnNJd2cwOWtuX0lYOW5yS1VwSThOamh3XCIsIFwiY2xpZW50X3NlY3JldFwiOiBcIjBTZ2V1WWg2bzRqSDdDRGR0OWV0S0YzT1wiLCBcImlkX3Rva2VuXCI6IHtcImdpdmVuX25hbWVcIjogXCJQaXl1c2hcIiwgXCJwaWN0dXJlXCI6IFwiaHR0cHM6Ly9saDQuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1Vd1RqREJ3QWVZdy9BQUFBQUFBQUFBSS9BQUFBQUFBQUZLTS9EZDBtc2lhZ0U5US9zOTYtYy9waG90by5qcGdcIiwgXCJhdF9oYXNoXCI6IFwiOHBQelNnekh2WndEOWJGUzlheGdKZ1wiLCBcImVtYWlsX3ZlcmlmaWVkXCI6IHRydWUsIFwiZXhwXCI6IDE1NjUxODQxNzksIFwiZmFtaWx5X25hbWVcIjogXCJIYW5jaGF0ZVwiLCBcImxvY2FsZVwiOiBcImVuXCIsIFwiZW1haWxcIjogXCJwaXl1c2gubi5oQGdtYWlsLmNvbVwiLCBcImlhdFwiOiAxNTY1MTgwNTc5LCBcInN1YlwiOiBcIjEwOTkwNTE0NjU2NjE1NTI1OTAyMVwiLCBcImF1ZFwiOiBcIjQ0OTEyODQ3ODI5MS05MGRkYzdpZzQ0OW45bTc5bHR0c3ZuZjBjMG80aW10Yy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbVwiLCBcImF6cFwiOiBcIjQ0OTEyODQ3ODI5MS05MGRkYzdpZzQ0OW45bTc5bHR0c3ZuZjBjMG80aW10Yy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbVwiLCBcImlzc1wiOiBcImh0dHBzOi8vYWNjb3VudHMuZ29vZ2xlLmNvbVwiLCBcIm5hbWVcIjogXCJQaXl1c2ggSGFuY2hhdGVcIn0sIFwiX2NsYXNzXCI6IFwiT0F1dGgyQ3JlZGVudGlhbHNcIiwgXCJyZXZva2VfdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vcmV2b2tlXCIsIFwiYWNjZXNzX3Rva2VuXCI6IFwieWEyOS5HbHhkQjFYaVhrNDdPVm9rcWhoRTVmTmlxWVh6bjEtTjdFY2VtU3dJZ0d1OXVRQ1RQMUh4WWw1N3FHVDlGLWRTaVdQeFZrRVdxYkFWOHJOVGg0cDcteVBrS1hsRnBjaGVwZnRtMWdDZEZjSmU0SS12NXFvSFNRQTIzTWxWQ3dcIiwgXCJ0b2tlbl9yZXNwb25zZVwiOiB7XCJpZF90b2tlblwiOiBcImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJak0wT1RSaU1XVTNPRFpqWkdGa01Ea3laVFF5TXpjMk5tSmlaVE0zWmpVMFpXUTROMkl5TW1RaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwyRmpZMjkxYm5SekxtZHZiMmRzWlM1amIyMGlMQ0poZW5BaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0poZFdRaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0p6ZFdJaU9pSXhNRGs1TURVeE5EWTFOall4TlRVeU5Ua3dNakVpTENKbGJXRnBiQ0k2SW5CcGVYVnphQzV1TG1oQVoyMWhhV3d1WTI5dElpd2laVzFoYVd4ZmRtVnlhV1pwWldRaU9uUnlkV1VzSW1GMFgyaGhjMmdpT2lJNGNGQjZVMmQ2U0haYWQwUTVZa1pUT1dGNFowcG5JaXdpYm1GdFpTSTZJbEJwZVhWemFDQklZVzVqYUdGMFpTSXNJbkJwWTNSMWNtVWlPaUpvZEhSd2N6b3ZMMnhvTkM1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMHZMVlYzVkdwRVFuZEJaVmwzTDBGQlFVRkJRVUZCUVVGSkwwRkJRVUZCUVVGQlJrdE5MMFJrTUcxemFXRm5SVGxSTDNNNU5pMWpMM0JvYjNSdkxtcHdaeUlzSW1kcGRtVnVYMjVoYldVaU9pSlFhWGwxYzJnaUxDSm1ZVzFwYkhsZmJtRnRaU0k2SWtoaGJtTm9ZWFJsSWl3aWJHOWpZV3hsSWpvaVpXNGlMQ0pwWVhRaU9qRTFOalV4T0RBMU56a3NJbVY0Y0NJNk1UVTJOVEU0TkRFM09YMC5CWEdjMjRmS0E5UG9ZeDdSRUdaTENCTDVfVmp4YjRXem9yM1lud2p1ZE91NmlZNEI2X3g2aXNBRDU0M18wTHN0ZldQMFJEeGQzcE1RMTRQQm9HNVpud1FPRERLVGtKVlQ2VVBHZXlaU1NUQnNzNC1XY2tNMkthVWVKM3JBUzE5UWkwU05OVE5FdlRJZ180SU12WGx2djFrYVJRX3UxZlVMdkVteTR1dHhzSk5JekJkTW8zM2RGRmljdHQ3NC1uREpra0ZYcDJSczlrOXQwNGZCZWFJemhnRWcxZ2VqSjItWW1EMExBR21CS0hZQmJHQ1lQMTZLRHZjU3NwVWVhdVZtSkU1dHRFQS1yVkpRdGpDVFVVaDV5Q3NjRnRZWVVCa1dzbFJ3RW81bmxJV0hmdVRoZHFRNHo4bjBpSlpQRXVyc0l3ZzA5a25fSVg5bnJLVXBJOE5qaHdcIiwgXCJhY2Nlc3NfdG9rZW5cIjogXCJ5YTI5LkdseGRCMVhpWGs0N09Wb2txaGhFNWZOaXFZWHpuMS1ON0VjZW1Td0lnR3U5dVFDVFAxSHhZbDU3cUdUOUYtZFNpV1B4VmtFV3FiQVY4ck5UaDRwNy15UGtLWGxGcGNoZXBmdG0xZ0NkRmNKZTRJLXY1cW9IU1FBMjNNbFZDd1wiLCBcInRva2VuX3R5cGVcIjogXCJCZWFyZXJcIiwgXCJzY29wZVwiOiBcImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvdXNlcmluZm8ucHJvZmlsZSBvcGVuaWQgaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vYXV0aC91c2VyaW5mby5lbWFpbFwiLCBcImV4cGlyZXNfaW5cIjogMzU5OH0sIFwiX21vZHVsZVwiOiBcIm9hdXRoMmNsaWVudC5jbGllbnRcIiwgXCJ0b2tlbl91cmlcIjogXCJodHRwczovL29hdXRoMi5nb29nbGVhcGlzLmNvbS90b2tlblwiLCBcInRva2VuX2luZm9fdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW5pbmZvXCIsIFwic2NvcGVzXCI6IFtcImVtYWlsXCIsIFwicHJvZmlsZVwiLCBcImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvZHJpdmUuYXBwZGF0YVwiXSwgXCJjbGllbnRfaWRcIjogXCI0NDkxMjg0NzgyOTEtOTBkZGM3aWc0NDluOW03OWx0dHN2bmYwYzBvNGltdGMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb21cIiwgXCJpbnZhbGlkXCI6IGZhbHNlLCBcInJlZnJlc2hfdG9rZW5cIjogbnVsbCwgXCJ1c2VyX2FnZW50XCI6IG51bGx9In0=	2019-08-21 17:52:59.896475+05:30
bnh4mzj1tznggmc7srtbh7dfzzds87h1	MTRmYzkzOTFhODQzZDRiMzdkMzdkMzhjNWM4OTA4NzY2NDU4OWQ2Nzp7ImNyZWRlbnRpYWxzIjoie1wiY2xpZW50X2lkXCI6IFwiNDQ5MTI4NDc4MjkxLTkwZGRjN2lnNDQ5bjltNzlsdHRzdm5mMGMwbzRpbXRjLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tXCIsIFwiYWNjZXNzX3Rva2VuXCI6IFwieWEyOS5HbHhkQjFNb0xXQ2R0cUVGZ1l4TTV2WUVCUFdDZEMtR3dJUGk5VHZScUVzSThVQnlubmFtd1ktTVFPRFNRMnpyd2xJWGNCRlI0cjhfbTNReGxJU0I0WlFTcnpYSENVbVRqanFxdGJjczNsUmYyai1RY1Fic25BR2k0aG1lQVFcIiwgXCJpZF90b2tlbl9qd3RcIjogXCJleUpoYkdjaU9pSlNVekkxTmlJc0ltdHBaQ0k2SWpNME9UUmlNV1UzT0RaalpHRmtNRGt5WlRReU16YzJObUppWlRNM1pqVTBaV1E0TjJJeU1tUWlMQ0owZVhBaU9pSktWMVFpZlEuZXlKcGMzTWlPaUpvZEhSd2N6b3ZMMkZqWTI5MWJuUnpMbWR2YjJkc1pTNWpiMjBpTENKaGVuQWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKaGRXUWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKemRXSWlPaUl4TURrNU1EVXhORFkxTmpZeE5UVXlOVGt3TWpFaUxDSmxiV0ZwYkNJNkluQnBlWFZ6YUM1dUxtaEFaMjFoYVd3dVkyOXRJaXdpWlcxaGFXeGZkbVZ5YVdacFpXUWlPblJ5ZFdVc0ltRjBYMmhoYzJnaU9pSm9kVmw0YzE5VGMzVm9VME5tVEZKT1IwWkZSbFJCSWl3aWJtRnRaU0k2SWxCcGVYVnphQ0JJWVc1amFHRjBaU0lzSW5CcFkzUjFjbVVpT2lKb2RIUndjem92TDJ4b05DNW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjB2TFZWM1ZHcEVRbmRCWlZsM0wwRkJRVUZCUVVGQlFVRkpMMEZCUVVGQlFVRkJSa3ROTDBSa01HMXphV0ZuUlRsUkwzTTVOaTFqTDNCb2IzUnZMbXB3WnlJc0ltZHBkbVZ1WDI1aGJXVWlPaUpRYVhsMWMyZ2lMQ0ptWVcxcGJIbGZibUZ0WlNJNklraGhibU5vWVhSbElpd2liRzlqWVd4bElqb2laVzRpTENKcFlYUWlPakUxTmpVeE9ETXlPRFFzSW1WNGNDSTZNVFUyTlRFNE5qZzROSDAucGpUbTY5a1ozUTh1dUJ2ZnBjNDJXWXg4MzNCamtDeEtGNXo0VldJMlJ4NTdkRlIwZk1vVE9OWEpkVjNjR19QUU9Ha2h6Y05QbW81Ny04Z0gxYXNSd2VwakhFYTEwQjJtdTF5clZ3Y1NST0ozalpQejgwUFZBN1NVNG42ejZaM3NIdng3S2VGakZTV0FuRy1sa05oNGJjMXdZdHVuYkpqbkRpbmxkTW01REtJV3YxeVZiXzc5RFJ5aVJsdUFlbjl6RWhWNU45NHA0ekphbTFsN3VCZXdtV0h4MGFMT3B5RkZ6QkdrcDlkLS1fa1N2U3E4M3J6WkROeVBHNC01S01OM1BQeVF2a0hZNUhvTHRMTVBHb0FJWG9EYjIwWjVfS3IzNm56UmNvNDEzX3g0c0dGT2RYUEhDbkZVOTZVcWd1X05paFU0LUhLVzFaOTZHOTlVNWdiNk13XCIsIFwiaW52YWxpZFwiOiBmYWxzZSwgXCJyZXZva2VfdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vcmV2b2tlXCIsIFwic2NvcGVzXCI6IFtcImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvZHJpdmUuYXBwZGF0YVwiLCBcInByb2ZpbGVcIiwgXCJlbWFpbFwiXSwgXCJ1c2VyX2FnZW50XCI6IG51bGwsIFwidG9rZW5fcmVzcG9uc2VcIjoge1widG9rZW5fdHlwZVwiOiBcIkJlYXJlclwiLCBcImV4cGlyZXNfaW5cIjogMzU4OCwgXCJhY2Nlc3NfdG9rZW5cIjogXCJ5YTI5LkdseGRCMU1vTFdDZHRxRUZnWXhNNXZZRUJQV0NkQy1Hd0lQaTlUdlJxRXNJOFVCeW5uYW13WS1NUU9EU1EyenJ3bElYY0JGUjRyOF9tM1F4bElTQjRaUVNyelhIQ1VtVGpqcXF0YmNzM2xSZjJqLVFjUWJzbkFHaTRobWVBUVwiLCBcInNjb3BlXCI6IFwib3BlbmlkIGh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvdXNlcmluZm8ucHJvZmlsZSBodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9hdXRoL3VzZXJpbmZvLmVtYWlsXCIsIFwiaWRfdG9rZW5cIjogXCJleUpoYkdjaU9pSlNVekkxTmlJc0ltdHBaQ0k2SWpNME9UUmlNV1UzT0RaalpHRmtNRGt5WlRReU16YzJObUppWlRNM1pqVTBaV1E0TjJJeU1tUWlMQ0owZVhBaU9pSktWMVFpZlEuZXlKcGMzTWlPaUpvZEhSd2N6b3ZMMkZqWTI5MWJuUnpMbWR2YjJkc1pTNWpiMjBpTENKaGVuQWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKaGRXUWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKemRXSWlPaUl4TURrNU1EVXhORFkxTmpZeE5UVXlOVGt3TWpFaUxDSmxiV0ZwYkNJNkluQnBlWFZ6YUM1dUxtaEFaMjFoYVd3dVkyOXRJaXdpWlcxaGFXeGZkbVZ5YVdacFpXUWlPblJ5ZFdVc0ltRjBYMmhoYzJnaU9pSm9kVmw0YzE5VGMzVm9VME5tVEZKT1IwWkZSbFJCSWl3aWJtRnRaU0k2SWxCcGVYVnphQ0JJWVc1amFHRjBaU0lzSW5CcFkzUjFjbVVpT2lKb2RIUndjem92TDJ4b05DNW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjB2TFZWM1ZHcEVRbmRCWlZsM0wwRkJRVUZCUVVGQlFVRkpMMEZCUVVGQlFVRkJSa3ROTDBSa01HMXphV0ZuUlRsUkwzTTVOaTFqTDNCb2IzUnZMbXB3WnlJc0ltZHBkbVZ1WDI1aGJXVWlPaUpRYVhsMWMyZ2lMQ0ptWVcxcGJIbGZibUZ0WlNJNklraGhibU5vWVhSbElpd2liRzlqWVd4bElqb2laVzRpTENKcFlYUWlPakUxTmpVeE9ETXlPRFFzSW1WNGNDSTZNVFUyTlRFNE5qZzROSDAucGpUbTY5a1ozUTh1dUJ2ZnBjNDJXWXg4MzNCamtDeEtGNXo0VldJMlJ4NTdkRlIwZk1vVE9OWEpkVjNjR19QUU9Ha2h6Y05QbW81Ny04Z0gxYXNSd2VwakhFYTEwQjJtdTF5clZ3Y1NST0ozalpQejgwUFZBN1NVNG42ejZaM3NIdng3S2VGakZTV0FuRy1sa05oNGJjMXdZdHVuYkpqbkRpbmxkTW01REtJV3YxeVZiXzc5RFJ5aVJsdUFlbjl6RWhWNU45NHA0ekphbTFsN3VCZXdtV0h4MGFMT3B5RkZ6QkdrcDlkLS1fa1N2U3E4M3J6WkROeVBHNC01S01OM1BQeVF2a0hZNUhvTHRMTVBHb0FJWG9EYjIwWjVfS3IzNm56UmNvNDEzX3g0c0dGT2RYUEhDbkZVOTZVcWd1X05paFU0LUhLVzFaOTZHOTlVNWdiNk13XCJ9LCBcIl9tb2R1bGVcIjogXCJvYXV0aDJjbGllbnQuY2xpZW50XCIsIFwidG9rZW5fdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW5cIiwgXCJpZF90b2tlblwiOiB7XCJuYW1lXCI6IFwiUGl5dXNoIEhhbmNoYXRlXCIsIFwic3ViXCI6IFwiMTA5OTA1MTQ2NTY2MTU1MjU5MDIxXCIsIFwiZXhwXCI6IDE1NjUxODY4ODQsIFwiZW1haWxfdmVyaWZpZWRcIjogdHJ1ZSwgXCJpc3NcIjogXCJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb21cIiwgXCJhenBcIjogXCI0NDkxMjg0NzgyOTEtOTBkZGM3aWc0NDluOW03OWx0dHN2bmYwYzBvNGltdGMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb21cIiwgXCJwaWN0dXJlXCI6IFwiaHR0cHM6Ly9saDQuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1Vd1RqREJ3QWVZdy9BQUFBQUFBQUFBSS9BQUFBQUFBQUZLTS9EZDBtc2lhZ0U5US9zOTYtYy9waG90by5qcGdcIiwgXCJhdWRcIjogXCI0NDkxMjg0NzgyOTEtOTBkZGM3aWc0NDluOW03OWx0dHN2bmYwYzBvNGltdGMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb21cIiwgXCJnaXZlbl9uYW1lXCI6IFwiUGl5dXNoXCIsIFwiaWF0XCI6IDE1NjUxODMyODQsIFwiZmFtaWx5X25hbWVcIjogXCJIYW5jaGF0ZVwiLCBcImxvY2FsZVwiOiBcImVuXCIsIFwiZW1haWxcIjogXCJwaXl1c2gubi5oQGdtYWlsLmNvbVwiLCBcImF0X2hhc2hcIjogXCJodVl4c19Tc3VoU0NmTFJOR0ZFRlRBXCJ9LCBcInRva2VuX2luZm9fdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW5pbmZvXCIsIFwicmVmcmVzaF90b2tlblwiOiBudWxsLCBcIl9jbGFzc1wiOiBcIk9BdXRoMkNyZWRlbnRpYWxzXCIsIFwiY2xpZW50X3NlY3JldFwiOiBcIjBTZ2V1WWg2bzRqSDdDRGR0OWV0S0YzT1wiLCBcInRva2VuX2V4cGlyeVwiOiBcIjIwMTktMDgtMDdUMTQ6MDc6NTJaXCJ9In0=	2019-08-21 18:38:04.526109+05:30
ebbijc860itnz3gmid3g2dnt74ljio6p	MjNkNWM4YTYyN2EwNDRlMWY1MWQ2MmI2NTBiN2NlNmVkYzNkYjg5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-21 16:28:22.696818+05:30
5539d7ld54ug61b0fan8g6u8ut7q8fm3	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-21 17:34:51.336969+05:30
mc6h5oh5yxwomus3q3n7hiwoxhy508o5	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-21 23:59:45.380678+05:30
24ra7er3rts5o0po39u6fdxq7jcu9gej	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-23 13:49:36.824417+05:30
3z2lfrtfiweiiekk0u6pzg8gpdxsv8g6	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-23 15:57:21.106874+05:30
g3ji3n9ees6p5adzkvttdap3molx5m9r	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-23 21:00:27.592592+05:30
g35msqfjou10ky1vbd6lh0wys8rdtk6o	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-24 00:09:37.91051+05:30
gpy8fqrdi14qlwox9rky1hvhjrt3963k	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-24 23:52:19.907028+05:30
anyan9ld8ao6knmuvckg8lyh4xg82e51	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-25 12:41:51.494445+05:30
4ga9fpop6oeiblw501gugwi6jg7inhj4	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-25 14:42:25.773462+05:30
xxwjtdiwsxgibjp3pir4rk03wwlpu7df	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-25 17:25:47.052664+05:30
epti5tyj0x0bu1iqkqr2l0e990te7cw6	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-25 22:20:41.777636+05:30
r3j0uved6wm4i12uexoyvrpre2hixa5z	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-25 23:52:31.959643+05:30
tukxng4hlvcmajvpnrkg269liprhzwn4	NzE4ZGY5YjM5NTI5NjdjYmFlYjlkNjhmNGRjMjlhOWYwM2FkZDk2Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjkxY2NhYWU3ZmRlM2MwY2FiNjM2MWFmY2FiNTIzMTdlYjRkZmZkOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-05-26 00:58:47.663853+05:30
fhjg9jb6n99egorp16boqvvrni1zo9vl	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-05-26 01:00:04.519453+05:30
7q2e8a9l1tu5rqy60dg7nx1yqf3962gd	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-26 23:50:35.791294+05:30
b1872x2sbqiaxqvk9ytu8fsq68v3wbxj	MDJjNjc5NTM2ZDhjNGFhNzUxNjY4N2Q5ODg4M2RmNDZjM2FkNDVmMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiOTFjY2FhZTdmZGUzYzBjYWI2MzYxYWZjYWI1MjMxN2ViNGRmZmQ4In0=	2019-05-27 00:16:01.776324+05:30
lxnznde3prlywegrlqc1qsf0bw4k7q64	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-05-27 00:53:23.809585+05:30
tjiwgirgu9gqzgxu40f3n706nkbjaa01	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-27 18:48:58.299408+05:30
fqxb2gwia1e68pt1sgjcu9ack6423ywu	MjdlNGFiODU4YTU5OTZhZDQ4MTJkZGI1NTgwYzY2YmVmMDcwZTJhODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-05-27 20:04:42.475875+05:30
oqek3rzciqcsuxvmjcagpo5ananh474h	ZjdmYjM4ZjgyMWZiZGYyYjc5NmZmMGFjMmFjMTEyZjZhMzM1NGM5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-08-10 01:22:56.584019+05:30
wzau82hccoywnln8attefuu3rygqr5ea	YzJhZTJhM2E1YmI4MzkyY2JkNTFhYTE5MDM0YmE4YTU1YTU4MGU0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3NjU3ZDA1ODZlMjc3MzY1YTI1NDIyMmEzMjU5ZWY3ZjRiMzE0MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-08-12 09:44:44.291531+05:30
31m3rcsbu62x7j3we4iv3b44kwxgq3c0	YjYwODhlMTU3MjQ1MDE2MGE1MzJjNmRlMzQ3ODQ4MGUyZmJjYTlmMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5MWNjYWFlN2ZkZTNjMGNhYjYzNjFhZmNhYjUyMzE3ZWI0ZGZmZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-08-12 12:03:18.865321+05:30
jb0jbmm5f5zcwl34icjsesdfc6odljgi	YTE4YjNjNWY1NWRmODk2Yzk1MGI0ZWExYTZmZGQyMzQ4NTJlMzBmYTp7ImNyZWRlbnRpYWxzIjoie1widG9rZW5fcmVzcG9uc2VcIjoge1wiYWNjZXNzX3Rva2VuXCI6IFwieWEyOS5HbHhkQjcwdVZlQmEtbGN5em9HaWUyXzhHUDFCcU9oWXhDZW9pWkoydkJoOFMwd0hwSVhsclRYbEFpbjJyMDhwN3R0ekxRSEU5SThGNXRIVk8tQlBrTEwyaS1JRTU1VTcyRGh6T1BzenB3dlhBWFpKa1l0dDViLTRHY1g3MmdcIiwgXCJpZF90b2tlblwiOiBcImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJak0wT1RSaU1XVTNPRFpqWkdGa01Ea3laVFF5TXpjMk5tSmlaVE0zWmpVMFpXUTROMkl5TW1RaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwyRmpZMjkxYm5SekxtZHZiMmRzWlM1amIyMGlMQ0poZW5BaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0poZFdRaU9pSTBORGt4TWpnME56Z3lPVEV0T1RCa1pHTTNhV2MwTkRsdU9XMDNPV3gwZEhOMmJtWXdZekJ2TkdsdGRHTXVZWEJ3Y3k1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMGlMQ0p6ZFdJaU9pSXhNRGs1TURVeE5EWTFOall4TlRVeU5Ua3dNakVpTENKbGJXRnBiQ0k2SW5CcGVYVnphQzV1TG1oQVoyMWhhV3d1WTI5dElpd2laVzFoYVd4ZmRtVnlhV1pwWldRaU9uUnlkV1VzSW1GMFgyaGhjMmdpT2lKVFRGSnRXakJPUTFCTVkyZFhNRFZ5VTA4M1dqVjNJaXdpYm1GdFpTSTZJbEJwZVhWemFDQklZVzVqYUdGMFpTSXNJbkJwWTNSMWNtVWlPaUpvZEhSd2N6b3ZMMnhvTkM1bmIyOW5iR1YxYzJWeVkyOXVkR1Z1ZEM1amIyMHZMVlYzVkdwRVFuZEJaVmwzTDBGQlFVRkJRVUZCUVVGSkwwRkJRVUZCUVVGQlJrdE5MMFJrTUcxemFXRm5SVGxSTDNNNU5pMWpMM0JvYjNSdkxtcHdaeUlzSW1kcGRtVnVYMjVoYldVaU9pSlFhWGwxYzJnaUxDSm1ZVzFwYkhsZmJtRnRaU0k2SWtoaGJtTm9ZWFJsSWl3aWJHOWpZV3hsSWpvaVpXNGlMQ0pwWVhRaU9qRTFOalV4T0RBMk1EWXNJbVY0Y0NJNk1UVTJOVEU0TkRJd05uMC5xNGVlU1BiWEhXalBzTWItdGFWaDhhd3RzUEt6b2REeS1TdXNYal9vVWo2VmgzWVZ0ZnhrUks5ODRhMl9iSEI4elN1Q2pDWklSc01vZjFKdHJqeDZIdy16ZzdlanFzeFdraV9ObW1nZW1JaTQydXJTVVVqQk04SEp0NXBWR1ktcVhQS0VvNXVPVjV1eFIyVUptNHF6ZEViRFNqM1p4R29ZRi1kNHphVlFRWnhDZTVodE5GSkhIT2hudW5SVjlRd050WWdSODVYTTJvdTlaMFJnRXd4M09vaUhRM2U4dHhRV3lWdXZPWVJHc3ZnWkVHeWgwN0k0Q2VIVGctOHJpUWtDemdIVWNLQ3VfclNiU2Vzb2lLU1NHcmNNUXE5U3E2c2dwUXdnc19teXp0Q1BwNDhqZVh2em1kVzZoZHJJY1lYeVUwTXhwT1FsRDNQbFhGTnQ2ZWZOQlFcIiwgXCJzY29wZVwiOiBcIm9wZW5pZCBodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9hdXRoL3VzZXJpbmZvLnByb2ZpbGUgaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vYXV0aC91c2VyaW5mby5lbWFpbFwiLCBcImV4cGlyZXNfaW5cIjogMzU5NywgXCJ0b2tlbl90eXBlXCI6IFwiQmVhcmVyXCJ9LCBcInNjb3Blc1wiOiBbXCJlbWFpbFwiLCBcImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvZHJpdmUuYXBwZGF0YVwiLCBcInByb2ZpbGVcIl0sIFwiY2xpZW50X2lkXCI6IFwiNDQ5MTI4NDc4MjkxLTkwZGRjN2lnNDQ5bjltNzlsdHRzdm5mMGMwbzRpbXRjLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tXCIsIFwiX2NsYXNzXCI6IFwiT0F1dGgyQ3JlZGVudGlhbHNcIiwgXCJyZWZyZXNoX3Rva2VuXCI6IG51bGwsIFwidG9rZW5fZXhwaXJ5XCI6IFwiMjAxOS0wOC0wN1QxMzoyMzoyM1pcIiwgXCJ1c2VyX2FnZW50XCI6IG51bGwsIFwidG9rZW5fdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW5cIiwgXCJpZF90b2tlbl9qd3RcIjogXCJleUpoYkdjaU9pSlNVekkxTmlJc0ltdHBaQ0k2SWpNME9UUmlNV1UzT0RaalpHRmtNRGt5WlRReU16YzJObUppWlRNM1pqVTBaV1E0TjJJeU1tUWlMQ0owZVhBaU9pSktWMVFpZlEuZXlKcGMzTWlPaUpvZEhSd2N6b3ZMMkZqWTI5MWJuUnpMbWR2YjJkc1pTNWpiMjBpTENKaGVuQWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKaGRXUWlPaUkwTkRreE1qZzBOemd5T1RFdE9UQmtaR00zYVdjME5EbHVPVzAzT1d4MGRITjJibVl3WXpCdk5HbHRkR011WVhCd2N5NW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjBpTENKemRXSWlPaUl4TURrNU1EVXhORFkxTmpZeE5UVXlOVGt3TWpFaUxDSmxiV0ZwYkNJNkluQnBlWFZ6YUM1dUxtaEFaMjFoYVd3dVkyOXRJaXdpWlcxaGFXeGZkbVZ5YVdacFpXUWlPblJ5ZFdVc0ltRjBYMmhoYzJnaU9pSlRURkp0V2pCT1ExQk1ZMmRYTURWeVUwODNXalYzSWl3aWJtRnRaU0k2SWxCcGVYVnphQ0JJWVc1amFHRjBaU0lzSW5CcFkzUjFjbVVpT2lKb2RIUndjem92TDJ4b05DNW5iMjluYkdWMWMyVnlZMjl1ZEdWdWRDNWpiMjB2TFZWM1ZHcEVRbmRCWlZsM0wwRkJRVUZCUVVGQlFVRkpMMEZCUVVGQlFVRkJSa3ROTDBSa01HMXphV0ZuUlRsUkwzTTVOaTFqTDNCb2IzUnZMbXB3WnlJc0ltZHBkbVZ1WDI1aGJXVWlPaUpRYVhsMWMyZ2lMQ0ptWVcxcGJIbGZibUZ0WlNJNklraGhibU5vWVhSbElpd2liRzlqWVd4bElqb2laVzRpTENKcFlYUWlPakUxTmpVeE9EQTJNRFlzSW1WNGNDSTZNVFUyTlRFNE5ESXdObjAucTRlZVNQYlhIV2pQc01iLXRhVmg4YXd0c1BLem9kRHktU3VzWGpfb1VqNlZoM1lWdGZ4a1JLOTg0YTJfYkhCOHpTdUNqQ1pJUnNNb2YxSnRyang2SHctemc3ZWpxc3hXa2lfTm1tZ2VtSWk0MnVyU1VVakJNOEhKdDVwVkdZLXFYUEtFbzV1T1Y1dXhSMlVKbTRxemRFYkRTajNaeEdvWUYtZDR6YVZRUVp4Q2U1aHRORkpISE9obnVuUlY5UXdOdFlnUjg1WE0yb3U5WjBSZ0V3eDNPb2lIUTNlOHR4UVd5VnV2T1lSR3N2Z1pFR3loMDdJNENlSFRnLThyaVFrQ3pnSFVjS0N1X3JTYlNlc29pS1NTR3JjTVFxOVNxNnNncFF3Z3NfbXl6dENQcDQ4amVYdnptZFc2aGRySWNZWHlVME14cE9RbEQzUGxYRk50NmVmTkJRXCIsIFwiY2xpZW50X3NlY3JldFwiOiBcIjBTZ2V1WWg2bzRqSDdDRGR0OWV0S0YzT1wiLCBcInRva2VuX2luZm9fdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW5pbmZvXCIsIFwiX21vZHVsZVwiOiBcIm9hdXRoMmNsaWVudC5jbGllbnRcIiwgXCJpbnZhbGlkXCI6IGZhbHNlLCBcImFjY2Vzc190b2tlblwiOiBcInlhMjkuR2x4ZEI3MHVWZUJhLWxjeXpvR2llMl84R1AxQnFPaFl4Q2VvaVpKMnZCaDhTMHdIcElYbHJUWGxBaW4ycjA4cDd0dHpMUUhFOUk4RjV0SFZPLUJQa0xMMmktSUU1NVU3MkRoek9Qc3pwd3ZYQVhaSmtZdHQ1Yi00R2NYNzJnXCIsIFwicmV2b2tlX3VyaVwiOiBcImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Jldm9rZVwiLCBcImlkX3Rva2VuXCI6IHtcIm5hbWVcIjogXCJQaXl1c2ggSGFuY2hhdGVcIiwgXCJpYXRcIjogMTU2NTE4MDYwNiwgXCJsb2NhbGVcIjogXCJlblwiLCBcImlzc1wiOiBcImh0dHBzOi8vYWNjb3VudHMuZ29vZ2xlLmNvbVwiLCBcImZhbWlseV9uYW1lXCI6IFwiSGFuY2hhdGVcIiwgXCJwaWN0dXJlXCI6IFwiaHR0cHM6Ly9saDQuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1Vd1RqREJ3QWVZdy9BQUFBQUFBQUFBSS9BQUFBQUFBQUZLTS9EZDBtc2lhZ0U5US9zOTYtYy9waG90by5qcGdcIiwgXCJleHBcIjogMTU2NTE4NDIwNiwgXCJlbWFpbF92ZXJpZmllZFwiOiB0cnVlLCBcImdpdmVuX25hbWVcIjogXCJQaXl1c2hcIiwgXCJhenBcIjogXCI0NDkxMjg0NzgyOTEtOTBkZGM3aWc0NDluOW03OWx0dHN2bmYwYzBvNGltdGMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb21cIiwgXCJhdF9oYXNoXCI6IFwiU0xSbVowTkNQTGNnVzA1clNPN1o1d1wiLCBcImVtYWlsXCI6IFwicGl5dXNoLm4uaEBnbWFpbC5jb21cIiwgXCJzdWJcIjogXCIxMDk5MDUxNDY1NjYxNTUyNTkwMjFcIiwgXCJhdWRcIjogXCI0NDkxMjg0NzgyOTEtOTBkZGM3aWc0NDluOW03OWx0dHN2bmYwYzBvNGltdGMuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb21cIn19In0=	2019-08-21 17:53:26.713897+05:30
lns769omihnxjxeuvpilqrgh8o5iicob	YjZmYmM3MDQwMjNmOWZjOWVkODYzMjRhYjYzZDMyNGMzYzJmMDJhZTp7ImNyZWRlbnRpYWxzIjoie1wiX2NsYXNzXCI6IFwiT0F1dGgyQ3JlZGVudGlhbHNcIiwgXCJ0b2tlbl91cmlcIjogXCJodHRwczovL29hdXRoMi5nb29nbGVhcGlzLmNvbS90b2tlblwiLCBcInRva2VuX3Jlc3BvbnNlXCI6IHtcInNjb3BlXCI6IFwiaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vYXV0aC91c2VyaW5mby5lbWFpbCBodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9hdXRoL3VzZXJpbmZvLnByb2ZpbGUgb3BlbmlkXCIsIFwiZXhwaXJlc19pblwiOiAzNTk4LCBcImlkX3Rva2VuXCI6IFwiZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNklqTTBPVFJpTVdVM09EWmpaR0ZrTURreVpUUXlNemMyTm1KaVpUTTNaalUwWldRNE4ySXlNbVFpTENKMGVYQWlPaUpLVjFRaWZRLmV5SnBjM01pT2lKb2RIUndjem92TDJGalkyOTFiblJ6TG1kdmIyZHNaUzVqYjIwaUxDSmhlbkFpT2lJME5Ea3hNamcwTnpneU9URXRPVEJrWkdNM2FXYzBORGx1T1cwM09XeDBkSE4yYm1Zd1l6QnZOR2x0ZEdNdVlYQndjeTVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwaUxDSmhkV1FpT2lJME5Ea3hNamcwTnpneU9URXRPVEJrWkdNM2FXYzBORGx1T1cwM09XeDBkSE4yYm1Zd1l6QnZOR2x0ZEdNdVlYQndjeTVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwaUxDSnpkV0lpT2lJeE1EazVNRFV4TkRZMU5qWXhOVFV5TlRrd01qRWlMQ0psYldGcGJDSTZJbkJwZVhWemFDNXVMbWhBWjIxaGFXd3VZMjl0SWl3aVpXMWhhV3hmZG1WeWFXWnBaV1FpT25SeWRXVXNJbUYwWDJoaGMyZ2lPaUpCWlhVMmR6RjBjRFZ0YjFWaWNXZ3ROMFZJUVZaQklpd2libUZ0WlNJNklsQnBlWFZ6YUNCSVlXNWphR0YwWlNJc0luQnBZM1IxY21VaU9pSm9kSFJ3Y3pvdkwyeG9OQzVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwdkxWVjNWR3BFUW5kQlpWbDNMMEZCUVVGQlFVRkJRVUZKTDBGQlFVRkJRVUZCUmt0TkwwUmtNRzF6YVdGblJUbFJMM001TmkxakwzQm9iM1J2TG1wd1p5SXNJbWRwZG1WdVgyNWhiV1VpT2lKUWFYbDFjMmdpTENKbVlXMXBiSGxmYm1GdFpTSTZJa2hoYm1Ob1lYUmxJaXdpYkc5allXeGxJam9pWlc0aUxDSnBZWFFpT2pFMU5qVXhPRE16TlRVc0ltVjRjQ0k2TVRVMk5URTROamsxTlgwLkd5MXBFT2VPRWVCSmI2b0VUcUMxS0d5ZG1GQWx1dzU4alZwZ0RVb2JNeHhtcVo1QXZkeXJEZ3F5ZE1kajFvUFlRT2xuMXRBNFV6N3NNa3VXdmJkOUo0WGdiclNLdUdVaUJidHNfRGdiMVRoQWRvVHdSdWgwWHlMaTgyYlNjeUg5NDFobmZjN3ByZHF1VllNaUJxcmh5aU9HazFMbnBjMlJkdnVrbVp6NGRhaVpMMTZoRTVkOVF2bm9lU3VVR0FURmEyMTFhZVplYkp0ZnJxeGpsSmdrZU5Oblp1RFFoREtJR3YyRFprSDlBWHAyZkxXX0ZYNEt2YkpoTU1HUXR3ckxPZDVQUk84NWwyX3JQSGNhclBGZkE5OFZQYjZkMzN4UklrS19GMWJSMnVjUFlYcDN4M0hYWlJrVm9pS29VazZGbTY2aFByZ3RQN1ppcWU4Q3Vqa3U2d1wiLCBcImFjY2Vzc190b2tlblwiOiBcInlhMjkuR2x4ZEJ5RE9RZW9LUzVqWk5CczdaR250RTV5Skk0OU1FRGtEcUFLVG9lUkpRSk5CU3ZsbGhnY3NUSXZlYm92ejZhMzBrSFl6c0VwQVZVaWwzSEJoM1BydlVNSVEzcHVKU25CdVF0Z3JLUU52X0dmbTNQRWgxSTk1QXA1TDdBXCIsIFwidG9rZW5fdHlwZVwiOiBcIkJlYXJlclwifSwgXCJyZXZva2VfdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vcmV2b2tlXCIsIFwidG9rZW5fZXhwaXJ5XCI6IFwiMjAxOS0wOC0wN1QxNDowOToxM1pcIiwgXCJfbW9kdWxlXCI6IFwib2F1dGgyY2xpZW50LmNsaWVudFwiLCBcImFjY2Vzc190b2tlblwiOiBcInlhMjkuR2x4ZEJ5RE9RZW9LUzVqWk5CczdaR250RTV5Skk0OU1FRGtEcUFLVG9lUkpRSk5CU3ZsbGhnY3NUSXZlYm92ejZhMzBrSFl6c0VwQVZVaWwzSEJoM1BydlVNSVEzcHVKU25CdVF0Z3JLUU52X0dmbTNQRWgxSTk1QXA1TDdBXCIsIFwiY2xpZW50X3NlY3JldFwiOiBcIjBTZ2V1WWg2bzRqSDdDRGR0OWV0S0YzT1wiLCBcInNjb3Blc1wiOiBbXCJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9hdXRoL2RyaXZlLmFwcGRhdGFcIiwgXCJwcm9maWxlXCIsIFwiZW1haWxcIl0sIFwiaW52YWxpZFwiOiBmYWxzZSwgXCJ1c2VyX2FnZW50XCI6IG51bGwsIFwiY2xpZW50X2lkXCI6IFwiNDQ5MTI4NDc4MjkxLTkwZGRjN2lnNDQ5bjltNzlsdHRzdm5mMGMwbzRpbXRjLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tXCIsIFwiaWRfdG9rZW5fand0XCI6IFwiZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNklqTTBPVFJpTVdVM09EWmpaR0ZrTURreVpUUXlNemMyTm1KaVpUTTNaalUwWldRNE4ySXlNbVFpTENKMGVYQWlPaUpLVjFRaWZRLmV5SnBjM01pT2lKb2RIUndjem92TDJGalkyOTFiblJ6TG1kdmIyZHNaUzVqYjIwaUxDSmhlbkFpT2lJME5Ea3hNamcwTnpneU9URXRPVEJrWkdNM2FXYzBORGx1T1cwM09XeDBkSE4yYm1Zd1l6QnZOR2x0ZEdNdVlYQndjeTVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwaUxDSmhkV1FpT2lJME5Ea3hNamcwTnpneU9URXRPVEJrWkdNM2FXYzBORGx1T1cwM09XeDBkSE4yYm1Zd1l6QnZOR2x0ZEdNdVlYQndjeTVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwaUxDSnpkV0lpT2lJeE1EazVNRFV4TkRZMU5qWXhOVFV5TlRrd01qRWlMQ0psYldGcGJDSTZJbkJwZVhWemFDNXVMbWhBWjIxaGFXd3VZMjl0SWl3aVpXMWhhV3hmZG1WeWFXWnBaV1FpT25SeWRXVXNJbUYwWDJoaGMyZ2lPaUpCWlhVMmR6RjBjRFZ0YjFWaWNXZ3ROMFZJUVZaQklpd2libUZ0WlNJNklsQnBlWFZ6YUNCSVlXNWphR0YwWlNJc0luQnBZM1IxY21VaU9pSm9kSFJ3Y3pvdkwyeG9OQzVuYjI5bmJHVjFjMlZ5WTI5dWRHVnVkQzVqYjIwdkxWVjNWR3BFUW5kQlpWbDNMMEZCUVVGQlFVRkJRVUZKTDBGQlFVRkJRVUZCUmt0TkwwUmtNRzF6YVdGblJUbFJMM001TmkxakwzQm9iM1J2TG1wd1p5SXNJbWRwZG1WdVgyNWhiV1VpT2lKUWFYbDFjMmdpTENKbVlXMXBiSGxmYm1GdFpTSTZJa2hoYm1Ob1lYUmxJaXdpYkc5allXeGxJam9pWlc0aUxDSnBZWFFpT2pFMU5qVXhPRE16TlRVc0ltVjRjQ0k2TVRVMk5URTROamsxTlgwLkd5MXBFT2VPRWVCSmI2b0VUcUMxS0d5ZG1GQWx1dzU4alZwZ0RVb2JNeHhtcVo1QXZkeXJEZ3F5ZE1kajFvUFlRT2xuMXRBNFV6N3NNa3VXdmJkOUo0WGdiclNLdUdVaUJidHNfRGdiMVRoQWRvVHdSdWgwWHlMaTgyYlNjeUg5NDFobmZjN3ByZHF1VllNaUJxcmh5aU9HazFMbnBjMlJkdnVrbVp6NGRhaVpMMTZoRTVkOVF2bm9lU3VVR0FURmEyMTFhZVplYkp0ZnJxeGpsSmdrZU5Oblp1RFFoREtJR3YyRFprSDlBWHAyZkxXX0ZYNEt2YkpoTU1HUXR3ckxPZDVQUk84NWwyX3JQSGNhclBGZkE5OFZQYjZkMzN4UklrS19GMWJSMnVjUFlYcDN4M0hYWlJrVm9pS29VazZGbTY2aFByZ3RQN1ppcWU4Q3Vqa3U2d1wiLCBcInRva2VuX2luZm9fdXJpXCI6IFwiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW5pbmZvXCIsIFwicmVmcmVzaF90b2tlblwiOiBudWxsLCBcImlkX3Rva2VuXCI6IHtcInN1YlwiOiBcIjEwOTkwNTE0NjU2NjE1NTI1OTAyMVwiLCBcImVtYWlsX3ZlcmlmaWVkXCI6IHRydWUsIFwiYXRfaGFzaFwiOiBcIkFldTZ3MXRwNW1vVWJxaC03RUhBVkFcIiwgXCJsb2NhbGVcIjogXCJlblwiLCBcImV4cFwiOiAxNTY1MTg2OTU1LCBcImF1ZFwiOiBcIjQ0OTEyODQ3ODI5MS05MGRkYzdpZzQ0OW45bTc5bHR0c3ZuZjBjMG80aW10Yy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbVwiLCBcImZhbWlseV9uYW1lXCI6IFwiSGFuY2hhdGVcIiwgXCJwaWN0dXJlXCI6IFwiaHR0cHM6Ly9saDQuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1Vd1RqREJ3QWVZdy9BQUFBQUFBQUFBSS9BQUFBQUFBQUZLTS9EZDBtc2lhZ0U5US9zOTYtYy9waG90by5qcGdcIiwgXCJuYW1lXCI6IFwiUGl5dXNoIEhhbmNoYXRlXCIsIFwiZW1haWxcIjogXCJwaXl1c2gubi5oQGdtYWlsLmNvbVwiLCBcImlhdFwiOiAxNTY1MTgzMzU1LCBcImlzc1wiOiBcImh0dHBzOi8vYWNjb3VudHMuZ29vZ2xlLmNvbVwiLCBcImF6cFwiOiBcIjQ0OTEyODQ3ODI5MS05MGRkYzdpZzQ0OW45bTc5bHR0c3ZuZjBjMG80aW10Yy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbVwiLCBcImdpdmVuX25hbWVcIjogXCJQaXl1c2hcIn19In0=	2019-08-21 18:39:15.562855+05:30
16he27o142auaf4kffs9yz3cvesnuj22	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-15 01:57:57.253782+05:30
chj9iocdrw2vguuuzdmrj5prf7uno8b8	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-15 01:58:11.712811+05:30
1n0rf98os5cf83yf34z5jftmr5jwubu0	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-15 01:58:25.912739+05:30
lbu9qqil6qpiuekhfmz88fghwbmss0sd	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-15 01:58:54.614072+05:30
tonpy06ckw4mukuaoycg5fvryuiru9wu	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-15 11:14:08.387828+05:30
jpuwg9mxe6siugzsmabwkk6j2frjl0u6	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-15 22:26:45.048107+05:30
q5jdgz5wc3zmcyvixhlfrhxrmxm6vi9f	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-15 22:26:47.549178+05:30
gn4tubysl1figkmrw4h7ah4w7xoxid2i	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-16 01:58:34.044003+05:30
qf03xiqs10oc23qcwfgalzigercdmi7m	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-16 02:04:54.577944+05:30
1did9zzd0jl24nwue3lj0mfl33s0cqs6	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-16 02:04:58.099015+05:30
7mi1eq6wu6fvw0a8dfqsni9i8l1gvltl	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-16 02:09:39.175958+05:30
etje8k66f1fo5hq0vnp3kvm8wf77gvgw	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-16 10:20:24.869497+05:30
zham5q71lbgf2swtmgm8yt9423wkhdys	MjY0NWE2ZWQ0OWRlM2Y2MjNmMDgzMmViNzM5ZWZmNTlmMGUzZjNhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2019-08-18 17:52:31.596702+05:30
xah7yzrrrnocg5r41wfh3h1vyn8v2lkc	YjYwODhlMTU3MjQ1MDE2MGE1MzJjNmRlMzQ3ODQ4MGUyZmJjYTlmMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5MWNjYWFlN2ZkZTNjMGNhYjYzNjFhZmNhYjUyMzE3ZWI0ZGZmZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-08-26 13:24:16.479185+05:30
v7bg6o5j556532ibcgvesyfw4xezyiwm	MjIyOGE2YWU1NGFkNmY0YWE4NjVkZGY2ZDY5MjFiYzMyYzkyMmRlZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDc2NTdkMDU4NmUyNzczNjVhMjU0MjIyYTMyNTllZjdmNGIzMTQwNiJ9	2019-08-26 17:45:30.101795+05:30
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Data for Name: friendship_follow; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.friendship_follow (id, created, followee_id, follower_id) FROM stdin;
\.


--
-- Name: friendship_follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.friendship_follow_id_seq', 1, false);


--
-- Data for Name: friendship_friend; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.friendship_friend (id, created, from_user_id, to_user_id) FROM stdin;
\.


--
-- Name: friendship_friend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.friendship_friend_id_seq', 1, false);


--
-- Data for Name: friendship_friendshiprequest; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.friendship_friendshiprequest (id, message, created, rejected, viewed, from_user_id, to_user_id) FROM stdin;
\.


--
-- Name: friendship_friendshiprequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.friendship_friendshiprequest_id_seq', 1, false);


--
-- Data for Name: paytm_merchantprofile; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.paytm_merchantprofile (phone_number, merchant_id, key, owner_id) FROM stdin;
8197033794	xInaNs61782653789260	Ng4G_pv09cA0CHz9	2
\.


--
-- Data for Name: paytm_paytmhistory; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.paytm_paytmhistory (id, "ORDERID", "TXNDATE", "TXNID", "BANKTXNID", "BANKNAME", "RESPCODE", "PAYMENTMODE", "CURRENCY", "GATEWAYNAME", "MID", "RESPMSG", "TXNAMOUNT", "STATUS", "CUST_ID", customer_id) FROM stdin;
51	e0fcec68-c91e-4cd8-a331-d749656c5815	2019-08-04 20:56:33+05:30	20190804111212800110168461400728886	8162726	WALLET	01	PPI	INR	WALLET	xInaNs61782653789260	Txn Success	400.00	TXN_SUCCESS		2
\.


--
-- Name: paytm_paytmhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.paytm_paytmhistory_id_seq', 51, true);


--
-- Data for Name: restaurants_foodcourt; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_foodcourt (id, name, address, cover_pic, location, phone_number, website_url, city) FROM stdin;
1	Mantri Food Court	Sampige Rd, Malleshwaram, Bengaluru, Karnataka 560003	media/foodcourt_pics/apple_park.0.jpg	0101000020E61000004ECCD5EA8664534088DD712FD5012A40	8197033794	http://www.google.com	Bengaluru
\.


--
-- Name: restaurants_foodcourt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_foodcourt_id_seq', 1, true);


--
-- Data for Name: restaurants_menu; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_menu (id, name, slug, additional_text, "order", restaurant_id) FROM stdin;
1	Food Menu	menu	Served between 11:00 am and 4 pm	0	11
2	Non-Veg	nonveg	\N	0	12
\.


--
-- Name: restaurants_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_menu_id_seq', 2, true);


--
-- Data for Name: restaurants_menucategory; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_menucategory (id, name, additional_text, "order", menu_id) FROM stdin;
2	Soups	\N	1	1
3	bar	\N	0	2
\.


--
-- Name: restaurants_menucategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_menucategory_id_seq', 3, true);


--
-- Data for Name: restaurants_menuitem; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_menuitem (id, name, description, "order", price, image, classification, spicy, contains_peanuts, gluten_free, popular) FROM stdin;
2	Chicken Manchow Soup	\N	2	150	media/menu_item_pics/butter_chicken_OfUC4E0.jpeg	non-vegetarian	f	f	f	f
1	Chicken Butter Masala	\N	1	250	media/menu_item_pics/butter_chicken_tUjT0Ha.jpeg	non-vegetarian	f	f	f	t
3	Shahi Paneer	\N	0	300	media/menu_item_pics/butter_chicken.jpeg	vegetarian	f	f	f	f
4	Paneer	\N	0	120	media/menu_item_pics/fidelity_agreement.png	non-vegetarian	f	t	f	f
5	Chicken	\N	0	150	media/menu_item_pics/content_V7s9pR7.png	non-vegetarian	f	t	f	f
6	Chicken	\N	0	120	media/menu_item_pics/butter_chicken_lWKRuLn.jpeg	non-vegetarian	f	t	f	f
7	Chicken	\N	0	120	media/menu_item_pics/mapss.jpeg	non-vegetarian	f	t	f	f
\.


--
-- Data for Name: restaurants_menuitem_category; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_menuitem_category (id, menuitem_id, menucategory_id) FROM stdin;
1	1	2
2	2	2
3	3	2
4	4	2
5	5	2
6	6	2
7	7	3
\.


--
-- Name: restaurants_menuitem_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_menuitem_category_id_seq', 7, true);


--
-- Name: restaurants_menuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_menuitem_id_seq', 7, true);


--
-- Data for Name: restaurants_order; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_order (amount, customer_id, restaurant_id, order_id) FROM stdin;
550	2	11	04db7058-47be-4c58-80f5-6883c421f7fe
550	2	11	6ccad782-002e-456e-bcde-ddad68628e98
450	2	11	075c09e4-0b8b-420e-893e-943dc2825f18
400	2	11	dff6f2fc-e6bf-429d-8a9e-d84606748123
400	2	11	d6b99c8c-ad88-4c17-86df-8ff97146d8f5
400	2	11	f9bfb964-93e0-4ea5-9442-8734da1755ff
400	2	11	b7049934-362a-41bf-9b27-4ab7973c4871
450	2	11	8507c3d7-7c9b-43ea-aeb1-f653ab3f6b90
450	2	11	c6f8ebd1-9912-49e4-8cc6-6490a29cc86b
700	2	11	4b6030c9-1e41-4500-80da-e4a9425929a7
700	2	11	67101888-f775-464c-a1a2-01670120d1c5
120	2	12	765aa452-c421-4088-bded-eef2ceed7768
400	2	11	e0fcec68-c91e-4cd8-a331-d749656c5815
120	2	12	775f5e63-1730-4109-99e8-40f1b75fbeb8
\.


--
-- Data for Name: restaurants_order_items; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_order_items (id, order_id, menuitem_id) FROM stdin;
2	04db7058-47be-4c58-80f5-6883c421f7fe	3
3	04db7058-47be-4c58-80f5-6883c421f7fe	1
4	6ccad782-002e-456e-bcde-ddad68628e98	1
5	6ccad782-002e-456e-bcde-ddad68628e98	3
6	075c09e4-0b8b-420e-893e-943dc2825f18	3
7	075c09e4-0b8b-420e-893e-943dc2825f18	2
8	dff6f2fc-e6bf-429d-8a9e-d84606748123	1
9	dff6f2fc-e6bf-429d-8a9e-d84606748123	2
10	d6b99c8c-ad88-4c17-86df-8ff97146d8f5	1
11	d6b99c8c-ad88-4c17-86df-8ff97146d8f5	2
12	f9bfb964-93e0-4ea5-9442-8734da1755ff	1
13	f9bfb964-93e0-4ea5-9442-8734da1755ff	2
14	b7049934-362a-41bf-9b27-4ab7973c4871	1
15	b7049934-362a-41bf-9b27-4ab7973c4871	2
16	8507c3d7-7c9b-43ea-aeb1-f653ab3f6b90	3
17	8507c3d7-7c9b-43ea-aeb1-f653ab3f6b90	2
18	c6f8ebd1-9912-49e4-8cc6-6490a29cc86b	3
19	c6f8ebd1-9912-49e4-8cc6-6490a29cc86b	2
20	4b6030c9-1e41-4500-80da-e4a9425929a7	3
21	4b6030c9-1e41-4500-80da-e4a9425929a7	2
22	4b6030c9-1e41-4500-80da-e4a9425929a7	1
23	67101888-f775-464c-a1a2-01670120d1c5	3
24	67101888-f775-464c-a1a2-01670120d1c5	2
25	67101888-f775-464c-a1a2-01670120d1c5	1
26	765aa452-c421-4088-bded-eef2ceed7768	7
27	e0fcec68-c91e-4cd8-a331-d749656c5815	1
28	e0fcec68-c91e-4cd8-a331-d749656c5815	2
29	775f5e63-1730-4109-99e8-40f1b75fbeb8	7
\.


--
-- Name: restaurants_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_order_items_id_seq', 29, true);


--
-- Data for Name: restaurants_quantity; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_quantity (id, number, order_id) FROM stdin;
174	1	04db7058-47be-4c58-80f5-6883c421f7fe
175	1	04db7058-47be-4c58-80f5-6883c421f7fe
176	1	6ccad782-002e-456e-bcde-ddad68628e98
177	1	6ccad782-002e-456e-bcde-ddad68628e98
178	1	075c09e4-0b8b-420e-893e-943dc2825f18
179	1	075c09e4-0b8b-420e-893e-943dc2825f18
180	1	dff6f2fc-e6bf-429d-8a9e-d84606748123
181	1	dff6f2fc-e6bf-429d-8a9e-d84606748123
182	1	d6b99c8c-ad88-4c17-86df-8ff97146d8f5
183	1	d6b99c8c-ad88-4c17-86df-8ff97146d8f5
184	1	f9bfb964-93e0-4ea5-9442-8734da1755ff
185	1	f9bfb964-93e0-4ea5-9442-8734da1755ff
186	1	b7049934-362a-41bf-9b27-4ab7973c4871
187	1	b7049934-362a-41bf-9b27-4ab7973c4871
188	1	8507c3d7-7c9b-43ea-aeb1-f653ab3f6b90
189	1	8507c3d7-7c9b-43ea-aeb1-f653ab3f6b90
190	1	c6f8ebd1-9912-49e4-8cc6-6490a29cc86b
191	1	c6f8ebd1-9912-49e4-8cc6-6490a29cc86b
192	1	4b6030c9-1e41-4500-80da-e4a9425929a7
193	1	4b6030c9-1e41-4500-80da-e4a9425929a7
194	1	4b6030c9-1e41-4500-80da-e4a9425929a7
195	1	67101888-f775-464c-a1a2-01670120d1c5
196	1	67101888-f775-464c-a1a2-01670120d1c5
197	1	67101888-f775-464c-a1a2-01670120d1c5
198	1	765aa452-c421-4088-bded-eef2ceed7768
199	1	e0fcec68-c91e-4cd8-a331-d749656c5815
200	1	e0fcec68-c91e-4cd8-a331-d749656c5815
201	1	775f5e63-1730-4109-99e8-40f1b75fbeb8
\.


--
-- Name: restaurants_quantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_quantity_id_seq', 201, true);


--
-- Data for Name: restaurants_ratings; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_ratings (id, rating, author_id, restaurant_id) FROM stdin;
\.


--
-- Name: restaurants_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_ratings_id_seq', 1, false);


--
-- Data for Name: restaurants_restaurant; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_restaurant (id, name, cover_pic, location, phone_number, website_url, address, city, foodcourt_id, paytm_merchant_id) FROM stdin;
3	Kobe's	userprofiles/restaurant_pics/content.png	0101000020E6100000EC2C7AA7824153C00FAF905E79724340	5698745632	http://www.google.com	Washington, USA	Washington	\N	\N
4	Teriyaki	userprofiles/restaurant_pics/iab2.png	0101000020E6100000F9FAB5500D66534016AC826275F12940	1236547896	http://www.google.com	New Delhi, India	Banglore	\N	\N
5	BBq nation	userprofiles/restaurant_pics/maps.jpg	0101000020E6100000706CD15DEDB6524016B24813EFBC2940	1236547896	http://www.google.com	3rd Floor, Mak Mall, Father Muller's Rd, Kankanady, Mangaluru, Karnataka 575002	Manglore	\N	\N
6	Onesta	userprofiles/restaurant_pics/iab1.png	0101000020E6100000CED02E95EDB65240D56828A4EBBC2940	8197033794	http://www.google.com	Onesta, TF 2 & TF 3, Third Floor, MAK Mall, Kankanady, Mangaluru, Karnataka 575002	Manglore	\N	\N
7	BBQ manipal	userprofiles/restaurant_pics/error.png	0101000020E61000001CFF4F0F1BB252403CE3569CC5B22A40	6646464646	http://www.google.com	Ground Floor, Central Cinemas, Laxmindra Nagar, Udupi, Main Road, Manipal, Karnataka 576104	Manipal	\N	\N
8	Bourbon	userprofiles/restaurant_pics/iab2_ShX09Uj.png	0101000020E610000098A7CEFE9BB2524015B3147FCA0B2A40	1236547895	http://www.google.com	NH 66, Mukka, Sasihithlu, Karnataka 575025	Surathkal	\N	\N
12	The Asian Curry House	media/restaurant_pics/iab2.png	0101000020E61000003AB995148E645340AE731DF4B6FB2940	6646464646	http://www.google.com	3rd Floor, Mantri Square, Sampige Road, Malleshwaram, Bangalore	Banglore	1	\N
11	Barbecue by Punjab Grill	media/restaurant_pics/content.png	0101000020E61000003AB995148E645340A4731DF4B6FB2940	6444646464	http://www.google.com	Unit T-1, Third Floor, Sampige Road, Mantri Square Mall, Malleshwaram, Bangalore	Banglore	1	xInaNs61782653789260
\.


--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_restaurant_id_seq', 12, true);


--
-- Data for Name: restaurants_review; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.restaurants_review (id, review, restaurant_id, writer_id) FROM stdin;
\.


--
-- Name: restaurants_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.restaurants_review_id_seq', 1, false);


--
-- Data for Name: socialAuth_credentialsmodel; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public."socialAuth_credentialsmodel" (id_id, credential) FROM stdin;
3	\\x496a78765958563061444a6a62476c6c626e5175593278705a5735304c6b39426458526f4d6b4e795a57526c626e52705957787a49473969616d566a64434268644341776544646d4f4456694d324930597a4a6c4f443469
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
1	google-oauth2	piyush.n.h@gmail.com	{"token_type": null, "expires": null, "access_token": "ya29.GlxiB9czVWt8US1ppL47Rrdt2bS3LJK05KgklyIqFemvTeyTYFfpIflLWghZob0ixv4Q8xuFCeC4nwnqDM7PVSvF76YiS8V-lRKiEFtql3jq7VdRRr7ZolEgkLndGg", "auth_time": 1565608432}	3
\.


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, true);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: foodieuser
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodieuser
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys  FROM stdin;
\.


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: friendship_follow_follower_id_followee_id_75264015_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_follow
    ADD CONSTRAINT friendship_follow_follower_id_followee_id_75264015_uniq UNIQUE (follower_id, followee_id);


--
-- Name: friendship_follow_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_follow
    ADD CONSTRAINT friendship_follow_pkey PRIMARY KEY (id);


--
-- Name: friendship_friend_from_user_id_to_user_id_5aa078c0_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friend
    ADD CONSTRAINT friendship_friend_from_user_id_to_user_id_5aa078c0_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: friendship_friend_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friend
    ADD CONSTRAINT friendship_friend_pkey PRIMARY KEY (id);


--
-- Name: friendship_friendshipreq_from_user_id_to_user_id_003053a1_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friendshiprequest
    ADD CONSTRAINT friendship_friendshipreq_from_user_id_to_user_id_003053a1_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: friendship_friendshiprequest_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friendshiprequest
    ADD CONSTRAINT friendship_friendshiprequest_pkey PRIMARY KEY (id);


--
-- Name: paytm_merchantprofile_key_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.paytm_merchantprofile
    ADD CONSTRAINT paytm_merchantprofile_key_key UNIQUE (key);


--
-- Name: paytm_merchantprofile_merchant_id_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.paytm_merchantprofile
    ADD CONSTRAINT paytm_merchantprofile_merchant_id_key UNIQUE (owner_id);


--
-- Name: paytm_merchantprofile_mid_4544f567_pk; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.paytm_merchantprofile
    ADD CONSTRAINT paytm_merchantprofile_mid_4544f567_pk PRIMARY KEY (merchant_id);


--
-- Name: paytm_paytmhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.paytm_paytmhistory
    ADD CONSTRAINT paytm_paytmhistory_pkey PRIMARY KEY (id);


--
-- Name: restaurants_foodcourt_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_foodcourt
    ADD CONSTRAINT restaurants_foodcourt_pkey PRIMARY KEY (id);


--
-- Name: restaurants_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menu
    ADD CONSTRAINT restaurants_menu_name_key UNIQUE (name);


--
-- Name: restaurants_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menu
    ADD CONSTRAINT restaurants_menu_pkey PRIMARY KEY (id);


--
-- Name: restaurants_menu_slug_key; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menu
    ADD CONSTRAINT restaurants_menu_slug_key UNIQUE (slug);


--
-- Name: restaurants_menucategory_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menucategory
    ADD CONSTRAINT restaurants_menucategory_pkey PRIMARY KEY (id);


--
-- Name: restaurants_menuitem_cat_menuitem_id_menucategory_c8c1ff10_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menuitem_category
    ADD CONSTRAINT restaurants_menuitem_cat_menuitem_id_menucategory_c8c1ff10_uniq UNIQUE (menuitem_id, menucategory_id);


--
-- Name: restaurants_menuitem_category_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menuitem_category
    ADD CONSTRAINT restaurants_menuitem_category_pkey PRIMARY KEY (id);


--
-- Name: restaurants_menuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menuitem
    ADD CONSTRAINT restaurants_menuitem_pkey PRIMARY KEY (id);


--
-- Name: restaurants_order_items_order_id_menuitem_id_282a268b_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_order_items
    ADD CONSTRAINT restaurants_order_items_order_id_menuitem_id_282a268b_uniq UNIQUE (order_id, menuitem_id);


--
-- Name: restaurants_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_order_items
    ADD CONSTRAINT restaurants_order_items_pkey PRIMARY KEY (id);


--
-- Name: restaurants_order_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_order
    ADD CONSTRAINT restaurants_order_pkey PRIMARY KEY (order_id);


--
-- Name: restaurants_quantity_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_quantity
    ADD CONSTRAINT restaurants_quantity_pkey PRIMARY KEY (id);


--
-- Name: restaurants_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_ratings
    ADD CONSTRAINT restaurants_ratings_pkey PRIMARY KEY (id);


--
-- Name: restaurants_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_restaurant
    ADD CONSTRAINT restaurants_restaurant_pkey PRIMARY KEY (id);


--
-- Name: restaurants_review_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_review
    ADD CONSTRAINT restaurants_review_pkey PRIMARY KEY (id);


--
-- Name: socialAuth_credentialsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public."socialAuth_credentialsmodel"
    ADD CONSTRAINT "socialAuth_credentialsmodel_pkey" PRIMARY KEY (id_id);


--
-- Name: social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: friendship_follow_followee_id_3348979c; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX friendship_follow_followee_id_3348979c ON public.friendship_follow USING btree (followee_id);


--
-- Name: friendship_follow_follower_id_c10685be; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX friendship_follow_follower_id_c10685be ON public.friendship_follow USING btree (follower_id);


--
-- Name: friendship_friend_from_user_id_f229f783; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX friendship_friend_from_user_id_f229f783 ON public.friendship_friend USING btree (from_user_id);


--
-- Name: friendship_friend_to_user_id_0de15f5e; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX friendship_friend_to_user_id_0de15f5e ON public.friendship_friend USING btree (to_user_id);


--
-- Name: friendship_friendshiprequest_from_user_id_bbaf16e8; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX friendship_friendshiprequest_from_user_id_bbaf16e8 ON public.friendship_friendshiprequest USING btree (from_user_id);


--
-- Name: friendship_friendshiprequest_to_user_id_51d5a5a2; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX friendship_friendshiprequest_to_user_id_51d5a5a2 ON public.friendship_friendshiprequest USING btree (to_user_id);


--
-- Name: paytm_merchantprofile_key_e1d06d19_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX paytm_merchantprofile_key_e1d06d19_like ON public.paytm_merchantprofile USING btree (key varchar_pattern_ops);


--
-- Name: paytm_merchantprofile_mid_4544f567_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX paytm_merchantprofile_mid_4544f567_like ON public.paytm_merchantprofile USING btree (merchant_id varchar_pattern_ops);


--
-- Name: paytm_paytmhistory_customer_id_be3ed338; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX paytm_paytmhistory_customer_id_be3ed338 ON public.paytm_paytmhistory USING btree (customer_id);


--
-- Name: restaurants_foodcourt_location_id; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_foodcourt_location_id ON public.restaurants_foodcourt USING gist (location);


--
-- Name: restaurants_menu_name_c25bdc60_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_menu_name_c25bdc60_like ON public.restaurants_menu USING btree (name varchar_pattern_ops);


--
-- Name: restaurants_menu_restaurant_id_2b4adac7; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_menu_restaurant_id_2b4adac7 ON public.restaurants_menu USING btree (restaurant_id);


--
-- Name: restaurants_menu_slug_94fdac02_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_menu_slug_94fdac02_like ON public.restaurants_menu USING btree (slug varchar_pattern_ops);


--
-- Name: restaurants_menucategory_menu_id_ef8cb7e5; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_menucategory_menu_id_ef8cb7e5 ON public.restaurants_menucategory USING btree (menu_id);


--
-- Name: restaurants_menuitem_category_menucategory_id_ea6406f8; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_menuitem_category_menucategory_id_ea6406f8 ON public.restaurants_menuitem_category USING btree (menucategory_id);


--
-- Name: restaurants_menuitem_category_menuitem_id_c47bd0cb; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_menuitem_category_menuitem_id_c47bd0cb ON public.restaurants_menuitem_category USING btree (menuitem_id);


--
-- Name: restaurants_order_customer_id_5fc70501; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_order_customer_id_5fc70501 ON public.restaurants_order USING btree (customer_id);


--
-- Name: restaurants_order_items_menuitem_id_58402390; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_order_items_menuitem_id_58402390 ON public.restaurants_order_items USING btree (menuitem_id);


--
-- Name: restaurants_order_items_order_id_c7e3c050; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_order_items_order_id_c7e3c050 ON public.restaurants_order_items USING btree (order_id);


--
-- Name: restaurants_order_restaurant_id_6deeb748; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_order_restaurant_id_6deeb748 ON public.restaurants_order USING btree (restaurant_id);


--
-- Name: restaurants_quantity_order_id_a48e6561; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_quantity_order_id_a48e6561 ON public.restaurants_quantity USING btree (order_id);


--
-- Name: restaurants_ratings_author_id_0cace7e3; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_ratings_author_id_0cace7e3 ON public.restaurants_ratings USING btree (author_id);


--
-- Name: restaurants_ratings_restaurant_id_36927b50; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_ratings_restaurant_id_36927b50 ON public.restaurants_ratings USING btree (restaurant_id);


--
-- Name: restaurants_restaurant_foodcourt_id_ae43250a; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_restaurant_foodcourt_id_ae43250a ON public.restaurants_restaurant USING btree (foodcourt_id);


--
-- Name: restaurants_restaurant_location_id; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_restaurant_location_id ON public.restaurants_restaurant USING gist (location);


--
-- Name: restaurants_restaurant_merchant_id_27619ef4; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_restaurant_merchant_id_27619ef4 ON public.restaurants_restaurant USING btree (paytm_merchant_id);


--
-- Name: restaurants_review_restaurant_id_eb8a296e; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_review_restaurant_id_eb8a296e ON public.restaurants_review USING btree (restaurant_id);


--
-- Name: restaurants_review_writer_id_e41aaede; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX restaurants_review_writer_id_e41aaede ON public.restaurants_review USING btree (writer_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: foodieuser
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: friendship_follow_followee_id_3348979c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_follow
    ADD CONSTRAINT friendship_follow_followee_id_3348979c_fk_auth_user_id FOREIGN KEY (followee_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: friendship_follow_follower_id_c10685be_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_follow
    ADD CONSTRAINT friendship_follow_follower_id_c10685be_fk_auth_user_id FOREIGN KEY (follower_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: friendship_friend_from_user_id_f229f783_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friend
    ADD CONSTRAINT friendship_friend_from_user_id_f229f783_fk_auth_user_id FOREIGN KEY (from_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: friendship_friend_to_user_id_0de15f5e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friend
    ADD CONSTRAINT friendship_friend_to_user_id_0de15f5e_fk_auth_user_id FOREIGN KEY (to_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: friendship_friendshi_from_user_id_bbaf16e8_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friendshiprequest
    ADD CONSTRAINT friendship_friendshi_from_user_id_bbaf16e8_fk_auth_user FOREIGN KEY (from_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: friendship_friendshi_to_user_id_51d5a5a2_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.friendship_friendshiprequest
    ADD CONSTRAINT friendship_friendshi_to_user_id_51d5a5a2_fk_auth_user FOREIGN KEY (to_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paytm_merchantprofile_owner_id_ab836ad4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.paytm_merchantprofile
    ADD CONSTRAINT paytm_merchantprofile_owner_id_ab836ad4_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paytm_paytmhistory_customer_id_be3ed338_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.paytm_paytmhistory
    ADD CONSTRAINT paytm_paytmhistory_customer_id_be3ed338_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_menu_restaurant_id_2b4adac7_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menu
    ADD CONSTRAINT restaurants_menu_restaurant_id_2b4adac7_fk_restauran FOREIGN KEY (restaurant_id) REFERENCES public.restaurants_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_menucate_menu_id_ef8cb7e5_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menucategory
    ADD CONSTRAINT restaurants_menucate_menu_id_ef8cb7e5_fk_restauran FOREIGN KEY (menu_id) REFERENCES public.restaurants_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_menuitem_menucategory_id_ea6406f8_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menuitem_category
    ADD CONSTRAINT restaurants_menuitem_menucategory_id_ea6406f8_fk_restauran FOREIGN KEY (menucategory_id) REFERENCES public.restaurants_menucategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_menuitem_menuitem_id_c47bd0cb_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_menuitem_category
    ADD CONSTRAINT restaurants_menuitem_menuitem_id_c47bd0cb_fk_restauran FOREIGN KEY (menuitem_id) REFERENCES public.restaurants_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_order_customer_id_5fc70501_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_order
    ADD CONSTRAINT restaurants_order_customer_id_5fc70501_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_order_it_menuitem_id_58402390_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_order_items
    ADD CONSTRAINT restaurants_order_it_menuitem_id_58402390_fk_restauran FOREIGN KEY (menuitem_id) REFERENCES public.restaurants_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_order_it_order_id_c7e3c050_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_order_items
    ADD CONSTRAINT restaurants_order_it_order_id_c7e3c050_fk_restauran FOREIGN KEY (order_id) REFERENCES public.restaurants_order(order_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_order_restaurant_id_6deeb748_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_order
    ADD CONSTRAINT restaurants_order_restaurant_id_6deeb748_fk_restauran FOREIGN KEY (restaurant_id) REFERENCES public.restaurants_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_quantity_order_id_a48e6561_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_quantity
    ADD CONSTRAINT restaurants_quantity_order_id_a48e6561_fk_restauran FOREIGN KEY (order_id) REFERENCES public.restaurants_order(order_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_ratings_author_id_0cace7e3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_ratings
    ADD CONSTRAINT restaurants_ratings_author_id_0cace7e3_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_ratings_restaurant_id_36927b50_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_ratings
    ADD CONSTRAINT restaurants_ratings_restaurant_id_36927b50_fk_restauran FOREIGN KEY (restaurant_id) REFERENCES public.restaurants_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_restaura_foodcourt_id_ae43250a_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_restaurant
    ADD CONSTRAINT restaurants_restaura_foodcourt_id_ae43250a_fk_restauran FOREIGN KEY (foodcourt_id) REFERENCES public.restaurants_foodcourt(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_restaura_paytm_merchant_id_c6f85da3_fk_paytm_mer; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_restaurant
    ADD CONSTRAINT restaurants_restaura_paytm_merchant_id_c6f85da3_fk_paytm_mer FOREIGN KEY (paytm_merchant_id) REFERENCES public.paytm_merchantprofile(merchant_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_review_restaurant_id_eb8a296e_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_review
    ADD CONSTRAINT restaurants_review_restaurant_id_eb8a296e_fk_restauran FOREIGN KEY (restaurant_id) REFERENCES public.restaurants_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants_review_writer_id_e41aaede_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.restaurants_review
    ADD CONSTRAINT restaurants_review_writer_id_e41aaede_fk_auth_user_id FOREIGN KEY (writer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialAuth_credentialsmodel_id_id_5efdd774_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public."socialAuth_credentialsmodel"
    ADD CONSTRAINT "socialAuth_credentialsmodel_id_id_5efdd774_fk_auth_user_id" FOREIGN KEY (id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodieuser
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

