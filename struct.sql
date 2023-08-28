--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 11.16 (Debian 11.16-0+deb10u1)

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

--
-- Name: buscarcadena(character varying, character varying); Type: FUNCTION; Schema: public; Owner: orfeo_usr
--

CREATE FUNCTION public.buscarcadena(cadena character varying, esquema character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

DECLARE

 tabla character varying;

 columna character varying;

 r record;

    BEGIN

    FOR tabla IN

        select table_name from information_schema.tables where table_schema = esquema 

    LOOP

        FOR columna IN

            SELECT column_name FROM information_schema.columns WHERE table_schema = 'public' 

                AND table_name = tabla and data_type = 'character varying'

        LOOP

            FOR r IN EXECUTE format('SELECT 1 FROM %I where %I = ''%I''', tabla,columna,cadena)

            LOOP

                return 'tabla: '|| tabla||' || columna: '||columna;

            END LOOP;

        END LOOP;

    END LOOP;

    return 'No encontrada';

    END;

$$;


ALTER FUNCTION public.buscarcadena(cadena character varying, esquema character varying) OWNER TO orfeo_usr;

--
-- Name: concat(text, text); Type: FUNCTION; Schema: public; Owner: orfeo_usr
--

CREATE FUNCTION public.concat(text, text) RETURNS text
    LANGUAGE sql
    AS $_$select case when $1 = '' then $2 else ($1 || ', ' || $2) end$_$;


ALTER FUNCTION public.concat(text, text) OWNER TO orfeo_usr;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: preguntas; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.preguntas (
    id_preguntas integer NOT NULL,
    pregunta character varying(150)
);


ALTER TABLE public.preguntas OWNER TO orfeo_usr;

--
-- Name: TABLE preguntas; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.preguntas IS 'Guarda la pregunta en general para restablecer contraseña';


--
-- Name: Preguntas_id_preguntas_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public."Preguntas_id_preguntas_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Preguntas_id_preguntas_seq" OWNER TO orfeo_usr;

--
-- Name: Preguntas_id_preguntas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public."Preguntas_id_preguntas_seq" OWNED BY public.preguntas.id_preguntas;


--
-- Name: respuestas_usuario; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.respuestas_usuario (
    "id_Respuestas_Usuario" integer NOT NULL,
    id_pregunta integer NOT NULL,
    id_sgd_ciu_ciudadano integer NOT NULL,
    respuesta character varying(150) NOT NULL
);


ALTER TABLE public.respuestas_usuario OWNER TO orfeo_usr;

--
-- Name: TABLE respuestas_usuario; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.respuestas_usuario IS 'Preguntas por usuario';


--
-- Name: Respuestas_Usuario_id_Respuestas_Usuario_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public."Respuestas_Usuario_id_Respuestas_Usuario_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public."Respuestas_Usuario_id_Respuestas_Usuario_seq" OWNER TO orfeo_usr;

--
-- Name: Respuestas_Usuario_id_Respuestas_Usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public."Respuestas_Usuario_id_Respuestas_Usuario_seq" OWNED BY public.respuestas_usuario."id_Respuestas_Usuario";


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.usuario (
    usua_codi numeric(10,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_login character varying(50) NOT NULL,
    usua_fech_crea date,
    usua_pasw character varying(35) NOT NULL,
    usua_esta character varying(10) NOT NULL,
    usua_nomb character varying(45),
    perm_radi character(1) DEFAULT 0,
    usua_admin character(1) DEFAULT 0,
    usua_nuevo character(1) DEFAULT 0,
    usua_doc character varying(14) DEFAULT 0,
    codi_nivel numeric(2,0) DEFAULT 1,
    usua_sesion character varying(30),
    usua_fech_sesion date,
    usua_ext numeric(4,0),
    usua_nacim date,
    usua_email character varying(50),
    usua_at character varying(50),
    usua_piso numeric(2,0),
    perm_radi_sal numeric DEFAULT 0,
    usua_admin_archivo numeric(1,0) DEFAULT 0,
    usua_masiva numeric(1,0) DEFAULT 0,
    usua_perm_dev numeric(1,0) DEFAULT 0,
    usua_perm_numera_res character varying(1),
    usua_doc_suip character varying(15),
    usua_perm_numeradoc numeric(1,0),
    sgd_panu_codi numeric(4,0),
    usua_prad_tp1 numeric(1,0) DEFAULT 0,
    usua_prad_tp2 numeric(1,0) DEFAULT 0,
    usua_perm_envios numeric(1,0) DEFAULT 0,
    usua_perm_modifica numeric(1,0) DEFAULT 0,
    usua_perm_impresion numeric(1,0) DEFAULT 0,
    sgd_aper_codigo numeric(2,0),
    usu_telefono1 character varying(14),
    usua_encuesta character varying(1),
    sgd_perm_estadistica numeric(2,0),
    usua_perm_sancionados numeric(1,0),
    usua_admin_sistema numeric(1,0),
    usua_perm_trd numeric(1,0),
    usua_perm_firma numeric(1,0),
    usua_perm_prestamo numeric(1,0),
    usuario_publico numeric(1,0),
    usuario_reasignar numeric(1,0),
    usua_perm_notifica numeric(1,0),
    usua_perm_expediente numeric,
    usua_login_externo character varying(50),
    id_pais numeric(4,0) DEFAULT 170,
    id_cont numeric(2,0) DEFAULT 1,
    usua_auth_ldap numeric(1,0) DEFAULT 0,
    perm_archi character(1) DEFAULT 1,
    perm_vobo character(1) DEFAULT 1,
    perm_borrar_anexo numeric(1,0),
    perm_tipif_anexo numeric(1,0),
    usua_perm_adminflujos numeric(1,0) DEFAULT 0 NOT NULL,
    usua_exp_trd numeric(2,0) DEFAULT 0,
    usua_perm_rademail smallint,
    usua_perm_accesi numeric(1,0) DEFAULT 0,
    usua_perm_agrcontacto numeric(1,0) DEFAULT 0,
    usua_prad_tp4 smallint,
    usua_perm_preradicado numeric(1,0),
    cod_rol numeric(3,0),
    descargar_documentos numeric(1,0) DEFAULT 0,
    usua_perm_reasigna_masiva numeric(1,0),
    usua_nivel_consulta numeric(1,0),
    descarga_arc_original smallint DEFAULT 0,
    firma_qr smallint DEFAULT 0,
    per_transferencia_documental smallint DEFAULT 0,
    usua_perm_grupo_usuarios_informados numeric(1,0),
    usua_perm_doc_publico numeric(1,0) DEFAULT 0,
    usua_perm_consulta_rad numeric(1,0),
    consulta_inv_documental numeric DEFAULT 0,
    carga_inv_documental numeric DEFAULT 0
);


ALTER TABLE public.usuario OWNER TO orfeo_usr;

--
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.usuario IS 'USUARIO';


--
-- Name: COLUMN usuario.usua_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_codi IS 'CODIGO DE USUARIO';


--
-- Name: COLUMN usuario.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.depe_codi IS 'DEPE_CODI';


--
-- Name: COLUMN usuario.usua_login; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_login IS 'LOGIN USUARIO';


--
-- Name: COLUMN usuario.usua_fech_crea; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_fech_crea IS 'FECHA DE CREACION DEL USUARIO';


--
-- Name: COLUMN usuario.usua_pasw; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_pasw IS 'USUA_PASW';


--
-- Name: COLUMN usuario.usua_esta; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_esta IS 'ESTADO DEL USUARIO - Activo o No (1/0)';


--
-- Name: COLUMN usuario.usua_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_nomb IS 'NOMBRE DEL USUARIO';


--
-- Name: COLUMN usuario.perm_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.perm_radi IS 'Permiso para digitalizacion de documentos: 1 permiso asignado';


--
-- Name: COLUMN usuario.usua_admin; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_admin IS 'Prestamo de documentos fisicos: 0 sin permiso -  1 permiso asignado ';


--
-- Name: COLUMN usuario.usua_nuevo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_nuevo IS 'Usuario Nuevo ? Si esta en ''0'' resetea la contrase?a';


--
-- Name: COLUMN usuario.usua_doc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_doc IS 'No. de Documento de Identificacion. ';


--
-- Name: COLUMN usuario.codi_nivel; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.codi_nivel IS 'Nivel del Usuario';


--
-- Name: COLUMN usuario.usua_sesion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_sesion IS 'Sesion Actual del usuario o Ultima fecha que entro.';


--
-- Name: COLUMN usuario.usua_fech_sesion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_fech_sesion IS 'Fecha de Actual de la session o Ultima Fecha.';


--
-- Name: COLUMN usuario.usua_ext; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_ext IS 'Numero de extension del usuario';


--
-- Name: COLUMN usuario.usua_nacim; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_nacim IS 'Fecha Nacimiento';


--
-- Name: COLUMN usuario.usua_email; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_email IS 'Mail';


--
-- Name: COLUMN usuario.usua_at; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_at IS 'Nombre del Equipo';


--
-- Name: COLUMN usuario.usua_piso; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_piso IS 'Piso en el que se encuentra laborando';


--
-- Name: COLUMN usuario.usua_admin_archivo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_admin_archivo IS 'Administrador de Archivo (Expedientes): 0 sin permiso - 1 permiso asignado ';


--
-- Name: COLUMN usuario.usua_masiva; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_masiva IS 'Permiso de radicacion masiva de documentos';


--
-- Name: COLUMN usuario.usua_perm_dev; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_dev IS 'Devoluciones de correo (Dev_correo): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.sgd_panu_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.sgd_panu_codi IS 'Permisos de anulacion de radicados: 1 - Permiso de solicitud de anulado 2- Permiso de anulacion y generacion de actas 3- Permiso 1 y 2';


--
-- Name: COLUMN usuario.usua_prad_tp1; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_prad_tp1 IS 'Si esta en ''1'' El usuario Tiene Permisos de radicacicion Tipo 1.  En nuestro caso de salida';


--
-- Name: COLUMN usuario.usua_prad_tp2; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_prad_tp2 IS 'Si esta en ''2'' El usuario Tiene Permisos de radicacicion Tipo 2.  En nuestro caso de Entrada';


--
-- Name: COLUMN usuario.usua_perm_envios; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_envios IS 'Envios de correo (correspondencia): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.usua_perm_modifica; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_modifica IS 'Permiso de modificar Radicados';


--
-- Name: COLUMN usuario.usua_perm_impresion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_impresion IS 'Carpeta de impresion: 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.sgd_perm_estadistica; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.sgd_perm_estadistica IS 'Si tiene ''1'' tiene permisos como jefe para ver las estadisticas de la dependencia.';


--
-- Name: COLUMN usuario.usua_admin_sistema; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_admin_sistema IS 'Administrador del sistema : 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.usua_perm_trd; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_trd IS 'Usuario Administracion de tablas de retencion documental : 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN usuario.usua_perm_prestamo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_prestamo IS 'Indica si un usuario tiene o no permiso de acceso al modulo de prestamo. Segun su valor:

Tiene permiso

(0) No tiene permiso';


--
-- Name: COLUMN usuario.perm_borrar_anexo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.perm_borrar_anexo IS 'Indica si un usuario tiene (1) o no (0) permiso para tipificar anexos .tif';


--
-- Name: COLUMN usuario.perm_tipif_anexo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.perm_tipif_anexo IS 'Indica si un usuario tiene (1)  o no (0) permiso para tipificar anexos .tif';


--
-- Name: COLUMN usuario.usua_perm_rademail; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_rademail IS 'Permiso de radicacion de email';


--
-- Name: COLUMN usuario.usua_perm_accesi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_accesi IS 'Permiso para  compatbilidad uso de lector de pantalla';


--
-- Name: COLUMN usuario.usua_perm_agrcontacto; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_agrcontacto IS 'permiso para agregar contactos formualrio rad';


--
-- Name: COLUMN usuario.usua_perm_preradicado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_preradicado IS 'Identifica si tiene o no el permiso del formulario de pre-radicación';


--
-- Name: COLUMN usuario.cod_rol; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.cod_rol IS 'identifica el rol que se asigno al usuario';


--
-- Name: COLUMN usuario.usua_perm_reasigna_masiva; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_reasigna_masiva IS 'Este permite asignar el permiso para realizar el proceso de reasignación masiva';


--
-- Name: COLUMN usuario.usua_nivel_consulta; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_nivel_consulta IS 'Este permiso permite asignar un nivel de consilta a los radicados';


--
-- Name: COLUMN usuario.descarga_arc_original; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.descarga_arc_original IS 'Este permiso permite descargar el archivo original del radicado';


--
-- Name: COLUMN usuario.firma_qr; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.firma_qr IS 'Este permiso permite firmar el radicado';


--
-- Name: COLUMN usuario.usua_perm_grupo_usuarios_informados; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_grupo_usuarios_informados IS 'Este permiso permite asignar el permiso para crear gupos de informados nuevos';


--
-- Name: COLUMN usuario.usua_perm_consulta_rad; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.usua_perm_consulta_rad IS 'Permiso para el proceso de consulta de radicados marcados como confidenciales';


--
-- Name: COLUMN usuario.consulta_inv_documental; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.consulta_inv_documental IS 'permiso para consulta de inventario documental';


--
-- Name: COLUMN usuario.carga_inv_documental; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.usuario.carga_inv_documental IS 'permiso para creación y carga de documentos en inventario documental';


--
-- Name: V_USUARIO; Type: VIEW; Schema: public; Owner: orfeo_usr
--

CREATE VIEW public."V_USUARIO" AS
 SELECT usuario.usua_codi,
    usuario.usua_nomb,
    usuario.usua_login,
    usuario.depe_codi
   FROM public.usuario;


ALTER TABLE public."V_USUARIO" OWNER TO orfeo_usr;

--
-- Name: anexos; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.anexos (
    anex_radi_nume character varying(30) NOT NULL,
    anex_codigo character varying(30) NOT NULL,
    anex_tipo numeric(4,0) NOT NULL,
    anex_tamano numeric,
    anex_solo_lect character varying(1) NOT NULL,
    anex_creador character varying(50) NOT NULL,
    anex_desc character varying(512),
    anex_numero numeric(5,0) NOT NULL,
    anex_nomb_archivo character varying(150) NOT NULL,
    anex_borrado character varying(1) NOT NULL,
    anex_origen numeric(1,0) DEFAULT 0,
    anex_ubic character varying(15),
    anex_salida numeric(1,0) DEFAULT 0,
    radi_nume_salida character varying(30),
    anex_radi_fech timestamp with time zone DEFAULT now(),
    anex_estado numeric(1,0) DEFAULT 0,
    usua_doc character varying(14),
    sgd_rem_destino numeric(1,0) DEFAULT 0,
    anex_fech_envio timestamp with time zone,
    sgd_dir_tipo numeric(4,0),
    anex_fech_impres timestamp with time zone,
    anex_depe_creador character varying(5),
    sgd_doc_secuencia numeric(15,0),
    sgd_doc_padre character varying(20),
    sgd_arg_codigo numeric(2,0),
    sgd_tpr_codigo numeric(4,0),
    sgd_deve_codigo numeric(2,0),
    sgd_deve_fech date,
    sgd_fech_impres timestamp without time zone,
    anex_fech_anex timestamp with time zone,
    anex_depe_codi character varying(5),
    sgd_pnufe_codi numeric(4,0),
    sgd_dnufe_codi numeric(4,0),
    anex_usudoc_creador character varying(15),
    sgd_fech_doc date,
    sgd_apli_codi numeric(4,0),
    sgd_trad_codigo numeric(2,0),
    sgd_dir_direccion character varying(150),
    sgd_exp_numero character varying(20),
    numero_doc character varying(15),
    sgd_srd_codigo character varying(3),
    sgd_sbrd_codigo character varying(4),
    anex_num_hoja numeric,
    texto_archivo_anex text,
    anex_idarch_version numeric(3,0),
    anex_num_version numeric(2,0),
    doc_firmado_qr smallint DEFAULT 0,
    anex_nomb_archivo_orig character varying(150),
    radi_docu_publico boolean DEFAULT false,
    fecha_rec_remi date,
    anex_radicado numeric(1,0) DEFAULT 0,
    anex_tipo_envio numeric DEFAULT 0
);


ALTER TABLE public.anexos OWNER TO orfeo_usr;

--
-- Name: COLUMN anexos.numero_doc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.numero_doc IS 'Numero de documento';


--
-- Name: COLUMN anexos.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.sgd_srd_codigo IS 'Serie';


--
-- Name: COLUMN anexos.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.sgd_sbrd_codigo IS 'Subserie';


--
-- Name: COLUMN anexos.anex_idarch_version; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.anex_idarch_version IS 'Id del archivo de versión';


--
-- Name: COLUMN anexos.anex_num_version; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.anex_num_version IS 'Numero de versión del anexo';


--
-- Name: COLUMN anexos.radi_docu_publico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.radi_docu_publico IS 'Guarda la información correspondiente el documento puede ser visible o no en el landin page';


--
-- Name: COLUMN anexos.fecha_rec_remi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.fecha_rec_remi IS 'fecha recibido remitente';


--
-- Name: COLUMN anexos.anex_radicado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.anex_radicado IS 'Indica si el anexo va a ser una respuesta.';


--
-- Name: COLUMN anexos.anex_tipo_envio; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos.anex_tipo_envio IS 'Inca la forma de envío de la respuesta dada, 1=Fisico, 2= Electrónico
';


--
-- Name: anexos_historico; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.anexos_historico (
    anex_hist_anex_codi character varying(20) NOT NULL,
    anex_hist_num_ver numeric(4,0) NOT NULL,
    anex_hist_tipo_mod character varying(2) NOT NULL,
    anex_hist_usua character varying(15) NOT NULL,
    anex_hist_fecha date NOT NULL,
    usua_doc character varying(14)
);


ALTER TABLE public.anexos_historico OWNER TO orfeo_usr;

--
-- Name: anexos_tipo; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.anexos_tipo (
    anex_tipo_codi numeric(4,0) NOT NULL,
    anex_tipo_ext character varying(10) NOT NULL,
    anex_tipo_desc character varying(50),
    anex_tipo_icon character varying DEFAULT 'fas fa-file-invoice'::character varying
);


ALTER TABLE public.anexos_tipo OWNER TO orfeo_usr;

--
-- Name: COLUMN anexos_tipo.anex_tipo_icon; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.anexos_tipo.anex_tipo_icon IS 'iconos';


--
-- Name: bodega_empresas; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.bodega_empresas (
    nombre_de_la_empresa character varying(300),
    nuir character varying(13),
    nit_de_la_empresa character varying(80),
    sigla_de_la_empresa character varying(80),
    direccion character varying(4000),
    codigo_del_departamento character varying(4000),
    codigo_del_municipio character varying(4000),
    telefono_1 character varying(4000),
    telefono_2 character varying(4000),
    email character varying(4000),
    nombre_rep_legal character varying(4000),
    cargo_rep_legal character varying(4000),
    identificador_empresa numeric(5,0) NOT NULL,
    are_esp_secue numeric(8,0) DEFAULT 8 NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    activa numeric(1,0) DEFAULT 1,
    flag_rups character varying(10),
    codigo_suscriptor character varying(50),
    id_users_pqrs integer,
    trte_codi integer DEFAULT 1
);


ALTER TABLE public.bodega_empresas OWNER TO orfeo_usr;

--
-- Name: COLUMN bodega_empresas.codigo_suscriptor; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.bodega_empresas.codigo_suscriptor IS 'Codigo del suscriptor';


--
-- Name: COLUMN bodega_empresas.id_users_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.bodega_empresas.id_users_pqrs IS 'Indica el id del usuario correspondiente en la pagina publica';


--
-- Name: COLUMN bodega_empresas.trte_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.bodega_empresas.trte_codi IS 'Tipo de remitente';


--
-- Name: borrar_carpeta_personalizada; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.borrar_carpeta_personalizada (
    carp_per_codi numeric(2,0) NOT NULL,
    carp_per_usu character varying(15) NOT NULL,
    carp_per_desc character varying(80) NOT NULL
);


ALTER TABLE public.borrar_carpeta_personalizada OWNER TO orfeo_usr;

--
-- Name: borrar_empresa_esp; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.borrar_empresa_esp (
    eesp_codi numeric(7,0) NOT NULL,
    eesp_nomb character varying(150) NOT NULL,
    essp_nit character varying(13),
    essp_sigla character varying(30),
    depe_codi character varying(5),
    muni_codi numeric(4,0),
    eesp_dire character varying(50),
    eesp_rep_leg character varying(75)
);


ALTER TABLE public.borrar_empresa_esp OWNER TO orfeo_usr;

--
-- Name: TABLE borrar_empresa_esp; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.borrar_empresa_esp IS 'EMPRESA_ESP';


--
-- Name: COLUMN borrar_empresa_esp.eesp_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.borrar_empresa_esp.eesp_codi IS 'CODGO DE EMPRESA DE SERVICIOS PUBLICOS';


--
-- Name: COLUMN borrar_empresa_esp.eesp_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.borrar_empresa_esp.eesp_nomb IS 'NOMBRE DE EMPRESA';


--
-- Name: COLUMN borrar_empresa_esp.essp_nit; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.borrar_empresa_esp.essp_nit IS 'ESSP_NIT';


--
-- Name: COLUMN borrar_empresa_esp.essp_sigla; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.borrar_empresa_esp.essp_sigla IS 'ESSP_SIGLA';


--
-- Name: COLUMN borrar_empresa_esp.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.borrar_empresa_esp.depe_codi IS 'DEPE_CODI';


--
-- Name: COLUMN borrar_empresa_esp.muni_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.borrar_empresa_esp.muni_codi IS 'MUNI_CODI';


--
-- Name: carpeta; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.carpeta (
    carp_codi numeric(2,0) NOT NULL,
    carp_desc character varying(80) NOT NULL,
    mostrar_como_tipo numeric(1,0) DEFAULT 1
);


ALTER TABLE public.carpeta OWNER TO orfeo_usr;

--
-- Name: TABLE carpeta; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.carpeta IS 'CARPETA';


--
-- Name: COLUMN carpeta.carp_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.carpeta.carp_codi IS 'CARP_CODI';


--
-- Name: COLUMN carpeta.carp_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.carpeta.carp_desc IS 'CARP_DESC';


--
-- Name: COLUMN carpeta.mostrar_como_tipo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.carpeta.mostrar_como_tipo IS 'Indica si se debe mostrar o no como tipo de radicado en el sistema aplica mas que todo para PQRS';


--
-- Name: carpeta_per; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.carpeta_per (
    usua_codi numeric(3,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    nomb_carp character varying(50),
    desc_carp character varying(50),
    codi_carp numeric(3,0) DEFAULT 99,
    id_caperta_per integer NOT NULL
);


ALTER TABLE public.carpeta_per OWNER TO orfeo_usr;

--
-- Name: carpeta_per_id_caperta_per_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.carpeta_per_id_caperta_per_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carpeta_per_id_caperta_per_seq OWNER TO orfeo_usr;

--
-- Name: carpeta_per_id_caperta_per_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.carpeta_per_id_caperta_per_seq OWNED BY public.carpeta_per.id_caperta_per;


--
-- Name: centro_poblado; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.centro_poblado (
    cpob_codi numeric(4,0) NOT NULL,
    muni_codi numeric(4,0) NOT NULL,
    dpto_codi numeric(2,0) NOT NULL,
    cpob_nomb character varying(100) NOT NULL,
    cpob_nomb_anterior character varying(100)
);


ALTER TABLE public.centro_poblado OWNER TO orfeo_usr;

--
-- Name: TABLE centro_poblado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.centro_poblado IS 'CENTRO_POBLADO';


--
-- Name: COLUMN centro_poblado.cpob_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.centro_poblado.cpob_codi IS 'CPOB_CODI';


--
-- Name: COLUMN centro_poblado.muni_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.centro_poblado.muni_codi IS 'MUNI_CODI';


--
-- Name: COLUMN centro_poblado.dpto_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.centro_poblado.dpto_codi IS 'DPTO_CODI';


--
-- Name: COLUMN centro_poblado.cpob_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.centro_poblado.cpob_nomb IS 'CPOB_NOMB';


--
-- Name: configuracion_contrasena; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.configuracion_contrasena (
    "idConfiguracionContracsena" integer NOT NULL,
    numero_periocidad numeric(2,0) NOT NULL,
    descripcion_periocidad character varying(15) NOT NULL,
    dias_notificacion numeric(2,0) NOT NULL,
    estado_configuracion_contrasena boolean NOT NULL,
    anio_creacion character varying(4)
);


ALTER TABLE public.configuracion_contrasena OWNER TO orfeo_usr;

--
-- Name: TABLE configuracion_contrasena; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.configuracion_contrasena IS 'tabla que guarda la información de las configuraciones de las contrasñeas';


--
-- Name: COLUMN configuracion_contrasena."idConfiguracionContracsena"; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_contrasena."idConfiguracionContracsena" IS 'Identificador de tabla';


--
-- Name: COLUMN configuracion_contrasena.numero_periocidad; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_contrasena.numero_periocidad IS 'Indica la cantidad de dias, semanas o meses en los que vence la contraseña';


--
-- Name: COLUMN configuracion_contrasena.descripcion_periocidad; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_contrasena.descripcion_periocidad IS 'Indica la descripción de la periocidad dias, semanas y meses';


--
-- Name: COLUMN configuracion_contrasena.dias_notificacion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_contrasena.dias_notificacion IS 'indica la cantidad de dias antes del vencimiento de la contraseña';


--
-- Name: COLUMN configuracion_contrasena.estado_configuracion_contrasena; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_contrasena.estado_configuracion_contrasena IS 'Indica el estado de la confuguración';


--
-- Name: COLUMN configuracion_contrasena.anio_creacion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_contrasena.anio_creacion IS 'guara el año en el que se crea la configuración';


--
-- Name: configuracion_contrasena_idConfiguracionContracsena_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public."configuracion_contrasena_idConfiguracionContracsena_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."configuracion_contrasena_idConfiguracionContracsena_seq" OWNER TO orfeo_usr;

--
-- Name: configuracion_contrasena_idConfiguracionContracsena_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public."configuracion_contrasena_idConfiguracionContracsena_seq" OWNED BY public.configuracion_contrasena."idConfiguracionContracsena";


--
-- Name: configuracion_general_fondo; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.configuracion_general_fondo (
    id_campo_configuracion_fondo integer NOT NULL,
    nombre_campo_configuracion_fondo character varying(100),
    descripcion_campo_configuracion_fondo character varying(100),
    consultar_configuracion_fondo numeric(2,0),
    tipo_consulta_configuracion_fondo numeric(2,0)
);


ALTER TABLE public.configuracion_general_fondo OWNER TO orfeo_usr;

--
-- Name: TABLE configuracion_general_fondo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.configuracion_general_fondo IS 'En esta tabla se va a guardar la configuración de los campos que se mostraran en el visor de consulta de fondo acumulado. 1= decretos, 2= resoluciones, 3=comunicaciones, 4=contratos, 5=posesiones, 6=titulaciones, 7=manual funciones, 8=plan desarrollo, 9=acuerdos, 10=historia laboral';


--
-- Name: COLUMN configuracion_general_fondo.id_campo_configuracion_fondo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_general_fondo.id_campo_configuracion_fondo IS 'Guarda el identificador de la tabla';


--
-- Name: COLUMN configuracion_general_fondo.nombre_campo_configuracion_fondo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_general_fondo.nombre_campo_configuracion_fondo IS 'Referencia al nombre del campo de la tabla donde se guarda la información leida del excel';


--
-- Name: COLUMN configuracion_general_fondo.descripcion_campo_configuracion_fondo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_general_fondo.descripcion_campo_configuracion_fondo IS 'Referencia el texto que va a mostrar en el formulario el label del campo de la tabla donde se guarda la información leida del excel tipo_consulta_configuracion_fondo';


--
-- Name: COLUMN configuracion_general_fondo.consultar_configuracion_fondo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_general_fondo.consultar_configuracion_fondo IS 'Indica si el campo va a ser utilizado para consultar de la información leida del excel';


--
-- Name: COLUMN configuracion_general_fondo.tipo_consulta_configuracion_fondo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.configuracion_general_fondo.tipo_consulta_configuracion_fondo IS 'Indica el tipo de archivo leido';


--
-- Name: configuracion_general_fondo_id_campo_configuracion_fondo_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.configuracion_general_fondo_id_campo_configuracion_fondo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuracion_general_fondo_id_campo_configuracion_fondo_seq OWNER TO orfeo_usr;

--
-- Name: configuracion_general_fondo_id_campo_configuracion_fondo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.configuracion_general_fondo_id_campo_configuracion_fondo_seq OWNED BY public.configuracion_general_fondo.id_campo_configuracion_fondo;


--
-- Name: contrasenas_guardadas; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.contrasenas_guardadas (
    id_contrasena_guardada integer NOT NULL,
    usua_login_contrasena_guardada character varying(15) NOT NULL,
    contrasena_anterior_contrasena_guardada character varying(150) NOT NULL,
    contrasena_nueva_contrasena_guardada character varying(150) NOT NULL,
    fecha_creacion_contrasena_guardada date NOT NULL,
    fecha_vencimiento_contrasena_guardada date NOT NULL,
    estado_contrasena_guardada boolean DEFAULT true NOT NULL
);


ALTER TABLE public.contrasenas_guardadas OWNER TO orfeo_usr;

--
-- Name: TABLE contrasenas_guardadas; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.contrasenas_guardadas IS 'Guarda las contraseñas correspondientes a los usuarios.';


--
-- Name: COLUMN contrasenas_guardadas.id_contrasena_guardada; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.contrasenas_guardadas.id_contrasena_guardada IS 'Identificador de tabla';


--
-- Name: COLUMN contrasenas_guardadas.usua_login_contrasena_guardada; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.contrasenas_guardadas.usua_login_contrasena_guardada IS 'indica el usuario al que se le esta guardando la contraseña';


--
-- Name: COLUMN contrasenas_guardadas.contrasena_anterior_contrasena_guardada; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.contrasenas_guardadas.contrasena_anterior_contrasena_guardada IS 'indica la contraseña anterior que tenia el usuario';


--
-- Name: COLUMN contrasenas_guardadas.contrasena_nueva_contrasena_guardada; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.contrasenas_guardadas.contrasena_nueva_contrasena_guardada IS 'indica la contraseña nueva que tiene el usuario';


--
-- Name: COLUMN contrasenas_guardadas.fecha_creacion_contrasena_guardada; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.contrasenas_guardadas.fecha_creacion_contrasena_guardada IS 'indica la fecha en la que se crea el registro';


--
-- Name: COLUMN contrasenas_guardadas.fecha_vencimiento_contrasena_guardada; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.contrasenas_guardadas.fecha_vencimiento_contrasena_guardada IS 'indica la fecha de vencimiento de la contraseña';


--
-- Name: COLUMN contrasenas_guardadas.estado_contrasena_guardada; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.contrasenas_guardadas.estado_contrasena_guardada IS 'indica el estado de la contraseña';


--
-- Name: contrasenas_guardadas_id_contrasena_guardada_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.contrasenas_guardadas_id_contrasena_guardada_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contrasenas_guardadas_id_contrasena_guardada_seq OWNER TO orfeo_usr;

--
-- Name: contrasenas_guardadas_id_contrasena_guardada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.contrasenas_guardadas_id_contrasena_guardada_seq OWNED BY public.contrasenas_guardadas.id_contrasena_guardada;


--
-- Name: datosocr; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.datosocr (
    indice integer NOT NULL,
    nume_radi character varying(30) NOT NULL,
    texto text NOT NULL,
    radi_nume_deri character varying(30),
    fecha_radi timestamp with time zone NOT NULL,
    tipo numeric(2,0) NOT NULL,
    radi_depe_radi character varying(5) NOT NULL,
    tipo_radi numeric(2,0) NOT NULL,
    tdoc_codi numeric(4,0) NOT NULL,
    anex_desc character varying(50000),
    fechaocr timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.datosocr OWNER TO orfeo_usr;

--
-- Name: TABLE datosocr; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.datosocr IS 'datosocr es donde se guarda directamente todo lo que skinascan reconoce como texto';


--
-- Name: datosocr_indice_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.datosocr_indice_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.datosocr_indice_seq OWNER TO orfeo_usr;

--
-- Name: datosocr_indice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.datosocr_indice_seq OWNED BY public.datosocr.indice;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.departamento (
    dpto_codi numeric(3,0) NOT NULL,
    dpto_nomb character varying(70) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170 NOT NULL
);


ALTER TABLE public.departamento OWNER TO orfeo_usr;

--
-- Name: TABLE departamento; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.departamento IS 'DEPARTAMENTO';


--
-- Name: COLUMN departamento.dpto_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.departamento.dpto_codi IS 'DPTO_CODI';


--
-- Name: COLUMN departamento.dpto_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.departamento.dpto_nomb IS 'DPTO_NOMB';


--
-- Name: dependencia; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.dependencia (
    depe_codi character varying(5) NOT NULL,
    depe_nomb character varying(700) NOT NULL,
    dpto_codi numeric(2,0),
    depe_codi_padre character varying(5),
    muni_codi numeric(4,0),
    depe_codi_territorial character varying(5),
    dep_sigla character varying(100),
    dep_central numeric(1,0),
    dep_direccion character varying(100),
    depe_num_interna numeric(4,0),
    depe_num_resolucion numeric(4,0),
    depe_rad_tp1 character varying(5),
    depe_rad_tp2 character varying(5),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    depe_estado numeric(1,0) DEFAULT 0,
    depe_segu numeric(1,0),
    depe_rad_tp4 character varying(5)
);


ALTER TABLE public.dependencia OWNER TO orfeo_usr;

--
-- Name: COLUMN dependencia.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.dependencia.depe_codi IS 'CODIGO DE DEPENDENCIA';


--
-- Name: COLUMN dependencia.depe_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.dependencia.depe_nomb IS 'NOMBRE DE DEPENDENCIA';


--
-- Name: COLUMN dependencia.dep_sigla; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.dependencia.dep_sigla IS 'SIGLA DE LA DEPENDENCIA';


--
-- Name: COLUMN dependencia.dep_central; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.dependencia.dep_central IS 'INDICA SI SE TRATA DE UNA DEPENDENCIA DEL NIVEL CENTRAL';


--
-- Name: COLUMN dependencia.depe_segu; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.dependencia.depe_segu IS 'Guarda valor que identifica que la dependencia tenga seguridad o no en la consulta de radicados ';


--
-- Name: dependencia_visibilidad; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.dependencia_visibilidad (
    codigo_visibilidad numeric(18,0) NOT NULL,
    dependencia_visible character varying(5) NOT NULL,
    dependencia_observa character varying(5) NOT NULL
);


ALTER TABLE public.dependencia_visibilidad OWNER TO orfeo_usr;

--
-- Name: dependencias; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.dependencias
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999
    CACHE 1;


ALTER TABLE public.dependencias OWNER TO orfeo_usr;

--
-- Name: direccion_usuarios; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.direccion_usuarios (
    id integer NOT NULL,
    "DirCam1" character varying(10),
    "DirCam2" character varying(10),
    "DirCam3" character varying(10),
    "DirCam4" character varying(10),
    "DirCam5" character varying(10),
    "DirCam6" character varying(10)
);


ALTER TABLE public.direccion_usuarios OWNER TO orfeo_usr;

--
-- Name: TABLE direccion_usuarios; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.direccion_usuarios IS 'guarda la dirección del usuariio';


--
-- Name: direccion_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.direccion_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.direccion_usuarios_id_seq OWNER TO orfeo_usr;

--
-- Name: direccion_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.direccion_usuarios_id_seq OWNED BY public.direccion_usuarios.id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.estado (
    esta_codi numeric(2,0) NOT NULL,
    esta_desc character varying(100) NOT NULL,
    estado_tipo_radicado numeric(1,0)
);


ALTER TABLE public.estado OWNER TO orfeo_usr;

--
-- Name: TABLE estado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.estado IS 'ESTADO';


--
-- Name: COLUMN estado.esta_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.estado.esta_codi IS 'ESTA_CODI';


--
-- Name: COLUMN estado.esta_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.estado.esta_desc IS 'ESTA_DESC';


--
-- Name: COLUMN estado.estado_tipo_radicado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.estado.estado_tipo_radicado IS 'Guarda el id del tipo de radicado donde se ve afectado el estado';


--
-- Name: estado_civil_pqrs; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.estado_civil_pqrs (
    id_estado_civil_pqrs integer NOT NULL,
    tipo_estado_civil_pqrs character varying(50)
);


ALTER TABLE public.estado_civil_pqrs OWNER TO orfeo_usr;

--
-- Name: estado_civil_pqrs_id_estado_civil_pqrs_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.estado_civil_pqrs_id_estado_civil_pqrs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_civil_pqrs_id_estado_civil_pqrs_seq OWNER TO orfeo_usr;

--
-- Name: estado_civil_pqrs_id_estado_civil_pqrs_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.estado_civil_pqrs_id_estado_civil_pqrs_seq OWNED BY public.estado_civil_pqrs.id_estado_civil_pqrs;


--
-- Name: fondo_acumulado_comunicaciones_id_fondo_acumulado_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.fondo_acumulado_comunicaciones_id_fondo_acumulado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fondo_acumulado_comunicaciones_id_fondo_acumulado_seq OWNER TO orfeo_usr;

--
-- Name: fondo_acumulado_comunicaciones; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.fondo_acumulado_comunicaciones (
    id_fondo_acumulado_comunicaciones integer DEFAULT nextval('public.fondo_acumulado_comunicaciones_id_fondo_acumulado_seq'::regclass) NOT NULL,
    tipo_fondo numeric(1,0),
    campo1 date,
    campo2 character varying(10000),
    campo3 character varying(10),
    campo4 character varying(10000),
    campo5 character varying(10000),
    campo6 character varying(10000),
    campo7 character varying(10000),
    campo8 character varying(10000),
    campo9 character varying(1000),
    campo10 character varying(10000),
    campo11 character varying(10000),
    campo12 numeric(4,0)
);


ALTER TABLE public.fondo_acumulado_comunicaciones OWNER TO orfeo_usr;

--
-- Name: COLUMN fondo_acumulado_comunicaciones.id_fondo_acumulado_comunicaciones; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.id_fondo_acumulado_comunicaciones IS 'Guarda el identificador de la tabla';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.tipo_fondo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.tipo_fondo IS 'Guarda el tipo de archivo del fondo acumulado 3= comunicaciones, 2= resoluciones';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo1; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo1 IS 'Guarda fecha_recibido que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo2; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo2 IS 'Guarda codigo_dependencia que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo3; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo3 IS 'Guarda numero_consecutivo que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo4; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo4 IS 'Guarda entidad que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo5; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo5 IS 'Guarda persona que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo6; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo6 IS 'Guarda ubicacion_electronica que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo7; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo7 IS 'Guarda lugar que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo8; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo8 IS 'Guarda referencia que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo9; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo9 IS 'Guarda anexos que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo10; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo10 IS 'Guarda usuario_firma que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo11; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo11 IS 'Guarda no_conforme que se esta leyendo';


--
-- Name: COLUMN fondo_acumulado_comunicaciones.campo12; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.fondo_acumulado_comunicaciones.campo12 IS 'Guarda año que se esta leyendo';


--
-- Name: fun_funcionario; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.fun_funcionario (
    usua_doc character varying(14),
    usua_fech_crea date NOT NULL,
    usua_esta character varying(10) NOT NULL,
    usua_nomb character varying(45),
    usua_ext numeric(4,0),
    usua_nacim date,
    usua_email character varying(50),
    usua_at character varying(15),
    usua_piso numeric(2,0),
    cedula_ok character(1) DEFAULT 'n'::bpchar,
    cedula_suip character varying(15),
    nombre_suip character varying(45),
    observa character(20)
);


ALTER TABLE public.fun_funcionario OWNER TO orfeo_usr;

--
-- Name: genero_pqrs; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.genero_pqrs (
    genero_pqrs_id integer NOT NULL,
    genero_pqrs_tipo text
);


ALTER TABLE public.genero_pqrs OWNER TO orfeo_usr;

--
-- Name: grupo_interes; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.grupo_interes (
    id_grupo_interes integer NOT NULL,
    nombre_grupo_interes character varying(50)
);


ALTER TABLE public.grupo_interes OWNER TO orfeo_usr;

--
-- Name: TABLE grupo_interes; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.grupo_interes IS 'Guarda la información relacionada a los grupos de interes';


--
-- Name: COLUMN grupo_interes.id_grupo_interes; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.grupo_interes.id_grupo_interes IS 'Identificador de tabla';


--
-- Name: COLUMN grupo_interes.nombre_grupo_interes; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.grupo_interes.nombre_grupo_interes IS 'Nombre del grupo de interés de la entidad';


--
-- Name: grupos_informados; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.grupos_informados (
    id_grupos_informados integer NOT NULL,
    nombre_grupo character varying(100) NOT NULL,
    descripcion_grupo character varying(255),
    activo_grupo integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.grupos_informados OWNER TO orfeo_usr;

--
-- Name: TABLE grupos_informados; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.grupos_informados IS 'Tabla para almacenar los nombres de los grupos a los que se van a informar los radicados';


--
-- Name: grupos_informados_id_grupos_informados_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.grupos_informados_id_grupos_informados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_informados_id_grupos_informados_seq OWNER TO orfeo_usr;

--
-- Name: grupos_informados_id_grupos_informados_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.grupos_informados_id_grupos_informados_seq OWNED BY public.grupos_informados.id_grupos_informados;


--
-- Name: grupos_informados_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.grupos_informados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_informados_seq OWNER TO orfeo_usr;

--
-- Name: grupos_informados_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.grupos_informados_seq OWNED BY public.grupos_informados.id_grupos_informados;


--
-- Name: hist_eventos; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.hist_eventos (
    depe_codi character varying(5) NOT NULL,
    hist_fech timestamp with time zone NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    radi_nume_radi character varying(30) NOT NULL,
    hist_obse character varying(10000) NOT NULL,
    usua_codi_dest numeric(10,0),
    usua_doc character varying(14),
    usua_doc_old character varying(15),
    sgd_ttr_codigo numeric(3,0),
    hist_usua_autor character varying(14),
    hist_doc_dest character varying(14),
    depe_codi_dest character varying(5)
);


ALTER TABLE public.hist_eventos OWNER TO orfeo_usr;

--
-- Name: TABLE hist_eventos; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.hist_eventos IS 'HIST_EVENTOS';


--
-- Name: COLUMN hist_eventos.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.depe_codi IS 'DEPE_CODI';


--
-- Name: COLUMN hist_eventos.hist_fech; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.hist_fech IS 'HIST_FECH';


--
-- Name: COLUMN hist_eventos.usua_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.usua_codi IS 'USUA_CODI';


--
-- Name: COLUMN hist_eventos.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.radi_nume_radi IS 'Numero de Radicado';


--
-- Name: COLUMN hist_eventos.hist_obse; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.hist_obse IS 'HIST_OBSE';


--
-- Name: COLUMN hist_eventos.usua_codi_dest; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.usua_codi_dest IS 'Codigo del usuario destino.';


--
-- Name: COLUMN hist_eventos.sgd_ttr_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.sgd_ttr_codigo IS 'Tipo de Evento';


--
-- Name: COLUMN hist_eventos.hist_doc_dest; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.hist_doc_dest IS 'Documento del usuario destino No. implentado';


--
-- Name: COLUMN hist_eventos.depe_codi_dest; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.hist_eventos.depe_codi_dest IS 'Codigo de la dependencia del usuario destino';


--
-- Name: informados; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.informados (
    radi_nume_radi character varying(30) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    info_desc character varying(600),
    info_fech date NOT NULL,
    info_leido numeric(1,0) DEFAULT 0,
    usua_codi_info numeric(3,0),
    info_codi numeric(10,0),
    usua_doc character varying(14),
    info_resp character varying(10)
);


ALTER TABLE public.informados OWNER TO orfeo_usr;

--
-- Name: COLUMN informados.usua_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.informados.usua_codi IS 'Codigo de usuario';


--
-- Name: COLUMN informados.info_resp; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.informados.info_resp IS 'Indica si el informado necesita respuesta.';


--
-- Name: inventario_documental; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.inventario_documental (
    id_inv_documental integer NOT NULL,
    uni_administrativa character varying,
    ofi_productora character varying,
    no_orden character varying,
    objeto character varying,
    codigo character varying,
    nombre character varying,
    sub_serie character varying,
    fecha_ext_ini date,
    fecha_ext_end date,
    caja numeric,
    carpeta numeric,
    tomo numeric,
    otro character varying,
    modulo numeric,
    estante numeric,
    no_folios numeric,
    fr_consulta numeric,
    notas character varying,
    soporte character varying
);


ALTER TABLE public.inventario_documental OWNER TO orfeo_usr;

--
-- Name: COLUMN inventario_documental.fr_consulta; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.inventario_documental.fr_consulta IS '1 => baja, 2 => media, 3 => alta';


--
-- Name: inventario_documentos; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.inventario_documentos (
    id_inv_documento integer NOT NULL,
    original_inv_doc character varying,
    nombre_inv_doc character varying,
    ruta_inv_doc character varying,
    tipo_inv_doc character varying,
    tamano_inv_doc character varying,
    user_inv_doc numeric,
    creacion_inv_doc date,
    id_inv_documental numeric
);


ALTER TABLE public.inventario_documentos OWNER TO orfeo_usr;

--
-- Name: medio_recepcion; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.medio_recepcion (
    mrec_codi numeric(2,0) NOT NULL,
    mrec_desc character varying(100) NOT NULL
);


ALTER TABLE public.medio_recepcion OWNER TO orfeo_usr;

--
-- Name: TABLE medio_recepcion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.medio_recepcion IS 'MEDIO_RECEPCION';


--
-- Name: COLUMN medio_recepcion.mrec_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.medio_recepcion.mrec_codi IS 'CODIGO DE MEDIO DE RECEPCION';


--
-- Name: COLUMN medio_recepcion.mrec_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.medio_recepcion.mrec_desc IS 'DESCRIPCION DEL MEDIO';


--
-- Name: municipio; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.municipio (
    muni_codi numeric(4,0) NOT NULL,
    dpto_codi numeric(3,0) NOT NULL,
    muni_nomb character varying(100) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170 NOT NULL,
    homologa_muni character varying(10),
    homologa_idmuni character varying(15),
    activa numeric(1,0) DEFAULT 1
);


ALTER TABLE public.municipio OWNER TO orfeo_usr;

--
-- Name: TABLE municipio; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.municipio IS 'MUNICIPIO';


--
-- Name: COLUMN municipio.muni_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.municipio.muni_codi IS 'MUNI_CODI';


--
-- Name: COLUMN municipio.dpto_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.municipio.dpto_codi IS 'DPTO_CODI';


--
-- Name: COLUMN municipio.muni_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.municipio.muni_nomb IS 'MUNI_NOMB';


--
-- Name: nivel_academico_pqrs_id_nivel_acad_pqrs_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.nivel_academico_pqrs_id_nivel_acad_pqrs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nivel_academico_pqrs_id_nivel_acad_pqrs_seq OWNER TO orfeo_usr;

--
-- Name: nivel_academico_pqrs; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.nivel_academico_pqrs (
    id_nivel_acad_pqrs integer DEFAULT nextval('public.nivel_academico_pqrs_id_nivel_acad_pqrs_seq'::regclass) NOT NULL,
    descripcion_nivel_acad_pqrs character varying(50)
);


ALTER TABLE public.nivel_academico_pqrs OWNER TO orfeo_usr;

--
-- Name: num_resol_dtc; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.num_resol_dtc
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.num_resol_dtc OWNER TO orfeo_usr;

--
-- Name: num_resol_dtn; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.num_resol_dtn
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtn OWNER TO orfeo_usr;

--
-- Name: num_resol_dtoc; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.num_resol_dtoc
    START WITH 21
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtoc OWNER TO orfeo_usr;

--
-- Name: num_resol_dtor; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.num_resol_dtor
    START WITH 61
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dtor OWNER TO orfeo_usr;

--
-- Name: num_resol_dts; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.num_resol_dts
    START WITH 61
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.num_resol_dts OWNER TO orfeo_usr;

--
-- Name: num_resol_gral; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.num_resol_gral
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 20;


ALTER TABLE public.num_resol_gral OWNER TO orfeo_usr;

--
-- Name: par_serv_servicios; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.par_serv_servicios (
    par_serv_secue numeric(8,0) NOT NULL,
    par_serv_codigo character varying(5),
    par_serv_nombre character varying(100),
    par_serv_estado character varying(1)
);


ALTER TABLE public.par_serv_servicios OWNER TO orfeo_usr;

--
-- Name: perfiles; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.perfiles (
    codi_perfil integer NOT NULL,
    nomb_perfil character varying(150) NOT NULL,
    usua_esta character varying DEFAULT 1 NOT NULL,
    perm_radi character(1) DEFAULT 0,
    usua_admin character(1) DEFAULT 0,
    usua_nuevo character varying(1) DEFAULT 0 NOT NULL,
    codi_nivel numeric(2,0) DEFAULT 3 NOT NULL,
    perm_radi_sal numeric(1,0) DEFAULT 0,
    usua_admin_archivo numeric(1,0) DEFAULT 0,
    usua_masiva numeric(1,0) DEFAULT 0,
    usua_perm_dev numeric(1,0) DEFAULT 0,
    usua_perm_numera_res character varying(1) DEFAULT 0,
    usua_perm_numeradoc numeric DEFAULT 0,
    sgd_panu_codi numeric(4,0) DEFAULT 0,
    usua_prad_tp1 numeric(1,0) DEFAULT 0,
    usua_prad_tp2 numeric(1,0) DEFAULT 0,
    usua_prad_tp4 numeric(1,0) DEFAULT 0,
    usua_perm_envios numeric(1,0) DEFAULT 0,
    usua_perm_modifica numeric(1,0) DEFAULT 0,
    usua_perm_impresion numeric(1,0) DEFAULT 0,
    sgd_aper_codigo numeric(1,0) DEFAULT 0,
    sgd_perm_estadistica numeric(2,0) DEFAULT 0,
    usua_admin_sistema numeric(1,0) DEFAULT 0,
    usua_perm_trd numeric(1,0) DEFAULT 0,
    usua_perm_firma numeric(1,0) DEFAULT 0,
    usua_perm_prestamo numeric(1,0) DEFAULT 0,
    usuario_publico numeric(1,0) DEFAULT 1,
    usuario_reasignar numeric(1,0) DEFAULT 0,
    usua_perm_notifica numeric(1,0) DEFAULT 0,
    usua_perm_expediente numeric DEFAULT 0,
    usua_auth_ldap numeric(1,0) DEFAULT 0,
    perm_archi character varying(1) DEFAULT 0,
    perm_vobo character varying(1) DEFAULT 1,
    perm_borrar_anexo numeric(1,0) DEFAULT 0,
    perm_tipif_anexo numeric(1,0) DEFAULT 0,
    usua_perm_adminflujos numeric(1,0) DEFAULT 0,
    usua_exp_trd numeric(2,0) DEFAULT 0,
    usua_perm_rademail smallint DEFAULT 0,
    usua_perm_accesi numeric(1,0) DEFAULT 0,
    usua_perm_agrcontacto numeric(1,0) DEFAULT 0,
    usua_perm_preradicado numeric(1,0) DEFAULT 0,
    descargar_documentos numeric(1,0) DEFAULT 0,
    usua_perm_reasigna_masiva numeric(1,0),
    usua_nivel_consulta numeric,
    descarga_arc_original smallint DEFAULT 0,
    firma_qr smallint DEFAULT 0,
    per_transferencia_documental smallint DEFAULT 0,
    usua_perm_grupo_usuarios_informados numeric(1,0),
    usua_perm_doc_publico numeric(1,0) DEFAULT 0,
    usua_perm_consulta_rad numeric(1,0),
    consulta_inv_documental numeric,
    carga_inv_documental numeric
);


ALTER TABLE public.perfiles OWNER TO orfeo_usr;

--
-- Name: TABLE perfiles; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.perfiles IS 'Guarda los permisos de accesos al sistema mediante un rol';


--
-- Name: COLUMN perfiles.codi_perfil; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.codi_perfil IS 'Identificador de la tabla perfiles el que se relaciona con la tabla usuario';


--
-- Name: COLUMN perfiles.nomb_perfil; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.nomb_perfil IS 'Nombre del perfil (rol)';


--
-- Name: COLUMN perfiles.usua_esta; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_esta IS 'Estado del usuario - Activo o No (1/0)';


--
-- Name: COLUMN perfiles.perm_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.perm_radi IS 'Permiso para digitalizacion de documentos: 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_admin; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_admin IS 'Prestamo de documentos fisicos: 0 sin permiso -  1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_nuevo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_nuevo IS 'Usuario Nuevo ? Si esta en ''''0'''' resetea la contraseña';


--
-- Name: COLUMN perfiles.codi_nivel; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.codi_nivel IS 'Nivel del Usuario';


--
-- Name: COLUMN perfiles.usua_admin_archivo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_admin_archivo IS 'Administrador de Archivo (Expedientes): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_masiva; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_masiva IS 'Permiso de radicacion masiva de documentos';


--
-- Name: COLUMN perfiles.usua_perm_dev; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_dev IS 'Devoluciones de correo (Dev_correo): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.sgd_panu_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.sgd_panu_codi IS 'Permisos de anulacion de radicados: 1 - Permiso de solicitud de anulado 2- Permiso de anulacion y generacion de actas 3- Permiso 1 y 2';


--
-- Name: COLUMN perfiles.usua_prad_tp1; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_prad_tp1 IS 'Si esta en ''''1'''' El usuario Tiene Permisos de radicacicion Tipo 1.  En nuestro caso de salida';


--
-- Name: COLUMN perfiles.usua_prad_tp2; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_prad_tp2 IS 'Si esta en ''''2'''' El usuario Tiene Permisos de radicacicion Tipo 2.  En nuestro caso de Entrada';


--
-- Name: COLUMN perfiles.usua_perm_envios; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_envios IS 'Envios de correo (correspondencia): 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_perm_modifica; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_modifica IS 'Permiso de modificar Radicados';


--
-- Name: COLUMN perfiles.usua_perm_impresion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_impresion IS 'Carpeta de impresion: 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.sgd_perm_estadistica; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.sgd_perm_estadistica IS 'Si tiene ''''1'''' tiene permisos como jefe para ver las estadisticas de la dependencia';


--
-- Name: COLUMN perfiles.usua_admin_sistema; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_admin_sistema IS 'Administrador del sistema : 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_perm_trd; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_trd IS 'Usuario Administracion de tablas de retencion documental : 0 sin permiso - 1 permiso asignado';


--
-- Name: COLUMN perfiles.usua_perm_prestamo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_prestamo IS 'Indica si un usuario tiene o no permiso de acceso al modulo de prestamo. Segun su valor: Tiene permiso (0) No tiene permiso';


--
-- Name: COLUMN perfiles.perm_borrar_anexo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.perm_borrar_anexo IS 'Indica si un usuario tiene (1) o no (0) permiso para tipificar anexos .pdf';


--
-- Name: COLUMN perfiles.perm_tipif_anexo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.perm_tipif_anexo IS 'Indica si un usuario tiene (1)  o no (0) permiso para tipificar anexos .pdf';


--
-- Name: COLUMN perfiles.usua_perm_rademail; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_rademail IS 'Permiso de radicacion de email';


--
-- Name: COLUMN perfiles.usua_perm_accesi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_accesi IS 'Permiso para  compatbilidad uso de lector de pantalla';


--
-- Name: COLUMN perfiles.usua_perm_agrcontacto; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_agrcontacto IS 'permiso para agregar contactos formualrio rad';


--
-- Name: COLUMN perfiles.usua_perm_preradicado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_preradicado IS 'Permiso para la pre-radicación que se realiza en el sistema';


--
-- Name: COLUMN perfiles.usua_perm_reasigna_masiva; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_reasigna_masiva IS 'Este permite asignar el permiso para realizar el proceso de reasignación masiva';


--
-- Name: COLUMN perfiles.usua_nivel_consulta; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_nivel_consulta IS 'Este permiso permite asignar un nivel de consilta a los radicados';


--
-- Name: COLUMN perfiles.descarga_arc_original; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.descarga_arc_original IS 'Este permiso permite descargar el archivo original del radicado';


--
-- Name: COLUMN perfiles.firma_qr; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.firma_qr IS 'Este permiso permite firmar el radicado';


--
-- Name: COLUMN perfiles.usua_perm_grupo_usuarios_informados; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_grupo_usuarios_informados IS 'Este permiso permite asignar el permiso para crear gupos de informados nuevos';


--
-- Name: COLUMN perfiles.usua_perm_consulta_rad; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.usua_perm_consulta_rad IS 'Permiso para el proceso de consulta de radicados marcados como confidenciales';


--
-- Name: COLUMN perfiles.consulta_inv_documental; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.consulta_inv_documental IS 'permiso para consulta de inventario documental';


--
-- Name: COLUMN perfiles.carga_inv_documental; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.perfiles.carga_inv_documental IS 'permiso para creacion y carga de documentos en inventario documental';


--
-- Name: perfiles_codi_perfil_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.perfiles_codi_perfil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfiles_codi_perfil_seq OWNER TO orfeo_usr;

--
-- Name: perfiles_codi_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.perfiles_codi_perfil_seq OWNED BY public.perfiles.codi_perfil;


--
-- Name: pl_generado_plg; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.pl_generado_plg (
    depe_codi character varying(5),
    radi_nume_radi character varying(15),
    plt_codi numeric(4,0),
    plg_codi numeric(4,0),
    plg_comentarios character varying(150),
    plg_analiza numeric(10,0),
    plg_firma numeric(10,0),
    plg_autoriza numeric(10,0),
    plg_imprime numeric(10,0),
    plg_envia numeric(10,0),
    plg_archivo_tmp character varying(150),
    plg_archivo_final character varying(150),
    plg_nombre character varying(30),
    plg_crea numeric(10,0) DEFAULT 0,
    plg_autoriza_fech date,
    plg_imprime_fech date,
    plg_envia_fech date,
    plg_crea_fech date,
    plg_creador character varying(20),
    pl_codi numeric(4,0),
    usua_doc character varying(14),
    sgd_rem_destino numeric(1,0) DEFAULT 0,
    radi_nume_sal character varying(15) DEFAULT 0
);


ALTER TABLE public.pl_generado_plg OWNER TO orfeo_usr;

--
-- Name: pl_tipo_plt; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.pl_tipo_plt (
    plt_codi numeric(4,0) NOT NULL,
    plt_desc character varying(35)
);


ALTER TABLE public.pl_tipo_plt OWNER TO orfeo_usr;

--
-- Name: plan_table; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.plan_table (
    statement_id character varying(30),
    "timestamp" date,
    remarks character varying(80),
    operation character varying(30),
    options character varying(30),
    object_node character varying(128),
    object_owner character varying(30),
    object_name character varying(30),
    object_instance integer,
    object_type character varying(30),
    optimizer character varying(255),
    search_columns numeric,
    id integer,
    parent_id integer,
    "position" integer,
    cost integer,
    cardinality integer,
    s integer,
    other_tag character varying(255),
    partition_start character varying(255),
    partition_stop character varying(255),
    partition_id integer,
    other character varying(255),
    distribution character varying(30)
);


ALTER TABLE public.plan_table OWNER TO orfeo_usr;

--
-- Name: plantilla_pl; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.plantilla_pl (
    pl_codi numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    pl_nomb character varying(35),
    pl_archivo character varying(35),
    pl_desc character varying(150),
    pl_fech date,
    usua_codi numeric(10,0),
    pl_uso numeric(1,0) DEFAULT 0
);


ALTER TABLE public.plantilla_pl OWNER TO orfeo_usr;

--
-- Name: plsql_profiler_runnumeric; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.plsql_profiler_runnumeric
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.plsql_profiler_runnumeric OWNER TO orfeo_usr;

--
-- Name: pre_radicado; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.pre_radicado (
    radi_nume_radi character(30) NOT NULL,
    radi_fech_radi timestamp with time zone NOT NULL,
    estado integer NOT NULL
);


ALTER TABLE public.pre_radicado OWNER TO orfeo_usr;

--
-- Name: TABLE pre_radicado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.pre_radicado IS 'almacena los radicados que se han generado de forma inicial sin remitente alguno';


--
-- Name: pres_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.pres_seq
    START WITH 30392
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.pres_seq OWNER TO orfeo_usr;

--
-- Name: prestamo; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.prestamo (
    pres_id numeric(10,0) NOT NULL,
    radi_nume_radi character varying(30) NOT NULL,
    usua_login_actu character varying(50) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_login_pres character varying(50),
    pres_desc character varying(200),
    pres_fech_pres timestamp without time zone,
    pres_fech_devo timestamp without time zone,
    pres_fech_pedi timestamp without time zone NOT NULL,
    pres_estado numeric(2,0),
    pres_requerimiento numeric(2,0),
    pres_depe_arch character varying(5),
    pres_fech_venc timestamp without time zone,
    dev_desc character varying(500),
    pres_fech_canc timestamp without time zone,
    usua_login_canc character varying(50),
    usua_login_rx character varying(50)
);


ALTER TABLE public.prestamo OWNER TO orfeo_usr;

--
-- Name: COLUMN prestamo.dev_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.prestamo.dev_desc IS 'Observaciones realizadas por el usuario que recibe la devolucion acerca de la cantidad, el estado, tipo o sucesos acontecidos con los documentos y anexos fisicos';


--
-- Name: COLUMN prestamo.pres_fech_canc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.prestamo.pres_fech_canc IS 'Fecha de cancelacion de la solicitud';


--
-- Name: COLUMN prestamo.usua_login_canc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.prestamo.usua_login_canc IS 'Login del usuario que cancela la solicitud';


--
-- Name: COLUMN prestamo.usua_login_rx; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.prestamo.usua_login_rx IS 'Login del usuario que recibe el documento al momento de entregar.';


--
-- Name: radicado; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.radicado (
    radi_nume_radi character varying(30) NOT NULL,
    radi_fech_radi timestamp with time zone NOT NULL,
    tdoc_codi numeric(4,0) NOT NULL,
    trte_codi numeric(2,0),
    mrec_codi numeric(2,0),
    eesp_codi numeric(10,0),
    eotra_codi numeric(10,0),
    radi_tipo_empr character varying(2),
    radi_fech_ofic date,
    tdid_codi numeric(2,0),
    radi_nume_iden character varying(30),
    radi_nomb character varying(90),
    radi_prim_apel character varying(50),
    radi_segu_apel character varying(50),
    radi_pais character varying(70),
    muni_codi numeric(5,0),
    cpob_codi numeric(4,0),
    carp_codi numeric(3,0),
    esta_codi numeric(2,0),
    dpto_codi numeric(2,0),
    cen_muni_codi numeric(4,0),
    cen_dpto_codi numeric(2,0),
    radi_dire_corr character varying(100),
    radi_tele_cont character varying(15),
    radi_nume_hoja numeric(4,0),
    radi_desc_anex character varying(500),
    radi_nume_deri character varying(30),
    radi_path character varying(100),
    radi_usua_actu numeric(10,0),
    radi_depe_actu character varying(5),
    radi_fech_asig timestamp with time zone,
    radi_arch1 character varying(10),
    radi_arch2 character varying(10),
    radi_arch3 character varying(10),
    radi_arch4 character varying(10),
    ra_asun character varying(50000),
    radi_usu_ante character varying(45),
    radi_depe_radi character varying(5),
    radicado_referencia_cliente character varying(60),
    radi_usua_radi numeric(10,0),
    codi_nivel numeric(2,0) DEFAULT 1,
    flag_nivel integer DEFAULT 1,
    carp_per numeric(1,0) DEFAULT 0,
    radi_leido numeric(1,0) DEFAULT 0,
    radi_cuentai character varying(20),
    radi_tipo_deri numeric(2,0) DEFAULT 0,
    listo character varying(2),
    sgd_tma_codigo numeric(4,0),
    sgd_mtd_codigo numeric(4,0),
    par_serv_secue numeric(8,0),
    sgd_fld_codigo numeric(3,0) DEFAULT 0,
    radi_agend numeric(1,0),
    radi_fech_agend timestamp with time zone,
    radi_fech_doc date,
    sgd_doc_secuencia numeric(15,0),
    sgd_pnufe_codi numeric(4,0),
    sgd_eanu_codigo numeric(1,0),
    sgd_not_codi numeric(3,0),
    radi_fech_notif timestamp with time zone,
    sgd_tdec_codigo numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_ttr_codigo integer DEFAULT 0,
    usua_doc_ante character varying(14),
    radi_fech_antetx timestamp with time zone,
    sgd_trad_codigo numeric(2,0),
    fech_vcmto timestamp with time zone,
    tdoc_vcmto numeric(4,0),
    sgd_termino_real numeric(4,0),
    id_cont numeric(2,0) DEFAULT 1,
    sgd_spub_codigo numeric(2,0) DEFAULT 0,
    id_pais numeric(4,0),
    medio_m character varying(5),
    radi_nrr numeric(2,0),
    numero_rm character varying(15),
    numero_tran character varying(15),
    firma_qr smallint DEFAULT 0,
    tipo_usario_interes numeric(2,0) DEFAULT 0,
    doc_transferido smallint DEFAULT 1,
    radi_fech_reasignado timestamp with time zone,
    radi_envio_correo boolean,
    radi_docu_publico boolean DEFAULT false,
    radi_eje_tematico numeric,
    radi_estado_pqrs numeric DEFAULT 1,
    descripcion_asunto_pqrs text,
    grupo_interes integer,
    servicio_pqr integer,
    radi_depe_ante character varying(5)
);


ALTER TABLE public.radicado OWNER TO orfeo_usr;

--
-- Name: COLUMN radicado.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_nume_radi IS 'Numero de Radicado';


--
-- Name: COLUMN radicado.radi_fech_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_fech_radi IS 'FECHA DE RADICACION';


--
-- Name: COLUMN radicado.tdoc_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.tdoc_codi IS 'Tipo de Documento, (ej. Res, derecho pet, tutela, etc .. . . . .)';


--
-- Name: COLUMN radicado.trte_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.trte_codi IS 'TRTE_CODI';


--
-- Name: COLUMN radicado.mrec_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.mrec_codi IS 'MREC_CODI';


--
-- Name: COLUMN radicado.eesp_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.eesp_codi IS 'EESP_CODI';


--
-- Name: COLUMN radicado.eotra_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.eotra_codi IS 'EOTRA_CODI';


--
-- Name: COLUMN radicado.radi_tipo_empr; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_tipo_empr IS 'TIPO DE EMPRESA (OTRA O ESP)';


--
-- Name: COLUMN radicado.radi_fech_ofic; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_fech_ofic IS 'FECHA DE OFICIO';


--
-- Name: COLUMN radicado.tdid_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.tdid_codi IS 'TDID_CODI';


--
-- Name: COLUMN radicado.radi_nume_iden; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_nume_iden IS 'NUMERO DE IDENTIFICACION';


--
-- Name: COLUMN radicado.radi_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_nomb IS 'NOMBRE';


--
-- Name: COLUMN radicado.radi_prim_apel; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_prim_apel IS '1 APELLIDO';


--
-- Name: COLUMN radicado.radi_segu_apel; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_segu_apel IS '2 APELLIDO';


--
-- Name: COLUMN radicado.radi_pais; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_pais IS 'PAIS (DEFAULT COLOMBIA)';


--
-- Name: COLUMN radicado.muni_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.muni_codi IS 'MUNI_CODI';


--
-- Name: COLUMN radicado.cpob_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.cpob_codi IS 'CPOB_CODI';


--
-- Name: COLUMN radicado.carp_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.carp_codi IS 'CARP_CODI';


--
-- Name: COLUMN radicado.esta_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.esta_codi IS 'ESTA_CODI';


--
-- Name: COLUMN radicado.dpto_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.dpto_codi IS 'DPTO_CODI';


--
-- Name: COLUMN radicado.cen_muni_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.cen_muni_codi IS 'CEN_MUNI_CODI';


--
-- Name: COLUMN radicado.cen_dpto_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.cen_dpto_codi IS 'CEN_DPTO_CODI';


--
-- Name: COLUMN radicado.radi_dire_corr; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_dire_corr IS 'DIRECCION CORRESPONDENCIA';


--
-- Name: COLUMN radicado.radi_tele_cont; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_tele_cont IS 'TELEFONO CONTACTO';


--
-- Name: COLUMN radicado.radi_nume_hoja; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_nume_hoja IS 'NUMERO DE HOJAS';


--
-- Name: COLUMN radicado.radi_desc_anex; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_desc_anex IS 'DESCRIPCION DE ANEXOS';


--
-- Name: COLUMN radicado.radi_nume_deri; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_nume_deri IS 'NUMERO DERIVADO';


--
-- Name: COLUMN radicado.radi_path; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_path IS 'RADI_PATH';


--
-- Name: COLUMN radicado.radi_usua_actu; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_usua_actu IS 'USUARIO ACTUAL';


--
-- Name: COLUMN radicado.radi_depe_actu; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_depe_actu IS 'DEPENDENCIA ACTUAL (USUARIO)';


--
-- Name: COLUMN radicado.radi_fech_asig; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_fech_asig IS 'FECHA DE ASIGNACION DEL USUARIO';


--
-- Name: COLUMN radicado.radi_arch1; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_arch1 IS 'CAMPO PARA ARCHIVO FISICO';


--
-- Name: COLUMN radicado.radi_arch2; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_arch2 IS 'CAMPO PARA ARCHIVO FISICO';


--
-- Name: COLUMN radicado.radi_arch3; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_arch3 IS 'CAMPO PARA ARCHIVO FISICO';


--
-- Name: COLUMN radicado.radi_arch4; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_arch4 IS 'CAMPO PARA ARCHIVO FISICO';


--
-- Name: COLUMN radicado.radicado_referencia_cliente; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radicado_referencia_cliente IS 'Este campo guarda la información del radicado de referencia del cliente externo a las comunicaciones que se reciben';


--
-- Name: COLUMN radicado.usua_doc_ante; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.usua_doc_ante IS 'Codigo TTR. transaccion.';


--
-- Name: COLUMN radicado.radi_fech_antetx; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_fech_antetx IS 'Documento del usuario que realizo la anterior tx';


--
-- Name: COLUMN radicado.sgd_trad_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.sgd_trad_codigo IS 'Fecha de la Ultima transaccion.';


--
-- Name: COLUMN radicado.numero_rm; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.numero_rm IS 'numero de registro';


--
-- Name: COLUMN radicado.numero_tran; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.numero_tran IS 'Numero de transaccion';


--
-- Name: COLUMN radicado.doc_transferido; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.doc_transferido IS '1 Gestión 2 Central 3 Hitorico';


--
-- Name: COLUMN radicado.radi_envio_correo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_envio_correo IS 'Guardar en la columna radi_envio_correo en false (no quiero notificación) y true (quiero que me notifique.) ';


--
-- Name: COLUMN radicado.radi_docu_publico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_docu_publico IS 'Guarda la información correspondiente el documento puede ser visible o no en el landin page';


--
-- Name: COLUMN radicado.radi_eje_tematico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_eje_tematico IS 'Guarda el identificador del eje tematico, esto es como para tenerlo presente';


--
-- Name: COLUMN radicado.radi_estado_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_estado_pqrs IS 'Guarda el estado de una PQRs';


--
-- Name: COLUMN radicado.descripcion_asunto_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.descripcion_asunto_pqrs IS 'guara la descripción del asunto de la pqrs';


--
-- Name: COLUMN radicado.grupo_interes; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.grupo_interes IS 'Guarda la información de los grupos de interes';


--
-- Name: COLUMN radicado.servicio_pqr; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.servicio_pqr IS 'Guarda el id del servicio correspondiente a la PQRS';


--
-- Name: COLUMN radicado.radi_depe_ante; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.radicado.radi_depe_ante IS 'codigo de la dependencia anterior';


--
-- Name: rango_edades_pqrs; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.rango_edades_pqrs (
    id_rango_edades_pqrs integer NOT NULL,
    nombre_rango_edades_pqrs character varying NOT NULL
);


ALTER TABLE public.rango_edades_pqrs OWNER TO orfeo_usr;

--
-- Name: TABLE rango_edades_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.rango_edades_pqrs IS 'tabla que guarda la información respecto a las dedades.';


--
-- Name: COLUMN rango_edades_pqrs.id_rango_edades_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.rango_edades_pqrs.id_rango_edades_pqrs IS 'Identificador de tabla';


--
-- Name: COLUMN rango_edades_pqrs.nombre_rango_edades_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.rango_edades_pqrs.nombre_rango_edades_pqrs IS 'las opciones de edades';


--
-- Name: rol_tipos_doc; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.rol_tipos_doc (
    cod_rol_tipos integer NOT NULL,
    cod_rol numeric,
    cod_tp_tpdcumento numeric,
    estado numeric
);


ALTER TABLE public.rol_tipos_doc OWNER TO orfeo_usr;

--
-- Name: TABLE rol_tipos_doc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.rol_tipos_doc IS 'Se guarda el codigo del rol y los tipos documentales a los que tiene acceso un usuario';


--
-- Name: roles; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.roles (
    cod_rol integer NOT NULL,
    nomb_rol character varying(200),
    fecha date,
    estado numeric
);


ALTER TABLE public.roles OWNER TO orfeo_usr;

--
-- Name: TABLE roles; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.roles IS 'Almacena los roles de la herramienta, acorde a los perfiles';


--
-- Name: roles_cod_rol_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.roles_cod_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_cod_rol_seq OWNER TO orfeo_usr;

--
-- Name: roles_cod_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.roles_cod_rol_seq OWNED BY public.roles.cod_rol;


--
-- Name: sec_bodega_empresas; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_bodega_empresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_bodega_empresas OWNER TO orfeo_usr;

--
-- Name: sec_central; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_central
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_central OWNER TO orfeo_usr;

--
-- Name: sec_ciu_ciudadano; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_ciu_ciudadano
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_ciu_ciudadano OWNER TO orfeo_usr;

--
-- Name: sec_def_contactos; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_def_contactos
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_def_contactos OWNER TO orfeo_usr;

--
-- Name: sec_dir_direcciones; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_dir_direcciones
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_dir_direcciones OWNER TO orfeo_usr;

--
-- Name: sec_edificio; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_edificio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_edificio OWNER TO orfeo_usr;

--
-- Name: sec_fondo; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_fondo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sec_fondo OWNER TO orfeo_usr;

--
-- Name: sec_inv; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_inv
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_inv OWNER TO orfeo_usr;

--
-- Name: sec_oem_empresas; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_oem_empresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_oem_empresas OWNER TO orfeo_usr;

--
-- Name: sec_oem_oempresas; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_oem_oempresas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_oem_oempresas OWNER TO orfeo_usr;

--
-- Name: sec_planilla; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_planilla
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla OWNER TO orfeo_usr;

--
-- Name: sec_planilla_envio; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_planilla_envio
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla_envio OWNER TO orfeo_usr;

--
-- Name: sec_planilla_tx; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_planilla_tx
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_planilla_tx OWNER TO orfeo_usr;

--
-- Name: sec_prestamo; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_prestamo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_prestamo OWNER TO orfeo_usr;

--
-- Name: sec_rol_tipos_doc; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_rol_tipos_doc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE public.sec_rol_tipos_doc OWNER TO orfeo_usr;

--
-- Name: sec_rol_tipos_doc; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.sec_rol_tipos_doc OWNED BY public.rol_tipos_doc.cod_rol_tipos;


--
-- Name: sec_sgd_hfld_histflujodoc; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sec_sgd_hfld_histflujodoc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.sec_sgd_hfld_histflujodoc OWNER TO orfeo_usr;

--
-- Name: secr_subseries_id_tabla; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_subseries_id_tabla
    START WITH 279
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.secr_subseries_id_tabla OWNER TO orfeo_usr;

--
-- Name: secr_tp1_; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp1_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secr_tp1_ OWNER TO orfeo_usr;

--
-- Name: secr_tp1_998; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp1_998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.secr_tp1_998 OWNER TO orfeo_usr;

--
-- Name: secr_tp1_999; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp1_999
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.secr_tp1_999 OWNER TO orfeo_usr;

--
-- Name: secr_tp2_; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp2_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secr_tp2_ OWNER TO orfeo_usr;

--
-- Name: secr_tp2_998; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp2_998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.secr_tp2_998 OWNER TO orfeo_usr;

--
-- Name: secr_tp2_999; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp2_999
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.secr_tp2_999 OWNER TO orfeo_usr;

--
-- Name: secr_tp4_; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp4_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secr_tp4_ OWNER TO orfeo_usr;

--
-- Name: secr_tp4_998; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp4_998
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.secr_tp4_998 OWNER TO orfeo_usr;

--
-- Name: secr_tp4_999; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.secr_tp4_999
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.secr_tp4_999 OWNER TO orfeo_usr;

--
-- Name: seq_parexp_paramexpediente; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.seq_parexp_paramexpediente
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.seq_parexp_paramexpediente OWNER TO orfeo_usr;

--
-- Name: seq_sgd_mrd_codigo; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.seq_sgd_mrd_codigo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.seq_sgd_mrd_codigo OWNER TO orfeo_usr;

--
-- Name: servicios_pqrs; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.servicios_pqrs (
    id_servicio_pqrs integer NOT NULL,
    nombre_servicio_pqrs character varying(50)
);


ALTER TABLE public.servicios_pqrs OWNER TO orfeo_usr;

--
-- Name: TABLE servicios_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.servicios_pqrs IS 'Indica los servicios que se prestan en la entidad';


--
-- Name: COLUMN servicios_pqrs.id_servicio_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.servicios_pqrs.id_servicio_pqrs IS 'Identificador de tabla';


--
-- Name: COLUMN servicios_pqrs.nombre_servicio_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.servicios_pqrs.nombre_servicio_pqrs IS 'Guarda el nombre del servicio';


--
-- Name: sgd_agen_agendados; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_agen_agendados (
    sgd_agen_fech date,
    sgd_agen_observacion character varying(4000),
    radi_nume_radi character varying(30) NOT NULL,
    usua_doc character varying(18) NOT NULL,
    depe_codi character varying(5),
    sgd_agen_codigo numeric,
    sgd_agen_fechplazo date,
    sgd_agen_activo numeric
);


ALTER TABLE public.sgd_agen_agendados OWNER TO orfeo_usr;

--
-- Name: sgd_anar_anexarg; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_anar_anexarg (
    sgd_anar_codi numeric(4,0) NOT NULL,
    anex_codigo character varying(20),
    sgd_argd_codi numeric(4,0),
    sgd_anar_argcod numeric(4,0)
);


ALTER TABLE public.sgd_anar_anexarg OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_anar_anexarg; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_anar_anexarg IS 'Indica los argumentos o criterios a incluir dentro de un tipo de documento generado';


--
-- Name: COLUMN sgd_anar_anexarg.sgd_anar_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_anar_anexarg.sgd_anar_codi IS 'id del registro';


--
-- Name: COLUMN sgd_anar_anexarg.anex_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_anar_anexarg.anex_codigo IS 'codigo del anexo';


--
-- Name: COLUMN sgd_anar_anexarg.sgd_argd_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_anar_anexarg.sgd_argd_codi IS 'codigo del argumento empleado';


--
-- Name: COLUMN sgd_anar_anexarg.sgd_anar_argcod; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_anar_anexarg.sgd_anar_argcod IS 'valor del campo llave, de tabla que contiene el argumento referenciado';


--
-- Name: sgd_anar_secue; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_anar_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999999
    CACHE 1;


ALTER TABLE public.sgd_anar_secue OWNER TO orfeo_usr;

--
-- Name: sgd_anu_anulados; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_anu_anulados (
    sgd_anu_id numeric(4,0),
    sgd_anu_desc character varying(250),
    radi_nume_radi character varying(30),
    sgd_eanu_codi numeric(4,0),
    sgd_anu_sol_fech date,
    sgd_anu_fech date,
    depe_codi character varying(5),
    usua_doc character varying(14),
    usua_codi numeric(4,0),
    depe_codi_anu character varying(5),
    usua_doc_anu character varying(14),
    usua_codi_anu numeric(4,0),
    usua_anu_acta numeric(8,0),
    sgd_anu_path_acta character varying(200),
    sgd_trad_codigo numeric(2,0)
);


ALTER TABLE public.sgd_anu_anulados OWNER TO orfeo_usr;

--
-- Name: sgd_aper_adminperfiles; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_aper_adminperfiles (
    sgd_aper_codigo numeric(2,0),
    sgd_aper_descripcion character varying(20)
);


ALTER TABLE public.sgd_aper_adminperfiles OWNER TO orfeo_usr;

--
-- Name: sgd_apli_aplintegra; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_apli_aplintegra (
    sgd_apli_codi numeric(4,0),
    sgd_apli_descrip character varying(150),
    sgd_apli_lk1desc character varying(150),
    sgd_apli_lk1 character varying(150),
    sgd_apli_lk2desc character varying(150),
    sgd_apli_lk2 character varying(150),
    sgd_apli_lk3desc character varying(150),
    sgd_apli_lk3 character varying(150),
    sgd_apli_lk4desc character varying(150),
    sgd_apli_lk4 character varying(150)
);


ALTER TABLE public.sgd_apli_aplintegra OWNER TO orfeo_usr;

--
-- Name: sgd_aplmen_aplimens; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_aplmen_aplimens (
    sgd_aplmen_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_aplmen_ref character varying(20),
    sgd_aplmen_haciaorfeo numeric(4,0),
    sgd_aplmen_desdeorfeo numeric(4,0)
);


ALTER TABLE public.sgd_aplmen_aplimens OWNER TO orfeo_usr;

--
-- Name: sgd_aplus_plicusua; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_aplus_plicusua (
    sgd_aplus_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    usua_doc character varying(14),
    sgd_trad_codigo numeric(2,0),
    sgd_aplus_prioridad numeric(1,0)
);


ALTER TABLE public.sgd_aplus_plicusua OWNER TO orfeo_usr;

--
-- Name: sgd_arch_depe; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_arch_depe (
    sgd_arch_depe character varying(5),
    sgd_arch_edificio numeric(6,0),
    sgd_arch_item numeric(6,0),
    sgd_arch_id numeric NOT NULL
);


ALTER TABLE public.sgd_arch_depe OWNER TO orfeo_usr;

--
-- Name: sgd_archivo_central; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_archivo_central (
    sgd_archivo_id numeric NOT NULL,
    sgd_archivo_tipo numeric,
    sgd_archivo_orden character varying(15),
    sgd_archivo_fechai timestamp with time zone,
    sgd_archivo_demandado character varying(1500),
    sgd_archivo_demandante character varying(200),
    sgd_archivo_cc_demandante numeric,
    sgd_archivo_depe character varying(5),
    sgd_archivo_zona character varying(4),
    sgd_archivo_carro numeric,
    sgd_archivo_cara character varying(4),
    sgd_archivo_estante numeric,
    sgd_archivo_entrepano numeric,
    sgd_archivo_caja numeric,
    sgd_archivo_unidocu character varying(40),
    sgd_archivo_anexo character varying(4000),
    sgd_archivo_inder numeric DEFAULT 0,
    sgd_archivo_path character varying(4000),
    sgd_archivo_year numeric(4,0),
    sgd_archivo_rad character varying(15) NOT NULL,
    sgd_archivo_srd numeric,
    sgd_archivo_sbrd numeric,
    sgd_archivo_folios numeric,
    sgd_archivo_mata numeric DEFAULT 0,
    sgd_archivo_fechaf timestamp with time zone,
    sgd_archivo_prestamo numeric(1,0),
    sgd_archivo_funprest character(100),
    sgd_archivo_fechprest timestamp with time zone,
    sgd_archivo_fechprestf timestamp with time zone,
    depe_codi character varying(5),
    sgd_archivo_usua character varying(15),
    sgd_archivo_fech timestamp with time zone
);


ALTER TABLE public.sgd_archivo_central OWNER TO orfeo_usr;

--
-- Name: sgd_archivo_fondo; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_archivo_fondo (
    sgd_archivo_id numeric NOT NULL,
    sgd_archivo_tipo numeric,
    sgd_archivo_orden character varying(15),
    sgd_archivo_fechai timestamp with time zone,
    sgd_archivo_demandado character varying(1500),
    sgd_archivo_demandante character varying(200),
    sgd_archivo_cc_demandante numeric,
    sgd_archivo_depe character varying(5),
    sgd_archivo_zona character varying(4),
    sgd_archivo_carro numeric,
    sgd_archivo_cara character varying(4),
    sgd_archivo_estante numeric,
    sgd_archivo_entrepano numeric,
    sgd_archivo_caja numeric,
    sgd_archivo_unidocu character varying(40),
    sgd_archivo_anexo character varying(4000),
    sgd_archivo_inder numeric DEFAULT 0,
    sgd_archivo_path character varying(4000),
    sgd_archivo_year numeric(4,0),
    sgd_archivo_rad character varying(15) NOT NULL,
    sgd_archivo_srd numeric,
    sgd_archivo_folios numeric,
    sgd_archivo_mata numeric DEFAULT 0,
    sgd_archivo_fechaf timestamp with time zone,
    sgd_archivo_prestamo numeric(1,0),
    sgd_archivo_funprest character(100),
    sgd_archivo_fechprest timestamp with time zone,
    sgd_archivo_fechprestf timestamp with time zone,
    depe_codi character varying(5),
    sgd_archivo_usua character varying(15),
    sgd_archivo_fech timestamp with time zone
);


ALTER TABLE public.sgd_archivo_fondo OWNER TO orfeo_usr;

--
-- Name: sgd_archivo_hist; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_archivo_hist (
    depe_codi character varying(5) NOT NULL,
    hist_fech timestamp with time zone NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    sgd_archivo_rad character varying(14),
    hist_obse character varying(600) NOT NULL,
    usua_doc character varying(14),
    sgd_ttr_codigo numeric(3,0),
    hist_id numeric
);


ALTER TABLE public.sgd_archivo_hist OWNER TO orfeo_usr;

--
-- Name: sgd_argd_argdoc; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_argd_argdoc (
    sgd_argd_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    sgd_argd_tabla character varying(100),
    sgd_argd_tcodi character varying(100),
    sgd_argd_tdes character varying(100),
    sgd_argd_llist character varying(150),
    sgd_argd_campo character varying(100)
);


ALTER TABLE public.sgd_argd_argdoc OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_argd_argdoc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_argd_argdoc IS 'Define los argumentos que ha de incluir un tipo de documento';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argd_argdoc.sgd_argd_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argd_argdoc.sgd_pnufe_codi IS 'Codigo del proceso';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tabla; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argd_argdoc.sgd_argd_tabla IS 'Nombre de la tabla tabla a la que hace refencia el argumento';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tcodi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argd_argdoc.sgd_argd_tcodi IS 'Nombre del campo llave de la tabla referenciada';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_tdes; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argd_argdoc.sgd_argd_tdes IS 'Nombre del campo descripcion de la tabla referenciada';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_llist; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argd_argdoc.sgd_argd_llist IS 'Texto del label descriptor  que ha  de aparecen de forma dinamica en la pagina web';


--
-- Name: COLUMN sgd_argd_argdoc.sgd_argd_campo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argd_argdoc.sgd_argd_campo IS 'Etiqueta que ha de incluirse en el documento para referenciar este campo';


--
-- Name: sgd_argup_argudoctop; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_argup_argudoctop (
    sgd_argup_codi numeric(4,0) NOT NULL,
    sgd_argup_desc character varying(50),
    sgd_tpr_codigo numeric(4,0)
);


ALTER TABLE public.sgd_argup_argudoctop OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_argup_argudoctop; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_argup_argudoctop IS 'Almacena los argumentos para contestar pliegos de cargos';


--
-- Name: COLUMN sgd_argup_argudoctop.sgd_argup_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argup_argudoctop.sgd_argup_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_argup_argudoctop.sgd_argup_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_argup_argudoctop.sgd_argup_desc IS 'Descripcion';


--
-- Name: sgd_auditoria; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_auditoria (
    usua_doc character varying(12),
    ip character varying(15),
    tipo character varying(5),
    tabla character varying(50),
    isql character(5000),
    fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sgd_auditoria OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_auditoria; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_auditoria IS 'Tabla para radicacion via web';


--
-- Name: sgd_camexp_campoexpediente; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_camexp_campoexpediente (
    sgd_camexp_codigo numeric(4,0) NOT NULL,
    sgd_camexp_campo character varying(30) NOT NULL,
    sgd_parexp_codigo numeric(4,0) NOT NULL,
    sgd_camexp_fk numeric DEFAULT 0,
    sgd_camexp_tablafk character varying(30),
    sgd_camexp_campofk character varying(30),
    sgd_camexp_campovalor character varying(30),
    sgd_camexp_orden numeric(1,0)
);


ALTER TABLE public.sgd_camexp_campoexpediente OWNER TO orfeo_usr;

--
-- Name: sgd_carp_descripcion; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_carp_descripcion (
    sgd_carp_depecodi character varying(5) NOT NULL,
    sgd_carp_tiporad numeric(2,0) NOT NULL,
    sgd_carp_descr character varying(40)
);


ALTER TABLE public.sgd_carp_descripcion OWNER TO orfeo_usr;

--
-- Name: sgd_cau_causal; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_cau_causal (
    sgd_cau_codigo numeric(4,0) NOT NULL,
    sgd_cau_descrip character varying(150)
);


ALTER TABLE public.sgd_cau_causal OWNER TO orfeo_usr;

--
-- Name: sgd_caux_causales; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_caux_causales (
    sgd_caux_codigo numeric(10,0) NOT NULL,
    radi_nume_radi character varying(15),
    sgd_dcau_codigo numeric(4,0),
    sgd_ddca_codigo numeric(4,0),
    sgd_caux_fecha date,
    usua_doc character varying(14)
);


ALTER TABLE public.sgd_caux_causales OWNER TO orfeo_usr;

--
-- Name: sgd_ciu_ciudadano; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_ciu_ciudadano (
    tdid_codi numeric(2,0),
    sgd_ciu_codigo numeric(8,0) DEFAULT nextval('public.sec_ciu_ciudadano'::regclass) NOT NULL,
    sgd_ciu_nombre character varying(150),
    sgd_ciu_direccion character varying(150),
    sgd_ciu_apell1 character varying(50),
    sgd_ciu_apell2 character varying(50),
    sgd_ciu_telefono character varying(50),
    sgd_ciu_email character varying(50),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_ciu_cedula character varying(13),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    id_estado_civil_pqrs integer NOT NULL,
    genero_pqrs_id integer NOT NULL,
    id_users_pqrs integer NOT NULL,
    barrio character varying(150),
    sgd_ciu_edad integer,
    sgd_ciu_ubicacion numeric(1,0),
    trte_codi integer DEFAULT 2 NOT NULL,
    tipo_poblacion integer
);


ALTER TABLE public.sgd_ciu_ciudadano OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_ciu_ciudadano.sgd_ciu_edad; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ciu_ciudadano.sgd_ciu_edad IS 'Guarda la edad de la persona en relación a la opción de la tabla rango_edades';


--
-- Name: COLUMN sgd_ciu_ciudadano.sgd_ciu_ubicacion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ciu_ciudadano.sgd_ciu_ubicacion IS 'Guarda la inormación correspondiente a Urbana =1 o Rural =0';


--
-- Name: COLUMN sgd_ciu_ciudadano.trte_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ciu_ciudadano.trte_codi IS 'Tipo de remitente';


--
-- Name: COLUMN sgd_ciu_ciudadano.tipo_poblacion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ciu_ciudadano.tipo_poblacion IS 'Indica el tipo de población a la que pertenece el que interpone la PQRS';


--
-- Name: sgd_ciu_secue; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_ciu_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_ciu_secue OWNER TO orfeo_usr;

--
-- Name: sgd_clta_clstarif; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_clta_clstarif (
    sgd_fenv_codigo numeric(5,0),
    sgd_clta_codser numeric(5,0),
    sgd_tar_codigo numeric(5,0),
    sgd_clta_descrip character varying(100),
    sgd_clta_pesdes numeric(15,0),
    sgd_clta_peshast numeric(15,0)
);


ALTER TABLE public.sgd_clta_clstarif OWNER TO orfeo_usr;

--
-- Name: sgd_cob_campobliga; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_cob_campobliga (
    sgd_cob_codi numeric(4,0) NOT NULL,
    sgd_cob_desc character varying(150),
    sgd_cob_label character varying(50),
    sgd_tidm_codi numeric(4,0)
);


ALTER TABLE public.sgd_cob_campobliga OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_cob_campobliga; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_cob_campobliga IS 'Indica los campos obligatorios que hacen parte de un tipo de documento de correspondencia masiva';


--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_cob_campobliga.sgd_cob_codi IS 'ID del registro';


--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_cob_campobliga.sgd_cob_desc IS 'Descripcion';


--
-- Name: COLUMN sgd_cob_campobliga.sgd_cob_label; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_cob_campobliga.sgd_cob_label IS 'Rotulo del campo a incluir dentro del documento';


--
-- Name: COLUMN sgd_cob_campobliga.sgd_tidm_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_cob_campobliga.sgd_tidm_codi IS 'Codigo del documento';


--
-- Name: sgd_dcau_causal; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_dcau_causal (
    sgd_dcau_codigo numeric(4,0) NOT NULL,
    sgd_cau_codigo numeric(4,0),
    sgd_dcau_descrip character varying(150)
);


ALTER TABLE public.sgd_dcau_causal OWNER TO orfeo_usr;

--
-- Name: sgd_ddca_ddsgrgdo; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_ddca_ddsgrgdo (
    sgd_ddca_codigo numeric(4,0) NOT NULL,
    sgd_dcau_codigo numeric(4,0),
    par_serv_secue numeric(8,0),
    sgd_ddca_descrip character varying(150)
);


ALTER TABLE public.sgd_ddca_ddsgrgdo OWNER TO orfeo_usr;

--
-- Name: sgd_def_contactos; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_def_contactos (
    ctt_id numeric(15,0) NOT NULL,
    ctt_nombre character varying(60) NOT NULL,
    ctt_cargo character varying(60) NOT NULL,
    ctt_telefono character varying(25),
    ctt_id_tipo numeric(4,0) NOT NULL,
    ctt_id_empresa numeric(15,0) NOT NULL
);


ALTER TABLE public.sgd_def_contactos OWNER TO orfeo_usr;

--
-- Name: sgd_def_continentes; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_def_continentes (
    id_cont numeric(2,0),
    nombre_cont character varying(20) NOT NULL
);


ALTER TABLE public.sgd_def_continentes OWNER TO orfeo_usr;

--
-- Name: sgd_def_paises; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_def_paises (
    id_pais numeric(4,0) NOT NULL,
    id_cont numeric(2,0) DEFAULT 1 NOT NULL,
    nombre_pais character varying(30) NOT NULL
);


ALTER TABLE public.sgd_def_paises OWNER TO orfeo_usr;

--
-- Name: sgd_deve_dev_envio; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_deve_dev_envio (
    sgd_deve_codigo numeric(2,0) NOT NULL,
    sgd_deve_desc character varying(150) NOT NULL
);


ALTER TABLE public.sgd_deve_dev_envio OWNER TO orfeo_usr;

--
-- Name: sgd_dir_drecciones; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_dir_drecciones (
    sgd_dir_codigo numeric(10,0) NOT NULL,
    sgd_dir_tipo numeric(4,0) NOT NULL,
    sgd_oem_codigo numeric(8,0),
    sgd_ciu_codigo numeric(8,0),
    radi_nume_radi character varying(30),
    sgd_esp_codi numeric(5,0),
    muni_codi numeric(4,0),
    dpto_codi numeric(3,0),
    sgd_dir_direccion character varying(150),
    sgd_dir_telefono character varying(50),
    sgd_dir_mail character varying(50),
    sgd_sec_codigo numeric(13,0),
    sgd_temporal_nombre character varying(150),
    anex_codigo numeric(20,0),
    sgd_anex_codigo character varying(20),
    sgd_dir_nombre character varying(150),
    sgd_doc_fun character varying(14),
    sgd_dir_nomremdes character varying(1000),
    sgd_trd_codigo numeric(1,0),
    sgd_dir_tdoc numeric(1,0),
    sgd_dir_doc character varying(14),
    id_pais numeric(4,0) DEFAULT 170,
    id_cont numeric(2,0) DEFAULT 1
);


ALTER TABLE public.sgd_dir_drecciones OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_dir_drecciones.sgd_dir_nomremdes; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dir_drecciones.sgd_dir_nomremdes IS 'NOMBRE DE REMITENTE O DESTINATARIO';


--
-- Name: COLUMN sgd_dir_drecciones.sgd_trd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dir_drecciones.sgd_trd_codigo IS 'TIPO DE REMITENTE/DESTINATARIO (1 Ciudadanao, 2 OtrasEmpresas, 3 Esp, 4 Funcionario)';


--
-- Name: COLUMN sgd_dir_drecciones.sgd_dir_tdoc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dir_drecciones.sgd_dir_tdoc IS 'NUMERO DE DOCUMENTO';


--
-- Name: sgd_dir_secue; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_dir_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_dir_secue OWNER TO orfeo_usr;

--
-- Name: sgd_dnufe_docnufe; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_dnufe_docnufe (
    sgd_dnufe_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    sgd_tpr_codigo numeric(4,0),
    sgd_dnufe_label character varying(150),
    trte_codi numeric(2,0),
    sgd_dnufe_main character varying(1),
    sgd_dnufe_path character varying(150),
    sgd_dnufe_gerarq character varying(10),
    anex_tipo_codi numeric(4,0)
);


ALTER TABLE public.sgd_dnufe_docnufe OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_dnufe_docnufe; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_dnufe_docnufe IS 'Indica los documentos que componen un proceso de numeracion y fechado';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dnufe_docnufe.sgd_dnufe_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dnufe_docnufe.sgd_pnufe_codi IS 'codigo del proceso';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dnufe_docnufe.sgd_tpr_codigo IS 'codigo del documento que hace parte de un proceso de numeracion y fechado';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_label; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dnufe_docnufe.sgd_dnufe_label IS 'label del documento que ha de usarse en la interfaz de gestion de procesos de numeracion y fechado';


--
-- Name: COLUMN sgd_dnufe_docnufe.trte_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dnufe_docnufe.trte_codi IS 'indica el tipo de remitente para quien va dirigida la comunicacion';


--
-- Name: COLUMN sgd_dnufe_docnufe.sgd_dnufe_main; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dnufe_docnufe.sgd_dnufe_main IS 'Indica si el registro es el documento principal del paquete';


--
-- Name: sgd_dt_radicado; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_dt_radicado (
    radi_nume_radi character varying(30) NOT NULL,
    dias_termino numeric(2,0) NOT NULL
);


ALTER TABLE public.sgd_dt_radicado OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_dt_radicado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_dt_radicado IS 'Dias de termino por radicado';


--
-- Name: COLUMN sgd_dt_radicado.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dt_radicado.radi_nume_radi IS 'Numero de radicado';


--
-- Name: COLUMN sgd_dt_radicado.dias_termino; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_dt_radicado.dias_termino IS 'dias de termino';


--
-- Name: sgd_eanu_estanulacion; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_eanu_estanulacion (
    sgd_eanu_desc character varying(150),
    sgd_eanu_codi numeric
);


ALTER TABLE public.sgd_eanu_estanulacion OWNER TO orfeo_usr;

--
-- Name: sgd_einv_inventario; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_einv_inventario (
    sgd_einv_codigo numeric NOT NULL,
    sgd_depe_nomb character varying(400),
    sgd_depe_codi character varying(5),
    sgd_einv_expnum character varying(18),
    sgd_einv_titulo character varying(400),
    sgd_einv_unidad numeric,
    sgd_einv_fech date,
    sgd_einv_fechfin date,
    sgd_einv_radicados character varying(40),
    sgd_einv_folios numeric,
    sgd_einv_nundocu numeric,
    sgd_einv_nundocubodega numeric,
    sgd_einv_caja numeric,
    sgd_einv_cajabodega numeric,
    sgd_einv_srd numeric,
    sgd_einv_nomsrd character varying(400),
    sgd_einv_sbrd numeric,
    sgd_einv_nomsbrd character varying(400),
    sgd_einv_retencion character varying(400),
    sgd_einv_disfinal character varying(400),
    sgd_einv_ubicacion character varying(400),
    sgd_einv_observacion character varying(400)
);


ALTER TABLE public.sgd_einv_inventario OWNER TO orfeo_usr;

--
-- Name: sgd_eit_items; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_eit_items (
    sgd_eit_codigo numeric NOT NULL,
    sgd_eit_cod_padre numeric DEFAULT 0,
    sgd_eit_nombre character varying(40),
    sgd_eit_sigla character varying(6),
    codi_dpto numeric(4,0),
    codi_muni numeric(5,0)
);


ALTER TABLE public.sgd_eit_items OWNER TO orfeo_usr;

--
-- Name: sgd_ejes_tematicos; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_ejes_tematicos (
    id_sgd_eje_tematico integer NOT NULL,
    nombre_eje_tematico character varying(1000),
    descripcion_eje_tematico character varying(1000),
    plazo_eje_tematico numeric(3,0),
    tipo_plazo_eje_tematico character varying(10),
    activo_eje_tematico boolean
);


ALTER TABLE public.sgd_ejes_tematicos OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_ejes_tematicos; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_ejes_tematicos IS 'Guarda la información de los ejes tematicos los cuales se utilizan para clasificar el documento que se esta solicitando';


--
-- Name: COLUMN sgd_ejes_tematicos.id_sgd_eje_tematico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ejes_tematicos.id_sgd_eje_tematico IS 'Codigo del eje tematico';


--
-- Name: COLUMN sgd_ejes_tematicos.nombre_eje_tematico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ejes_tematicos.nombre_eje_tematico IS 'Nombre del eje tematico';


--
-- Name: COLUMN sgd_ejes_tematicos.descripcion_eje_tematico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ejes_tematicos.descripcion_eje_tematico IS 'Descripcion del eje tematico';


--
-- Name: COLUMN sgd_ejes_tematicos.plazo_eje_tematico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ejes_tematicos.plazo_eje_tematico IS 'Dias de plazo';


--
-- Name: COLUMN sgd_ejes_tematicos.tipo_plazo_eje_tematico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ejes_tematicos.tipo_plazo_eje_tematico IS 'Tipo de plazo';


--
-- Name: sgd_ejes_tematicos_dependencia; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_ejes_tematicos_dependencia (
    id_sgd_eje_tematico_dependencia integer NOT NULL,
    id_sgd_eje_tematico numeric,
    depe_codi character varying(5),
    estado_eje_tematico boolean
);


ALTER TABLE public.sgd_ejes_tematicos_dependencia OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_ejes_tematicos_dependencia; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_ejes_tematicos_dependencia IS 'Guarda la relación de los ejes tematicos a sociados a una dependencia';


--
-- Name: COLUMN sgd_ejes_tematicos_dependencia.id_sgd_eje_tematico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ejes_tematicos_dependencia.id_sgd_eje_tematico IS 'Guarda el id del ejetematica para la dependencia';


--
-- Name: COLUMN sgd_ejes_tematicos_dependencia.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_ejes_tematicos_dependencia.depe_codi IS 'Guarda el código de la dependencia';


--
-- Name: sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq OWNER TO orfeo_usr;

--
-- Name: sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq OWNED BY public.sgd_ejes_tematicos_dependencia.id_sgd_eje_tematico_dependencia;


--
-- Name: sgd_ejes_tematicos_id_sgd_eje_tematico_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_ejes_tematicos_id_sgd_eje_tematico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sgd_ejes_tematicos_id_sgd_eje_tematico_seq OWNER TO orfeo_usr;

--
-- Name: sgd_ejes_tematicos_id_sgd_eje_tematico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.sgd_ejes_tematicos_id_sgd_eje_tematico_seq OWNED BY public.sgd_ejes_tematicos.id_sgd_eje_tematico;


--
-- Name: sgd_empus_empusuario; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_empus_empusuario (
    usua_login character varying(10),
    identificador_empresa numeric(10,0)
);


ALTER TABLE public.sgd_empus_empusuario OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_empus_empusuario.identificador_empresa; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_empus_empusuario.identificador_empresa IS 'Corresponde al identificador de la tabla bodega_empresas';


--
-- Name: sgd_ent_entidades; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_ent_entidades (
    sgd_ent_nit character varying(13) NOT NULL,
    sgd_ent_codsuc character varying(4) NOT NULL,
    sgd_ent_pias numeric(5,0),
    dpto_codi numeric(2,0),
    muni_codi numeric(4,0),
    sgd_ent_descrip character varying(80),
    sgd_ent_direccion character varying(50),
    sgd_ent_telefono character varying(50)
);


ALTER TABLE public.sgd_ent_entidades OWNER TO orfeo_usr;

--
-- Name: sgd_enve_envioespecial; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_enve_envioespecial (
    sgd_fenv_codigo numeric(4,0),
    sgd_enve_valorl character varying(30),
    sgd_enve_valorn character varying(30),
    sgd_enve_desc character varying(30)
);


ALTER TABLE public.sgd_enve_envioespecial OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_enve_envioespecial.sgd_fenv_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_enve_envioespecial.sgd_fenv_codigo IS 'Codigo Empresa de envio';


--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_valorl; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_enve_envioespecial.sgd_enve_valorl IS 'Valor Campo Local';


--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_valorn; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_enve_envioespecial.sgd_enve_valorn IS 'Valor Campo Nacional';


--
-- Name: COLUMN sgd_enve_envioespecial.sgd_enve_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_enve_envioespecial.sgd_enve_desc IS 'Descripcion Valor';


--
-- Name: sgd_estc_estconsolid; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_estc_estconsolid (
    sgd_estc_codigo numeric,
    sgd_tpr_codigo numeric,
    dep_nombre character varying(30),
    depe_codi character varying(5),
    sgd_estc_ctotal numeric,
    sgd_estc_centramite numeric,
    sgd_estc_csinriesgo numeric,
    sgd_estc_criesgomedio numeric,
    sgd_estc_criesgoalto numeric,
    sgd_estc_ctramitados numeric,
    sgd_estc_centermino numeric,
    sgd_estc_cfueratermino numeric,
    sgd_estc_fechgen date,
    sgd_estc_fechini date,
    sgd_estc_fechfin date,
    sgd_estc_fechiniresp date,
    sgd_estc_fechfinresp date,
    sgd_estc_dsinriesgo numeric,
    sgd_estc_driesgomegio numeric,
    sgd_estc_driesgoalto numeric,
    sgd_estc_dtermino numeric,
    sgd_estc_grupgenerado numeric
);


ALTER TABLE public.sgd_estc_estconsolid OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_estc_estconsolid; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_estc_estconsolid IS 'Tabla en la cual se almacenan consolidados de las territoriales.';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_codigo IS 'Codigo Registro Unico';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_tpr_codigo IS 'Tipo de Documento';


--
-- Name: COLUMN sgd_estc_estconsolid.dep_nombre; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.dep_nombre IS 'Nombre Grupo Dependenciad de cada Territorial';


--
-- Name: COLUMN sgd_estc_estconsolid.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.depe_codi IS 'Codigo dependencia';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_ctotal; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_ctotal IS 'Cantidad Documentos';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_centramite; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_centramite IS 'Cantidad Documentos En tramite';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_csinriesgo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_csinriesgo IS 'Cantidad Documentos Sin riesgo';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_criesgomedio; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_criesgomedio IS 'Cantidad de Documentos en Riesgo Medio';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_criesgoalto; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_criesgoalto IS 'Cantidad de Documentos en Riesgo Alto';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_ctramitados; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_ctramitados IS 'Cantidad de Documentos Tramitados';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_centermino; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_centermino IS 'Cantidad Documentos Tramitados en Termino';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_cfueratermino; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_cfueratermino IS 'Cantidad Documentos Tramitados Fuera de Termino';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechgen; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_fechgen IS 'Fecha Generados';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechini; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_fechini IS 'Fecha Inicio de Reporde de Radicados';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechfin; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_fechfin IS 'Fecha Fin de Reporte de Radicados';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechiniresp; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_fechiniresp IS 'Fecha inicio de Documentos respuesta';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_fechfinresp; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_fechfinresp IS 'Fecha Fin de Documentos Respuesta';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_dsinriesgo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_dsinriesgo IS 'Dias definidos para Riesgo Bajo';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_driesgomegio; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_driesgomegio IS 'Dias Para Riesgo Medio';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_driesgoalto; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_driesgoalto IS 'Dias Para Riesgo Alto';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_dtermino; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_dtermino IS 'Dias Reales de Termino de los Documentos.';


--
-- Name: COLUMN sgd_estc_estconsolid.sgd_estc_grupgenerado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_estc_estconsolid.sgd_estc_grupgenerado IS 'Numero Historico de la Generacion.';


--
-- Name: sgd_estinst_estadoinstancia; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_estinst_estadoinstancia (
    sgd_estinst_codi numeric(4,0),
    sgd_apli_codi numeric(4,0),
    sgd_instorf_codi numeric(4,0),
    sgd_estinst_valor numeric(4,0),
    sgd_estinst_habilita numeric(1,0),
    sgd_estinst_mensaje character varying(100)
);


ALTER TABLE public.sgd_estinst_estadoinstancia OWNER TO orfeo_usr;

--
-- Name: sgd_exp_expediente_id_expediente_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_exp_expediente_id_expediente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sgd_exp_expediente_id_expediente_seq OWNER TO orfeo_usr;

--
-- Name: sgd_exp_expediente; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_exp_expediente (
    sgd_exp_numero character varying(20) NOT NULL,
    radi_nume_radi character varying(30),
    sgd_exp_fech date,
    sgd_exp_fech_mod date,
    depe_codi character varying(5),
    usua_codi numeric(3,0),
    usua_doc character varying(15),
    sgd_exp_estado numeric(1,0) DEFAULT 0,
    sgd_exp_titulo character varying(50),
    sgd_exp_asunto character varying(150),
    sgd_exp_carpeta character varying(30),
    sgd_exp_ufisica character varying(20),
    sgd_exp_isla character varying(10),
    sgd_exp_estante character varying(10),
    sgd_exp_caja character varying(10),
    sgd_exp_fech_arch date,
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_fexp_codigo numeric(3,0),
    sgd_exp_subexpediente character varying(20),
    sgd_exp_archivo numeric(1,0),
    sgd_exp_unicon numeric(1,0),
    sgd_exp_fechfin date,
    sgd_exp_folios character varying(6),
    sgd_exp_rete numeric(2,0),
    sgd_exp_entrepa numeric(6,0),
    radi_usua_arch character varying(40),
    sgd_exp_edificio character varying(400),
    sgd_exp_caja_bodega character varying(40),
    sgd_exp_carro character varying(40),
    sgd_exp_carpeta_bodega character varying(40),
    sgd_exp_privado numeric(1,0),
    sgd_exp_cd character varying(10),
    sgd_exp_nref character varying(7),
    sgd_sexp_paraexp1 character varying(50),
    id_expediente integer DEFAULT nextval('public.sgd_exp_expediente_id_expediente_seq'::regclass) NOT NULL,
    CONSTRAINT sgd_exp_expediente_exp_check CHECK ((btrim((radi_nume_radi)::text) <> (''::character varying)::text)),
    CONSTRAINT sgd_exp_expediente_radi_check CHECK ((btrim((sgd_exp_numero)::text) <> (''::character varying)::text))
);


ALTER TABLE public.sgd_exp_expediente OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_numero; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_numero IS 'Numero de Expediente';


--
-- Name: COLUMN sgd_exp_expediente.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.radi_nume_radi IS 'Radicado Asociado por cada radicado puede existir un registro de ubicacion en el expediente.';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_fech IS 'Fecha de Creacion del Expediente';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech_mod; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_fech_mod IS 'Fecha de Ultima modificacion';


--
-- Name: COLUMN sgd_exp_expediente.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.depe_codi IS 'Dependencia que crea el expediente';


--
-- Name: COLUMN sgd_exp_expediente.usua_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.usua_codi IS 'Codigo del Usuario que crea el expediente ';


--
-- Name: COLUMN sgd_exp_expediente.usua_doc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.usua_doc IS 'Documento del usuario que crea el documento';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_estado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_estado IS 'Indica si el radicado esta archivado (1) o no (0)';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_titulo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_titulo IS 'Titulo de expediente se coloca en archivo';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_asunto; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_asunto IS 'Asunto del expediente';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_carpeta; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_carpeta IS 'Ubicacion en carpeta';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_ufisica; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_ufisica IS 'Ubicacion fisica';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_isla; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_isla IS 'Isla';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_estante; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_estante IS 'Estante';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_caja; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_caja IS 'Caja';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_fech_arch; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_fech_arch IS 'Fecha de archivado';


--
-- Name: COLUMN sgd_exp_expediente.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_srd_codigo IS 'Serie';


--
-- Name: COLUMN sgd_exp_expediente.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_sbrd_codigo IS 'Subserie';


--
-- Name: COLUMN sgd_exp_expediente.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_fexp_codigo IS 'Fecha del expediente';


--
-- Name: COLUMN sgd_exp_expediente.sgd_exp_subexpediente; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.sgd_exp_subexpediente IS 'Nombre de subexpediente';


--
-- Name: COLUMN sgd_exp_expediente.id_expediente; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_exp_expediente.id_expediente IS 'Autoincremental de la tabla para diferenciar los datos correspondientes';


--
-- Name: sgd_fars_faristas; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_fars_faristas (
    sgd_fars_codigo numeric(5,0) NOT NULL,
    sgd_pexp_codigo numeric(4,0),
    sgd_fexp_codigoini numeric(6,0),
    sgd_fexp_codigofin numeric(6,0),
    sgd_fars_diasminimo numeric(3,0),
    sgd_fars_diasmaximo numeric(3,0),
    sgd_fars_desc character varying(100),
    sgd_trad_codigo numeric(2,0),
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_fars_tipificacion numeric(1,0),
    sgd_tpr_codigo numeric,
    sgd_fars_automatico numeric,
    sgd_fars_rolgeneral numeric
);


ALTER TABLE public.sgd_fars_faristas OWNER TO orfeo_usr;

--
-- Name: sgd_fenv_frmenvio; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_fenv_frmenvio (
    sgd_fenv_codigo numeric(5,0) NOT NULL,
    sgd_fenv_descrip character varying(150),
    sgd_fenv_planilla numeric(1,0) DEFAULT 0 NOT NULL,
    sgd_fenv_estado numeric(1,0) DEFAULT 1 NOT NULL
);


ALTER TABLE public.sgd_fenv_frmenvio OWNER TO orfeo_usr;

--
-- Name: sgd_fexp_flujoexpedientes; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_fexp_flujoexpedientes (
    sgd_fexp_codigo numeric(6,0),
    sgd_pexp_codigo numeric(6,0),
    sgd_fexp_orden numeric(4,0),
    sgd_fexp_terminos numeric(4,0),
    sgd_fexp_imagen character varying(50),
    sgd_fexp_descrip character varying(150)
);


ALTER TABLE public.sgd_fexp_flujoexpedientes OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_fexp_flujoexpedientes; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_fexp_flujoexpedientes IS 'Descripcion de la etapa en el Tipo de Proceso incicado en el campo SGD_PEXP_CODIGO';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_fexp_flujoexpedientes.sgd_fexp_codigo IS 'Codigo etapa del Flujo. Codigo debe ser Unico.';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_pexp_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_fexp_flujoexpedientes.sgd_pexp_codigo IS 'Codigo de proceso al cual se le incluira el flujo';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_orden; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_fexp_flujoexpedientes.sgd_fexp_orden IS 'Orden de la Etapa en el Flujo Documental';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_terminos; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_fexp_flujoexpedientes.sgd_fexp_terminos IS 'Numero de dias de plazo para cumplimiento de esta etapa.';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_imagen; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_fexp_flujoexpedientes.sgd_fexp_imagen IS 'Icono para distinguir la etapa.';


--
-- Name: COLUMN sgd_fexp_flujoexpedientes.sgd_fexp_descrip; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_fexp_flujoexpedientes.sgd_fexp_descrip IS 'Descripcion de la etapa en el Tipo de Proceso incicado en el campo SGD_PEXP_CODIGO';


--
-- Name: sgd_firmas_qr; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_firmas_qr (
    radi_nume_radi character varying(30) NOT NULL,
    usua_login character varying(50) NOT NULL,
    usua_nomb character varying(45) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    firma_fecha timestamp without time zone NOT NULL,
    permiso_firma numeric(1,0) NOT NULL,
    usua_codi numeric(10,0)
);


ALTER TABLE public.sgd_firmas_qr OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_firmas_qr; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_firmas_qr IS 'almacena la información de los radicados firmados';


--
-- Name: COLUMN sgd_firmas_qr.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_firmas_qr.radi_nume_radi IS 'Número de radicado';


--
-- Name: COLUMN sgd_firmas_qr.usua_login; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_firmas_qr.usua_login IS 'Usuario que genera la firma';


--
-- Name: COLUMN sgd_firmas_qr.usua_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_firmas_qr.usua_nomb IS 'Nombre del usuario';


--
-- Name: COLUMN sgd_firmas_qr.usua_doc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_firmas_qr.usua_doc IS 'Documento de identidad del usuario';


--
-- Name: COLUMN sgd_firmas_qr.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_firmas_qr.depe_codi IS 'Dependencia del usuario';


--
-- Name: COLUMN sgd_firmas_qr.firma_fecha; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_firmas_qr.firma_fecha IS 'Fecha de generación de la firma';


--
-- Name: COLUMN sgd_firmas_qr.permiso_firma; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_firmas_qr.permiso_firma IS 'Permiso de firma actual del usuario';


--
-- Name: sgd_firrad_firmarads; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_firrad_firmarads (
    sgd_firrad_id numeric(15,0) NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_firrad_firma character varying(255),
    sgd_firrad_fecha date,
    sgd_firrad_docsolic character varying(14) NOT NULL,
    sgd_firrad_fechsolic date NOT NULL,
    sgd_firrad_pk character varying(255)
);


ALTER TABLE public.sgd_firrad_firmarads OWNER TO orfeo_usr;

--
-- Name: sgd_fld_flujodoc; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_fld_flujodoc (
    sgd_fld_codigo numeric(3,0),
    sgd_fld_desc character varying(100),
    sgd_tpr_codigo numeric(3,0),
    sgd_fld_imagen character varying(50),
    sgd_fld_grupoweb integer DEFAULT 0
);


ALTER TABLE public.sgd_fld_flujodoc OWNER TO orfeo_usr;

--
-- Name: sgd_fun_funciones; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_fun_funciones (
    sgd_fun_codigo numeric(4,0) NOT NULL,
    sgd_fun_descrip character varying(530),
    sgd_fun_fech_ini date,
    sgd_fun_fech_fin date
);


ALTER TABLE public.sgd_fun_funciones OWNER TO orfeo_usr;

--
-- Name: sgd_hfld_histflujodoc; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_hfld_histflujodoc (
    sgd_hfld_codigo numeric(6,0),
    sgd_fexp_codigo numeric(3,0) NOT NULL,
    sgd_exp_fechflujoant date,
    sgd_hfld_fech timestamp without time zone,
    sgd_exp_numero character varying(30),
    radi_nume_radi character varying(30),
    usua_doc character varying(10),
    usua_codi numeric(10,0),
    depe_codi character varying(5),
    sgd_ttr_codigo numeric(2,0),
    sgd_fexp_observa character varying(500),
    sgd_hfld_observa character varying(500),
    sgd_fars_codigo numeric,
    sgd_hfld_automatico numeric
);


ALTER TABLE public.sgd_hfld_histflujodoc OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_hfld_histflujodoc.sgd_hfld_fech; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_hfld_histflujodoc.sgd_hfld_fech IS 'Fecha Historico de expediente';


--
-- Name: sgd_hmtd_hismatdoc; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_hmtd_hismatdoc (
    sgd_hmtd_codigo numeric(6,0) NOT NULL,
    sgd_hmtd_fecha date NOT NULL,
    radi_nume_radi character varying(15) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    sgd_hmtd_obse character varying(600) NOT NULL,
    usua_doc numeric(13,0),
    depe_codi character varying(5),
    sgd_mtd_codigo numeric(4,0)
);


ALTER TABLE public.sgd_hmtd_hismatdoc OWNER TO orfeo_usr;

--
-- Name: sgd_hmtd_secue; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_hmtd_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999
    CACHE 1;


ALTER TABLE public.sgd_hmtd_secue OWNER TO orfeo_usr;

--
-- Name: sgd_info_secue; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_info_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.sgd_info_secue OWNER TO orfeo_usr;

--
-- Name: sgd_instorf_instanciasorfeo; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_instorf_instanciasorfeo (
    sgd_instorf_codi numeric(4,0),
    sgd_instorf_desc character varying(100)
);


ALTER TABLE public.sgd_instorf_instanciasorfeo OWNER TO orfeo_usr;

--
-- Name: sgd_lip_linkip; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_lip_linkip (
    sgd_lip_id numeric(4,0) NOT NULL,
    sgd_lip_ipini character varying(20) NOT NULL,
    sgd_lip_ipfin character varying(20),
    sgd_lip_dirintranet character varying(150) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_lip_arch character varying(70),
    sgd_lip_diascache numeric(5,0),
    sgd_lip_rutaftp character varying(150),
    sgd_lip_servftp character varying(50),
    sgd_lip_usbd character varying(20),
    sgd_lip_nombd character varying(20),
    sgd_lip_pwdbd character varying(20),
    sgd_lip_usftp character varying(20),
    sgd_lip_pwdftp character varying(30)
);


ALTER TABLE public.sgd_lip_linkip OWNER TO orfeo_usr;

--
-- Name: sgd_mat_matriz; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_mat_matriz (
    sgd_mat_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    sgd_fun_codigo numeric(4,0),
    sgd_prc_codigo numeric(4,0),
    sgd_prd_codigo numeric(4,0),
    sgd_mat_fech_ini date,
    sgd_mat_fech_fin date,
    sgd_mat_peso_prd numeric(5,2)
);


ALTER TABLE public.sgd_mat_matriz OWNER TO orfeo_usr;

--
-- Name: sgd_mat_secue; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_mat_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_mat_secue OWNER TO orfeo_usr;

--
-- Name: sgd_mpes_mddpeso; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_mpes_mddpeso (
    sgd_mpes_codigo numeric(5,0) NOT NULL,
    sgd_mpes_descrip character varying(10)
);


ALTER TABLE public.sgd_mpes_mddpeso OWNER TO orfeo_usr;

--
-- Name: sgd_mrd_matrird; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_mrd_matrird (
    sgd_mrd_codigo numeric(4,0) DEFAULT nextval('public.seq_sgd_mrd_codigo'::regclass) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_codigo numeric(4,0) NOT NULL,
    sgd_tpr_codigo numeric(4,0) NOT NULL,
    soporte character varying(50),
    sgd_mrd_fechini date,
    sgd_mrd_fechfin date,
    sgd_mrd_esta character varying(10)
);


ALTER TABLE public.sgd_mrd_matrird OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_mrd_matrird.sgd_mrd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_mrd_matrird.sgd_mrd_codigo IS 'Se agrega secuencia para la trd';


--
-- Name: sgd_msdep_msgdep; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_msdep_msgdep (
    sgd_msdep_codi numeric(15,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_msg_codi numeric(15,0) NOT NULL
);


ALTER TABLE public.sgd_msdep_msgdep OWNER TO orfeo_usr;

--
-- Name: sgd_msg_mensaje; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_msg_mensaje (
    sgd_msg_codi numeric(15,0) NOT NULL,
    sgd_tme_codi numeric(3,0) NOT NULL,
    sgd_msg_desc character varying(150),
    sgd_msg_fechdesp date NOT NULL,
    sgd_msg_url character varying(150) NOT NULL,
    sgd_msg_veces numeric(3,0) NOT NULL,
    sgd_msg_ancho numeric(6,0) NOT NULL,
    sgd_msg_largo numeric(6,0) NOT NULL
);


ALTER TABLE public.sgd_msg_mensaje OWNER TO orfeo_usr;

--
-- Name: sgd_mtd_matriz_doc; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_mtd_matriz_doc (
    sgd_mtd_codigo numeric(4,0) NOT NULL,
    sgd_mat_codigo numeric(4,0),
    sgd_tpr_codigo numeric(4,0)
);


ALTER TABLE public.sgd_mtd_matriz_doc OWNER TO orfeo_usr;

--
-- Name: sgd_noh_nohabiles; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_noh_nohabiles (
    noh_fecha date NOT NULL
);


ALTER TABLE public.sgd_noh_nohabiles OWNER TO orfeo_usr;

--
-- Name: sgd_not_notificacion; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_not_notificacion (
    sgd_not_codi numeric(3,0) NOT NULL,
    sgd_not_descrip character varying(100) NOT NULL
);


ALTER TABLE public.sgd_not_notificacion OWNER TO orfeo_usr;

--
-- Name: sgd_ntrd_notifrad; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_ntrd_notifrad (
    radi_nume_radi character varying(15) NOT NULL,
    sgd_not_codi numeric(3,0) NOT NULL,
    sgd_ntrd_notificador character varying(150),
    sgd_ntrd_notificado character varying(150),
    sgd_ntrd_fecha_not date,
    sgd_ntrd_num_edicto numeric(6,0),
    sgd_ntrd_fecha_fija date,
    sgd_ntrd_fecha_desfija date,
    sgd_ntrd_observaciones character varying(150)
);


ALTER TABLE public.sgd_ntrd_notifrad OWNER TO orfeo_usr;

--
-- Name: sgd_oem_oempresas; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_oem_oempresas (
    sgd_oem_codigo numeric(8,0) NOT NULL,
    tdid_codi numeric(2,0),
    sgd_oem_oempresa character varying(300),
    sgd_oem_rep_legal character varying(300),
    sgd_oem_nit character varying(20),
    sgd_oem_sigla character varying(1000),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_oem_direccion character varying(1000),
    sgd_oem_telefono character varying(1000),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170,
    email character varying(1000)
);


ALTER TABLE public.sgd_oem_oempresas OWNER TO orfeo_usr;

--
-- Name: sgd_oem_secue; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_oem_secue
    START WITH 18398
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.sgd_oem_secue OWNER TO orfeo_usr;

--
-- Name: sgd_panu_peranulados; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_panu_peranulados (
    sgd_panu_codi numeric(4,0),
    sgd_panu_desc character varying(200)
);


ALTER TABLE public.sgd_panu_peranulados OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_panu_peranulados; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_panu_peranulados IS 'Define los permisos de anulacion de documentos';


--
-- Name: COLUMN sgd_panu_peranulados.sgd_panu_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_panu_peranulados.sgd_panu_codi IS 'Descripcion';


--
-- Name: sgd_parametro; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_parametro (
    param_nomb character varying(25) NOT NULL,
    param_codi numeric(5,0) NOT NULL,
    param_valor character varying(25) NOT NULL
);


ALTER TABLE public.sgd_parametro OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_parametro; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_parametro IS 'Almacena parametros compuestos por dos valores: identificador y valor';


--
-- Name: COLUMN sgd_parametro.param_nomb; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_parametro.param_nomb IS 'Nombre del tipo de parametro';


--
-- Name: COLUMN sgd_parametro.param_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_parametro.param_codi IS 'Codigo identificador del parametro';


--
-- Name: COLUMN sgd_parametro.param_valor; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_parametro.param_valor IS 'Valor del parametro';


--
-- Name: sgd_parexp_paramexpediente; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_parexp_paramexpediente (
    sgd_parexp_codigo integer DEFAULT nextval('public.seq_parexp_paramexpediente'::regclass) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    sgd_parexp_tabla character varying(30) NOT NULL,
    sgd_parexp_etiqueta character varying(30) NOT NULL,
    sgd_parexp_orden numeric(1,0),
    sgd_parexp_editable numeric(1,0)
);


ALTER TABLE public.sgd_parexp_paramexpediente OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_parexp_paramexpediente.sgd_parexp_editable; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_parexp_paramexpediente.sgd_parexp_editable IS '1 o 0';


--
-- Name: sgd_pen_pensionados; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_pen_pensionados (
    tdid_codi numeric(2,0),
    sgd_ciu_codigo numeric(8,0) NOT NULL,
    sgd_ciu_nombre character varying(150),
    sgd_ciu_direccion character varying(150),
    sgd_ciu_apell1 character varying(50),
    sgd_ciu_apell2 character varying(50),
    sgd_ciu_telefono character varying(50),
    sgd_ciu_email character varying(50),
    muni_codi numeric(4,0),
    dpto_codi numeric(2,0),
    sgd_ciu_cedula character varying(20),
    id_cont numeric(2,0) DEFAULT 1,
    id_pais numeric(4,0) DEFAULT 170
);


ALTER TABLE public.sgd_pen_pensionados OWNER TO orfeo_usr;

--
-- Name: sgd_pexp_procexpedientes; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_pexp_procexpedientes (
    sgd_pexp_codigo numeric NOT NULL,
    sgd_pexp_descrip character varying(100),
    sgd_pexp_terminos numeric DEFAULT 0,
    sgd_srd_codigo numeric(3,0),
    sgd_sbrd_codigo numeric(3,0),
    sgd_pexp_automatico numeric(1,0) DEFAULT 1,
    sgd_pexp_tieneflujo numeric(1,0) DEFAULT 0
);


ALTER TABLE public.sgd_pexp_procexpedientes OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pexp_procexpedientes.sgd_pexp_codigo IS 'Codigo que identifica el proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_descrip; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pexp_procexpedientes.sgd_pexp_descrip IS 'Nombre del proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_terminos; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pexp_procexpedientes.sgd_pexp_terminos IS 'termino del proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pexp_procexpedientes.sgd_srd_codigo IS 'Serie (trd) que identifica el proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pexp_procexpedientes.sgd_sbrd_codigo IS 'Subserie (trd) que identifica el proceso';


--
-- Name: COLUMN sgd_pexp_procexpedientes.sgd_pexp_tieneflujo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pexp_procexpedientes.sgd_pexp_tieneflujo IS 'Si el expediente tiene flujo';


--
-- Name: sgd_plg_secue; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_plg_secue
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999
    CACHE 1;


ALTER TABLE public.sgd_plg_secue OWNER TO orfeo_usr;

--
-- Name: sgd_pnufe_procnumfe; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_pnufe_procnumfe (
    sgd_pnufe_codi numeric(4,0) NOT NULL,
    sgd_tpr_codigo numeric(4,0),
    sgd_pnufe_descrip character varying(150),
    sgd_pnufe_serie character varying(50)
);


ALTER TABLE public.sgd_pnufe_procnumfe OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_pnufe_procnumfe; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_pnufe_procnumfe IS 'Cataloga los procesos de numeracion y fechado';


--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pnufe_procnumfe.sgd_pnufe_codi IS 'Codigo del proceso';


--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pnufe_procnumfe.sgd_tpr_codigo IS 'Codigo del documento que genera el procedimiento';


--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_descrip; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pnufe_procnumfe.sgd_pnufe_descrip IS 'Descripcion del procedimiento generado';


--
-- Name: COLUMN sgd_pnufe_procnumfe.sgd_pnufe_serie; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pnufe_procnumfe.sgd_pnufe_serie IS 'Serie que maneja la numeracion de los documentos';


--
-- Name: sgd_pnun_procenum; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_pnun_procenum (
    sgd_pnun_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    depe_codi character varying(5),
    sgd_pnun_prepone character varying(50)
);


ALTER TABLE public.sgd_pnun_procenum OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnun_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pnun_procenum.sgd_pnun_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnufe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pnun_procenum.sgd_pnufe_codi IS 'Codigo del proceso';


--
-- Name: COLUMN sgd_pnun_procenum.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pnun_procenum.depe_codi IS 'Codigo de la dependencia';


--
-- Name: COLUMN sgd_pnun_procenum.sgd_pnun_prepone; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_pnun_procenum.sgd_pnun_prepone IS 'Preposicion empleada para generar el numero completo del documento';


--
-- Name: sgd_prc_proceso; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_prc_proceso (
    sgd_prc_codigo numeric(4,0) NOT NULL,
    sgd_prc_descrip character varying(150),
    sgd_prc_fech_ini date,
    sgd_prc_fech_fin date
);


ALTER TABLE public.sgd_prc_proceso OWNER TO orfeo_usr;

--
-- Name: sgd_prd_prcdmentos; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_prd_prcdmentos (
    sgd_prd_codigo numeric(4,0) NOT NULL,
    sgd_prd_descrip character varying(200),
    sgd_prd_fech_ini date,
    sgd_prd_fech_fin date
);


ALTER TABLE public.sgd_prd_prcdmentos OWNER TO orfeo_usr;

--
-- Name: sgd_rda_retdoca; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_rda_retdoca (
    anex_radi_nume numeric(15,0) NOT NULL,
    anex_codigo character varying(20) NOT NULL,
    radi_nume_salida character varying(15),
    anex_borrado character varying(1),
    sgd_mrd_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_rda_fech date,
    sgd_deve_codigo numeric(2,0),
    anex_solo_lect character varying(1),
    anex_radi_fech date,
    anex_estado numeric(1,0),
    anex_nomb_archivo character varying(50),
    anex_tipo numeric(4,0),
    sgd_dir_tipo numeric(4,0)
);


ALTER TABLE public.sgd_rda_retdoca OWNER TO orfeo_usr;

--
-- Name: sgd_rdf_retdocf; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_rdf_retdocf (
    sgd_mrd_codigo numeric(4,0) NOT NULL,
    radi_nume_radi character varying(30) NOT NULL,
    depe_codi character varying(5) NOT NULL,
    usua_codi numeric(10,0) NOT NULL,
    usua_doc character varying(14) NOT NULL,
    sgd_rdf_fech date NOT NULL
);


ALTER TABLE public.sgd_rdf_retdocf OWNER TO orfeo_usr;

--
-- Name: sgd_renv_regenvio; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_renv_regenvio (
    sgd_renv_codigo numeric NOT NULL,
    sgd_fenv_codigo numeric,
    sgd_renv_fech timestamp without time zone,
    radi_nume_sal character varying(30),
    sgd_renv_destino character varying,
    sgd_renv_telefono character varying,
    sgd_renv_mail character varying,
    sgd_renv_peso character varying,
    sgd_renv_valor numeric,
    sgd_renv_certificado numeric,
    sgd_renv_estado numeric,
    usua_doc numeric,
    sgd_renv_nombre character varying,
    sgd_rem_destino numeric DEFAULT 0,
    sgd_dir_codigo numeric,
    sgd_renv_planilla character varying(8),
    sgd_renv_fech_sal timestamp without time zone,
    depe_codi character varying(5),
    sgd_dir_tipo numeric(4,0) DEFAULT 0,
    radi_nume_grupo character varying(30),
    sgd_renv_dir character varying(100),
    sgd_renv_depto character varying(30),
    sgd_renv_mpio character varying(30),
    sgd_renv_tel character varying(20),
    sgd_renv_cantidad numeric(4,0) DEFAULT 0,
    sgd_renv_tipo numeric(1,0) DEFAULT 0,
    sgd_renv_observa character varying(200),
    sgd_renv_grupo numeric(14,0),
    sgd_deve_codigo numeric(2,0),
    sgd_deve_fech timestamp without time zone,
    sgd_renv_valortotal character varying(14) DEFAULT 0,
    sgd_renv_valistamiento character varying(10) DEFAULT 0,
    sgd_renv_vdescuento character varying(10) DEFAULT 0,
    sgd_renv_vadicional character varying(14) DEFAULT 0,
    sgd_depe_genera character varying(5),
    sgd_renv_pais character varying(30) DEFAULT 'colombia'::character varying,
    sgd_renv_guia character varying(100)
);


ALTER TABLE public.sgd_renv_regenvio OWNER TO orfeo_usr;

--
-- Name: sgd_rmr_radmasivre; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_rmr_radmasivre (
    sgd_rmr_grupo character varying(15) NOT NULL,
    sgd_rmr_radi character varying(15) NOT NULL
);


ALTER TABLE public.sgd_rmr_radmasivre OWNER TO orfeo_usr;

--
-- Name: sgd_sbrd_subserierd; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_sbrd_subserierd (
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_codigo numeric(4,0) NOT NULL,
    sgd_sbrd_descrip character varying(500) NOT NULL,
    sgd_sbrd_fechini date NOT NULL,
    sgd_sbrd_fechfin date NOT NULL,
    sgd_sbrd_tiemag numeric(4,0),
    sgd_sbrd_tiemac numeric(4,0),
    sgd_sbrd_dispfin character varying(50),
    sgd_sbrd_soporte character varying(50),
    sgd_sbrd_procedi character varying(1500),
    id_tabla numeric(4,0) DEFAULT nextval('public.secr_subseries_id_tabla'::regclass) NOT NULL
);


ALTER TABLE public.sgd_sbrd_subserierd OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_sbrd_subserierd.id_tabla; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sbrd_subserierd.id_tabla IS 'Secuencia que controla la creación de subseries mediante el sistema';


--
-- Name: sgd_sed_sede; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_sed_sede (
    sgd_sed_codi numeric(4,0) NOT NULL,
    sgd_sed_desc character varying(50)
);


ALTER TABLE public.sgd_sed_sede OWNER TO orfeo_usr;

--
-- Name: sgd_senuf_secnumfe; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_senuf_secnumfe (
    sgd_senuf_codi numeric(4,0) NOT NULL,
    sgd_pnufe_codi numeric(4,0),
    depe_codi character varying(5),
    sgd_senuf_sec character varying(50)
);


ALTER TABLE public.sgd_senuf_secnumfe OWNER TO orfeo_usr;

--
-- Name: sgd_sexp_secexpedientes; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_sexp_secexpedientes (
    sgd_exp_numero character varying(30) NOT NULL,
    sgd_srd_codigo numeric,
    sgd_sbrd_codigo numeric,
    sgd_sexp_secuencia numeric NOT NULL,
    depe_codi character varying(5),
    usua_doc character varying(15),
    sgd_sexp_fech date,
    sgd_fexp_codigo numeric,
    sgd_sexp_ano numeric,
    usua_doc_responsable character varying(18),
    sgd_sexp_parexp1 character varying(250),
    sgd_sexp_parexp2 character varying(160),
    sgd_sexp_parexp3 character varying(160),
    sgd_sexp_parexp4 character varying(160),
    sgd_sexp_parexp5 character varying(160),
    sgd_pexp_codigo numeric(3,0),
    sgd_exp_fech_arch date,
    sgd_fld_codigo numeric(3,0),
    sgd_exp_fechflujoant date,
    sgd_mrd_codigo numeric(4,0),
    sgd_exp_subexpediente numeric(18,0),
    sgd_exp_privado numeric(1,0),
    sgd_sexp_estado numeric(1,0) DEFAULT 0 NOT NULL
);


ALTER TABLE public.sgd_sexp_secexpedientes OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_exp_numero; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.sgd_exp_numero IS 'Numero del expediente';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.sgd_srd_codigo IS 'codigo serie';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.sgd_sbrd_codigo IS 'codigo subserie';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_secuencia; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.sgd_sexp_secuencia IS 'numero del expediente';


--
-- Name: COLUMN sgd_sexp_secexpedientes.depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.depe_codi IS 'Dependencia creadora';


--
-- Name: COLUMN sgd_sexp_secexpedientes.usua_doc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.usua_doc IS 'Documento del usuario creador';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_fech; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.sgd_sexp_fech IS 'Fecha de inicio del proceso';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_fexp_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.sgd_fexp_codigo IS 'Codigo de proceso';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_ano; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.sgd_sexp_ano IS 'A?o del expediente';


--
-- Name: COLUMN sgd_sexp_secexpedientes.sgd_sexp_estado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_sexp_secexpedientes.sgd_sexp_estado IS 'Estado de transferencia, 0 ninguna, 1 primaria, 2, secundaria, 3 eliminado';


--
-- Name: sgd_srd_seriesrd; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_srd_seriesrd (
    sgd_srd_codigo numeric(4,0) NOT NULL,
    sgd_srd_descrip character varying(500) NOT NULL,
    sgd_srd_fechini date NOT NULL,
    sgd_srd_fechfin date NOT NULL
);


ALTER TABLE public.sgd_srd_seriesrd OWNER TO orfeo_usr;

--
-- Name: sgd_tar_tarifas; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tar_tarifas (
    sgd_fenv_codigo numeric(5,0),
    sgd_tar_codser numeric(5,0),
    sgd_tar_codigo numeric(5,0),
    sgd_tar_valenv1 numeric(15,0),
    sgd_tar_valenv2 numeric(15,0),
    sgd_tar_valenv1g1 numeric(15,0),
    sgd_clta_codser numeric(5,0),
    sgd_tar_valenv2g2 numeric(15,0),
    sgd_clta_descrip character varying(100)
);


ALTER TABLE public.sgd_tar_tarifas OWNER TO orfeo_usr;

--
-- Name: sgd_tdec_tipodecision; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tdec_tipodecision (
    sgd_apli_codi numeric(4,0) NOT NULL,
    sgd_tdec_codigo numeric(4,0) NOT NULL,
    sgd_tdec_descrip character varying(150),
    sgd_tdec_sancionar numeric(1,0),
    sgd_tdec_firmeza numeric(1,0),
    sgd_tdec_versancion numeric(1,0),
    sgd_tdec_showmenu numeric(1,0),
    sgd_tdec_updnotif numeric(1,0),
    sgd_tdec_veragota numeric(1,0)
);


ALTER TABLE public.sgd_tdec_tipodecision OWNER TO orfeo_usr;

--
-- Name: sgd_tid_tipdecision; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tid_tipdecision (
    sgd_tid_codi numeric(4,0) NOT NULL,
    sgd_tid_desc character varying(150),
    sgd_tpr_codigo numeric(4,0),
    sgd_pexp_codigo numeric(2,0),
    sgd_tpr_codigop numeric(2,0)
);


ALTER TABLE public.sgd_tid_tipdecision OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_tid_tipdecision; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_tid_tipdecision IS 'Tipos de decision';


--
-- Name: COLUMN sgd_tid_tipdecision.sgd_tid_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tid_tipdecision.sgd_tid_codi IS 'Id del registro';


--
-- Name: COLUMN sgd_tid_tipdecision.sgd_tid_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tid_tipdecision.sgd_tid_desc IS 'Descripcion';


--
-- Name: sgd_tidm_tidocmasiva; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tidm_tidocmasiva (
    sgd_tidm_codi numeric(4,0) NOT NULL,
    sgd_tidm_desc character varying(150)
);


ALTER TABLE public.sgd_tidm_tidocmasiva OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_tidm_tidocmasiva; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_tidm_tidocmasiva IS 'Cataloga los documentos que hacen parte del procedimiento de correspondencia masiva';


--
-- Name: COLUMN sgd_tidm_tidocmasiva.sgd_tidm_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tidm_tidocmasiva.sgd_tidm_codi IS 'Codigo del documento';


--
-- Name: COLUMN sgd_tidm_tidocmasiva.sgd_tidm_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tidm_tidocmasiva.sgd_tidm_desc IS 'Descripcion';


--
-- Name: sgd_tip3_tipotercero; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tip3_tipotercero (
    sgd_tip3_codigo numeric(2,0) NOT NULL,
    sgd_dir_tipo numeric(4,0),
    sgd_tip3_nombre character varying(15),
    sgd_tip3_desc character varying(30),
    sgd_tip3_imgpestana character varying(20),
    sgd_tpr_tp1 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp2 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp4 smallint DEFAULT 1
);


ALTER TABLE public.sgd_tip3_tipotercero OWNER TO orfeo_usr;

--
-- Name: sgd_tma_temas; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tma_temas (
    sgd_tma_codigo numeric(4,0) NOT NULL,
    depe_codi character varying(5),
    sgd_prc_codigo numeric(4,0),
    sgd_tma_descrip character varying(150)
);


ALTER TABLE public.sgd_tma_temas OWNER TO orfeo_usr;

--
-- Name: sgd_tme_tipmen; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tme_tipmen (
    sgd_tme_codi numeric(3,0) NOT NULL,
    sgd_tme_desc character varying(150)
);


ALTER TABLE public.sgd_tme_tipmen OWNER TO orfeo_usr;

--
-- Name: sgd_tpr_tpdcumento; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tpr_tpdcumento (
    sgd_tpr_codigo numeric(4,0) NOT NULL,
    sgd_tpr_descrip character varying(500),
    sgd_tpr_termino numeric(4,0),
    sgd_tpr_tpuso numeric(1,0),
    sgd_tpr_numera character(1),
    sgd_tpr_radica character(1),
    sgd_tpr_tp1 numeric(1,0) DEFAULT 0,
    sgd_tpr_tp2 numeric(1,0) DEFAULT 0,
    sgd_tpr_estado numeric(1,0),
    sgd_termino_real numeric(4,0),
    sgd_tpr_web smallint DEFAULT 0,
    sgd_tpr_tiptermino character varying(5),
    sgd_tpr_tp4 numeric(1,0) DEFAULT 0
);


ALTER TABLE public.sgd_tpr_tpdcumento OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_numera; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tpr_tpdcumento.sgd_tpr_numera IS 'INDICA SI UN DOCUMNTO PUEDE NUMERARSE';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_radica; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tpr_tpdcumento.sgd_tpr_radica IS 'INDICA SI UN DOCUMNTO PUEDE RADICARSE';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp1; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tpr_tpdcumento.sgd_tpr_tp1 IS 'Radicados de salida';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_tp2; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tpr_tpdcumento.sgd_tpr_tp2 IS 'Radicados de entrada';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_estado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tpr_tpdcumento.sgd_tpr_estado IS 'Estado del documento 1- habilitado 2- deshabilitado';


--
-- Name: COLUMN sgd_tpr_tpdcumento.sgd_tpr_web; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tpr_tpdcumento.sgd_tpr_web IS 'Indica si se debe mostrar o no el tipo documental en el fomulario de PQRS';


--
-- Name: sgd_trad_tiporad; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_trad_tiporad (
    sgd_trad_codigo numeric(2,0) NOT NULL,
    sgd_trad_descr character varying(30),
    sgd_trad_icono character varying(30),
    sgd_trad_diasbloqueo numeric(2,0),
    sgd_trad_genradsal smallint,
    tiporadi_email numeric(1,0) DEFAULT 0,
    mostrar_como_tipo numeric(1,0) DEFAULT 1
);


ALTER TABLE public.sgd_trad_tiporad OWNER TO orfeo_usr;

--
-- Name: COLUMN sgd_trad_tiporad.mostrar_como_tipo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_trad_tiporad.mostrar_como_tipo IS 'Indica si se debe mostrar o no como tipo de radicado en el sistema aplica mas que todo para PQRS';


--
-- Name: sgd_transfe_documentales; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_transfe_documentales (
    id_trans numeric(15,0) NOT NULL,
    sgd_exp_numero character varying(20),
    sgd_srd_codigo numeric(4,0),
    sgd_sbrd_codigo numeric(4,0),
    sgd_tpr_codigo numeric(4,0),
    radi_nume_radi character varying(30),
    fecha_archivado timestamp with time zone,
    depe_codi_arch character varying(5),
    usua_codi_arch numeric(10,0),
    fecha_transferencia timestamp with time zone,
    depe_codi_trans character varying(5),
    usua_codi_trans numeric(10,0),
    nombre_archivo character varying(100)
);


ALTER TABLE public.sgd_transfe_documentales OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_transfe_documentales; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_transfe_documentales IS 'Registra las transferencias documentales';


--
-- Name: COLUMN sgd_transfe_documentales.id_trans; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.id_trans IS 'Id unico de la tabla';


--
-- Name: COLUMN sgd_transfe_documentales.sgd_exp_numero; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.sgd_exp_numero IS 'Numero de expediente';


--
-- Name: COLUMN sgd_transfe_documentales.sgd_srd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.sgd_srd_codigo IS 'Codigo Serie';


--
-- Name: COLUMN sgd_transfe_documentales.sgd_sbrd_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.sgd_sbrd_codigo IS 'Codigo Subserie';


--
-- Name: COLUMN sgd_transfe_documentales.sgd_tpr_codigo; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.sgd_tpr_codigo IS 'Codigo tipo documental';


--
-- Name: COLUMN sgd_transfe_documentales.radi_nume_radi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.radi_nume_radi IS 'Numero radicado';


--
-- Name: COLUMN sgd_transfe_documentales.fecha_archivado; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.fecha_archivado IS 'Fecha archivado';


--
-- Name: COLUMN sgd_transfe_documentales.depe_codi_arch; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.depe_codi_arch IS 'Dependencia de usuario que archivo';


--
-- Name: COLUMN sgd_transfe_documentales.usua_codi_arch; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.usua_codi_arch IS 'Codigo de usuario que archivo';


--
-- Name: COLUMN sgd_transfe_documentales.fecha_transferencia; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.fecha_transferencia IS 'Fecha de transaccion documental';


--
-- Name: COLUMN sgd_transfe_documentales.depe_codi_trans; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.depe_codi_trans IS 'Dependencia de usuario que transfirio';


--
-- Name: COLUMN sgd_transfe_documentales.usua_codi_trans; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_transfe_documentales.usua_codi_trans IS 'Codigo de usuario que transfirio';


--
-- Name: sgd_ttr_transaccion; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_ttr_transaccion (
    sgd_ttr_codigo numeric(3,0) NOT NULL,
    sgd_ttr_descrip character varying(100) NOT NULL
);


ALTER TABLE public.sgd_ttr_transaccion OWNER TO orfeo_usr;

--
-- Name: sgd_tvd_depe_id; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sgd_tvd_depe_id
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE public.sgd_tvd_depe_id OWNER TO orfeo_usr;

--
-- Name: sgd_tvd_dependencia; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tvd_dependencia (
    sgd_depe_codi character varying(5) NOT NULL,
    sgd_depe_nombre character varying(200) NOT NULL,
    sgd_depe_fechini date NOT NULL,
    sgd_depe_fechfin date NOT NULL
);


ALTER TABLE public.sgd_tvd_dependencia OWNER TO orfeo_usr;

--
-- Name: sgd_tvd_series; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_tvd_series (
    sgd_depe_codi character varying(5) NOT NULL,
    sgd_stvd_codi numeric(4,0) NOT NULL,
    sgd_stvd_nombre character varying(200) NOT NULL,
    sgd_stvd_ac numeric(4,0),
    sgd_stvd_dispfin numeric(2,0),
    sgd_stvd_proc character varying(500)
);


ALTER TABLE public.sgd_tvd_series OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_tvd_series; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_tvd_series IS 'Series de TVD';


--
-- Name: COLUMN sgd_tvd_series.sgd_depe_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tvd_series.sgd_depe_codi IS 'Codigo de dependencia TVD';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tvd_series.sgd_stvd_codi IS 'Codigo de serieTVD';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_nombre; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tvd_series.sgd_stvd_nombre IS 'Nombre de serie TVD';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_ac; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tvd_series.sgd_stvd_ac IS 'Retencion en AC';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_dispfin; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tvd_series.sgd_stvd_dispfin IS 'Disposicion final';


--
-- Name: COLUMN sgd_tvd_series.sgd_stvd_proc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.sgd_tvd_series.sgd_stvd_proc IS 'procedimiento';


--
-- Name: sgd_ush_usuhistorico; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_ush_usuhistorico (
    sgd_ush_admcod numeric(10,0) NOT NULL,
    sgd_ush_admdep character varying(5) NOT NULL,
    sgd_ush_admdoc character varying(14) NOT NULL,
    sgd_ush_usucod numeric(10,0) NOT NULL,
    sgd_ush_usudep character varying(5) NOT NULL,
    sgd_ush_usudoc character varying(14) NOT NULL,
    sgd_ush_modcod numeric(5,0) NOT NULL,
    sgd_ush_fechevento date NOT NULL,
    sgd_ush_usulogin character varying(20) NOT NULL
);


ALTER TABLE public.sgd_ush_usuhistorico OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_ush_usuhistorico; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_ush_usuhistorico IS 'Representa las modificaciones hechas a los usuarios. Registro historico por usuario sobre el tipo de transaccion realizada y los cambios con fecha y hora de realizacion.';


--
-- Name: sgd_usm_usumodifica; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sgd_usm_usumodifica (
    sgd_usm_modcod numeric(5,0) NOT NULL,
    sgd_usm_moddescr character varying(60) NOT NULL
);


ALTER TABLE public.sgd_usm_usumodifica OWNER TO orfeo_usr;

--
-- Name: TABLE sgd_usm_usumodifica; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sgd_usm_usumodifica IS 'Contiene los tipos de modificaciones que se pueden hacer a los usuarios del sistema.';


--
-- Name: sphinx_index_meta; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sphinx_index_meta (
    index_name character varying(50) NOT NULL,
    max_id integer NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.sphinx_index_meta OWNER TO orfeo_usr;

--
-- Name: TABLE sphinx_index_meta; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sphinx_index_meta IS 'sphinx_index_meta esta tabla se usa para dejar una marca de tiempo cada vez que se ejecuta el proceso de indexación';


--
-- Name: sphinx_index_remove; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.sphinx_index_remove (
    id integer NOT NULL,
    indice integer NOT NULL,
    estado numeric(1,0) NOT NULL,
    fecha_creacion timestamp with time zone NOT NULL,
    fecha_ejecucion timestamp with time zone,
    identificador character varying(30) NOT NULL
);


ALTER TABLE public.sphinx_index_remove OWNER TO orfeo_usr;

--
-- Name: TABLE sphinx_index_remove; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.sphinx_index_remove IS 'sphinx_index_remove se usa para indicarle a sphinx que registros debe eliminar, orfeo carga datos en esta tabla cuando actualizan un anexo cargado con skinascan';


--
-- Name: sphinx_index_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.sphinx_index_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sphinx_index_meta_id_seq OWNER TO orfeo_usr;

--
-- Name: sphinx_index_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.sphinx_index_meta_id_seq OWNED BY public.sphinx_index_remove.id;


--
-- Name: tipo_doc_identificacion; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.tipo_doc_identificacion (
    tdid_codi numeric(2,0) NOT NULL,
    tdid_desc character varying(100) NOT NULL
);


ALTER TABLE public.tipo_doc_identificacion OWNER TO orfeo_usr;

--
-- Name: TABLE tipo_doc_identificacion; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.tipo_doc_identificacion IS 'TIPO_DOC_IDENTIFICACION';


--
-- Name: COLUMN tipo_doc_identificacion.tdid_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.tipo_doc_identificacion.tdid_codi IS 'CODIGO DEL TIPO DE DOCUMENTO DE IDENTIFICACION';


--
-- Name: COLUMN tipo_doc_identificacion.tdid_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.tipo_doc_identificacion.tdid_desc IS 'DESCIPCION DEL TIPO DE DOCUMENTO DE IDENTIFICACION';


--
-- Name: tipo_poblacion_pqrs_id_tp_pqrs_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.tipo_poblacion_pqrs_id_tp_pqrs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_poblacion_pqrs_id_tp_pqrs_seq OWNER TO orfeo_usr;

--
-- Name: tipo_poblacion_pqrs; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.tipo_poblacion_pqrs (
    id_tp_pqrs integer DEFAULT nextval('public.tipo_poblacion_pqrs_id_tp_pqrs_seq'::regclass) NOT NULL,
    tipo_p_pqrs character varying
);


ALTER TABLE public.tipo_poblacion_pqrs OWNER TO orfeo_usr;

--
-- Name: tipo_remitente; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.tipo_remitente (
    trte_codi numeric(2,0) NOT NULL,
    trte_desc character varying(100) NOT NULL,
    aplica_pqrs numeric(2,0) DEFAULT 0
);


ALTER TABLE public.tipo_remitente OWNER TO orfeo_usr;

--
-- Name: TABLE tipo_remitente; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.tipo_remitente IS 'TIPO_REMITENTE';


--
-- Name: COLUMN tipo_remitente.trte_codi; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.tipo_remitente.trte_codi IS 'CODIGO TIPO DE REMITENTE';


--
-- Name: COLUMN tipo_remitente.trte_desc; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.tipo_remitente.trte_desc IS 'DESC DEL TIPO DE REMITENTE';


--
-- Name: COLUMN tipo_remitente.aplica_pqrs; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public.tipo_remitente.aplica_pqrs IS 'indica si se muestra o no en el formulario de PQRS 0=No, 10= SI';


--
-- Name: tipo_tratamiento_pqrs_id_tipo_t_pqrs_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.tipo_tratamiento_pqrs_id_tipo_t_pqrs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE public.tipo_tratamiento_pqrs_id_tipo_t_pqrs_seq OWNER TO orfeo_usr;

--
-- Name: tipo_tratamiento_pqrs; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.tipo_tratamiento_pqrs (
    id_tipo_t_pqrs integer DEFAULT nextval('public.tipo_tratamiento_pqrs_id_tipo_t_pqrs_seq'::regclass) NOT NULL,
    tipo_t_pqrs character varying NOT NULL
);


ALTER TABLE public.tipo_tratamiento_pqrs OWNER TO orfeo_usr;

--
-- Name: tipo_usuario_grupo; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.tipo_usuario_grupo (
    id_grupo_tipo_usuario integer NOT NULL,
    nombre_tipo_usuario character varying(30),
    estdo_tipo_usuario numeric(1,0)
);


ALTER TABLE public.tipo_usuario_grupo OWNER TO orfeo_usr;

--
-- Name: tipo_usuario_grupo_id_grupo_tipo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.tipo_usuario_grupo_id_grupo_tipo_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_usuario_grupo_id_grupo_tipo_usuario_seq OWNER TO orfeo_usr;

--
-- Name: tipo_usuario_grupo_id_grupo_tipo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.tipo_usuario_grupo_id_grupo_tipo_usuario_seq OWNED BY public.tipo_usuario_grupo.id_grupo_tipo_usuario;


--
-- Name: tipos_comunicaciones; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.tipos_comunicaciones (
    id_tipos_comunicaciones integer NOT NULL,
    nombre_tipos_comunicaciones character varying
);


ALTER TABLE public.tipos_comunicaciones OWNER TO orfeo_usr;

--
-- Name: TABLE tipos_comunicaciones; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.tipos_comunicaciones IS 'En esta tabla se guarda la información de las diferentes pestañas incluidas en el archivo entregado por el cliente';


--
-- Name: tipos_comunicaciones_id_tipos_comunicaciones_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.tipos_comunicaciones_id_tipos_comunicaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_comunicaciones_id_tipos_comunicaciones_seq OWNER TO orfeo_usr;

--
-- Name: tipos_comunicaciones_id_tipos_comunicaciones_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.tipos_comunicaciones_id_tipos_comunicaciones_seq OWNED BY public.tipos_comunicaciones.id_tipos_comunicaciones;


--
-- Name: ubicacion_fisica; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.ubicacion_fisica (
    ubic_depe_radi character varying(5),
    ubic_depe_arch character varying(5)
);


ALTER TABLE public.ubicacion_fisica OWNER TO orfeo_usr;

--
-- Name: user; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    password_reset_token character varying(255),
    email character varying(255),
    status smallint DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    verification_token character varying(255) DEFAULT NULL::character varying,
    security_questions integer DEFAULT 0
);


ALTER TABLE public."user" OWNER TO orfeo_usr;

--
-- Name: COLUMN "user".security_questions; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON COLUMN public."user".security_questions IS '0 = sin metodo de Recuperacion de cuenta  1 = metodo por Preguntas 2 = metodo por correo ';


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO orfeo_usr;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: usuarios_grupos_informados; Type: TABLE; Schema: public; Owner: orfeo_usr
--

CREATE TABLE public.usuarios_grupos_informados (
    id_usuarios_grupos_informados integer NOT NULL,
    id_grupos_informados integer NOT NULL,
    usua_login character varying(50) NOT NULL,
    usuario_grupo_activo integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.usuarios_grupos_informados OWNER TO orfeo_usr;

--
-- Name: TABLE usuarios_grupos_informados; Type: COMMENT; Schema: public; Owner: orfeo_usr
--

COMMENT ON TABLE public.usuarios_grupos_informados IS 'Se utiliza para relacionar los usuarios con los grupos';


--
-- Name: usuarios_grupos_informados_id_usuarios_grupos_informados_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.usuarios_grupos_informados_id_usuarios_grupos_informados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_grupos_informados_id_usuarios_grupos_informados_seq OWNER TO orfeo_usr;

--
-- Name: usuarios_grupos_informados_id_usuarios_grupos_informados_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.usuarios_grupos_informados_id_usuarios_grupos_informados_seq OWNED BY public.usuarios_grupos_informados.id_usuarios_grupos_informados;


--
-- Name: usuarios_grupos_informados_seq; Type: SEQUENCE; Schema: public; Owner: orfeo_usr
--

CREATE SEQUENCE public.usuarios_grupos_informados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_grupos_informados_seq OWNER TO orfeo_usr;

--
-- Name: usuarios_grupos_informados_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: orfeo_usr
--

ALTER SEQUENCE public.usuarios_grupos_informados_seq OWNED BY public.usuarios_grupos_informados.id_usuarios_grupos_informados;


--
-- Name: carpeta_per id_caperta_per; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.carpeta_per ALTER COLUMN id_caperta_per SET DEFAULT nextval('public.carpeta_per_id_caperta_per_seq'::regclass);


--
-- Name: configuracion_contrasena idConfiguracionContracsena; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.configuracion_contrasena ALTER COLUMN "idConfiguracionContracsena" SET DEFAULT nextval('public."configuracion_contrasena_idConfiguracionContracsena_seq"'::regclass);


--
-- Name: configuracion_general_fondo id_campo_configuracion_fondo; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.configuracion_general_fondo ALTER COLUMN id_campo_configuracion_fondo SET DEFAULT nextval('public.configuracion_general_fondo_id_campo_configuracion_fondo_seq'::regclass);


--
-- Name: contrasenas_guardadas id_contrasena_guardada; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.contrasenas_guardadas ALTER COLUMN id_contrasena_guardada SET DEFAULT nextval('public.contrasenas_guardadas_id_contrasena_guardada_seq'::regclass);


--
-- Name: datosocr indice; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.datosocr ALTER COLUMN indice SET DEFAULT nextval('public.datosocr_indice_seq'::regclass);


--
-- Name: direccion_usuarios id; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.direccion_usuarios ALTER COLUMN id SET DEFAULT nextval('public.direccion_usuarios_id_seq'::regclass);


--
-- Name: estado_civil_pqrs id_estado_civil_pqrs; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.estado_civil_pqrs ALTER COLUMN id_estado_civil_pqrs SET DEFAULT nextval('public.estado_civil_pqrs_id_estado_civil_pqrs_seq'::regclass);


--
-- Name: grupos_informados id_grupos_informados; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.grupos_informados ALTER COLUMN id_grupos_informados SET DEFAULT nextval('public.grupos_informados_seq'::regclass);


--
-- Name: perfiles codi_perfil; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.perfiles ALTER COLUMN codi_perfil SET DEFAULT nextval('public.perfiles_codi_perfil_seq'::regclass);


--
-- Name: preguntas id_preguntas; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.preguntas ALTER COLUMN id_preguntas SET DEFAULT nextval('public."Preguntas_id_preguntas_seq"'::regclass);


--
-- Name: respuestas_usuario id_Respuestas_Usuario; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.respuestas_usuario ALTER COLUMN "id_Respuestas_Usuario" SET DEFAULT nextval('public."Respuestas_Usuario_id_Respuestas_Usuario_seq"'::regclass);


--
-- Name: rol_tipos_doc cod_rol_tipos; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.rol_tipos_doc ALTER COLUMN cod_rol_tipos SET DEFAULT nextval('public.sec_rol_tipos_doc'::regclass);


--
-- Name: roles cod_rol; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.roles ALTER COLUMN cod_rol SET DEFAULT nextval('public.roles_cod_rol_seq'::regclass);


--
-- Name: sgd_ejes_tematicos id_sgd_eje_tematico; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_ejes_tematicos ALTER COLUMN id_sgd_eje_tematico SET DEFAULT nextval('public.sgd_ejes_tematicos_id_sgd_eje_tematico_seq'::regclass);


--
-- Name: sgd_ejes_tematicos_dependencia id_sgd_eje_tematico_dependencia; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_ejes_tematicos_dependencia ALTER COLUMN id_sgd_eje_tematico_dependencia SET DEFAULT nextval('public.sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq'::regclass);


--
-- Name: sphinx_index_remove id; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sphinx_index_remove ALTER COLUMN id SET DEFAULT nextval('public.sphinx_index_meta_id_seq'::regclass);


--
-- Name: tipo_usuario_grupo id_grupo_tipo_usuario; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.tipo_usuario_grupo ALTER COLUMN id_grupo_tipo_usuario SET DEFAULT nextval('public.tipo_usuario_grupo_id_grupo_tipo_usuario_seq'::regclass);


--
-- Name: tipos_comunicaciones id_tipos_comunicaciones; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.tipos_comunicaciones ALTER COLUMN id_tipos_comunicaciones SET DEFAULT nextval('public.tipos_comunicaciones_id_tipos_comunicaciones_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: usuarios_grupos_informados id_usuarios_grupos_informados; Type: DEFAULT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.usuarios_grupos_informados ALTER COLUMN id_usuarios_grupos_informados SET DEFAULT nextval('public.usuarios_grupos_informados_seq'::regclass);


--
-- Data for Name: anexos; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.anexos (anex_radi_nume, anex_codigo, anex_tipo, anex_tamano, anex_solo_lect, anex_creador, anex_desc, anex_numero, anex_nomb_archivo, anex_borrado, anex_origen, anex_ubic, anex_salida, radi_nume_salida, anex_radi_fech, anex_estado, usua_doc, sgd_rem_destino, anex_fech_envio, sgd_dir_tipo, anex_fech_impres, anex_depe_creador, sgd_doc_secuencia, sgd_doc_padre, sgd_arg_codigo, sgd_tpr_codigo, sgd_deve_codigo, sgd_deve_fech, sgd_fech_impres, anex_fech_anex, anex_depe_codi, sgd_pnufe_codi, sgd_dnufe_codi, anex_usudoc_creador, sgd_fech_doc, sgd_apli_codi, sgd_trad_codigo, sgd_dir_direccion, sgd_exp_numero, numero_doc, sgd_srd_codigo, sgd_sbrd_codigo, anex_num_hoja, texto_archivo_anex, anex_idarch_version, anex_num_version, doc_firmado_qr, anex_nomb_archivo_orig, radi_docu_publico, fecha_rec_remi, anex_radicado, anex_tipo_envio) FROM stdin;
20219980000062	2021998000006200001	7	24.338	S	ADMON	Respuesta a comunicación 20219980000062 de fecha 2021-03-31.	1	120219980000062_00001.pdf	N	0	\N	1	20219980000141	2021-03-31 12:14:56.631012-05	3	\N	1	2021-03-31 12:14:56.631012-05	1	\N	998	\N	\N	\N	145	\N	\N	2021-03-31 12:14:56.631012	2021-03-31 12:14:15.167631-05	\N	\N	\N	\N	\N	\N	1	\N		\N			\N	\N	\N	\N	0	120219980000062_00001.docx	f	\N	1	0
20219980000092	2021998000009200001	7	24.338	S	ADMON	Respuesta a comunicación 20219980000092 de fecha 2021-04-08.	1	120219980000092_00001.pdf	N	0	\N	1	20219980000161	2021-04-13 16:22:06.77482-05	4	\N	1	2021-04-13 16:22:06.77482-05	1	\N	998	\N	\N	\N	2	\N	\N	2021-04-13 16:22:06.77482	2021-04-13 16:17:03.939116-05	\N	\N	\N	\N	\N	\N	1	\N		\N	11	2	\N	\N	\N	\N	0	120219980000092_00001.docx	f	\N	1	0
20219980000012	2021998000001200003	7	24.302	S	ADMON	Respuesta a comunicación 20219980000012 de fecha 2021-02-23.	3	120219980000012_00003.pdf	N	0	\N	1	20219980000071	2021-02-23 18:00:54.214015-05	4	\N	1	2021-02-23 18:01:08.526438-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-02-23 18:00:54.214015	2021-02-23 18:00:50.509455-05	\N	\N	\N	\N	\N	\N	1	\N	20219981110000002E	\N	11	1	\N	\N	\N	\N	0	120219980000012_00003.docx	f	\N	1	0
20219980000032	2021998000003200001	7	15.168	1	ADMON	Prueba de entrega 20219980000032	1	120219980000032_00001.pdf	N	0	\N	0	0	\N	0	\N	7	\N	7	\N	998	\N	\N	\N	423	\N	\N	\N	2021-02-24 16:18:44.890832-05	\N	\N	\N	\N	\N	\N	\N	\N		\N			\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000042	2021998000004200001	7	15.142	1	ADMON	Prueba de entreaga de la documentación	1	120219980000042_00001.pdf	N	0	\N	0	0	\N	0	\N	7	\N	7	\N	998	\N	\N	\N	455	\N	\N	\N	2021-03-01 09:08:34.586809-05	\N	\N	\N	\N	\N	\N	\N	\N		\N			\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000042	2021998000004200002	7	41.751	N	RECEPCION.INVM	Documento de respuesta dada	2	120219980000042_00002.pdf	N	0	\N	0	\N	\N	0	\N	1	\N	1	\N	100	\N	\N	\N	455	\N	\N	\N	2021-03-01 09:12:59.411402-05	\N	\N	\N	\N	\N	\N	\N	\N		\N			\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000042	2021998000004200003	7	15.142	1	ADMON	Prueba entrega externa al cliente	3	120219980000042_00003.pdf	N	0	\N	0	0	\N	0	\N	7	\N	7	\N	998	\N	\N	\N	490	\N	\N	\N	2021-03-01 09:18:47.419861-05	\N	\N	\N	\N	\N	\N	\N	\N		\N			\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000052	2021998000005200003	7	24.338	S	ADMON	Respuesta a comunicación 20219980000052 de fecha 2021-03-31.	3	120219980000052_00003.pdf	N	0	\N	1	20219980000121	2021-03-31 10:48:36.719563-05	3	\N	1	2021-03-31 10:48:36.719563-05	1	\N	998	\N	\N	\N	145	\N	\N	2021-03-31 10:48:36.719563	2021-03-31 10:48:32.526629-05	\N	\N	\N	\N	\N	\N	1	\N	20219981120000003E	\N	11	2	\N	\N	\N	\N	1	120219980000052_00003.docx	f	\N	1	0
20219980000021	2021998000002100002	7	24.302	S	ADMON	Respuesta	2	120219980000021_00002.pdf	N	0	\N	1	20219980000031	2021-02-23 14:58:30.530382-05	4	\N	1	2021-02-23 14:58:30.530382-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-02-23 14:58:30.530382	2021-02-23 14:58:03.985288-05	\N	\N	\N	\N	\N	\N	1	\N		\N	11	1	\N	\N	\N	\N	1	120219980000021_00002.docx	t	\N	1	0
20219980000021	2021998000002100001	7	24.302	S	ADMON	Respuesta	1	120219980000021_00001.pdf	N	0	\N	1	20219980000021	2021-02-23 14:59:13.35083-05	4	\N	1	2021-02-23 16:39:26.218571-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-02-23 14:59:13.35083	2021-02-23 14:49:17.947172-05	\N	\N	\N	\N	\N	\N	1	\N		\N	11	1	\N	\N	\N	\N	1	120219980000021_00001.docx	t	\N	1	0
20219980000022	2021998000002200001	7	41.476	1	ADMON	20219980000022	1	120219980000022_00001.pdf	N	0	\N	0	0	\N	0	\N	7	\N	7	\N	998	\N	\N	\N	459	\N	\N	\N	2021-02-23 17:40:19.001506-05	\N	\N	\N	\N	\N	\N	\N	\N		\N	11	1	\N	\N	\N	\N	0	\N	t	\N	0	0
20219980000041	2021998000004100001	7	24.302	S	ADMON	Respuesta cargada	1	120219980000041_00001.pdf	N	0	\N	1	20219980000041	2021-02-23 16:43:11.283435-05	4	\N	1	2021-02-23 16:43:11.283435-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-02-23 16:43:11.283435	2021-02-23 16:43:06.846806-05	\N	\N	\N	\N	\N	\N	1	\N		\N	11	1	\N	\N	\N	\N	1	120219980000041_00001.docx	t	\N	1	0
20219980000041	2021998000004100002	7	181.781	N	ADMON	Soporte	2	120219980000041_00002.pdf	N	0	\N	0	\N	\N	0	\N	1	\N	1	\N	998	\N	\N	\N	489	\N	\N	\N	2021-02-23 16:44:00.953908-05	\N	\N	\N	\N	\N	\N	\N	\N		\N	11	1	\N	\N	\N	\N	0	\N	t	\N	0	0
20219980000012	2021998000001200001	7	2.464	1	ADMON	anexo	1	120219980000012_00001.pdf	N	0	\N	0	0	\N	0	\N	7	\N	7	\N	998	\N	\N	\N	489	\N	\N	\N	2021-02-23 16:48:09.716173-05	\N	\N	\N	\N	\N	\N	\N	\N		\N	11	1	\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000072	2021998000007200002	7	35.238	S	ADMON	anexo 1	2	120219980000072_00002.pdf	N	0	\N	0	\N	\N	0	\N	1	\N	1	\N	998	\N	\N	\N	2	\N	\N	\N	2021-04-13 16:32:11.072499-05	\N	\N	\N	\N	\N	\N	\N	\N		\N			\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000012	2021998000001200002	7	24.302	S	ADMON	Respuesta a comunicación 20219980000012 de fecha 2021-02-23.	2	120219980000012_00002.pdf	N	0	\N	1	20219980000051	2021-02-23 16:48:58.409761-05	4	\N	1	2021-02-23 16:54:40.944345-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-02-23 16:48:58.409761	2021-02-23 16:48:49.510107-05	\N	\N	\N	\N	\N	\N	1	\N		\N	11	1	\N	\N	\N	\N	0	120219980000012_00002.docx	f	\N	1	0
20219980000022	2021998000002200002	7	24.302	S	ADMON	Respuesta a comunicación 20219980000022 de fecha 2021-02-23.	2	120219980000022_00002.pdf	N	0	\N	1	20219980000061	2021-02-23 17:41:50.203955-05	4	\N	1	2021-02-23 17:56:29.382501-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-02-23 17:41:50.203955	2021-02-23 17:41:44.557901-05	\N	\N	\N	\N	\N	\N	1	\N	20219981110000002E	\N	11	1	\N	\N	\N	\N	1	120219980000022_00002.docx	t	\N	1	0
20219980000052	2021998000005200004	7	24.338	S	ADMON	Respuesta a comunicación 20219980000052 de fecha 2021-03-31.	4	120219980000052_00004.pdf	N	0	\N	1	20219980000131	2021-03-31 10:50:01.230526-05	3	\N	1	2021-03-31 10:50:01.230526-05	1	\N	998	\N	\N	\N	145	\N	\N	2021-03-31 10:50:01.230526	2021-03-31 10:49:57.277776-05	\N	\N	\N	\N	\N	\N	1	\N	20219981120000003E	\N	11	2	\N	\N	\N	\N	0	120219980000052_00004.docx	f	\N	1	0
20219980000052	2021998000005200001	7	246.196	1	ADMON	anexo	1	120219980000052_00001.pdf	N	0	\N	0	0	\N	0	\N	7	\N	7	\N	998	\N	\N	\N	145	\N	\N	\N	2021-03-31 10:33:32.43117-05	\N	\N	\N	\N	\N	\N	\N	\N		\N	11	2	\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000052	2021998000005200002	24	24.338	S	ADMON	Respuesta a comunicación 20219980000052 de fecha 2021-03-31.	2	120219980000052_00002.docx	N	0	\N	1	20219980000111	2021-03-31 10:38:11.180031-05	4	\N	1	2021-03-31 10:38:11.180031-05	1	\N	998	\N	\N	\N	145	\N	\N	2021-03-31 10:38:11.180031	2021-03-31 10:34:24.445079-05	\N	\N	\N	\N	\N	\N	1	\N		\N	11	2	\N	\N	\N	\N	0	\N	f	\N	1	0
20219980000082	2021998000008200001	14	61.854	S	ADMON	Respuesta a comunicación 20219980000082 de fecha 2021-04-07.	1	120219980000082_00001.odt	N	0	\N	1	20219980000151	2021-04-07 09:39:59.053384-05	3	\N	1	2021-04-07 09:39:59.053384-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-04-07 09:39:59.053384	2021-04-07 09:36:49.7496-05	\N	\N	\N	\N	\N	\N	1	\N		\N	11	2	\N	\N	\N	\N	0	\N	f	\N	1	0
20219980000072	2021998000007200001	7	24.338	S	ADMON	Respuesta a comunicación 20219980000072 de fecha 2021-03-31.	1	120219980000072_00001.pdf	N	0	\N	1	20219980000171	2021-04-13 16:31:54.577765-05	4	\N	1	2021-04-13 16:31:54.577765-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-04-13 16:31:54.577765	2021-04-13 16:31:50.48347-05	\N	\N	\N	\N	\N	\N	1	\N		\N			\N	\N	\N	\N	0	120219980000072_00001.docx	f	\N	1	0
20219980000092	2021998000009200002	7	304.286	S	ADMON	anexo 1	2	120219980000092_00002.pdf	N	0	\N	0	\N	\N	0	\N	1	\N	1	\N	998	\N	\N	\N	145	\N	\N	\N	2021-04-13 16:22:44.976512-05	\N	\N	\N	\N	\N	\N	\N	\N		\N	11	2	\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000092	2021998000009200003	7	17.343	S	ADMON	anexo 2	3	120219980000092_00003.pdf	N	0	\N	0	\N	\N	0	\N	1	\N	1	\N	998	\N	\N	\N	155	\N	\N	\N	2021-04-13 16:23:10.872305-05	\N	\N	\N	\N	\N	\N	\N	\N		\N	11	2	\N	\N	\N	\N	0	\N	f	\N	0	0
20219980000042	2021998000004200004	7	24.338	S	ADMON	Respuesta a comunicación 20219980000042 de fecha 2021-03-01.	4	120219980000042_00004.pdf	N	0	\N	1	20219980000181	2021-04-13 17:00:10.17476-05	3	\N	1	2021-04-13 17:00:10.17476-05	1	\N	998	\N	\N	\N	2	\N	\N	2021-04-13 17:00:10.17476	2021-04-13 17:00:06.060785-05	\N	\N	\N	\N	\N	\N	1	\N		\N			\N	\N	\N	\N	1	120219980000042_00004.docx	f	\N	1	0
20219980000201	2021998000020100001	7	24.338	S	ADMON	formato	1	120219980000201_00001.pdf	N	0	\N	1	20219980000201	2021-04-13 17:31:11.64617-05	3	\N	1	2021-04-13 17:31:11.64617-05	1	\N	998	\N	\N	\N	455	\N	\N	2021-04-13 17:31:11.64617	2021-04-13 17:31:06.605826-05	\N	\N	\N	\N	\N	\N	1	\N		\N	11	2	\N	\N	\N	\N	0	120219980000201_00001.docx	f	\N	1	0
20219980000102	2021998000010200001	7	24.338	S	ADMON	Respuesta a comunicación 20219980000102 de fecha 2021-04-13.	1	120219980000102_00001.pdf	N	0	\N	1	20219980000191	2021-04-13 17:27:48.316339-05	3	\N	1	2021-04-13 17:27:48.316339-05	1	\N	998	\N	\N	\N	2	\N	\N	2021-04-13 17:27:48.316339	2021-04-13 17:27:44.560065-05	\N	\N	\N	\N	\N	\N	1	\N	20219981120000003E	\N	11	2	\N	\N	\N	\N	0	120219980000102_00001.docx	f	\N	1	0
\.


--
-- Data for Name: anexos_historico; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.anexos_historico (anex_hist_anex_codi, anex_hist_num_ver, anex_hist_tipo_mod, anex_hist_usua, anex_hist_fecha, usua_doc) FROM stdin;
\.


--
-- Data for Name: anexos_tipo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.anexos_tipo (anex_tipo_codi, anex_tipo_ext, anex_tipo_desc, anex_tipo_icon) FROM stdin;
1	doc	Word	fas fa-file-invoice
2	xls	Excel	fas fa-file-invoice
3	ppt	PowerPoint	fas fa-file-invoice
4	tif	Imagen Tif	fas fa-file-invoice
5	jpg	Imagen jpg	fas fa-file-invoice
6	gif	Imagen gif	fas fa-file-invoice
7	pdf	Acrobat Reader	fas fa-file-invoice
8	txt	Documento txt	fas fa-file-invoice
9	zip	Comprimido	fas fa-file-invoice
10	rtf	Rich Text Format (rtf)	fas fa-file-invoice
11	dia	Dia(Diagrama)	fas fa-file-invoice
12	zargo	Argo(Diagrama)	fas fa-file-invoice
13	csv	csv (separado por comas)	fas fa-file-invoice
14	odt	OpenDocument Text	fas fa-file-invoice
20	avi	.avi (Video)	fas fa-file-invoice
21	mpg	.mpg (video)	fas fa-file-invoice
23	tar	.tar (Comprimido)	fas fa-file-invoice
24	docx	Microsoft Word 2010+	fas fa-file-invoice
25	xlsx	Microsoft Excel 2010+	fas fa-file-invoice
26	pptx	Microsoft Power Point 2010+	fas fa-file-invoice
\.


--
-- Data for Name: bodega_empresas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.bodega_empresas (nombre_de_la_empresa, nuir, nit_de_la_empresa, sigla_de_la_empresa, direccion, codigo_del_departamento, codigo_del_municipio, telefono_1, telefono_2, email, nombre_rep_legal, cargo_rep_legal, identificador_empresa, are_esp_secue, id_cont, id_pais, activa, flag_rups, codigo_suscriptor, id_users_pqrs, trte_codi) FROM stdin;
\.


--
-- Data for Name: borrar_carpeta_personalizada; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.borrar_carpeta_personalizada (carp_per_codi, carp_per_usu, carp_per_desc) FROM stdin;
\.


--
-- Data for Name: borrar_empresa_esp; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.borrar_empresa_esp (eesp_codi, eesp_nomb, essp_nit, essp_sigla, depe_codi, muni_codi, eesp_dire, eesp_rep_leg) FROM stdin;
\.


--
-- Data for Name: carpeta; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.carpeta (carp_codi, carp_desc, mostrar_como_tipo) FROM stdin;
0	Entrada	1
1	Salida	1
12	Devueltos	1
11	Vo.Bo.	1
14	Reasignación Masiva	1
4	Pqrsd	1
\.


--
-- Data for Name: carpeta_per; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.carpeta_per (usua_codi, depe_codi, nomb_carp, desc_carp, codi_carp, id_caperta_per) FROM stdin;
1	999	Masiva	Radicacion Masiva	99	1
1	998	Masiva	Radicacion Masiva	99	2
\.


--
-- Data for Name: centro_poblado; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.centro_poblado (cpob_codi, muni_codi, dpto_codi, cpob_nomb, cpob_nomb_anterior) FROM stdin;
\.


--
-- Data for Name: configuracion_contrasena; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.configuracion_contrasena ("idConfiguracionContracsena", numero_periocidad, descripcion_periocidad, dias_notificacion, estado_configuracion_contrasena, anio_creacion) FROM stdin;
4	3	month	3	f	2020
3	3	month	3	f	2020
1	3	month	3	f	2020
2	4	month	3	f	2020
5	3	month	1	t	2020
\.


--
-- Data for Name: configuracion_general_fondo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.configuracion_general_fondo (id_campo_configuracion_fondo, nombre_campo_configuracion_fondo, descripcion_campo_configuracion_fondo, consultar_configuracion_fondo, tipo_consulta_configuracion_fondo) FROM stdin;
\.


--
-- Data for Name: contrasenas_guardadas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.contrasenas_guardadas (id_contrasena_guardada, usua_login_contrasena_guardada, contrasena_anterior_contrasena_guardada, contrasena_nueva_contrasena_guardada, fecha_creacion_contrasena_guardada, fecha_vencimiento_contrasena_guardada, estado_contrasena_guardada) FROM stdin;
14	ACASTRO	123	02cb962ac59075b964b07152d2	2020-11-05	2021-02-05	t
15	MCONDE	123	74c0d42b4433905293aab661fc	2020-11-05	2021-02-05	t
16	LRADA	123	02cb962ac59075b964b07152d2	2020-11-06	2021-02-06	t
17	YSUAREZ	123	1dc9bdb52d04dc20036dbd8313	2020-11-11	2021-02-11	t
18	AOJEDA	02cb962ac59075b964b07152d2	27df54de456339423e488ea8f3	2020-11-11	2021-02-11	t
19	LAREVALO	123	745c842f326da3754d59936712	2020-11-11	2021-02-11	t
20	SVILLAMIZAR	123	f63605cb91e05a3679f13e1ec1	2020-11-11	2021-02-11	t
21	GVILLAMIL	123	e2e2ae4793e7b69e0b3148337d	2020-11-11	2021-02-11	t
22	TATUNES	123	a36e0b660fcc6c26fc12111652	2020-11-11	2021-02-11	t
23	DLOPEZ	123	e746e99dfcbdf8450b05e86378	2020-11-11	2021-02-11	t
24	SGIL	123	71754aa5fb422af0e8f882ea75	2020-11-11	2021-02-11	f
25	SGIL	123	1dc9bdb52d04dc20036dbd8313	2020-11-12	2021-02-12	t
26	ACORDOBA	123	4a36e43715f361a98b20c741c5	2020-11-12	2021-02-12	t
27	GMEJIA	123	7104abe3efaa3b463a49398682	2020-11-12	2021-02-12	t
28	MJIMENEZ	1dc9bdb52d04dc20036dbd8313	02cb962ac59075b964b07152d2	2020-11-17	2021-02-17	t
29	OCARDONA	123	3362cde489de930053572aa1d6	2020-11-25	2021-02-25	t
32	ALBEIRO.PULIDO	123	5c186983b52c4551ee00f72316	2021-01-04	1969-12-31	t
34	PASTOR.HERNAN	123	1cdd25b8effe5b33b6c5ab386d	2021-01-04	1969-12-31	t
35	FORERO.OSCAR	123	7e524a09bbbadc54025e23ffb3	2021-01-04	1969-12-31	t
36	SANDOVAL.JOHN	123	596ea5efa1fcdad17e2c40e79d	2021-01-04	1969-12-31	t
37	CASAS.CAMILO	123	c091bc91ee12d5525d0689ba07	2021-01-04	1969-12-31	t
38	IMBACUAN.MARIA	123	e47da43619f65190036a4329f1	2021-01-04	1969-12-31	t
39	MUNOZ.ANA	123	1ca9b44ab70904728506856286	2021-01-04	1969-12-31	t
40	GIRALDO.ADRIANA	123	7445e8ee476f1dcd129ccca1de	2021-01-04	1969-12-31	t
41	CARDENAS.DANIEL	123	a7d1ed414474e4033ac29ccb86	2021-01-04	1969-12-31	t
42	MORA.CLAUDIA	123	27342769ea247d8b351ec50cef	2021-01-04	1969-12-31	t
43	URREGO.MARTHA	123	74ed3f5fe66db5db1292f21dda	2021-01-04	1969-12-31	t
45	CABRERA.LAURA	123	aa555993e1372fc4132f422a70	2021-01-04	1969-12-31	t
46	LOPEZ.JESUS	123	f841df2894883b91a5f1a2388c	2021-01-04	1969-12-31	t
47	HERNANDEZ.NIDIA	123	3b4d2dbedc99fe843fd3dedb02	2021-01-04	1969-12-31	t
48	GARCIA.TITA	123	c4cc95904853898fc449a47321	2021-01-04	1969-12-31	t
49	CAMACHO.YUHELY	123	1b52bd625073a88e5e13703ee7	2021-01-04	1969-12-31	t
50	MORALES.SANDRA	123	d3dcf1cee113e16d316881a328	2021-01-04	1969-12-31	t
51	FORERO.MIGUEL	123	b8647afe288ffcf8e006f3688b	2021-01-04	1969-12-31	t
52	AZA.GRACIELA	123	98aca7038a3484ffbeefab900b	2021-01-04	1969-12-31	t
54	PINZON.JUDITH	123	9db46dae229de386f2084ec759	2021-01-04	1969-12-31	t
55	LEON.ADRIANA	123	9df3e2b7435e135f6260e9719a	2021-01-04	1969-12-31	t
56	CAMARGO.ROSA	123	ad9ef65f38b6a10b435eddde91	2021-01-04	1969-12-31	t
58	SOCHE.MIREYA	123	bcebd77d7242aa11a1bb57466a	2021-01-05	1969-12-31	t
60	MORENO.LAURA	123	e6c6870d48d19bc5c2deedd813	2021-01-05	1969-12-31	t
61	DE.MARTINEZ	123	1cdae6cf5ce5d387a964fea1d1	2021-01-05	1969-12-31	t
62	TOQUICA.DANILO	123	bb74fc4b7254a27b0fa339da31	2021-01-05	1969-12-31	t
53	CELY.KEILA	123	3d73e480659bb26e3e1a893f63	2021-01-04	1969-12-31	f
63	CELY.KEILA	3d73e480659bb26e3e1a893f63	5b643417205ef8bef0a46d06bc	2021-01-05	1969-12-31	t
64	OCAMPO.SANDRA	123	47661f5cce1a07f694d8edb416	2021-01-05	1969-12-31	t
65	SAENZ.LILIA	123	b0f33587c7ce8df73e3fa96082	2021-01-05	1969-12-31	t
66	DIAZ.MANUEL	123	8b50fc800d26929bd3aaa48e06	2021-01-05	1969-12-31	f
67	DIAZ.MANUEL	8b50fc800d26929bd3aaa48e06	aa6fd014c8887fb0d1a8da9bcf	2021-01-05	1969-12-31	t
68	QUINTERO.RAFAEL	123	3bfa2e48887f74bd2de73463f9	2021-01-05	1969-12-31	t
69	RODRIGUEZ.COSME	123	3ba4ea457e53ba63a9a465753d	2021-01-05	1969-12-31	t
33	ARDILA.NATALI	123	994680c50d971a1bfe39bbb05a	2021-01-04	1969-12-31	f
70	ARDILA.NATALI	994680c50d971a1bfe39bbb05a	ead19942c2ed3fb9b6bd9d5d63	2021-01-06	1969-12-31	t
72	RAMIREZ.VIVIANA	123	fec9c77d60f1e0bf63287bfc17	2021-01-06	1969-12-31	t
73	CAICEDO.LADY	123	550edec5f0b26fc1c8af37e54f	2021-01-06	1969-12-31	t
74	TACHACK.YENY	123	dd96bfa3196f4e5d4446a50409	2021-01-06	1969-12-31	t
75	LOPEZ.JHON	123	cef2f969d222bafc7bc2cac0be	2021-01-06	1969-12-31	t
76	LEON.FERNANDO	123	7f8cee24019438aacf9e2ad540	2021-01-06	1969-12-31	t
71	GONZALEZ.SONIA	123	57dacc50800d1fe3c7d87f001a	2021-01-06	1969-12-31	f
79	GONZALEZ.SONIA	57dacc50800d1fe3c7d87f001a	33b18a82cdf9f859f3b695e493	2021-01-08	1969-12-31	t
78	GALVEZ.IVONNE	123	be74c556d1ce3d7abfd8e80bd4	2021-01-07	1969-12-31	f
80	GALVEZ.IVONNE	be74c556d1ce3d7abfd8e80bd4	1ff3899a910d192e4ffef4cf63	2021-01-08	1969-12-31	t
81	RUEDA.ESMERALDA	123	886d7cc087b0bfe2cc83a10c88	2021-01-12	1969-12-31	t
30	ADMON	f6805c232b73bc468bf29e3638	0f5dbac804642841d60b100a2b	2020-11-27	2021-02-27	f
83	ADMON	0f5dbac804642841d60b100a2b	02cb962ac59075b964b07152d2	2021-01-13	1969-12-31	f
86	ADMON	02cb962ac59075b964b07152d2	10adc3949ba59abbe56e057f20	2021-01-13	1969-12-31	f
87	ADMON	02cb962ac59075b964b07152d2	5d55ad283aa400af464c76d713	2021-01-13	1969-12-31	f
89	PEREZ.LUIS	123	b5b43465626636334f091facc4	2021-01-18	1969-12-31	t
90	TOVAR.EDUARDO	123	52c0a52ff2272cc969a44ff732	2021-01-18	1969-12-31	t
88	ADMON	02cb962ac59075b964b07152d2	0f5dbac804642841d60b100a2b	2021-01-13	1969-12-31	t
96	ZORNOSA.HERNAN	123	8383ba58f331e2f5a8044187ac	2021-01-19	1969-12-31	f
59	ARIAS.ROSA	123	c2b3687ff2fcbc4b028070a0f2	2021-01-05	1969-12-31	f
95	PEDREROS.VICKY	123	c7a0d6a302bac9e3b2998e728c	2021-01-19	1969-12-31	t
97	CARDENAS.LUZ	123	f19ae625fed8f7ce788f2debd4	2021-01-19	1969-12-31	t
98	BELTRAN.ADRIANA	123	33b18a82cdf9f859f3b695e493	2021-01-20	1969-12-31	t
44			41d8cd98f00b204e9800998ecf	2021-01-04	1969-12-31	f
57			41d8cd98f00b204e9800998ecf	2021-01-04	1969-12-31	f
93			41d8cd98f00b204e9800998ecf	2021-01-19	1969-12-31	f
99			41d8cd98f00b204e9800998ecf	2021-01-20	1969-12-31	t
82	HERNANDEZ.RUBY	123	20d16a1d9ad31a86df30fbf5c9	2021-01-12	1969-12-31	f
100	TAMAYO.ANA	123	8df4bd9b19b0e1b11f0bb0ae1e	2021-01-20	1969-12-31	f
91	GOMEZ.LEIDY	123	32bbbc7afa0e2b2f1c37191ceb	2021-01-18	1969-12-31	f
31	PAOLA.RODRIGUEZ	123	3f128f2b09f15dc76ecac5014a	2021-01-04	1969-12-31	f
101	ROJAS.JENNIFER	123	c41a8e8269a60c43d0f04ba46e	2021-01-20	1969-12-31	t
102	GOMEZ.SANDRA	123	9e22a0b1d447e8fdb899a61360	2021-01-21	1969-12-31	t
103	CRUZ.OMAR	123	6d91ffa839c78e4c1480677fb1	2021-01-21	1969-12-31	t
104	CORTES.EDITH	123	6110093c04b6b2389a6b80bee1	2021-01-21	1969-12-31	t
105	TORRES.SERGIO	123	9f6eac503b322f82b59a485f3a	2021-01-21	1969-12-31	t
106	LUCUMI.KAREN	123	babfe9a4e1d6b3ce6879eee40d	2021-01-21	1969-12-31	t
107	ZORNOSA.HERNAN	8383ba58f331e2f5a8044187ac	0894889e3b5d969024318a22a7	2021-01-26	1969-12-31	t
108	RODRIGUEZ.DIEGO	123	8b64aa074ec22daaab286cf4f7	2021-01-26	1969-12-31	t
110	PINEDA.ASTRID	123	2ff9511c580eae3924f6f3b4a5	2021-01-26	1969-12-31	t
111	JOHAN.BULLA	123	238c3d5fe6e25faa0a675c1f9a	2021-01-27	1969-12-31	t
112	PASTOR.NORA	123	178266350c1a4476c614d0e688	2021-01-28	1969-12-31	t
113	AYALA.CESAR	123	f89adf0597b991544172fc5d5c	2021-01-28	1969-12-31	t
114	RODRIGUEZ.LEIDY	123	39c149e4511af0daebf58baf04	2021-01-28	1969-12-31	t
115	ARIAS.ROSA	c2b3687ff2fcbc4b028070a0f2	c866a9ac8d42cf9ffd6cba1e32	2021-01-28	1969-12-31	t
109	CASTANEDA.NUBIA	123	cea920f7412b5da7be0cf42b8c	2021-01-26	1969-12-31	f
116	CASTANEDA.NUBIA	123\n	f7d5fcedf0e72b7d011b8a1a0e	2021-01-28	1969-12-31	t
92	ROMERO.DIANA	123	18d412b64208670f76cc9f1c08	2021-01-18	1969-12-31	f
117	ROMERO.DIANA	18d412b64208670f76cc9f1c08	02cb962ac59075b964b07152d2	2021-01-29	1969-12-31	t
118	HERNANDEZ.RUBY	20d16a1d9ad31a86df30fbf5c9	afd521d77158e02aed37e2274b	2021-02-01	1969-12-31	t
119	TAMAYO.ANA	8df4bd9b19b0e1b11f0bb0ae1e	6e25b2c72b4ba13f9720143b0d	2021-02-11	1969-12-31	t
120	GOMEZ.LEIDY	32bbbc7afa0e2b2f1c37191ceb	7f44b50972dd7596d7edc867f4	2021-02-17	1969-12-31	t
94	PAOLA.RODRIGUEZ	3f128f2b09f15dc76ecac5014a	39e0848577d91747dca45c9a25	2021-01-19	1969-12-31	f
121	PAOLA.RODRIGUEZ	39e0848577d91747dca45c9a25	02cb962ac59075b964b07152d2	2021-02-22	1969-12-31	t
122	RECEPCION.INVM	123	02cb962ac59075b964b07152d2	2021-03-01	1969-12-31	t
123	JMGAMEZ	123	02cb962ac59075b964b07152d2	2021-04-13	1969-12-31	t
77	DSALIDA	6080775c113b0e5c3e32bdd262	10adc3949ba59abbe56e057f20	2021-01-06	1969-12-31	f
84	DSALIDA	10adc3949ba59abbe56e057f20	02cb962ac59075b964b07152d2	2021-01-13	1969-12-31	f
85	DSALIDA	10adc3949ba59abbe56e057f20	02cb962ac59075b964b07152d2	2021-01-13	1969-12-31	f
124	DSALIDA	10adc3949ba59abbe56e057f20	02cb962ac59075b964b07152d2	2021-04-13	1969-12-31	t
\.


--
-- Data for Name: datosocr; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.datosocr (indice, nume_radi, texto, radi_nume_deri, fecha_radi, tipo, radi_depe_radi, tipo_radi, tdoc_codi, anex_desc, fechaocr) FROM stdin;
\.


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.departamento (dpto_codi, dpto_nomb, id_cont, id_pais) FROM stdin;
1	TODOS	1	170
5	ANTIOQUÍA	1	170
8	ATLÁNTICO	1	170
13	BOLÍVAR	1	170
15	BOYACÁ	1	170
17	CALDAS	1	170
19	CAUCA	1	170
20	CESAR	1	170
23	CÓRDOBA	1	170
25	CUNDINAMARCA	1	170
27	CHOCO	1	170
41	HUILA	1	170
44	LA GUAJIRA	1	170
47	MAGDALENA	1	170
50	META	1	170
52	NARIÑO	1	170
54	NORTE DE SANTANDER	1	170
63	QUINDÍO	1	170
66	RISARALDA	1	170
68	SANTANDER	1	170
70	SUCRE	1	170
73	TOLIMA	1	170
76	VALLE DEL CAUCA	1	170
81	ARAUCA	1	170
85	CASANARE	1	170
86	PUTUMAYO	1	170
88	SAN ANDRÉS	1	170
91	AMAZONAS	1	170
94	GUAINÍA	1	170
95	GUAVIARE	1	170
97	VAUPÉS	1	170
99	VICHADA	1	170
11	D.C.	1	170
18	CAQUETÁ	1	170
\.


--
-- Data for Name: dependencia; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.dependencia (depe_codi, depe_nomb, dpto_codi, depe_codi_padre, muni_codi, depe_codi_territorial, dep_sigla, dep_central, dep_direccion, depe_num_interna, depe_num_resolucion, depe_rad_tp1, depe_rad_tp2, id_cont, id_pais, depe_estado, depe_segu, depe_rad_tp4) FROM stdin;
998	Dependencia administradora Sistema	11	998	1	998	DAS	1	Carrera 37 No. 53-50	\N	\N	998	998	1	170	1	\N	998
999	Dependencia Administración Archivo	11	999	1	999	DAA	1	Carrera 37 No. 53-50	\N	\N	999	999	1	170	1	\N	999
100	COmando Armada	11	998	1	998	INVM	\N	Zona franca de bogota	\N	\N	\N	\N	1	170	1	\N	\N
101	Comisión Colombiana del Océano	11	998	1	998	SKN	\N	Zona franca Bodega 10	\N	\N	\N	\N	1	170	1	\N	\N
\.


--
-- Data for Name: dependencia_visibilidad; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.dependencia_visibilidad (codigo_visibilidad, dependencia_visible, dependencia_observa) FROM stdin;
1	1021	1020
\.


--
-- Data for Name: direccion_usuarios; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.direccion_usuarios (id, "DirCam1", "DirCam2", "DirCam3", "DirCam4", "DirCam5", "DirCam6") FROM stdin;
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.estado (esta_codi, esta_desc, estado_tipo_radicado) FROM stdin;
9	Documento Orfeo	\N
2	Asignado	4
3	En tramite	4
4	Finalizado	4
5	Con Respuesta	4
1	Nueva	4
\.


--
-- Data for Name: estado_civil_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.estado_civil_pqrs (id_estado_civil_pqrs, tipo_estado_civil_pqrs) FROM stdin;
1	Soltero(a)
2	Casado(a)
3	Viudo(a)
4	Unión Libre 
5	Divorciado
\.


--
-- Data for Name: fondo_acumulado_comunicaciones; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.fondo_acumulado_comunicaciones (id_fondo_acumulado_comunicaciones, tipo_fondo, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11, campo12) FROM stdin;
\.


--
-- Data for Name: fun_funcionario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.fun_funcionario (usua_doc, usua_fech_crea, usua_esta, usua_nomb, usua_ext, usua_nacim, usua_email, usua_at, usua_piso, cedula_ok, cedula_suip, nombre_suip, observa) FROM stdin;
\.


--
-- Data for Name: genero_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.genero_pqrs (genero_pqrs_id, genero_pqrs_tipo) FROM stdin;
1	Masculino
2	Femenino
3	Otro
\.


--
-- Data for Name: grupo_interes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.grupo_interes (id_grupo_interes, nombre_grupo_interes) FROM stdin;
1	Ninguno
2	Sindicato del Sector Publico
3	Veeduría Ciudadana
4	Representante de Asociación de\nUsuario
5	Representante EPS
6	Integrante Junta Directiva
\.


--
-- Data for Name: grupos_informados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.grupos_informados (id_grupos_informados, nombre_grupo, descripcion_grupo, activo_grupo) FROM stdin;
8	Equipo Tecnico de Gestión Documental	Integrantes Del Comité De Archivo	1
\.


--
-- Data for Name: hist_eventos; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.hist_eventos (depe_codi, hist_fech, usua_codi, radi_nume_radi, hist_obse, usua_codi_dest, usua_doc, usua_doc_old, sgd_ttr_codigo, hist_usua_autor, hist_doc_dest, depe_codi_dest) FROM stdin;
998	2021-02-23 14:39:12.573669-05	1	20219980000011	 Se radicado correctamente el documento 	1	1234567890	1	2	\N	1234567890	998
998	2021-02-23 14:39:12.583346-05	1	20219980000011	A: ADMON - Se ha generado el radicado No.20219980000011 y se esta notificando.	1	1234567890	\N	8	\N	1234567890	998
998	2021-02-23 14:45:03.518364-05	1	20219980000021	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-02-23 14:46:36.508172-05	1	20219980000021	Modificacion Documento  en la descripcion de anexos del radicado	1	1234567890	\N	11	\N	1234567890	998
998	2021-02-23 14:48:24.611126-05	1	20219980000021	Modificacion Documento  en la descripcion de anexos del radicado	1	1234567890	\N	11	\N	1234567890	998
998	2021-02-23 14:58:09.60168-05	1	20219980000031	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-02-23 14:58:52.696489-05	1	20219980000031	Se firmó el documento con el radicado 20219980000031	1	1234567890	\N	67	\N	1234567890	998
998	2021-02-23 14:58:52.697935-05	1	20219980000021	Se firmó el documento con el radicado 20219980000031	1	1234567890	\N	67	\N	1234567890	998
998	2021-02-23 14:59:19.269798-05	1	20219980000021	Se firmó el documento con el radicado 20219980000021	1	1234567890	\N	67	\N	1234567890	998
998	2021-02-23 14:59:27.868874-05	1	20219980000021	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000021 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-02-23 16:14:53.517069-05	1	20219980000021	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000021 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-02-23 16:17:29.009036-05	1	20219980000021	Asignación de TRD	1	1234567890	\N	32	\N	1234567890	998
998	2021-02-23 16:19:38.920919-05	1	20219980000021	*Modificado TRD* COMUNICACIONES OFICIALES//Propuestas	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 16:23:17.53308-05	1	20219980000021	*Modificado TRD* COMUNICACIONES OFICIALES//Propuestas	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 16:28:36.792828-05	1	20219980000021	Radicado Publico.	1	1234567890	\N	54	\N	1234567890	998
998	2021-02-23 16:28:45.605187-05	1	20219980000021	Radicado Confidencial	1	1234567890	\N	54	\N	1234567890	998
998	2021-02-23 16:29:24.584461-05	1	20219980000021	*Eliminado TRD*COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones/Propuestas	1	1234567890	\N	33	\N	1234567890	998
998	2021-02-23 16:29:49.273323-05	1	20219980000021	Asignación de TRD	1	1234567890	\N	32	\N	1234567890	998
998	2021-02-23 16:30:09.59448-05	1	20219980000021	Modificacion Documento  en la descripcion de anexos del radicado	1	1234567890	\N	11	\N	1234567890	998
998	2021-02-23 16:42:34.282214-05	1	20219980000041	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-02-23 16:43:25.619047-05	1	20219980000041	Se firmó el documento con el radicado 20219980000041	1	1234567890	\N	67	\N	1234567890	998
998	2021-02-23 16:44:08.216189-05	1	20219980000041	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000041 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-02-23 16:45:09.10979-05	1	20219980000041	Asignación de TRD	1	1234567890	\N	32	\N	1234567890	998
998	2021-02-23 16:45:16.71992-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 16:47:03.61546-05	1	20219980000012	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-02-23 16:47:36.053706-05	1	20219980000012	20219980000012	1	1234567890	\N	42	\N	1234567890	998
998	2021-02-23 16:48:09.716173-05	1	20219980000012	anexo	998	1234567890	\N	29	\N	1234567890	1
998	2021-02-23 16:48:09.716173-05	1	20219980000012	Se adjunto el anexo al radicado, anexo	1	1234567890	\N	29	\N	1234567890	998
998	2021-02-23 16:48:58.409761-05	1	20219980000051	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-02-23 16:48:58.409761-05	1	20219980000012	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000051	1	1234567890	\N	69	\N	1234567890	998
998	2021-02-23 17:11:38.787729-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:14:06.815328-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:15:22.111322-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:15:41.177739-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:16:06.056987-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:27:52.314162-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:34:32.966649-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:35:31.626662-05	1	20219980000041	*Modificado TRD* COMUNICACIONES OFICIALES//Respuesta	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:39:31.025378-05	1	20219980000022	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-02-23 17:40:07.052462-05	1	20219980000022	20219980000022	1	1234567890	\N	42	\N	1234567890	998
998	2021-02-23 17:40:19.001506-05	1	20219980000022	20219980000022	998	1234567890	\N	29	\N	1234567890	1
998	2021-02-23 17:40:19.001506-05	1	20219980000022	Se adjunto el anexo al radicado, 20219980000022	1	1234567890	\N	29	\N	1234567890	998
998	2021-02-23 17:40:36.972792-05	1	20219980000022	Asignación de TRD	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 17:41:50.203955-05	1	20219980000061	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-02-23 17:41:50.203955-05	1	20219980000022	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000061	1	1234567890	\N	69	\N	1234567890	998
998	2021-02-23 17:41:56.159029-05	1	20219980000061	Se firmó el documento con el radicado 20219980000061	1	1234567890	\N	67	\N	1234567890	998
998	2021-02-23 17:41:56.160422-05	1	20219980000022	Se firmó el documento con el radicado 20219980000061	1	1234567890	\N	67	\N	1234567890	998
998	2021-02-23 17:41:57.654766-05	1	20219980000061	Se envio notificación al ciudadano con el correo <b>soporte@skinatech.com </b> <br><br>	1	1234567890	\N	71	\N	1234567890	998
998	2021-02-23 17:41:57.656686-05	1	20219980000022	Se envio notificación al ciudadano con el correo <b>soporte@skinatech.com </b> <br><br>	1	1234567890	\N	71	\N	1234567890	998
998	2021-03-31 11:03:05.583042-05	1	20219980000052	se reasigna	1	1234567890	\N	9	\N	1234567890	998
998	2021-02-23 17:42:50.798024-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.884232-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.92162-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.926574-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.927883-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.929064-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.938993-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.940206-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.941655-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.942813-05	1	20219980000022	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.950158-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002200001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.951367-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002200001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.956363-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002200001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.957602-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000002200001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.95876-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000002200001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.961747-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002200002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.962943-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002200002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.965316-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000002200002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.966584-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000002200002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.967896-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000002200002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.969064-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000002200002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.980841-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.982048-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.983245-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.984435-05	1	20219980000022	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.989106-05	1	20219980000022	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.990581-05	1	20219980000022	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.991743-05	1	20219980000041	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.995116-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000004100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.996287-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000004100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.997443-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000004100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:50.999217-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000004100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.000441-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000004100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.001618-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000004100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.00281-05	1	20219980000041	Se ha marcado como publico el documento anexado con el número 2021998000004100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.003988-05	1	20219980000041	Se ha marcado como publico el documento anexado con el número 2021998000004100001.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.01427-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.015646-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.016872-05	1	20219980000021	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.018097-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.02328-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.024487-05	1	20219980000022	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.025689-05	1	20219980000041	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.026969-05	1	20219980000041	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.03158-05	1	20219980000041	Se ha marcado como publico el documento anexado con el número 2021998000004100002.	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.035411-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.036595-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.037762-05	1	20219980000021	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.038977-05	1	20219980000022	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.040178-05	1	20219980000022	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.041935-05	1	20219980000022	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.043099-05	1	20219980000041	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.044304-05	1	20219980000041	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.045479-05	1	20219980000041	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:42:51.046668-05	1	20219980000061	Se ha marcado como publico el documento principal del radicado número .	1	1234567890	\N	72	\N	1234567890	998
998	2021-02-23 17:43:53.95192-05	1	20219980000012	Asignación de TRD	998	1234567890	\N	32	\N	1234567890	1
998	2021-02-23 18:00:54.214015-05	1	20219980000071	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-02-23 18:00:54.214015-05	1	20219980000012	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000071	1	1234567890	\N	69	\N	1234567890	998
998	2021-02-24 15:29:46.342261-05	1	20219980000032	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1022982736	100
998	2021-02-24 16:16:16.847435-05	1	20219980000032	Se cargan facturas radicadas	1	1234567890	\N	42	\N	1234567890	998
998	2021-02-24 16:18:44.890832-05	1	20219980000032	Prueba de entrega 20219980000032	998	1234567890	\N	29	\N	1234567890	1
998	2021-02-24 16:18:44.890832-05	1	20219980000032	Se adjunto el anexo al radicado, Prueba de entrega 20219980000032	1	1234567890	\N	29	\N	1022982736	100
998	2021-03-01 08:28:46.632385-05	1	20219980000042	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1022982736	100
998	2021-03-01 08:32:38.857889-05	1	20219980000042	Facturas originales	1	1234567890	\N	42	\N	1234567890	998
998	2021-03-01 09:08:34.586809-05	1	20219980000042	Prueba de entreaga de la documentación	998	1234567890	\N	29	\N	1234567890	1
998	2021-03-01 09:08:34.586809-05	1	20219980000042	Se adjunto el anexo al radicado, Prueba de entreaga de la documentación	1	1234567890	\N	29	\N	1022982736	100
100	2021-03-01 09:14:40.040828-05	1	20219980000042	Se carga respuesta	1	1022982736	\N	12	\N	1234567890	998
998	2021-03-01 09:18:47.419861-05	1	20219980000042	Prueba entrega externa al cliente	998	1234567890	\N	29	\N	1234567890	1
998	2021-03-01 09:18:47.419861-05	1	20219980000042	Se adjunto el anexo al radicado, Prueba entrega externa al cliente	1	1234567890	\N	29	\N	1234567890	998
998	2021-03-09 10:27:49.103704-05	1	20219980000081	Radicado insertado del grupo de masiva 20219980000081	1	1234567890	\N	30	\N	1234567890	998
998	2021-03-09 10:27:49.103704-05	1	20219980000091	Radicado insertado del grupo de masiva 20219980000081	1	1234567890	\N	30	\N	1234567890	998
998	2021-03-09 10:27:49.103704-05	1	20219980000101	Radicado insertado del grupo de masiva 20219980000081	1	1234567890	\N	30	\N	1234567890	998
998	2021-03-31 10:32:06.527652-05	1	20219980000052	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-03-31 10:32:51.328095-05	1	20219980000052	20219980000052	1	1234567890	\N	42	\N	1234567890	998
998	2021-03-31 10:33:32.43117-05	1	20219980000052	anexo	998	1234567890	\N	29	\N	1234567890	1
998	2021-03-31 10:33:32.43117-05	1	20219980000052	Se adjunto el anexo al radicado, anexo	1	1234567890	\N	29	\N	1234567890	998
998	2021-03-31 10:34:33.616189-05	1	20219980000111	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-03-31 10:34:33.616189-05	1	20219980000052	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000111	1	1234567890	\N	69	\N	1234567890	998
998	2021-03-31 10:38:21.063709-05	1	20219980000052	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000052 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-03-31 10:38:44.257657-05	1	20219980000052	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000052 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-03-31 10:39:12.511482-05	1	20219980000052	Asignación de TRD	998	1234567890	\N	32	\N	1234567890	1
998	2021-03-31 10:39:28.257918-05	1	20219980000052	Radicado Confidencial	1	1234567890	\N	54	\N	1234567890	998
998	2021-03-31 10:48:36.719563-05	1	20219980000121	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-03-31 10:48:36.719563-05	1	20219980000052	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000121	1	1234567890	\N	69	\N	1234567890	998
998	2021-03-31 10:48:52.181724-05	1	20219980000121	Se firmó el documento con el radicado 20219980000121	1	1234567890	\N	67	\N	1234567890	998
998	2021-03-31 10:48:52.183425-05	1	20219980000052	Se firmó el documento con el radicado 20219980000121	1	1234567890	\N	67	\N	1234567890	998
998	2021-03-31 10:48:53.883222-05	1	20219980000121	Se envio notificación al ciudadano con el correo <b>soporte@skinatech.com </b> <br><br>	1	1234567890	\N	71	\N	1234567890	998
998	2021-03-31 10:48:53.884521-05	1	20219980000052	Se envio notificación al ciudadano con el correo <b>soporte@skinatech.com </b> <br><br>	1	1234567890	\N	71	\N	1234567890	998
998	2021-03-31 10:50:01.230526-05	1	20219980000131	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-03-31 10:50:01.230526-05	1	20219980000052	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000131	1	1234567890	\N	69	\N	1234567890	998
998	2021-03-31 11:03:18.276067-05	1	20219980000052	se reasigna	1	1234567890	\N	9	\N	1022982736	100
998	2021-03-31 11:36:38.414866-05	1	20219980000062	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-03-31 11:36:38.419496-05	1	20219980000062	A: ADMON - Se ha generado el radicado No.20219980000062 y se esta notificando.	1	1234567890	\N	8	\N	1234567890	998
998	2021-03-31 11:36:38.423767-05	1	20219980000062	A: RECEPCION.INVM - Se ha generado el radicado No.20219980000062 y se esta notificando.	1	1234567890	\N	8	\N	1022982736	100
998	2021-03-31 11:43:16.238507-05	1	20219980000062	Docxumento principal	1	1234567890	\N	42	\N	1234567890	998
998	2021-03-31 12:14:15.167631-05	1	20219980000062	Se actualizó el estado del radicado a <b>"En tramite"</b>, ya se cargó el formato de respuesta.	1	1234567890	\N	69	\N	1234567890	998
998	2021-03-31 12:14:56.631012-05	1	20219980000141	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-03-31 12:14:56.631012-05	1	20219980000062	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000141	1	1234567890	\N	69	\N	1234567890	998
998	2021-03-31 12:25:09.110957-05	1	20219980000072	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-07 09:29:50.81627-05	1	20219980000082	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-07 09:32:26.50954-05	1	20219980000082	tramitar	1	1234567890	\N	42	\N	1234567890	998
998	2021-04-07 09:36:49.7496-05	1	20219980000082	Se actualizó el estado del radicado a <b>"En tramite"</b>, ya se cargó el formato de respuesta.	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-07 09:39:59.053384-05	1	20219980000151	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-07 09:39:59.053384-05	1	20219980000082	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000151	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-08 09:39:16.485329-05	1	20219980000092	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-08 09:40:53.272971-05	1	20219980000092	para aprobacion	1	1234567890	\N	42	\N	1234567890	998
998	2021-04-13 16:17:03.939116-05	1	20219980000092	Se actualizó el estado del radicado a <b>"En tramite"</b>, ya se cargó el formato de respuesta.	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-13 16:18:51.413878-05	1	20219980000161	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-13 16:18:51.413878-05	1	20219980000092	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000161	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-13 16:23:42.364852-05	1	20219980000092	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000092 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-04-13 16:24:49.493866-05	1	20219980000092	Asignación de TRD	998	1234567890	\N	32	\N	1234567890	1
998	2021-04-13 16:29:58.974154-05	1	20219980000082	Asignación de TRD	998	1234567890	\N	32	\N	1234567890	1
998	2021-04-13 16:30:22.710722-05	1	20219980000082	*Modificado TRD* COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones/Solicitud de permiso para tal	1	1234567890	\N	32	\N	1234567890	998
998	2021-04-13 16:30:59.219521-05	1	20219980000082	no requiere respuesta	1	1234567890	\N	65	\N	12345678909	999
998	2021-04-13 16:31:50.48347-05	1	20219980000072	Se actualizó el estado del radicado a <b>"En tramite"</b>, ya se cargó el formato de respuesta.	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-13 16:31:54.577765-05	1	20219980000171	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-13 16:31:54.577765-05	1	20219980000072	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000171	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-13 16:42:23.590439-05	1	20219980000072	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000072 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-04-13 16:45:37.886969-05	1	20219980000072	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000072 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-04-13 16:47:04.246872-05	1	20219980000072	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000072 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-04-13 16:48:34.836573-05	1	20219980000072	Se envió la notificación de correo sobre la respuesta dada con No.radicado 20219980000072 al remitente/destinatario.soporte@skinatech.com	1	1234567890	\N	71	\N	1234567890	998
998	2021-04-13 17:00:10.17476-05	1	20219980000181	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-13 17:00:10.17476-05	1	20219980000042	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000181	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-13 17:00:23.724521-05	1	20219980000181	Se firmó el documento con el radicado 20219980000181	1	1234567890	\N	67	\N	1234567890	998
998	2021-04-13 17:00:23.727333-05	1	20219980000042	Se firmó el documento con el radicado 20219980000181	1	1234567890	\N	67	\N	1234567890	998
998	2021-04-13 17:06:33.965358-05	1	20219980000062	reasignación	2	1234567890	\N	9	\N	1022982735	101
998	2021-04-13 17:26:00.245667-05	1	20219980000102	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-13 17:26:00.251421-05	1	20219980000102	A: ADMON - Se ha generado el radicado No.20219980000102 y se esta notificando.	1	1234567890	\N	8	\N	1234567890	998
998	2021-04-13 17:26:00.255878-05	1	20219980000102	A: JMGAMEZ - Se ha generado el radicado No.20219980000102 y se esta notificando.	2	1234567890	\N	8	\N	1022982735	101
998	2021-04-13 17:26:45.653827-05	1	20219980000102	20219980000102	1	1234567890	\N	42	\N	1234567890	998
998	2021-04-13 17:27:13.133345-05	1	20219980000102	Asignación de TRD	1	1234567890	\N	32	\N	1234567890	998
998	2021-04-13 17:27:20.970797-05	1	20219980000102	*Modificado TRD* COMUNICACIONES OFICIALES/Actas Comité de Participación Local de Salud (COPACO)/Comunicaciones oficiales	998	1234567890	\N	32	\N	1234567890	1
998	2021-04-13 17:27:44.560065-05	1	20219980000102	Se actualizó el estado del radicado a <b>"En tramite"</b>, ya se cargó el formato de respuesta.	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-13 17:27:48.316339-05	1	20219980000191	 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-13 17:27:48.316339-05	1	20219980000102	Se actualizó el estado del radicado a <b>"Con Respuesta"</b> y se asigno el número 20219980000191	1	1234567890	\N	69	\N	1234567890	998
998	2021-04-13 17:30:39.053757-05	1	20219980000201	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-13 17:31:32.484454-05	1	20219980000201	Asignación de TRD	998	1234567890	\N	32	\N	1234567890	1
998	2021-04-15 10:13:58.192931-05	1	20219980000092	 Almacenado en Fisico 	1	1234567890	\N	57	\N	1234567890	998
998	2021-04-15 11:18:40.033578-05	1	20219980000092	Se realizó transferencia manual.	1	1234567890	\N	67	\N	1234567890	998
998	2021-04-15 14:42:11.633787-05	1	20219980000102	 Almacenado en Fisico 	1	1234567890	\N	57	\N	1234567890	998
998	2021-04-15 14:43:11.488017-05	1	20219980000102	Se realizó transferencia manual.	1	1234567890	\N	67	\N	1234567890	998
998	2021-04-15 15:08:31.100841-05	1	20219980000191	 Almacenado en Fisico 	1	1234567890	\N	57	\N	1234567890	998
998	2021-04-15 15:16:57.737467-05	1	20219980000191	Se realizó transferencia manual.	1	1234567890	\N	67	\N	1234567890	998
998	2021-04-16 15:14:58.800541-05	1	20219980000014	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-16 16:16:53.642178-05	1	20219980000112	 Se radicado correctamente el documento 	1	1234567890	\N	2	\N	1234567890	998
998	2021-04-16 16:16:53.647156-05	1	20219980000112	A: JMGAMEZ - Se ha generado el radicado No.20219980000112 y se esta notificando.	2	1234567890	\N	8	\N	1022982735	101
998	2021-04-16 16:21:02.716297-05	1	20219980000112	se adjunta documento	1	1234567890	\N	42	\N	1234567890	998
998	2021-04-16 16:25:58.067202-05	1	20219980000112	aprobado para pago	1	1234567890	\N	9	\N	1234567890	998
\.


--
-- Data for Name: informados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.informados (radi_nume_radi, usua_codi, depe_codi, info_desc, info_fech, info_leido, usua_codi_info, info_codi, usua_doc, info_resp) FROM stdin;
20219980000011	1	998	A: ADMON - Se ha generado el radicado No.20219980000011 y se esta notificando. 	2021-02-23	0	\N	1234567890	1234567890	\N
20219980000062	1	100	A: RECEPCION.INVM - Se ha generado el radicado No.20219980000062 y se esta notificando. 	2021-03-31	0	\N	1234567890	1022982736	\N
20219980000062	1	998	A: ADMON - Se ha generado el radicado No.20219980000062 y se esta notificando. 	2021-03-31	1	\N	1234567890	1234567890	\N
20219980000102	2	101	A: JMGAMEZ - Se ha generado el radicado No.20219980000102 y se esta notificando. 	2021-04-13	0	\N	1234567890	1022982735	\N
20219980000102	1	998	A: ADMON - Se ha generado el radicado No.20219980000102 y se esta notificando. 	2021-04-13	1	\N	1234567890	1234567890	\N
20219980000112	2	101	A: JMGAMEZ - Se ha generado el radicado No.20219980000112 y se esta notificando. 	2021-04-16	0	\N	1234567890	1022982735	\N
\.


--
-- Data for Name: inventario_documental; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.inventario_documental (id_inv_documental, uni_administrativa, ofi_productora, no_orden, objeto, codigo, nombre, sub_serie, fecha_ext_ini, fecha_ext_end, caja, carpeta, tomo, otro, modulo, estante, no_folios, fr_consulta, notas, soporte) FROM stdin;
66	Dependencia	998	0001	CENTRAL	0001-998	SERIE	SUBSERIE	2020-12-01	2020-12-31	500	500	500		500	500	500	3	NOTAS	SOPORTE
68	ua	op	no	ob	co	no	sub	2020-12-09	2020-12-25	1	2	3	4	5	6	7	2	Prueba de carga	8
\.


--
-- Data for Name: inventario_documentos; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.inventario_documentos (id_inv_documento, original_inv_doc, nombre_inv_doc, ruta_inv_doc, tipo_inv_doc, tamano_inv_doc, user_inv_doc, creacion_inv_doc, id_inv_documental) FROM stdin;
34	20209980000214.pdf	202000000034.pdf	/dk1/www/html/orfeo-6.0/bodega/2020/inventario/202000000034.pdf	pdf	3489	1234567890	2020-12-16	66
36	PDF PRUEBA.pdf	202000000036.pdf	/dk1/www/html/orfeo-6.0/bodega/2020/inventario/202000000036.pdf	pdf	44930	1234567890	2020-12-16	66
38	El español de Colombia.pdf	202000000038.pdf	/dk1/www/html/orfeo-6.0/bodega/2020/inventario/202000000038.pdf	pdf	29075	1234567890	2020-12-17	68
\.


--
-- Data for Name: medio_recepcion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.medio_recepcion (mrec_codi, mrec_desc) FROM stdin;
1	Mensajeria
6	Telefono
3	Correo electrónico
4	Personal
5	Pagina web
\.


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.municipio (muni_codi, dpto_codi, muni_nomb, id_cont, id_pais, homologa_muni, homologa_idmuni, activa) FROM stdin;
1	10	NEW YORK	1	249	0	\N	1
8	9	BARCELONA	2	724	0	\N	1
1	16	GINEBRA	2	767	0	\N	1
16	9	CUENCA	2	724	0	\N	1
1	5	MEDELLIN	1	170	\N	\N	1
2	5	ABEJORRAL	1	170	\N	\N	1
4	5	ABRIAQUI	1	170	\N	\N	1
21	5	ALEJANDRIA	1	170	\N	\N	1
30	5	AMAGA	1	170	\N	\N	1
31	5	AMALFI	1	170	\N	\N	1
34	5	ANDES	1	170	\N	\N	1
36	5	ANGELOPOLIS	1	170	\N	\N	1
38	5	ANGOSTURA	1	170	\N	\N	1
40	5	ANORI	1	170	\N	\N	1
42	5	SANTA FE DE ANTIOQUIA	1	170	\N	\N	1
44	5	ANZA	1	170	\N	\N	1
51	5	ARBOLETES	1	170	\N	\N	1
55	5	ARGELIA	1	170	\N	\N	1
59	5	ARMENIA	1	170	\N	\N	1
79	5	BARBOSA	1	170	\N	\N	1
86	5	BELMIRA	1	170	\N	\N	1
88	5	BELLO	1	170	\N	\N	1
91	5	BETANIA	1	170	\N	\N	1
93	5	BETULIA	1	170	\N	\N	1
101	5	CIUDAD BOLIVAR	1	170	\N	\N	1
107	5	BRICEÑO	1	170	\N	\N	1
113	5	BURITICA	1	170	\N	\N	1
120	5	CACERES	1	170	\N	\N	1
125	5	CAICEDO	1	170	\N	\N	1
129	5	CALDAS	1	170	\N	\N	1
134	5	CAMPAMENTO	1	170	\N	\N	1
138	5	CAÑASGORDAS	1	170	\N	\N	1
142	5	CARACOLI	1	170	\N	\N	1
145	5	CARAMANTA	1	170	\N	\N	1
147	5	CAREPA	1	170	\N	\N	1
148	5	EL CARMEN DE VIBORAL	1	170	\N	\N	1
150	5	CAROLINA	1	170	\N	\N	1
154	5	CAUCASIA	1	170	\N	\N	1
172	5	CHIGORODO	1	170	\N	\N	1
190	5	CISNEROS	1	170	\N	\N	1
197	5	COCORNA	1	170	\N	\N	1
206	5	CONCEPCION	1	170	\N	\N	1
209	5	CONCORDIA	1	170	\N	\N	1
212	5	COPACABANA	1	170	\N	\N	1
234	5	DABEIBA	1	170	\N	\N	1
237	5	DON MATIAS	1	170	\N	\N	1
240	5	EBEJICO	1	170	\N	\N	1
250	5	EL BAGRE	1	170	\N	\N	1
264	5	ENTRERRIOS	1	170	\N	\N	1
266	5	ENVIGADO	1	170	\N	\N	1
282	5	FREDONIA	1	170	\N	\N	1
284	5	FRONTINO	1	170	\N	\N	1
306	5	GIRALDO	1	170	\N	\N	1
308	5	GIRARDOTA	1	170	\N	\N	1
310	5	GOMEZ PLATA	1	170	\N	\N	1
313	5	GRANADA	1	170	\N	\N	1
315	5	GUADALUPE	1	170	\N	\N	1
318	5	GUARNE	1	170	\N	\N	1
321	5	GUATAPE	1	170	\N	\N	1
347	5	HELICONIA	1	170	\N	\N	1
353	5	HISPANIA	1	170	\N	\N	1
360	5	ITAGUI	1	170	\N	\N	1
361	5	ITUANGO	1	170	\N	\N	1
364	5	JARDIN	1	170	\N	\N	1
368	5	JERICO	1	170	\N	\N	1
376	5	LA CEJA	1	170	\N	\N	1
380	5	LA ESTRELLA	1	170	\N	\N	1
390	5	LA PINTADA	1	170	\N	\N	1
400	5	LA UNION	1	170	\N	\N	1
411	5	LIBORINA	1	170	\N	\N	1
425	5	MACEO	1	170	\N	\N	1
440	5	MARINILLA	1	170	\N	\N	1
467	5	MONTEBELLO	1	170	\N	\N	1
475	5	MURINDO	1	170	\N	\N	1
480	5	MUTATA	1	170	\N	\N	1
483	5	NARIÑO	1	170	\N	\N	1
490	5	NECOCLI	1	170	\N	\N	1
495	5	NECHI	1	170	\N	\N	1
501	5	OLAYA	1	170	\N	\N	1
541	5	PEÑOL	1	170	\N	\N	1
543	5	PEQUE	1	170	\N	\N	1
576	5	PUEBLORRICO	1	170	\N	\N	1
585	5	PUERTO NARE	1	170	\N	\N	1
591	5	PUERTO TRIUNFO	1	170	\N	\N	1
604	5	REMEDIOS	1	170	\N	\N	1
607	5	RETIRO	1	170	\N	\N	1
615	5	RIONEGRO	1	170	\N	\N	1
628	5	SABANALARGA	1	170	\N	\N	1
631	5	SABANETA	1	170	\N	\N	1
642	5	SALGAR	1	170	\N	\N	1
647	5	SAN ANDRES DE CUERQUIA	1	170	\N	\N	1
649	5	SAN CARLOS	1	170	\N	\N	1
652	5	SAN FRANCISCO	1	170	\N	\N	1
656	5	SAN JERONIMO	1	170	\N	\N	1
658	5	SAN JOSE DE LA MONTAÑA	1	170	\N	\N	1
659	5	SAN JUAN DE URABA	1	170	\N	\N	1
660	5	SAN LUIS	1	170	\N	\N	1
664	5	SAN PEDRO DE LOS MILAGROS	1	170	\N	\N	1
665	5	SAN PEDRO DE URABA	1	170	\N	\N	1
667	5	SAN RAFAEL	1	170	\N	\N	1
670	5	SAN ROQUE	1	170	\N	\N	1
674	5	SAN VICENTE FERRER	1	170	\N	\N	1
679	5	SANTA BARBARA	1	170	\N	\N	1
686	5	SANTA ROSA DE OSOS	1	170	\N	\N	1
690	5	SANTO DOMINGO	1	170	\N	\N	1
697	5	EL SANTUARIO	1	170	\N	\N	1
736	5	SEGOVIA	1	170	\N	\N	1
756	5	SONSON	1	170	\N	\N	1
761	5	SOPETRAN	1	170	\N	\N	1
789	5	TAMESIS	1	170	\N	\N	1
790	5	TARAZA	1	170	\N	\N	1
792	5	TARSO	1	170	\N	\N	1
809	5	TITIRIBI	1	170	\N	\N	1
819	5	TOLEDO	1	170	\N	\N	1
837	5	TURBO	1	170	\N	\N	1
842	5	URAMITA	1	170	\N	\N	1
847	5	URRAO	1	170	\N	\N	1
854	5	VALDIVIA	1	170	\N	\N	1
856	5	VALPARAISO	1	170	\N	\N	1
858	5	VEGACHI	1	170	\N	\N	1
861	5	VENECIA	1	170	\N	\N	1
873	5	VIGIA DEL FUERTE	1	170	\N	\N	1
885	5	YALI	1	170	\N	\N	1
887	5	YARUMAL	1	170	\N	\N	1
890	5	YOLOMBO	1	170	\N	\N	1
893	5	YONDO	1	170	\N	\N	1
895	5	ZARAGOZA	1	170	\N	\N	1
1	8	BARRANQUILLA	1	170	\N	\N	1
78	8	BARANOA	1	170	\N	\N	1
137	8	CAMPO DE LA CRUZ	1	170	\N	\N	1
141	8	CANDELARIA	1	170	\N	\N	1
296	8	GALAPA	1	170	\N	\N	1
372	8	JUAN DE ACOSTA	1	170	\N	\N	1
421	8	LURUACO	1	170	\N	\N	1
433	8	MALAMBO	1	170	\N	\N	1
436	8	MANATI	1	170	\N	\N	1
520	8	PALMAR DE VARELA	1	170	\N	\N	1
549	8	PIOJO	1	170	\N	\N	1
558	8	POLONUEVO	1	170	\N	\N	1
560	8	PONEDERA	1	170	\N	\N	1
573	8	PUERTO COLOMBIA	1	170	\N	\N	1
606	8	REPELON	1	170	\N	\N	1
634	8	SABANAGRANDE	1	170	\N	\N	1
638	8	SABANALARGA	1	170	\N	\N	1
675	8	SANTA LUCIA	1	170	\N	\N	1
685	8	SANTO TOMAS	1	170	\N	\N	1
758	8	SOLEDAD	1	170	\N	\N	1
770	8	SUAN	1	170	\N	\N	1
832	8	TUBARA	1	170	\N	\N	1
849	8	USIACURI	1	170	\N	\N	1
1	13	CARTAGENA	1	170	\N	\N	1
6	13	ACHI	1	170	\N	\N	1
30	13	ALTOS DEL ROSARIO	1	170	\N	\N	1
42	13	ARENAL	1	170	\N	\N	1
52	13	ARJONA	1	170	\N	\N	1
62	13	ARROYOHONDO	1	170	\N	\N	1
74	13	BARRANCO DE LOBA	1	170	\N	\N	1
140	13	CALAMAR	1	170	\N	\N	1
160	13	CANTAGALLO	1	170	\N	\N	1
188	13	CICUCO	1	170	\N	\N	1
212	13	CORDOBA	1	170	\N	\N	1
222	13	CLEMENCIA	1	170	\N	\N	1
244	13	EL CARMEN DE BOLIVAR	1	170	\N	\N	1
248	13	EL GUAMO	1	170	\N	\N	1
268	13	EL PEÑON	1	170	\N	\N	1
300	13	HATILLO DE LOBA	1	170	\N	\N	1
430	13	MAGANGUE	1	170	\N	\N	1
433	13	MAHATES	1	170	\N	\N	1
440	13	MARGARITA	1	170	\N	\N	1
442	13	MARIA LA BAJA	1	170	\N	\N	1
458	13	MONTECRISTO	1	170	\N	\N	1
468	13	MOMPOS	1	170	\N	\N	1
473	13	MORALES	1	170	\N	\N	1
490	13	NOROSI	1	170	\N	\N	1
549	13	PINILLOS	1	170	\N	\N	1
580	13	REGIDOR	1	170	\N	\N	1
600	13	RIO VIEJO	1	170	\N	\N	1
620	13	SAN CRISTOBAL	1	170	\N	\N	1
647	13	SAN ESTANISLAO	1	170	\N	\N	1
650	13	SAN FERNANDO	1	170	\N	\N	1
654	13	SAN JACINTO	1	170	\N	\N	1
655	13	SAN JACINTO DEL CAUCA	1	170	\N	\N	1
657	13	SAN JUAN NEPOMUCENO	1	170	\N	\N	1
667	13	SAN MARTIN DE LOBA	1	170	\N	\N	1
670	13	SAN PABLO	1	170	\N	\N	1
673	13	SANTA CATALINA	1	170	\N	\N	1
683	13	SANTA ROSA	1	170	\N	\N	1
688	13	SANTA ROSA DEL SUR	1	170	\N	\N	1
744	13	SIMITI	1	170	\N	\N	1
760	13	SOPLAVIENTO	1	170	\N	\N	1
780	13	TALAIGUA NUEVO	1	170	\N	\N	1
810	13	TIQUISIO	1	170	\N	\N	1
836	13	TURBACO	1	170	\N	\N	1
838	13	TURBANA	1	170	\N	\N	1
873	13	VILLANUEVA	1	170	\N	\N	1
894	13	ZAMBRANO	1	170	\N	\N	1
1	15	TUNJA	1	170	\N	\N	1
22	15	ALMEIDA	1	170	\N	\N	1
47	15	AQUITANIA	1	170	\N	\N	1
51	15	ARCABUCO	1	170	\N	\N	1
87	15	BELEN	1	170	\N	\N	1
90	15	BERBEO	1	170	\N	\N	1
92	15	BETEITIVA	1	170	\N	\N	1
97	15	BOAVITA	1	170	\N	\N	1
104	15	BOYACA	1	170	\N	\N	1
106	15	BRICEÑO	1	170	\N	\N	1
109	15	BUENAVISTA	1	170	\N	\N	1
114	15	BUSBANZA	1	170	\N	\N	1
131	15	CALDAS	1	170	\N	\N	1
135	15	CAMPOHERMOSO	1	170	\N	\N	1
162	15	CERINZA	1	170	\N	\N	1
172	15	CHINAVITA	1	170	\N	\N	1
176	15	CHIQUINQUIRA	1	170	\N	\N	1
180	15	CHISCAS	1	170	\N	\N	1
183	15	CHITA	1	170	\N	\N	1
185	15	CHITARAQUE	1	170	\N	\N	1
187	15	CHIVATA	1	170	\N	\N	1
189	15	CIENEGA	1	170	\N	\N	1
204	15	COMBITA	1	170	\N	\N	1
212	15	COPER	1	170	\N	\N	1
215	15	CORRALES	1	170	\N	\N	1
218	15	COVARACHIA	1	170	\N	\N	1
223	15	CUBARA	1	170	\N	\N	1
224	15	CUCAITA	1	170	\N	\N	1
226	15	CUITIVA	1	170	\N	\N	1
232	15	CHIQUIZA	1	170	\N	\N	1
236	15	CHIVOR	1	170	\N	\N	1
238	15	DUITAMA	1	170	\N	\N	1
244	15	EL COCUY	1	170	\N	\N	1
248	15	EL ESPINO	1	170	\N	\N	1
272	15	FIRAVITOBA	1	170	\N	\N	1
276	15	FLORESTA	1	170	\N	\N	1
293	15	GACHANTIVA	1	170	\N	\N	1
296	15	GAMEZA	1	170	\N	\N	1
299	15	GARAGOA	1	170	\N	\N	1
317	15	GUACAMAYAS	1	170	\N	\N	1
322	15	GUATEQUE	1	170	\N	\N	1
325	15	GUAYATA	1	170	\N	\N	1
332	15	GUICAN DE LA SIERRA	1	170	\N	\N	1
362	15	IZA	1	170	\N	\N	1
367	15	JENESANO	1	170	\N	\N	1
368	15	JERICO	1	170	\N	\N	1
377	15	LABRANZAGRANDE	1	170	\N	\N	1
380	15	LA CAPILLA	1	170	\N	\N	1
401	15	LA VICTORIA	1	170	\N	\N	1
403	15	LA UVITA	1	170	\N	\N	1
407	15	VILLA DE LEYVA	1	170	\N	\N	1
425	15	MACANAL	1	170	\N	\N	1
442	15	MARIPI	1	170	\N	\N	1
455	15	MIRAFLORES	1	170	\N	\N	1
464	15	MONGUA	1	170	\N	\N	1
466	15	MONGUI	1	170	\N	\N	1
469	15	MONIQUIRA	1	170	\N	\N	1
476	15	MOTAVITA	1	170	\N	\N	1
480	15	MUZO	1	170	\N	\N	1
491	15	NOBSA	1	170	\N	\N	1
494	15	NUEVO COLON	1	170	\N	\N	1
500	15	OICATA	1	170	\N	\N	1
507	15	OTANCHE	1	170	\N	\N	1
511	15	PACHAVITA	1	170	\N	\N	1
514	15	PAEZ	1	170	\N	\N	1
516	15	PAIPA	1	170	\N	\N	1
518	15	PAJARITO	1	170	\N	\N	1
522	15	PANQUEBA	1	170	\N	\N	1
531	15	PAUNA	1	170	\N	\N	1
533	15	PAYA	1	170	\N	\N	1
537	15	PAZ DE RIO	1	170	\N	\N	1
542	15	PESCA	1	170	\N	\N	1
550	15	PISBA	1	170	\N	\N	1
572	15	PUERTO BOYACA	1	170	\N	\N	1
580	15	QUIPAMA	1	170	\N	\N	1
599	15	RAMIRIQUI	1	170	\N	\N	1
600	15	RAQUIRA	1	170	\N	\N	1
621	15	RONDON	1	170	\N	\N	1
632	15	SABOYA	1	170	\N	\N	1
638	15	SACHICA	1	170	\N	\N	1
646	15	SAMACA	1	170	\N	\N	1
660	15	SAN EDUARDO	1	170	\N	\N	1
664	15	SAN JOSE DE PARE	1	170	\N	\N	1
667	15	SAN LUIS DE GACENO	1	170	\N	\N	1
673	15	SAN MATEO	1	170	\N	\N	1
676	15	SAN MIGUEL DE SEMA	1	170	\N	\N	1
681	15	SAN PABLO DE BORBUR	1	170	\N	\N	1
686	15	SANTANA	1	170	\N	\N	1
690	15	SANTA MARIA	1	170	\N	\N	1
693	15	SANTA ROSA DE VITERBO	1	170	\N	\N	1
696	15	SANTA SOFIA	1	170	\N	\N	1
720	15	SATIVANORTE	1	170	\N	\N	1
723	15	SATIVASUR	1	170	\N	\N	1
740	15	SIACHOQUE	1	170	\N	\N	1
753	15	SOATA	1	170	\N	\N	1
755	15	SOCOTA	1	170	\N	\N	1
757	15	SOCHA	1	170	\N	\N	1
759	15	SOGAMOSO	1	170	\N	\N	1
761	15	SOMONDOCO	1	170	\N	\N	1
762	15	SORA	1	170	\N	\N	1
763	15	SOTAQUIRA	1	170	\N	\N	1
764	15	SORACA	1	170	\N	\N	1
774	15	SUSACON	1	170	\N	\N	1
776	15	SUTAMARCHAN	1	170	\N	\N	1
778	15	SUTATENZA	1	170	\N	\N	1
790	15	TASCO	1	170	\N	\N	1
798	15	TENZA	1	170	\N	\N	1
804	15	TIBANA	1	170	\N	\N	1
806	15	TIBASOSA	1	170	\N	\N	1
808	15	TINJACA	1	170	\N	\N	1
810	15	TIPACOQUE	1	170	\N	\N	1
814	15	TOCA	1	170	\N	\N	1
816	15	TOGUI	1	170	\N	\N	1
820	15	TOPAGA	1	170	\N	\N	1
822	15	TOTA	1	170	\N	\N	1
832	15	TUNUNGUA	1	170	\N	\N	1
835	15	TURMEQUE	1	170	\N	\N	1
837	15	TUTA	1	170	\N	\N	1
839	15	TUTAZA	1	170	\N	\N	1
842	15	UMBITA	1	170	\N	\N	1
861	15	VENTAQUEMADA	1	170	\N	\N	1
879	15	VIRACACHA	1	170	\N	\N	1
897	15	ZETAQUIRA	1	170	\N	\N	1
1	17	MANIZALES	1	170	\N	\N	1
13	17	AGUADAS	1	170	\N	\N	1
42	17	ANSERMA	1	170	\N	\N	1
50	17	ARANZAZU	1	170	\N	\N	1
88	17	BELALCAZAR	1	170	\N	\N	1
174	17	CHINCHINA	1	170	\N	\N	1
272	17	FILADELFIA	1	170	\N	\N	1
380	17	LA DORADA	1	170	\N	\N	1
388	17	LA MERCED	1	170	\N	\N	1
433	17	MANZANARES	1	170	\N	\N	1
442	17	MARMATO	1	170	\N	\N	1
444	17	MARQUETALIA	1	170	\N	\N	1
446	17	MARULANDA	1	170	\N	\N	1
486	17	NEIRA	1	170	\N	\N	1
495	17	NORCASIA	1	170	\N	\N	1
513	17	PACORA	1	170	\N	\N	1
524	17	PALESTINA	1	170	\N	\N	1
541	17	PENSILVANIA	1	170	\N	\N	1
614	17	RIOSUCIO	1	170	\N	\N	1
616	17	RISARALDA	1	170	\N	\N	1
653	17	SALAMINA	1	170	\N	\N	1
662	17	SAMANA	1	170	\N	\N	1
665	17	SAN JOSE	1	170	\N	\N	1
777	17	SUPIA	1	170	\N	\N	1
867	17	VICTORIA	1	170	\N	\N	1
873	17	VILLAMARIA	1	170	\N	\N	1
877	17	VITERBO	1	170	\N	\N	1
1	19	POPAYAN	1	170	\N	\N	1
22	19	ALMAGUER	1	170	\N	\N	1
50	19	ARGELIA	1	170	\N	\N	1
75	19	BALBOA	1	170	\N	\N	1
100	19	BOLIVAR	1	170	\N	\N	1
110	19	BUENOS AIRES	1	170	\N	\N	1
130	19	CAJIBIO	1	170	\N	\N	1
137	19	CALDONO	1	170	\N	\N	1
142	19	CALOTO	1	170	\N	\N	1
212	19	CORINTO	1	170	\N	\N	1
256	19	EL TAMBO	1	170	\N	\N	1
290	19	FLORENCIA	1	170	\N	\N	1
300	19	GUACHENE	1	170	\N	\N	1
318	19	GUAPI	1	170	\N	\N	1
355	19	INZA	1	170	\N	\N	1
364	19	JAMBALO	1	170	\N	\N	1
392	19	LA SIERRA	1	170	\N	\N	1
397	19	LA VEGA	1	170	\N	\N	1
418	19	LOPEZ DE MICAY	1	170	\N	\N	1
450	19	MERCADERES	1	170	\N	\N	1
455	19	MIRANDA	1	170	\N	\N	1
473	19	MORALES	1	170	\N	\N	1
513	19	PADILLA	1	170	\N	\N	1
517	19	PAEZ	1	170	\N	\N	1
532	19	PATIA	1	170	\N	\N	1
533	19	PIAMONTE	1	170	\N	\N	1
548	19	PIENDAMO	1	170	\N	\N	1
573	19	PUERTO TEJADA	1	170	\N	\N	1
585	19	PURACE	1	170	\N	\N	1
622	19	ROSAS	1	170	\N	\N	1
693	19	SAN SEBASTIAN	1	170	\N	\N	1
698	19	SANTANDER DE QUILICHAO	1	170	\N	\N	1
701	19	SANTA ROSA	1	170	\N	\N	1
743	19	SILVIA	1	170	\N	\N	1
760	19	SOTARA	1	170	\N	\N	1
780	19	SUAREZ	1	170	\N	\N	1
785	19	SUCRE	1	170	\N	\N	1
807	19	TIMBIO	1	170	\N	\N	1
809	19	TIMBIQUI	1	170	\N	\N	1
821	19	TORIBIO	1	170	\N	\N	1
824	19	TOTORO	1	170	\N	\N	1
845	19	VILLA RICA	1	170	\N	\N	1
1	20	VALLEDUPAR	1	170	\N	\N	1
13	20	AGUSTIN CODAZZI	1	170	\N	\N	1
32	20	ASTREA	1	170	\N	\N	1
45	20	BECERRIL	1	170	\N	\N	1
60	20	BOSCONIA	1	170	\N	\N	1
175	20	CHIMICHAGUA	1	170	\N	\N	1
178	20	CHIRIGUANA	1	170	\N	\N	1
228	20	CURUMANI	1	170	\N	\N	1
238	20	EL COPEY	1	170	\N	\N	1
250	20	EL PASO	1	170	\N	\N	1
295	20	GAMARRA	1	170	\N	\N	1
310	20	GONZALEZ	1	170	\N	\N	1
383	20	LA GLORIA	1	170	\N	\N	1
400	20	LA JAGUA DE IBIRICO	1	170	\N	\N	1
443	20	MANAURE BALCON DEL CESAR	1	170	\N	\N	1
517	20	PAILITAS	1	170	\N	\N	1
550	20	PELAYA	1	170	\N	\N	1
570	20	PUEBLO BELLO	1	170	\N	\N	1
614	20	RIO DE ORO	1	170	\N	\N	1
621	20	LA PAZ	1	170	\N	\N	1
710	20	SAN ALBERTO	1	170	\N	\N	1
750	20	SAN DIEGO	1	170	\N	\N	1
770	20	SAN MARTIN	1	170	\N	\N	1
787	20	TAMALAMEQUE	1	170	\N	\N	1
1	23	MONTERIA	1	170	\N	\N	1
68	23	AYAPEL	1	170	\N	\N	1
79	23	BUENAVISTA	1	170	\N	\N	1
90	23	CANALETE	1	170	\N	\N	1
162	23	CERETE	1	170	\N	\N	1
168	23	CHIMA	1	170	\N	\N	1
182	23	CHINU	1	170	\N	\N	1
189	23	CIENAGA DE ORO	1	170	\N	\N	1
300	23	COTORRA	1	170	\N	\N	1
350	23	LA APARTADA	1	170	\N	\N	1
417	23	LORICA	1	170	\N	\N	1
419	23	LOS CORDOBAS	1	170	\N	\N	1
464	23	MOMIL	1	170	\N	\N	1
466	23	MONTELIBANO	1	170	\N	\N	1
500	23	MOÑITOS	1	170	\N	\N	1
555	23	PLANETA RICA	1	170	\N	\N	1
570	23	PUEBLO NUEVO	1	170	\N	\N	1
574	23	PUERTO ESCONDIDO	1	170	\N	\N	1
580	23	PUERTO LIBERTADOR	1	170	\N	\N	1
586	23	PURISIMA DE LA CONCEPCION	1	170	\N	\N	1
660	23	SAHAGUN	1	170	\N	\N	1
670	23	SAN ANDRES DE SOTAVENTO	1	170	\N	\N	1
672	23	SAN ANTERO	1	170	\N	\N	1
675	23	SAN BERNARDO DEL VIENTO	1	170	\N	\N	1
678	23	SAN CARLOS	1	170	\N	\N	1
682	23	SAN JOSE DE URE	1	170	\N	\N	1
686	23	SAN PELAYO	1	170	\N	\N	1
807	23	TIERRALTA	1	170	\N	\N	1
815	23	TUCHIN	1	170	\N	\N	1
855	23	VALENCIA	1	170	\N	\N	1
1	25	AGUA DE DIOS	1	170	\N	\N	1
19	25	ALBAN	1	170	\N	\N	1
35	25	ANAPOIMA	1	170	\N	\N	1
40	25	ANOLAIMA	1	170	\N	\N	1
53	25	ARBELAEZ	1	170	\N	\N	1
86	25	BELTRAN	1	170	\N	\N	1
95	25	BITUIMA	1	170	\N	\N	1
99	25	BOJACA	1	170	\N	\N	1
120	25	CABRERA	1	170	\N	\N	1
123	25	CACHIPAY	1	170	\N	\N	1
126	25	CAJICA	1	170	\N	\N	1
148	25	CAPARRAPI	1	170	\N	\N	1
151	25	CAQUEZA	1	170	\N	\N	1
154	25	CARMEN DE CARUPA	1	170	\N	\N	1
168	25	CHAGUANI	1	170	\N	\N	1
175	25	CHIA	1	170	\N	\N	1
178	25	CHIPAQUE	1	170	\N	\N	1
181	25	CHOACHI	1	170	\N	\N	1
183	25	CHOCONTA	1	170	\N	\N	1
200	25	COGUA	1	170	\N	\N	1
214	25	COTA	1	170	\N	\N	1
224	25	CUCUNUBA	1	170	\N	\N	1
245	25	EL COLEGIO	1	170	\N	\N	1
258	25	EL PEÑON	1	170	\N	\N	1
260	25	EL ROSAL	1	170	\N	\N	1
269	25	FACATATIVA	1	170	\N	\N	1
279	25	FOMEQUE	1	170	\N	\N	1
281	25	FOSCA	1	170	\N	\N	1
286	25	FUNZA	1	170	\N	\N	1
288	25	FUQUENE	1	170	\N	\N	1
290	25	FUSAGASUGA	1	170	\N	\N	1
293	25	GACHALA	1	170	\N	\N	1
295	25	GACHANCIPA	1	170	\N	\N	1
297	25	GACHETA	1	170	\N	\N	1
299	25	GAMA	1	170	\N	\N	1
307	25	GIRARDOT	1	170	\N	\N	1
312	25	GRANADA	1	170	\N	\N	1
317	25	GUACHETA	1	170	\N	\N	1
320	25	GUADUAS	1	170	\N	\N	1
322	25	GUASCA	1	170	\N	\N	1
324	25	GUATAQUI	1	170	\N	\N	1
326	25	GUATAVITA	1	170	\N	\N	1
328	25	GUAYABAL DE SIQUIMA	1	170	\N	\N	1
335	25	GUAYABETAL	1	170	\N	\N	1
339	25	GUTIERREZ	1	170	\N	\N	1
368	25	JERUSALEN	1	170	\N	\N	1
372	25	JUNIN	1	170	\N	\N	1
377	25	LA CALERA	1	170	\N	\N	1
386	25	LA MESA	1	170	\N	\N	1
394	25	LA PALMA	1	170	\N	\N	1
398	25	LA PEÑA	1	170	\N	\N	1
402	25	LA VEGA	1	170	\N	\N	1
407	25	LENGUAZAQUE	1	170	\N	\N	1
426	25	MACHETA	1	170	\N	\N	1
430	25	MADRID	1	170	\N	\N	1
436	25	MANTA	1	170	\N	\N	1
438	25	MEDINA	1	170	\N	\N	1
473	25	MOSQUERA	1	170	\N	\N	1
483	25	NARIÑO	1	170	\N	\N	1
486	25	NEMOCON	1	170	\N	\N	1
488	25	NILO	1	170	\N	\N	1
489	25	NIMAIMA	1	170	\N	\N	1
491	25	NOCAIMA	1	170	\N	\N	1
506	25	VENECIA	1	170	\N	\N	1
513	25	PACHO	1	170	\N	\N	1
518	25	PAIME	1	170	\N	\N	1
524	25	PANDI	1	170	\N	\N	1
530	25	PARATEBUENO	1	170	\N	\N	1
535	25	PASCA	1	170	\N	\N	1
572	25	PUERTO SALGAR	1	170	\N	\N	1
580	25	PULI	1	170	\N	\N	1
592	25	QUEBRADANEGRA	1	170	\N	\N	1
594	25	QUETAME	1	170	\N	\N	1
596	25	QUIPILE	1	170	\N	\N	1
599	25	APULO	1	170	\N	\N	1
612	25	RICAURTE	1	170	\N	\N	1
645	25	SAN ANTONIO DEL TEQUENDAMA	1	170	\N	\N	1
649	25	SAN BERNARDO	1	170	\N	\N	1
653	25	SAN CAYETANO	1	170	\N	\N	1
658	25	SAN FRANCISCO	1	170	\N	\N	1
662	25	SAN JUAN DE RIOSECO	1	170	\N	\N	1
718	25	SASAIMA	1	170	\N	\N	1
736	25	SESQUILE	1	170	\N	\N	1
740	25	SIBATE	1	170	\N	\N	1
743	25	SILVANIA	1	170	\N	\N	1
745	25	SIMIJACA	1	170	\N	\N	1
754	25	SOACHA	1	170	\N	\N	1
758	25	SOPO	1	170	\N	\N	1
769	25	SUBACHOQUE	1	170	\N	\N	1
772	25	SUESCA	1	170	\N	\N	1
777	25	SUPATA	1	170	\N	\N	1
779	25	SUSA	1	170	\N	\N	1
781	25	SUTATAUSA	1	170	\N	\N	1
785	25	TABIO	1	170	\N	\N	1
793	25	TAUSA	1	170	\N	\N	1
797	25	TENA	1	170	\N	\N	1
799	25	TENJO	1	170	\N	\N	1
805	25	TIBACUY	1	170	\N	\N	1
807	25	TIBIRITA	1	170	\N	\N	1
815	25	TOCAIMA	1	170	\N	\N	1
817	25	TOCANCIPA	1	170	\N	\N	1
823	25	TOPAIPI	1	170	\N	\N	1
839	25	UBALA	1	170	\N	\N	1
841	25	UBAQUE	1	170	\N	\N	1
843	25	VILLA DE SAN DIEGO DE UBATE	1	170	\N	\N	1
845	25	UNE	1	170	\N	\N	1
851	25	UTICA	1	170	\N	\N	1
862	25	VERGARA	1	170	\N	\N	1
867	25	VIANI	1	170	\N	\N	1
871	25	VILLAGOMEZ	1	170	\N	\N	1
873	25	VILLAPINZON	1	170	\N	\N	1
875	25	VILLETA	1	170	\N	\N	1
878	25	VIOTA	1	170	\N	\N	1
885	25	YACOPI	1	170	\N	\N	1
898	25	ZIPACON	1	170	\N	\N	1
899	25	ZIPAQUIRA	1	170	\N	\N	1
1	27	QUIBDO	1	170	\N	\N	1
6	27	ACANDI	1	170	\N	\N	1
25	27	ALTO BAUDO	1	170	\N	\N	1
50	27	ATRATO	1	170	\N	\N	1
73	27	BAGADO	1	170	\N	\N	1
75	27	BAHIA SOLANO	1	170	\N	\N	1
77	27	BAJO BAUDO	1	170	\N	\N	1
99	27	BOJAYA	1	170	\N	\N	1
135	27	EL CANTON DEL SAN PABLO	1	170	\N	\N	1
150	27	CARMEN DEL DARIEN	1	170	\N	\N	1
160	27	CERTEGUI	1	170	\N	\N	1
205	27	CONDOTO	1	170	\N	\N	1
245	27	EL CARMEN DE ATRATO	1	170	\N	\N	1
250	27	EL LITORAL DEL SAN JUAN	1	170	\N	\N	1
361	27	ISTMINA	1	170	\N	\N	1
372	27	JURADO	1	170	\N	\N	1
413	27	LLORO	1	170	\N	\N	1
425	27	MEDIO ATRATO	1	170	\N	\N	1
430	27	MEDIO BAUDO	1	170	\N	\N	1
450	27	MEDIO SAN JUAN	1	170	\N	\N	1
491	27	NOVITA	1	170	\N	\N	1
495	27	NUQUI	1	170	\N	\N	1
580	27	RIO IRO	1	170	\N	\N	1
600	27	RIO QUITO	1	170	\N	\N	1
615	27	RIOSUCIO	1	170	\N	\N	1
660	27	SAN JOSE DEL PALMAR	1	170	\N	\N	1
745	27	SIPI	1	170	\N	\N	1
787	27	TADO	1	170	\N	\N	1
800	27	UNGUIA	1	170	\N	\N	1
810	27	UNION PANAMERICANA	1	170	\N	\N	1
1	41	NEIVA	1	170	\N	\N	1
6	41	ACEVEDO	1	170	\N	\N	1
13	41	AGRADO	1	170	\N	\N	1
16	41	AIPE	1	170	\N	\N	1
20	41	ALGECIRAS	1	170	\N	\N	1
26	41	ALTAMIRA	1	170	\N	\N	1
78	41	BARAYA	1	170	\N	\N	1
132	41	CAMPOALEGRE	1	170	\N	\N	1
206	41	COLOMBIA	1	170	\N	\N	1
244	41	ELIAS	1	170	\N	\N	1
298	41	GARZON	1	170	\N	\N	1
306	41	GIGANTE	1	170	\N	\N	1
319	41	GUADALUPE	1	170	\N	\N	1
349	41	HOBO	1	170	\N	\N	1
357	41	IQUIRA	1	170	\N	\N	1
359	41	ISNOS	1	170	\N	\N	1
378	41	LA ARGENTINA	1	170	\N	\N	1
396	41	LA PLATA	1	170	\N	\N	1
483	41	NATAGA	1	170	\N	\N	1
503	41	OPORAPA	1	170	\N	\N	1
518	41	PAICOL	1	170	\N	\N	1
524	41	PALERMO	1	170	\N	\N	1
530	41	PALESTINA	1	170	\N	\N	1
548	41	PITAL	1	170	\N	\N	1
551	41	PITALITO	1	170	\N	\N	1
615	41	RIVERA	1	170	\N	\N	1
660	41	SALADOBLANCO	1	170	\N	\N	1
668	41	SAN AGUSTIN	1	170	\N	\N	1
676	41	SANTA MARIA	1	170	\N	\N	1
770	41	SUAZA	1	170	\N	\N	1
791	41	TARQUI	1	170	\N	\N	1
797	41	TESALIA	1	170	\N	\N	1
799	41	TELLO	1	170	\N	\N	1
801	41	TERUEL	1	170	\N	\N	1
807	41	TIMANA	1	170	\N	\N	1
872	41	VILLAVIEJA	1	170	\N	\N	1
885	41	YAGUARA	1	170	\N	\N	1
1	44	RIOHACHA	1	170	\N	\N	1
35	44	ALBANIA	1	170	\N	\N	1
78	44	BARRANCAS	1	170	\N	\N	1
90	44	DIBULLA	1	170	\N	\N	1
98	44	DISTRACCION	1	170	\N	\N	1
110	44	EL MOLINO	1	170	\N	\N	1
279	44	FONSECA	1	170	\N	\N	1
378	44	HATONUEVO	1	170	\N	\N	1
420	44	LA JAGUA DEL PILAR	1	170	\N	\N	1
430	44	MAICAO	1	170	\N	\N	1
560	44	MANAURE	1	170	\N	\N	1
650	44	SAN JUAN DEL CESAR	1	170	\N	\N	1
847	44	URIBIA	1	170	\N	\N	1
855	44	URUMITA	1	170	\N	\N	1
874	44	VILLANUEVA	1	170	\N	\N	1
1	47	SANTA MARTA	1	170	\N	\N	1
30	47	ALGARROBO	1	170	\N	\N	1
53	47	ARACATACA	1	170	\N	\N	1
58	47	ARIGUANI	1	170	\N	\N	1
161	47	CERRO DE SAN ANTONIO	1	170	\N	\N	1
170	47	CHIVOLO	1	170	\N	\N	1
189	47	CIENAGA	1	170	\N	\N	1
205	47	CONCORDIA	1	170	\N	\N	1
245	47	EL BANCO	1	170	\N	\N	1
258	47	EL PIÑON	1	170	\N	\N	1
268	47	EL RETEN	1	170	\N	\N	1
288	47	FUNDACION	1	170	\N	\N	1
318	47	GUAMAL	1	170	\N	\N	1
460	47	NUEVA GRANADA	1	170	\N	\N	1
541	47	PEDRAZA	1	170	\N	\N	1
545	47	PIJIÑO DEL CARMEN	1	170	\N	\N	1
551	47	PIVIJAY	1	170	\N	\N	1
555	47	PLATO	1	170	\N	\N	1
570	47	PUEBLOVIEJO	1	170	\N	\N	1
605	47	REMOLINO	1	170	\N	\N	1
660	47	SABANAS DE SAN ANGEL	1	170	\N	\N	1
675	47	SALAMINA	1	170	\N	\N	1
692	47	SAN SEBASTIAN DE BUENAVISTA	1	170	\N	\N	1
703	47	SAN ZENON	1	170	\N	\N	1
707	47	SANTA ANA	1	170	\N	\N	1
720	47	SANTA BARBARA DE PINTO	1	170	\N	\N	1
745	47	SITIONUEVO	1	170	\N	\N	1
798	47	TENERIFE	1	170	\N	\N	1
960	47	ZAPAYAN	1	170	\N	\N	1
980	47	ZONA BANANERA	1	170	\N	\N	1
1	50	VILLAVICENCIO	1	170	\N	\N	1
6	50	ACACIAS	1	170	\N	\N	1
110	50	BARRANCA DE UPIA	1	170	\N	\N	1
124	50	CABUYARO	1	170	\N	\N	1
150	50	CASTILLA LA NUEVA	1	170	\N	\N	1
223	50	CUBARRAL	1	170	\N	\N	1
226	50	CUMARAL	1	170	\N	\N	1
245	50	EL CALVARIO	1	170	\N	\N	1
251	50	EL CASTILLO	1	170	\N	\N	1
270	50	EL DORADO	1	170	\N	\N	1
287	50	FUENTE DE ORO	1	170	\N	\N	1
313	50	GRANADA	1	170	\N	\N	1
318	50	GUAMAL	1	170	\N	\N	1
325	50	MAPIRIPAN	1	170	\N	\N	1
330	50	MESETAS	1	170	\N	\N	1
350	50	LA MACARENA	1	170	\N	\N	1
370	50	URIBE	1	170	\N	\N	1
400	50	LEJANIAS	1	170	\N	\N	1
450	50	PUERTO CONCORDIA	1	170	\N	\N	1
568	50	PUERTO GAITAN	1	170	\N	\N	1
573	50	PUERTO LOPEZ	1	170	\N	\N	1
577	50	PUERTO LLERAS	1	170	\N	\N	1
590	50	PUERTO RICO	1	170	\N	\N	1
606	50	RESTREPO	1	170	\N	\N	1
680	50	SAN CARLOS DE GUAROA	1	170	\N	\N	1
683	50	SAN JUAN DE ARAMA	1	170	\N	\N	1
686	50	SAN JUANITO	1	170	\N	\N	1
689	50	SAN MARTIN	1	170	\N	\N	1
711	50	VISTAHERMOSA	1	170	\N	\N	1
1	52	PASTO	1	170	\N	\N	1
19	52	ALBAN	1	170	\N	\N	1
22	52	ALDANA	1	170	\N	\N	1
36	52	ANCUYA	1	170	\N	\N	1
51	52	ARBOLEDA	1	170	\N	\N	1
79	52	BARBACOAS	1	170	\N	\N	1
83	52	BELEN	1	170	\N	\N	1
110	52	BUESACO	1	170	\N	\N	1
203	52	COLON	1	170	\N	\N	1
207	52	CONSACA	1	170	\N	\N	1
210	52	CONTADERO	1	170	\N	\N	1
215	52	CORDOBA	1	170	\N	\N	1
224	52	CUASPUD	1	170	\N	\N	1
227	52	CUMBAL	1	170	\N	\N	1
233	52	CUMBITARA	1	170	\N	\N	1
240	52	CHACHAGUI	1	170	\N	\N	1
250	52	EL CHARCO	1	170	\N	\N	1
254	52	EL PEÑOL	1	170	\N	\N	1
256	52	EL ROSARIO	1	170	\N	\N	1
258	52	EL TABLON DE GOMEZ	1	170	\N	\N	1
260	52	EL TAMBO	1	170	\N	\N	1
287	52	FUNES	1	170	\N	\N	1
317	52	GUACHUCAL	1	170	\N	\N	1
320	52	GUAITARILLA	1	170	\N	\N	1
323	52	GUALMATAN	1	170	\N	\N	1
352	52	ILES	1	170	\N	\N	1
354	52	IMUES	1	170	\N	\N	1
356	52	IPIALES	1	170	\N	\N	1
378	52	LA CRUZ	1	170	\N	\N	1
381	52	LA FLORIDA	1	170	\N	\N	1
385	52	LA LLANADA	1	170	\N	\N	1
390	52	LA TOLA	1	170	\N	\N	1
399	52	LA UNION	1	170	\N	\N	1
405	52	LEIVA	1	170	\N	\N	1
411	52	LINARES	1	170	\N	\N	1
418	52	LOS ANDES	1	170	\N	\N	1
427	52	MAGUI	1	170	\N	\N	1
435	52	MALLAMA	1	170	\N	\N	1
473	52	MOSQUERA	1	170	\N	\N	1
480	52	NARIÑO	1	170	\N	\N	1
490	52	OLAYA HERRERA	1	170	\N	\N	1
506	52	OSPINA	1	170	\N	\N	1
520	52	FRANCISCO PIZARRO	1	170	\N	\N	1
540	52	POLICARPA	1	170	\N	\N	1
560	52	POTOSI	1	170	\N	\N	1
565	52	PROVIDENCIA	1	170	\N	\N	1
573	52	PUERRES	1	170	\N	\N	1
585	52	PUPIALES	1	170	\N	\N	1
612	52	RICAURTE	1	170	\N	\N	1
621	52	ROBERTO PAYAN	1	170	\N	\N	1
678	52	SAMANIEGO	1	170	\N	\N	1
683	52	SANDONA	1	170	\N	\N	1
685	52	SAN BERNARDO	1	170	\N	\N	1
687	52	SAN LORENZO	1	170	\N	\N	1
693	52	SAN PABLO	1	170	\N	\N	1
694	52	SAN PEDRO DE CARTAGO	1	170	\N	\N	1
696	52	SANTA BARBARA	1	170	\N	\N	1
699	52	SANTACRUZ	1	170	\N	\N	1
720	52	SAPUYES	1	170	\N	\N	1
786	52	TAMINANGO	1	170	\N	\N	1
788	52	TANGUA	1	170	\N	\N	1
835	52	SAN ANDRES DE TUMACO	1	170	\N	\N	1
838	52	TUQUERRES	1	170	\N	\N	1
885	52	YACUANQUER	1	170	\N	\N	1
1	54	CUCUTA	1	170	\N	\N	1
3	54	ABREGO	1	170	\N	\N	1
51	54	ARBOLEDAS	1	170	\N	\N	1
99	54	BOCHALEMA	1	170	\N	\N	1
109	54	BUCARASICA	1	170	\N	\N	1
125	54	CACOTA	1	170	\N	\N	1
128	54	CACHIRA	1	170	\N	\N	1
172	54	CHINACOTA	1	170	\N	\N	1
174	54	CHITAGA	1	170	\N	\N	1
206	54	CONVENCION	1	170	\N	\N	1
223	54	CUCUTILLA	1	170	\N	\N	1
239	54	DURANIA	1	170	\N	\N	1
245	54	EL CARMEN	1	170	\N	\N	1
250	54	EL TARRA	1	170	\N	\N	1
261	54	EL ZULIA	1	170	\N	\N	1
313	54	GRAMALOTE	1	170	\N	\N	1
344	54	HACARI	1	170	\N	\N	1
347	54	HERRAN	1	170	\N	\N	1
377	54	LABATECA	1	170	\N	\N	1
385	54	LA ESPERANZA	1	170	\N	\N	1
398	54	LA PLAYA	1	170	\N	\N	1
405	54	LOS PATIOS	1	170	\N	\N	1
418	54	LOURDES	1	170	\N	\N	1
480	54	MUTISCUA	1	170	\N	\N	1
498	54	OCAÑA	1	170	\N	\N	1
518	54	PAMPLONA	1	170	\N	\N	1
520	54	PAMPLONITA	1	170	\N	\N	1
553	54	PUERTO SANTANDER	1	170	\N	\N	1
599	54	RAGONVALIA	1	170	\N	\N	1
660	54	SALAZAR	1	170	\N	\N	1
670	54	SAN CALIXTO	1	170	\N	\N	1
673	54	SAN CAYETANO	1	170	\N	\N	1
680	54	SANTIAGO	1	170	\N	\N	1
720	54	SARDINATA	1	170	\N	\N	1
743	54	SILOS	1	170	\N	\N	1
800	54	TEORAMA	1	170	\N	\N	1
810	54	TIBU	1	170	\N	\N	1
820	54	TOLEDO	1	170	\N	\N	1
871	54	VILLA CARO	1	170	\N	\N	1
874	54	VILLA DEL ROSARIO	1	170	\N	\N	1
1	63	ARMENIA	1	170	\N	\N	1
111	63	BUENAVISTA	1	170	\N	\N	1
130	63	CALARCA	1	170	\N	\N	1
190	63	CIRCASIA	1	170	\N	\N	1
212	63	CORDOBA	1	170	\N	\N	1
272	63	FILANDIA	1	170	\N	\N	1
302	63	GENOVA	1	170	\N	\N	1
401	63	LA TEBAIDA	1	170	\N	\N	1
470	63	MONTENEGRO	1	170	\N	\N	1
548	63	PIJAO	1	170	\N	\N	1
594	63	QUIMBAYA	1	170	\N	\N	1
690	63	SALENTO	1	170	\N	\N	1
1	66	PEREIRA	1	170	\N	\N	1
45	66	APIA	1	170	\N	\N	1
75	66	BALBOA	1	170	\N	\N	1
88	66	BELEN DE UMBRIA	1	170	\N	\N	1
170	66	DOSQUEBRADAS	1	170	\N	\N	1
318	66	GUATICA	1	170	\N	\N	1
383	66	LA CELIA	1	170	\N	\N	1
400	66	LA VIRGINIA	1	170	\N	\N	1
440	66	MARSELLA	1	170	\N	\N	1
456	66	MISTRATO	1	170	\N	\N	1
572	66	PUEBLO RICO	1	170	\N	\N	1
594	66	QUINCHIA	1	170	\N	\N	1
682	66	SANTA ROSA DE CABAL	1	170	\N	\N	1
687	66	SANTUARIO	1	170	\N	\N	1
1	68	BUCARAMANGA	1	170	\N	\N	1
13	68	AGUADA	1	170	\N	\N	1
20	68	ALBANIA	1	170	\N	\N	1
51	68	ARATOCA	1	170	\N	\N	1
77	68	BARBOSA	1	170	\N	\N	1
79	68	BARICHARA	1	170	\N	\N	1
81	68	BARRANCABERMEJA	1	170	\N	\N	1
92	68	BETULIA	1	170	\N	\N	1
101	68	BOLIVAR	1	170	\N	\N	1
121	68	CABRERA	1	170	\N	\N	1
132	68	CALIFORNIA	1	170	\N	\N	1
147	68	CAPITANEJO	1	170	\N	\N	1
152	68	CARCASI	1	170	\N	\N	1
160	68	CEPITA	1	170	\N	\N	1
162	68	CERRITO	1	170	\N	\N	1
167	68	CHARALA	1	170	\N	\N	1
169	68	CHARTA	1	170	\N	\N	1
176	68	CHIMA	1	170	\N	\N	1
179	68	CHIPATA	1	170	\N	\N	1
190	68	CIMITARRA	1	170	\N	\N	1
207	68	CONCEPCION	1	170	\N	\N	1
209	68	CONFINES	1	170	\N	\N	1
211	68	CONTRATACION	1	170	\N	\N	1
217	68	COROMORO	1	170	\N	\N	1
229	68	CURITI	1	170	\N	\N	1
235	68	EL CARMEN DE CHUCURI	1	170	\N	\N	1
245	68	EL GUACAMAYO	1	170	\N	\N	1
250	68	EL PEÑON	1	170	\N	\N	1
255	68	EL PLAYON	1	170	\N	\N	1
264	68	ENCINO	1	170	\N	\N	1
266	68	ENCISO	1	170	\N	\N	1
271	68	FLORIAN	1	170	\N	\N	1
276	68	FLORIDABLANCA	1	170	\N	\N	1
296	68	GALAN	1	170	\N	\N	1
298	68	GAMBITA	1	170	\N	\N	1
307	68	GIRON	1	170	\N	\N	1
318	68	GUACA	1	170	\N	\N	1
320	68	GUADALUPE	1	170	\N	\N	1
322	68	GUAPOTA	1	170	\N	\N	1
324	68	GUAVATA	1	170	\N	\N	1
327	68	GUEPSA	1	170	\N	\N	1
344	68	HATO	1	170	\N	\N	1
368	68	JESUS MARIA	1	170	\N	\N	1
370	68	JORDAN	1	170	\N	\N	1
377	68	LA BELLEZA	1	170	\N	\N	1
385	68	LANDAZURI	1	170	\N	\N	1
397	68	LA PAZ	1	170	\N	\N	1
406	68	LEBRIJA	1	170	\N	\N	1
418	68	LOS SANTOS	1	170	\N	\N	1
425	68	MACARAVITA	1	170	\N	\N	1
432	68	MALAGA	1	170	\N	\N	1
444	68	MATANZA	1	170	\N	\N	1
464	68	MOGOTES	1	170	\N	\N	1
468	68	MOLAGAVITA	1	170	\N	\N	1
498	68	OCAMONTE	1	170	\N	\N	1
500	68	OIBA	1	170	\N	\N	1
502	68	ONZAGA	1	170	\N	\N	1
522	68	PALMAR	1	170	\N	\N	1
524	68	PALMAS DEL SOCORRO	1	170	\N	\N	1
533	68	PARAMO	1	170	\N	\N	1
547	68	PIEDECUESTA	1	170	\N	\N	1
549	68	PINCHOTE	1	170	\N	\N	1
572	68	PUENTE NACIONAL	1	170	\N	\N	1
573	68	PUERTO PARRA	1	170	\N	\N	1
575	68	PUERTO WILCHES	1	170	\N	\N	1
615	68	RIONEGRO	1	170	\N	\N	1
655	68	SABANA DE TORRES	1	170	\N	\N	1
669	68	SAN ANDRES	1	170	\N	\N	1
673	68	SAN BENITO	1	170	\N	\N	1
679	68	SAN GIL	1	170	\N	\N	1
682	68	SAN JOAQUIN	1	170	\N	\N	1
684	68	SAN JOSE DE MIRANDA	1	170	\N	\N	1
686	68	SAN MIGUEL	1	170	\N	\N	1
689	68	SAN VICENTE DE CHUCURI	1	170	\N	\N	1
705	68	SANTA BARBARA	1	170	\N	\N	1
720	68	SANTA HELENA DEL OPON	1	170	\N	\N	1
745	68	SIMACOTA	1	170	\N	\N	1
755	68	SOCORRO	1	170	\N	\N	1
770	68	SUAITA	1	170	\N	\N	1
773	68	SUCRE	1	170	\N	\N	1
780	68	SURATA	1	170	\N	\N	1
820	68	TONA	1	170	\N	\N	1
855	68	VALLE DE SAN JOSE	1	170	\N	\N	1
861	68	VELEZ	1	170	\N	\N	1
867	68	VETAS	1	170	\N	\N	1
872	68	VILLANUEVA	1	170	\N	\N	1
895	68	ZAPATOCA	1	170	\N	\N	1
1	70	SINCELEJO	1	170	\N	\N	1
110	70	BUENAVISTA	1	170	\N	\N	1
124	70	CAIMITO	1	170	\N	\N	1
204	70	COLOSO	1	170	\N	\N	1
215	70	COROZAL	1	170	\N	\N	1
221	70	COVEÑAS	1	170	\N	\N	1
230	70	CHALAN	1	170	\N	\N	1
233	70	EL ROBLE	1	170	\N	\N	1
235	70	GALERAS	1	170	\N	\N	1
265	70	GUARANDA	1	170	\N	\N	1
400	70	LA UNION	1	170	\N	\N	1
418	70	LOS PALMITOS	1	170	\N	\N	1
429	70	MAJAGUAL	1	170	\N	\N	1
473	70	MORROA	1	170	\N	\N	1
508	70	OVEJAS	1	170	\N	\N	1
523	70	PALMITO	1	170	\N	\N	1
670	70	SAMPUES	1	170	\N	\N	1
678	70	SAN BENITO ABAD	1	170	\N	\N	1
702	70	SAN JUAN DE BETULIA	1	170	\N	\N	1
708	70	SAN MARCOS	1	170	\N	\N	1
713	70	SAN ONOFRE	1	170	\N	\N	1
717	70	SAN PEDRO	1	170	\N	\N	1
742	70	SAN LUIS DE SINCE	1	170	\N	\N	1
771	70	SUCRE	1	170	\N	\N	1
820	70	SANTIAGO DE TOLU	1	170	\N	\N	1
823	70	TOLU VIEJO	1	170	\N	\N	1
1	73	IBAGUE	1	170	\N	\N	1
24	73	ALPUJARRA	1	170	\N	\N	1
26	73	ALVARADO	1	170	\N	\N	1
30	73	AMBALEMA	1	170	\N	\N	1
43	73	ANZOATEGUI	1	170	\N	\N	1
55	73	ARMERO GUAYABAL	1	170	\N	\N	1
67	73	ATACO	1	170	\N	\N	1
124	73	CAJAMARCA	1	170	\N	\N	1
148	73	CARMEN DE APICALA	1	170	\N	\N	1
152	73	CASABIANCA	1	170	\N	\N	1
168	73	CHAPARRAL	1	170	\N	\N	1
200	73	COELLO	1	170	\N	\N	1
217	73	COYAIMA	1	170	\N	\N	1
226	73	CUNDAY	1	170	\N	\N	1
236	73	DOLORES	1	170	\N	\N	1
268	73	ESPINAL	1	170	\N	\N	1
270	73	FALAN	1	170	\N	\N	1
275	73	FLANDES	1	170	\N	\N	1
283	73	FRESNO	1	170	\N	\N	1
319	73	GUAMO	1	170	\N	\N	1
347	73	HERVEO	1	170	\N	\N	1
349	73	HONDA	1	170	\N	\N	1
352	73	ICONONZO	1	170	\N	\N	1
408	73	LERIDA	1	170	\N	\N	1
411	73	LIBANO	1	170	\N	\N	1
443	73	SAN SEBASTIAN DE MARIQUITA	1	170	\N	\N	1
449	73	MELGAR	1	170	\N	\N	1
461	73	MURILLO	1	170	\N	\N	1
483	73	NATAGAIMA	1	170	\N	\N	1
504	73	ORTEGA	1	170	\N	\N	1
520	73	PALOCABILDO	1	170	\N	\N	1
547	73	PIEDRAS	1	170	\N	\N	1
555	73	PLANADAS	1	170	\N	\N	1
563	73	PRADO	1	170	\N	\N	1
585	73	PURIFICACION	1	170	\N	\N	1
616	73	RIOBLANCO	1	170	\N	\N	1
622	73	RONCESVALLES	1	170	\N	\N	1
624	73	ROVIRA	1	170	\N	\N	1
671	73	SALDAÑA	1	170	\N	\N	1
675	73	SAN ANTONIO	1	170	\N	\N	1
678	73	SAN LUIS	1	170	\N	\N	1
686	73	SANTA ISABEL	1	170	\N	\N	1
770	73	SUAREZ	1	170	\N	\N	1
854	73	VALLE DE SAN JUAN	1	170	\N	\N	1
861	73	VENADILLO	1	170	\N	\N	1
870	73	VILLAHERMOSA	1	170	\N	\N	1
873	73	VILLARRICA	1	170	\N	\N	1
1	76	CALI	1	170	\N	\N	1
20	76	ALCALA	1	170	\N	\N	1
36	76	ANDALUCIA	1	170	\N	\N	1
41	76	ANSERMANUEVO	1	170	\N	\N	1
54	76	ARGELIA	1	170	\N	\N	1
100	76	BOLIVAR	1	170	\N	\N	1
109	76	BUENAVENTURA	1	170	\N	\N	1
111	76	GUADALAJARA DE BUGA	1	170	\N	\N	1
113	76	BUGALAGRANDE	1	170	\N	\N	1
122	76	CAICEDONIA	1	170	\N	\N	1
126	76	CALIMA	1	170	\N	\N	1
130	76	CANDELARIA	1	170	\N	\N	1
147	76	CARTAGO	1	170	\N	\N	1
233	76	DAGUA	1	170	\N	\N	1
243	76	EL AGUILA	1	170	\N	\N	1
246	76	EL CAIRO	1	170	\N	\N	1
248	76	EL CERRITO	1	170	\N	\N	1
250	76	EL DOVIO	1	170	\N	\N	1
275	76	FLORIDA	1	170	\N	\N	1
306	76	GINEBRA	1	170	\N	\N	1
318	76	GUACARI	1	170	\N	\N	1
364	76	JAMUNDI	1	170	\N	\N	1
377	76	LA CUMBRE	1	170	\N	\N	1
400	76	LA UNION	1	170	\N	\N	1
403	76	LA VICTORIA	1	170	\N	\N	1
497	76	OBANDO	1	170	\N	\N	1
520	76	PALMIRA	1	170	\N	\N	1
563	76	PRADERA	1	170	\N	\N	1
606	76	RESTREPO	1	170	\N	\N	1
616	76	RIOFRIO	1	170	\N	\N	1
622	76	ROLDANILLO	1	170	\N	\N	1
670	76	SAN PEDRO	1	170	\N	\N	1
736	76	SEVILLA	1	170	\N	\N	1
823	76	TORO	1	170	\N	\N	1
828	76	TRUJILLO	1	170	\N	\N	1
834	76	TULUA	1	170	\N	\N	1
845	76	ULLOA	1	170	\N	\N	1
863	76	VERSALLES	1	170	\N	\N	1
869	76	VIJES	1	170	\N	\N	1
890	76	YOTOCO	1	170	\N	\N	1
892	76	YUMBO	1	170	\N	\N	1
895	76	ZARZAL	1	170	\N	\N	1
1	81	ARAUCA	1	170	\N	\N	1
65	81	ARAUQUITA	1	170	\N	\N	1
220	81	CRAVO NORTE	1	170	\N	\N	1
300	81	FORTUL	1	170	\N	\N	1
591	81	PUERTO RONDON	1	170	\N	\N	1
736	81	SARAVENA	1	170	\N	\N	1
794	81	TAME	1	170	\N	\N	1
1	85	YOPAL	1	170	\N	\N	1
10	85	AGUAZUL	1	170	\N	\N	1
15	85	CHAMEZA	1	170	\N	\N	1
125	85	HATO COROZAL	1	170	\N	\N	1
136	85	LA SALINA	1	170	\N	\N	1
139	85	MANI	1	170	\N	\N	1
230	85	OROCUE	1	170	\N	\N	1
250	85	PAZ DE ARIPORO	1	170	\N	\N	1
263	85	PORE	1	170	\N	\N	1
279	85	RECETOR	1	170	\N	\N	1
300	85	SABANALARGA	1	170	\N	\N	1
315	85	SACAMA	1	170	\N	\N	1
325	85	SAN LUIS DE PALENQUE	1	170	\N	\N	1
400	85	TAMARA	1	170	\N	\N	1
410	85	TAURAMENA	1	170	\N	\N	1
430	85	TRINIDAD	1	170	\N	\N	1
440	85	VILLANUEVA	1	170	\N	\N	1
1	86	MOCOA	1	170	\N	\N	1
219	86	COLON	1	170	\N	\N	1
320	86	ORITO	1	170	\N	\N	1
568	86	PUERTO ASIS	1	170	\N	\N	1
569	86	PUERTO CAICEDO	1	170	\N	\N	1
571	86	PUERTO GUZMAN	1	170	\N	\N	1
573	86	PUERTO LEGUIZAMO	1	170	\N	\N	1
749	86	SIBUNDOY	1	170	\N	\N	1
755	86	SAN FRANCISCO	1	170	\N	\N	1
757	86	SAN MIGUEL	1	170	\N	\N	1
760	86	SANTIAGO	1	170	\N	\N	1
865	86	VALLE DEL GUAMUEZ	1	170	\N	\N	1
885	86	VILLAGARZON	1	170	\N	\N	1
1	88	SAN ANDRES	1	170	\N	\N	1
564	88	PROVIDENCIA	1	170	\N	\N	1
1	91	LETICIA	1	170	\N	\N	1
263	91	EL ENCANTO	1	170	\N	\N	1
405	91	LA CHORRERA	1	170	\N	\N	1
407	91	LA PEDRERA	1	170	\N	\N	1
430	91	LA VICTORIA	1	170	\N	\N	1
460	91	MIRITI - PARANA	1	170	\N	\N	1
530	91	PUERTO ALEGRIA	1	170	\N	\N	1
536	91	PUERTO ARICA	1	170	\N	\N	1
540	91	PUERTO NARIÑO	1	170	\N	\N	1
669	91	PUERTO SANTANDER	1	170	\N	\N	1
798	91	TARAPACA	1	170	\N	\N	1
1	94	INIRIDA	1	170	\N	\N	1
343	94	BARRANCO MINAS	1	170	\N	\N	1
663	94	MAPIRIPANA	1	170	\N	\N	1
883	94	SAN FELIPE	1	170	\N	\N	1
884	94	PUERTO COLOMBIA	1	170	\N	\N	1
885	94	LA GUADALUPE	1	170	\N	\N	1
886	94	CACAHUAL	1	170	\N	\N	1
887	94	PANA PANA	1	170	\N	\N	1
888	94	MORICHAL	1	170	\N	\N	1
1	95	SAN JOSE DEL GUAVIARE	1	170	\N	\N	1
15	95	CALAMAR	1	170	\N	\N	1
25	95	EL RETORNO	1	170	\N	\N	1
200	95	MIRAFLORES	1	170	\N	\N	1
1	97	MITU	1	170	\N	\N	1
161	97	CARURU	1	170	\N	\N	1
511	97	PACOA	1	170	\N	\N	1
666	97	TARAIRA	1	170	\N	\N	1
777	97	PAPUNAUA	1	170	\N	\N	1
889	97	YAVARATE	1	170	\N	\N	1
524	99	LA PRIMAVERA	1	170	\N	\N	1
624	99	SANTA ROSALIA	1	170	\N	\N	1
773	99	CUMARIBO	1	170	\N	\N	1
579	5	Puerto Berrio	1	170	0	\N	1
1	11	BOGOTA	1	170	1	1-170-11-1	1
225	85	NUNCHIA	1	170	1	0-	1
11	20	AGUACHICA	1	170	1	0-	1
162	85	MONTERREY	1	170	1	1-170-25-123	1
45	5	APARTADÓ	1	170	0	\N	1
\.


--
-- Data for Name: nivel_academico_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.nivel_academico_pqrs (id_nivel_acad_pqrs, descripcion_nivel_acad_pqrs) FROM stdin;
1	Educación Básica Primaria
2	Educación Básica Secundaria
3	Técnico/Tecnologo
4	Profesional
5	Especializacion
6	Maestría
\.


--
-- Data for Name: par_serv_servicios; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.par_serv_servicios (par_serv_secue, par_serv_codigo, par_serv_nombre, par_serv_estado) FROM stdin;
\.


--
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.perfiles (codi_perfil, nomb_perfil, usua_esta, perm_radi, usua_admin, usua_nuevo, codi_nivel, perm_radi_sal, usua_admin_archivo, usua_masiva, usua_perm_dev, usua_perm_numera_res, usua_perm_numeradoc, sgd_panu_codi, usua_prad_tp1, usua_prad_tp2, usua_prad_tp4, usua_perm_envios, usua_perm_modifica, usua_perm_impresion, sgd_aper_codigo, sgd_perm_estadistica, usua_admin_sistema, usua_perm_trd, usua_perm_firma, usua_perm_prestamo, usuario_publico, usuario_reasignar, usua_perm_notifica, usua_perm_expediente, usua_auth_ldap, perm_archi, perm_vobo, perm_borrar_anexo, perm_tipif_anexo, usua_perm_adminflujos, usua_exp_trd, usua_perm_rademail, usua_perm_accesi, usua_perm_agrcontacto, usua_perm_preradicado, descargar_documentos, usua_perm_reasigna_masiva, usua_nivel_consulta, descarga_arc_original, firma_qr, per_transferencia_documental, usua_perm_grupo_usuarios_informados, usua_perm_doc_publico, usua_perm_consulta_rad, consulta_inv_documental, carga_inv_documental) FROM stdin;
2	ADMINISTRADOR DEL SISTEMA	1	1	1	1	5	1	2	1	1	0	0	3	3	3	3	1	1	2	0	2	1	2	0	1	1	1	0	2	0	1	1	0	1	0	1	1	0	1	0	1	1	3	1	1	1	\N	0	1	1	1
1	ADMINISTRADOR TABLAS DE RETENCIÓN DOCUMENTAL	1	0	1	1	3	0	2	0	0	0	0	3	3	0	0	0	0	0	0	1	0	2	0	1	1	1	0	2	0	1	1	0	0	0	1	0	0	1	0	1	0	2	1	0	1	\N	0	1	0	0
3	FUNCIONARIO	1	0	1	1	3	0	0	0	0	0	0	1	3	0	0	0	0	0	0	1	0	0	0	0	1	1	0	2	0	1	1	0	0	0	1	1	0	0	0	1	0	2	1	0	0	\N	0	0	0	0
4	JEFE	1	0	1	1	3	0	0	0	0	0	0	1	3	0	0	0	0	0	0	1	0	0	0	0	1	1	0	2	0	1	1	0	0	0	1	1	0	0	0	1	0	2	1	1	0	\N	0	0	0	0
5	VENTANILLA DE RADICACIÓN	1	1	1	1	3	1	0	0	1	0	0	1	3	3	3	1	1	2	0	0	0	0	0	0	1	1	0	2	0	1	1	0	0	0	1	0	0	1	0	1	0	2	1	0	0	\N	0	0	0	0
\.


--
-- Data for Name: pl_generado_plg; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.pl_generado_plg (depe_codi, radi_nume_radi, plt_codi, plg_codi, plg_comentarios, plg_analiza, plg_firma, plg_autoriza, plg_imprime, plg_envia, plg_archivo_tmp, plg_archivo_final, plg_nombre, plg_crea, plg_autoriza_fech, plg_imprime_fech, plg_envia_fech, plg_crea_fech, plg_creador, pl_codi, usua_doc, sgd_rem_destino, radi_nume_sal) FROM stdin;
\.


--
-- Data for Name: pl_tipo_plt; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.pl_tipo_plt (plt_codi, plt_desc) FROM stdin;
\.


--
-- Data for Name: plan_table; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.plan_table (statement_id, "timestamp", remarks, operation, options, object_node, object_owner, object_name, object_instance, object_type, optimizer, search_columns, id, parent_id, "position", cost, cardinality, s, other_tag, partition_start, partition_stop, partition_id, other, distribution) FROM stdin;
\.


--
-- Data for Name: plantilla_pl; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.plantilla_pl (pl_codi, depe_codi, pl_nomb, pl_archivo, pl_desc, pl_fech, usua_codi, pl_uso) FROM stdin;
\.


--
-- Data for Name: pre_radicado; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.pre_radicado (radi_nume_radi, radi_fech_radi, estado) FROM stdin;
\.


--
-- Data for Name: preguntas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.preguntas (id_preguntas, pregunta) FROM stdin;
1	¿Cual era el nombre de tu primera mascota ?
2	¿Cual es el nombre de la ciudad en la que naciste?
3	¿Cual era el apodo de tu infancia?
4	¿Cual es el nombre de tu Abuelo?
5	¿Como se llama la primera escuela a la que asististe?
\.


--
-- Data for Name: prestamo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.prestamo (pres_id, radi_nume_radi, usua_login_actu, depe_codi, usua_login_pres, pres_desc, pres_fech_pres, pres_fech_devo, pres_fech_pedi, pres_estado, pres_requerimiento, pres_depe_arch, pres_fech_venc, dev_desc, pres_fech_canc, usua_login_canc, usua_login_rx) FROM stdin;
\.


--
-- Data for Name: radicado; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.radicado (radi_nume_radi, radi_fech_radi, tdoc_codi, trte_codi, mrec_codi, eesp_codi, eotra_codi, radi_tipo_empr, radi_fech_ofic, tdid_codi, radi_nume_iden, radi_nomb, radi_prim_apel, radi_segu_apel, radi_pais, muni_codi, cpob_codi, carp_codi, esta_codi, dpto_codi, cen_muni_codi, cen_dpto_codi, radi_dire_corr, radi_tele_cont, radi_nume_hoja, radi_desc_anex, radi_nume_deri, radi_path, radi_usua_actu, radi_depe_actu, radi_fech_asig, radi_arch1, radi_arch2, radi_arch3, radi_arch4, ra_asun, radi_usu_ante, radi_depe_radi, radicado_referencia_cliente, radi_usua_radi, codi_nivel, flag_nivel, carp_per, radi_leido, radi_cuentai, radi_tipo_deri, listo, sgd_tma_codigo, sgd_mtd_codigo, par_serv_secue, sgd_fld_codigo, radi_agend, radi_fech_agend, radi_fech_doc, sgd_doc_secuencia, sgd_pnufe_codi, sgd_eanu_codigo, sgd_not_codi, radi_fech_notif, sgd_tdec_codigo, sgd_apli_codi, sgd_ttr_codigo, usua_doc_ante, radi_fech_antetx, sgd_trad_codigo, fech_vcmto, tdoc_vcmto, sgd_termino_real, id_cont, sgd_spub_codigo, id_pais, medio_m, radi_nrr, numero_rm, numero_tran, firma_qr, tipo_usario_interes, doc_transferido, radi_fech_reasignado, radi_envio_correo, radi_docu_publico, radi_eje_tematico, radi_estado_pqrs, descripcion_asunto_pqrs, grupo_interes, servicio_pqr, radi_depe_ante) FROM stdin;
20219980000141	2021-03-31 12:14:56.631012-05	145	\N	\N	0	\N	\N	2021-03-31	\N	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N		20219980000062	/2021/998/docs/120219980000062_00001.pdf	2	101	\N	\N	\N	\N	\N		ADMON	998	\N	1	3	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-05 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	\N	\N	\N	\N	998
20219980000022	2021-02-23 17:39:31.022139-05	459	0	4	0	\N	\N	2021-02-23	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1 folio	0	2021/998/20219980000022.pdf	1	999	\N	\N	\N	\N	\N	Radicaciones de pruebas para el proceso de validación	ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-02-26 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	t	t	\N	4	\N	\N	\N	998
20219980000121	2021-03-31 10:48:36.719563-05	145	\N	\N	0	\N	\N	2021-03-31	\N	\N	\N	\N	\N	170	\N	\N	1	\N	\N	\N	\N	\N	\N	\N		20219980000052	/2021/998/docs/120219980000052_00003.pdf	1	100	\N	\N	\N	\N	\N		ADMON	998	\N	1	3	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-04 00:00:00-05	\N	\N	1	1	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	\N	\N	\N	\N	998
20219980000062	2021-03-31 11:36:38.411506-05	155	0	4	0	\N	\N	2021-03-31	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N		0	2021/998/20219980000062.pdf	2	101	\N	\N	\N	\N	\N	Radicaciones de pruebas para el proceso	ADMON	998	\N	1	3	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-05 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	5	\N	\N	\N	998
20219980000081	2021-03-09 10:27:49.103704-05	155	1	\N	\N	\N	\N	2021-03-09	1	1234567890	\N	\N	\N	COLOMBIA	1	\N	99	9	11	\N	\N	\N	\N	0		0	/2021/998/docs/1234567890_2021_03_09_10_12_50.docx	1	998	\N	\N	\N	\N	\N		\N	998	\N	1	1	1	1	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	1	0	\N	\N	\N	\N	\N	0	0	1	\N	\N	f	\N	1	\N	\N	\N	\N
20219980000091	2021-03-09 10:27:49.103704-05	155	1	\N	\N	\N	\N	2021-03-09	1	1234567890	\N	\N	\N	COLOMBIA	1	\N	99	9	11	\N	\N	\N	\N	0		0	/2021/998/docs/1234567890_2021_03_09_10_12_50.docx	1	998	\N	\N	\N	\N	\N		\N	998	\N	1	1	1	1	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	1	0	\N	\N	\N	\N	\N	0	0	1	\N	\N	f	\N	1	\N	\N	\N	\N
20219980000051	2021-02-23 16:48:58.409761-05	455	\N	\N	0	\N	\N	2021-02-23	\N	\N	\N	\N	\N	170	\N	\N	1	\N	\N	\N	\N	\N	\N	\N		20219980000012	/2021/998/docs/120219980000012_00002.pdf	1	998	\N	\N	\N	\N	\N		\N	998	\N	1	5	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	9	\N	\N	\N	0	0	\N	\N	\N	2021-02-26 00:00:00-05	\N	\N	1	1	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	\N	\N	\N	\N	\N
20219980000101	2021-03-09 10:27:49.103704-05	155	1	\N	\N	\N	\N	2021-03-09	1	1234567890	\N	\N	\N	COLOMBIA	1	\N	99	9	11	\N	\N	\N	\N	0		0	/2021/998/docs/1234567890_2021_03_09_10_12_50.docx	1	998	\N	\N	\N	\N	\N		\N	998	\N	1	1	1	1	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	1	0	\N	\N	\N	\N	\N	0	0	1	\N	\N	f	\N	1	\N	\N	\N	\N
20219980000061	2021-02-23 17:41:50.203955-05	455	\N	\N	0	\N	\N	2021-02-23	\N	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N		20219980000022	/2021/998/docs/120219980000022_00002.pdf	1	999	\N	\N	\N	\N	\N		ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	9	\N	\N	\N	0	0	\N	\N	\N	2021-02-26 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	\N	t	\N	4	\N	\N	\N	998
20219980000131	2021-03-31 10:50:01.230526-05	145	\N	\N	0	\N	\N	2021-03-31	\N	\N	\N	\N	\N	170	\N	\N	1	\N	\N	\N	\N	\N	\N	\N		20219980000052	/2021/998/docs/120219980000052_00004.pdf	1	100	\N	\N	\N	\N	\N		ADMON	998	\N	1	3	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-04 00:00:00-05	\N	\N	1	1	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	\N	\N	\N	\N	998
20219980000052	2021-03-31 10:32:06.518428-05	327	0	4	0	\N	\N	2021-03-31	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N		0	2021/998/20219980000052.pdf	1	100	\N	\N	\N	\N	\N	Radicaciones de pruebas para el proceso	ADMON	998	\N	1	3	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-04 00:00:00-05	\N	\N	1	1	\N	\N	\N	\N	\N	0	\N	1	\N	t	f	\N	5	\N	\N	\N	998
20219980000031	2021-02-23 14:58:09.60168-05	455	\N	\N	0	\N	\N	2021-02-23	\N	\N	\N	\N	\N	170	\N	\N	14	\N	\N	\N	\N	\N	\N	\N		20219980000021	/2021/998/docs/120219980000021_00002.pdf	2	101	\N	\N	\N	\N	\N		ADMON	998	\N	1	5	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-02-24 00:00:00-05	\N	\N	1	1	\N	\N	\N	\N	\N	0	\N	1	2021-04-13 00:00:00-05	\N	f	\N	\N	\N	\N	\N	\N
20219980000111	2021-03-31 10:34:33.616189-05	145	\N	\N	0	\N	\N	2021-03-31	\N	\N	\N	\N	\N	170	\N	\N	1	\N	\N	\N	\N	\N	\N	\N		20219980000052	/2021/998/docs/120219980000052_00002.docx	1	100	\N	\N	\N	\N	\N		ADMON	998	\N	1	3	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-04 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	\N	\N	\N	\N	998
20219980000181	2021-04-13 17:00:10.17476-05	2	\N	\N	0	\N	\N	2021-04-13	\N	\N	\N	\N	\N	170	\N	\N	14	\N	\N	\N	\N	\N	\N	\N		20219980000042	/2021/998/docs/120219980000042_00004.pdf	2	101	\N	\N	\N	\N	\N		ADMON	998	\N	1	5	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-09 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	2021-04-13 00:00:00-05	\N	f	\N	\N	\N	\N	\N	998
20219980000071	2021-02-23 18:00:54.214015-05	455	\N	\N	0	\N	\N	2021-02-23	\N	\N	\N	\N	\N	170	\N	\N	1	\N	\N	\N	\N	\N	\N	\N		20219980000012	/2021/998/docs/120219980000012_00003.pdf	1	998	\N	\N	\N	\N	\N		\N	998	\N	1	5	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	9	\N	\N	\N	0	0	\N	\N	\N	2021-02-26 00:00:00-05	\N	\N	1	1	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	\N	\N	\N	\N	\N
20219980000041	2021-02-23 16:42:34.26997-05	455	0	4	0	\N	\N	2021-02-23	0	\N	\N	\N	\N	170	\N	\N	14	\N	\N	\N	\N	\N	\N	\N	1 Folio	0	/2021/998/docs/120219980000041_00001.pdf	2	101	\N	\N	\N	\N	\N	Radicaciones de pruebas para el proceso de validación	ADMON	998	\N	1	5	1	0	1		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-02-23 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	2021-04-13 00:00:00-05	\N	t	\N	\N	\N	\N	\N	\N
20219980000032	2021-02-24 15:29:46.339231-05	248	0	4	0	\N	\N	2021-02-24	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	2	0	2021/998/20219980000032.pdf	1	100	\N	\N	\N	\N	\N	Radicaciones de facturas recepcionadas en la entrada	\N	998	\N	1	3	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-04 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	t	f	\N	2	\N	\N	\N	\N
20219980000082	2021-04-07 09:29:50.789853-05	477	0	4	0	\N	\N	2021-04-07	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N		0	2021/998/20219980000082.pdf	1	999	\N	\N	\N	\N	\N	Solicitud de tala	ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-18 00:00:00-05	\N	\N	1	0	\N	\N	1	\N	\N	0	\N	1	\N	\N	f	\N	5	\N	\N	\N	998
20219980000151	2021-04-07 09:39:59.053384-05	455	\N	\N	0	\N	\N	2021-04-07	\N	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N		20219980000082	/2021/998/docs/120219980000082_00001.odt	1	999	\N	\N	\N	\N	\N		ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-18 00:00:00-05	\N	\N	1	0	\N	\N	1	\N	\N	0	\N	1	\N	\N	f	\N	\N	\N	\N	\N	998
20219980000042	2021-03-01 08:28:46.62342-05	248	0	4	0	\N	\N	2021-03-01	0	\N	\N	\N	\N	170	\N	\N	14	\N	\N	\N	\N	\N	\N	\N	2 facturas	0	2021/998/20219980000042.pdf	2	101	\N	\N	\N	\N	\N	Recepción de facturas	ADMON	998	\N	1	5	1	0	1		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-09 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	2021-04-13 00:00:00-05	\N	f	\N	5	\N	\N	\N	998
20219980000021	2021-02-23 14:45:03.514159-05	455	0	4	0	\N	\N	2021-02-23	0	\N	\N	\N	\N	170	\N	\N	14	\N	\N	\N	\N	\N	\N	\N	1 folio	0	/2021/998/docs/120219980000021_00001.pdf	2	101	\N	\N	\N	\N	\N	Radicaciones de pruebas para el proceso correspondiente	ADMON	998	\N	1	5	1	0	1		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	9	\N	\N	\N	0	0	\N	\N	\N	2021-02-24 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	2021-04-13 00:00:00-05	\N	t	\N	\N	\N	\N	\N	\N
20219980000092	2021-04-08 09:39:16.450006-05	248	0	4	0	\N	\N	2021-04-08	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	0		0	2021/998/20219980000092.pdf	1	999	\N	\N	\N	\N	\N	Factura 022	ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-20 00:00:00-05	\N	\N	1	0	\N	0	\N	\N	\N	0	\N	2	\N	\N	f	\N	4	\N	\N	\N	998
20219980000161	2021-04-13 16:18:51.413878-05	2	\N	\N	0	\N	\N	2021-04-13	\N	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N		20219980000092	/2021/998/docs/120219980000092_00001.pdf	1	999	\N	\N	\N	\N	\N		ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-20 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	4	\N	\N	\N	998
20219980000072	2021-03-31 12:25:09.107661-05	145	0	3	0	\N	\N	2021-03-31	0	\N	\N	\N	\N	170	\N	\N	14	\N	\N	\N	\N	\N	\N	\N		0	\N	2	101	\N	\N	\N	\N	\N	Radicaciones por coreo	ADMON	998	\N	1	5	1	0	1		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-05-06 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	2021-04-13 00:00:00-05	\N	f	\N	5	\N	\N	\N	998
20219980000171	2021-04-13 16:31:54.577765-05	455	\N	\N	0	\N	\N	2021-04-13	\N	\N	\N	\N	\N	170	\N	\N	14	\N	\N	\N	\N	\N	\N	\N		20219980000072	/2021/998/docs/120219980000072_00001.pdf	2	101	\N	\N	\N	\N	\N		ADMON	998	\N	1	5	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-05-06 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	2021-04-13 00:00:00-05	\N	f	\N	\N	\N	\N	\N	998
20219980000102	2021-04-13 17:26:00.239709-05	155	0	4	0	\N	\N	2021-04-13	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	0	1 Folio	0	2021/998/20219980000102.pdf	1	999	\N	\N	\N	\N	\N	RADICACIONES DE PRUEBAS PARA EL PROCESO	ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-15 00:00:00-05	\N	\N	1	0	\N	0	\N	\N	\N	0	\N	2	\N	t	f	\N	4	\N	\N	\N	998
20219980000191	2021-04-13 17:27:48.316339-05	2	\N	\N	0	\N	\N	2021-04-13	\N	\N	\N	\N	\N	170	\N	\N	1	\N	\N	\N	\N	\N	\N	10		20219980000102	/2021/998/docs/120219980000102_00001.pdf	1	999	\N	\N	\N	\N	\N		ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-15 00:00:00-05	\N	\N	1	0	\N	4	\N	\N	\N	0	\N	2	\N	\N	f	\N	4	\N	\N	\N	998
20219980000201	2021-04-13 17:30:39.049994-05	155	0	4	0	\N	\N	2021-04-13	0	\N	\N	\N	\N	170	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	1 Folio	0	/2021/998/docs/120219980000201_00001.pdf	1	999	\N	\N	\N	\N	\N	RADICACIONES DE PRUEBAS DE ENTRADA	ADMON	998	\N	1	1	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-16 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	4	\N	\N	\N	998
20219980000014	2021-04-16 15:14:58.797088-05	154	0	4	0	\N	\N	2021-04-16	0	\N	\N	\N	\N	170	\N	\N	4	\N	\N	\N	\N	\N	\N	\N		0	\N	1	998	\N	\N	\N	\N	\N	Radicaciones de pruebas	\N	998	\N	1	5	1	0	0		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-04-19 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	1	1	\N	\N	f	\N	2	\N	1	1	\N
20219980000012	2021-02-23 16:47:03.612278-05	155	0	4	0	\N	\N	2021-02-23	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1 Folio	0	2021/998/20219980000012.pdf	1	998	\N	\N	\N	\N	\N	Radicaciones de pruebas de entrada	\N	998	\N	1	5	1	0	1		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-02-26 00:00:00-05	\N	\N	1	1	\N	\N	\N	\N	\N	0	\N	1	\N	t	f	\N	5	\N	\N	\N	\N
20219980000112	2021-04-16 16:16:53.63897-05	248	0	4	0	\N	\N	2021-04-16	0	\N	\N	\N	\N	170	\N	\N	0	\N	\N	\N	\N	\N	\N	\N		0	2021/998/20219980000112.pdf	1	998	\N	\N	\N	\N	\N	Factura de proveedor 5588	ADMON	998	\N	1	5	1	0	1		0	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	2021-05-22 00:00:00-05	\N	\N	1	0	\N	\N	\N	\N	\N	0	\N	1	\N	\N	f	\N	2	\N	\N	\N	998
\.


--
-- Data for Name: rango_edades_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.rango_edades_pqrs (id_rango_edades_pqrs, nombre_rango_edades_pqrs) FROM stdin;
1	Menores a 18
2	Entre 18 a 28
3	Entre 29 a 59
4	Mayores 60
\.


--
-- Data for Name: respuestas_usuario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.respuestas_usuario ("id_Respuestas_Usuario", id_pregunta, id_sgd_ciu_ciudadano, respuesta) FROM stdin;
\.


--
-- Data for Name: rol_tipos_doc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.rol_tipos_doc (cod_rol_tipos, cod_rol, cod_tp_tpdcumento, estado) FROM stdin;
2998	2	1	1
2999	2	2	1
3000	2	3	1
3001	2	4	1
3002	2	5	1
3003	2	6	1
3004	2	7	1
3005	2	8	1
3006	2	9	1
3007	2	10	1
3008	2	11	1
3009	2	12	1
3010	2	13	1
3011	2	14	1
3012	2	15	1
3013	2	16	1
3014	2	17	1
3015	2	18	1
3016	2	31	1
3017	2	19	1
3018	2	20	1
3019	2	21	1
3020	2	22	1
3021	2	23	1
3022	2	24	1
3023	2	25	1
3024	2	26	1
3025	2	27	1
3026	2	28	1
3027	2	29	1
3028	2	30	1
3029	2	32	1
3030	2	33	1
3031	2	34	1
3032	2	35	1
3033	2	36	1
3034	2	37	1
3035	2	38	1
3036	2	39	1
3037	2	40	1
3038	2	41	1
3039	2	43	1
3040	2	44	1
3041	2	42	1
3042	2	45	1
3043	2	46	1
3044	2	47	1
3045	2	48	1
3046	2	50	1
3047	2	49	1
3048	2	51	1
3049	2	52	1
3050	2	53	1
3051	2	54	1
3052	2	55	1
3053	2	57	1
3054	2	56	1
3055	2	58	1
3056	2	59	1
3057	2	60	1
3058	2	61	1
3059	2	62	1
3060	2	63	1
3061	2	64	1
3062	2	65	1
3063	2	66	1
3064	2	67	1
3065	2	68	1
3066	2	69	1
3067	2	70	1
3068	2	80	1
3069	2	71	1
3070	2	72	1
3071	2	73	1
3072	2	74	1
3073	2	75	1
3074	2	76	1
3075	2	77	1
3076	2	78	1
3077	2	79	1
3078	2	81	1
3079	2	82	1
3080	2	83	1
3081	2	84	1
3082	2	85	1
3083	2	86	1
3084	2	87	1
3085	2	88	1
3086	2	89	1
3087	2	90	1
3088	2	91	1
3089	2	92	1
3090	2	93	1
3091	2	94	1
3092	2	95	1
3093	2	96	1
3094	2	97	1
3095	2	98	1
3096	2	99	1
3097	2	100	1
3098	2	101	1
3099	2	102	1
3100	2	103	1
3101	2	107	1
3102	2	104	1
3103	2	105	1
3104	2	106	1
3105	2	109	1
3106	2	110	1
3107	2	111	1
3108	2	112	1
3109	2	113	1
3110	2	114	1
3111	2	117	1
3112	2	115	1
3113	2	116	1
3114	2	108	1
3115	2	118	1
3116	2	119	1
3117	2	120	1
3118	2	121	1
3119	2	122	1
3120	2	123	1
3121	2	124	1
3122	2	125	1
3123	2	126	1
3124	2	128	1
3125	2	127	1
3126	2	129	1
3127	2	130	1
3128	2	131	1
3129	2	132	1
3130	2	133	1
3131	2	137	1
3132	2	134	1
3133	2	135	1
3134	2	136	1
3135	2	138	1
3136	2	139	1
3137	2	140	1
3138	2	141	1
3139	2	142	1
3140	2	143	1
3141	2	144	1
3142	2	145	1
3143	2	146	1
3144	2	147	1
3145	2	148	1
3146	2	149	1
3147	2	150	1
3148	2	151	1
3149	2	152	1
3150	2	153	1
3151	2	154	1
3152	2	155	1
3153	2	156	1
3154	2	158	1
3155	2	157	1
3156	2	159	1
3157	2	160	1
3158	2	161	1
3159	2	162	1
3160	2	163	1
3161	2	164	1
3162	2	165	1
3163	2	166	1
3164	2	167	1
3165	2	168	1
3166	2	171	1
3167	2	170	1
3168	2	172	1
3169	2	173	1
3170	2	169	1
3171	2	174	1
3172	2	175	1
3173	2	176	1
3174	2	177	1
3175	2	178	1
3176	2	179	1
3177	2	180	1
3178	2	181	1
3179	2	182	1
3180	2	183	1
3181	2	184	1
3182	2	185	1
3183	2	186	1
3184	2	187	1
3185	2	188	1
3186	2	189	1
3187	2	190	1
3188	2	191	1
3189	2	192	1
3190	2	193	1
3191	2	194	1
3192	2	195	1
3193	2	196	1
3194	2	197	1
3195	2	198	1
3196	2	199	1
3197	2	200	1
3198	2	201	1
3199	2	202	1
3200	2	203	1
3201	2	204	1
3202	2	205	1
3203	2	206	1
3204	2	207	1
3205	2	208	1
3206	2	209	1
3207	2	210	1
3208	2	211	1
3209	2	212	1
3210	2	213	1
3211	2	214	1
3212	2	215	1
3213	2	217	1
3214	2	216	1
3215	2	218	1
3216	2	219	1
3217	2	220	1
3218	2	221	1
3219	2	222	1
3220	2	223	1
3221	2	224	1
3222	2	225	1
3223	2	226	1
3224	2	227	1
3225	2	228	1
3226	2	229	1
3227	2	230	1
3228	2	231	1
3229	2	232	1
3230	2	233	1
3231	2	234	1
3232	2	235	1
3233	2	236	1
3234	2	237	1
3235	2	238	1
3236	2	239	1
3237	2	240	1
3238	2	241	1
3239	2	242	1
3240	2	243	1
3241	2	244	1
3242	2	245	1
3243	2	246	1
3244	2	247	1
3245	2	248	1
3246	2	249	1
3247	2	251	1
3248	2	250	1
3249	2	499	1
3250	2	252	1
3251	2	253	1
3252	2	255	1
3253	2	256	1
3254	2	254	1
3255	2	257	1
3256	2	258	1
3257	2	259	1
3258	2	260	1
3259	2	261	1
3260	2	262	1
3261	2	263	1
3262	2	264	1
3263	2	265	1
3264	2	266	1
3265	2	267	1
3266	2	268	1
3267	2	269	1
3268	2	270	1
3269	2	271	1
3270	2	272	1
3271	2	273	1
3272	2	275	1
3273	2	276	1
3274	2	274	1
3275	2	277	1
3276	2	278	1
3277	2	279	1
3278	2	280	1
3279	2	281	1
3280	2	282	1
3281	2	283	1
3282	2	286	1
3283	2	284	1
3284	2	285	1
3285	2	287	1
3286	2	288	1
3287	2	289	1
3288	2	290	1
3289	2	291	1
3290	2	292	1
3291	2	294	1
3292	2	295	1
3293	2	296	1
3294	2	293	1
3295	2	297	1
3296	2	298	1
3297	2	299	1
3298	2	300	1
3299	2	301	1
3300	2	302	1
3301	2	303	1
3302	2	304	1
3303	2	305	1
3304	2	306	1
3305	2	307	1
3306	2	308	1
3307	2	309	1
3308	2	310	1
3309	2	311	1
3310	2	312	1
3311	2	313	1
3312	2	314	1
3313	2	315	1
3314	2	316	1
3315	2	317	1
3316	2	318	1
3317	2	319	1
3318	2	320	1
3319	2	321	1
3320	2	322	1
3321	2	323	1
3322	2	324	1
3323	2	325	1
3324	2	326	1
3325	2	327	1
3326	2	328	1
3327	2	329	1
3328	2	330	1
3329	2	331	1
3330	2	332	1
3331	2	333	1
3332	2	334	1
3333	2	335	1
3334	2	336	1
3335	2	337	1
3336	2	500	1
3337	2	338	1
5503	3	1	1
5504	3	2	1
5505	3	3	1
5506	3	4	1
5507	3	5	1
5508	3	6	1
5509	3	7	1
5510	3	8	1
5511	3	9	1
5512	3	10	1
5513	3	11	1
5514	3	12	1
5515	3	13	1
5516	3	14	1
5517	3	15	1
5518	3	16	1
5519	3	17	1
5520	3	18	1
5521	3	31	1
5522	3	19	1
5523	3	20	1
5524	3	21	1
5525	3	22	1
5526	3	23	1
5527	3	24	1
5528	3	25	1
5529	3	26	1
5530	3	27	1
5531	3	28	1
5532	3	29	1
5533	3	30	1
5534	3	32	1
5535	3	33	1
5536	3	34	1
5537	3	35	1
5538	3	36	1
5539	3	37	1
5540	3	38	1
5541	3	39	1
5542	3	40	1
5543	3	41	1
5544	3	43	1
5545	3	44	1
5546	3	42	1
5547	3	45	1
5548	3	46	1
5549	3	47	1
5550	3	48	1
5551	3	50	1
5552	3	49	1
5553	3	51	1
5554	3	52	1
5555	3	53	1
5556	3	54	1
5557	3	55	1
5558	3	57	1
5559	3	56	1
5560	3	58	1
5561	3	59	1
5562	3	60	1
5563	3	61	1
5564	3	62	1
5565	3	63	1
5566	3	64	1
5567	3	65	1
5568	3	66	1
5569	3	67	1
5570	3	68	1
5571	3	69	1
5572	3	70	1
5573	3	80	1
5574	3	71	1
5575	3	72	1
5576	3	73	1
5577	3	74	1
5578	3	75	1
5579	3	76	1
5580	3	77	1
5581	3	78	1
5582	3	79	1
5583	3	81	1
5584	3	82	1
5585	3	83	1
5586	3	84	1
5587	3	85	1
5588	3	86	1
5589	3	87	1
5590	3	88	1
5591	3	89	1
5592	3	90	1
5593	3	91	1
5594	3	92	1
5595	3	93	1
5596	3	94	1
5597	3	95	1
5598	3	96	1
5599	3	97	1
5600	3	98	1
5601	3	99	1
5602	3	100	1
5603	3	101	1
5604	3	102	1
5605	3	103	1
5606	3	107	1
5607	3	104	1
5608	3	105	1
5609	3	106	1
5610	3	109	1
5611	3	110	1
5612	3	111	1
5613	3	112	1
5614	3	113	1
5615	3	114	1
5616	3	117	1
5617	3	115	1
5618	3	116	1
5619	3	108	1
5620	3	118	1
5621	3	119	1
5622	3	120	1
5623	3	121	1
5624	3	122	1
5625	3	123	1
5626	3	124	1
5627	3	125	1
5628	3	126	1
5629	3	128	1
5630	3	127	1
5631	3	129	1
5632	3	130	1
5633	3	131	1
5634	3	132	1
5635	3	133	1
5636	3	137	1
5637	3	134	1
5638	3	135	1
5639	3	136	1
5640	3	138	1
5641	3	139	1
5642	3	140	1
5643	3	141	1
5644	3	142	1
5645	3	143	1
5646	3	144	1
5647	3	145	1
5648	3	146	1
5649	3	147	1
5650	3	148	1
5651	3	149	1
5652	3	150	1
5653	3	151	1
5654	3	152	1
5655	3	153	1
5656	3	154	1
5657	3	155	1
5658	3	156	1
5659	3	158	1
5660	3	157	1
5661	3	159	1
5662	3	160	1
5663	3	161	1
5664	3	162	1
5665	3	163	1
5666	3	164	1
5667	3	165	1
5668	3	166	1
5669	3	167	1
5670	3	168	1
5671	3	171	1
5672	3	170	1
5673	3	172	1
5674	3	173	1
5675	3	169	1
5676	3	174	1
5677	3	175	1
5678	3	176	1
5679	3	177	1
5680	3	178	1
5681	3	179	1
5682	3	180	1
5683	3	181	1
5684	3	182	1
5685	3	183	1
5686	3	184	1
5687	3	185	1
5688	3	186	1
5689	3	187	1
5690	3	188	1
5691	3	189	1
5692	3	190	1
5693	3	191	1
5694	3	192	1
5695	3	193	1
5696	3	194	1
5697	3	195	1
5698	3	196	1
5699	3	197	1
5700	3	198	1
5701	3	199	1
5702	3	200	1
5703	3	201	1
5704	3	202	1
5705	3	203	1
5706	3	204	1
5707	3	205	1
5708	3	206	1
5709	3	207	1
5710	3	208	1
5711	3	209	1
5712	3	210	1
5713	3	211	1
5714	3	212	1
5715	3	213	1
5716	3	214	1
5717	3	215	1
5718	3	217	1
5719	3	216	1
5720	3	218	1
5721	3	219	1
5722	3	220	1
5723	3	221	1
5724	3	222	1
5725	3	223	1
5726	3	224	1
5727	3	225	1
5728	3	226	1
5729	3	227	1
5730	3	228	1
5731	3	229	1
5732	3	230	1
5733	3	231	1
5734	3	232	1
5735	3	233	1
5736	3	234	1
5737	3	235	1
5738	3	236	1
5739	3	237	1
5740	3	238	1
5741	3	239	1
5742	3	240	1
5743	3	241	1
5744	3	242	1
5745	3	243	1
5746	3	244	1
5747	3	245	1
5748	3	246	1
5749	3	247	1
5750	3	248	1
5751	3	249	1
5752	3	251	1
5753	3	250	1
5754	3	499	1
5755	3	252	1
5756	3	253	1
5757	3	255	1
5758	3	256	1
5759	3	254	1
5760	3	257	1
5761	3	258	1
5762	3	259	1
5763	3	260	1
5764	3	261	1
5765	3	262	1
5766	3	263	1
5767	3	264	1
5768	3	265	1
5769	3	266	1
5770	3	267	1
5771	3	283	1
5772	3	268	1
5773	3	269	1
5774	3	270	1
5775	3	271	1
5776	3	272	1
5777	3	273	1
5778	3	275	1
5779	3	276	1
5780	3	274	1
5781	3	277	1
5782	3	278	1
5783	3	279	1
5784	3	280	1
5785	3	281	1
5786	3	282	1
5787	3	286	1
5788	3	284	1
5789	3	285	1
5790	3	287	1
5791	3	288	1
5792	3	289	1
5793	3	290	1
5794	3	291	1
5795	3	292	1
5796	3	294	1
5797	3	295	1
5798	3	296	1
5799	3	293	1
5800	3	297	1
5801	3	298	1
5802	3	299	1
5803	3	300	1
5804	3	301	1
5805	3	302	1
5806	3	303	1
5807	3	304	1
5808	3	305	1
5809	3	306	1
5810	3	307	1
5811	3	308	1
5812	3	309	1
5813	3	310	1
5814	3	311	1
5815	3	312	1
5816	3	313	1
5817	3	314	1
5818	3	315	1
5819	3	316	1
5820	3	317	1
5821	3	318	1
5822	3	319	1
5823	3	320	1
5824	3	321	1
5825	3	322	1
5826	3	323	1
5827	3	324	1
5828	3	325	1
5829	3	326	1
5830	3	327	1
5831	3	328	1
5832	3	329	1
5833	3	330	1
5834	3	331	1
5835	3	332	1
5836	3	333	1
5837	3	334	1
5838	3	335	1
5839	3	336	1
5840	3	337	1
5841	3	500	1
5842	3	338	1
5843	3	339	1
5844	3	340	1
5845	3	341	1
5846	3	342	1
5847	3	343	1
5848	3	345	1
5849	3	346	1
5850	3	344	1
5851	3	348	1
5852	3	350	1
5853	3	351	1
5854	3	352	1
5855	3	353	1
5856	3	354	1
5857	3	355	1
5858	3	349	1
5859	3	356	1
5860	3	357	1
5861	3	358	1
5862	3	359	1
5863	3	360	1
5864	3	361	1
5865	3	362	1
5866	3	363	1
5867	3	372	1
5868	3	373	1
5869	3	364	1
5870	3	365	1
5871	3	366	1
5872	3	367	1
5873	3	368	1
5874	3	369	1
5875	3	370	1
5876	3	375	1
5877	3	376	1
5878	3	377	1
5879	3	378	1
5880	3	379	1
5881	3	374	1
5882	3	371	1
5883	3	380	1
5884	3	381	1
5885	3	382	1
5886	3	383	1
5887	3	384	1
5888	3	385	1
5889	3	386	1
5890	3	387	1
5891	3	388	1
5892	3	389	1
5893	3	390	1
5894	3	391	1
5895	3	392	1
5896	3	393	1
5897	3	394	1
5898	3	395	1
5899	3	396	1
5900	3	397	1
5901	3	398	1
5902	3	399	1
5903	3	400	1
5904	3	401	1
5905	3	402	1
5906	3	403	1
5907	3	404	1
5908	3	405	1
5909	3	406	1
5910	3	408	1
5911	3	409	1
5912	3	410	1
5913	3	411	1
5914	3	412	1
5915	3	407	1
5916	3	413	1
5917	3	414	1
5918	3	415	1
5919	3	416	1
5920	3	417	1
5921	3	418	1
5922	3	419	1
5923	3	420	1
5924	3	421	1
5925	3	422	1
5926	3	423	1
5927	3	424	1
5928	3	425	1
5929	3	426	1
5930	3	427	1
5931	3	428	1
5932	3	429	1
5933	3	430	1
5934	3	431	1
5935	3	432	1
5936	3	433	1
5937	3	434	1
5938	3	435	1
5939	3	436	1
5940	3	437	1
5941	3	440	1
5942	3	438	1
5943	3	439	1
5944	3	441	1
5945	3	442	1
5946	3	443	1
5947	3	444	1
5948	3	445	1
5949	3	446	1
5950	3	447	1
5951	3	448	1
5952	3	449	1
5953	3	451	1
5954	3	450	1
5955	3	453	1
5956	3	454	1
5957	3	452	1
5958	3	501	1
5959	3	455	1
5960	3	456	1
5961	3	457	1
5962	3	458	1
5963	3	459	1
5964	3	460	1
5965	3	461	1
5966	3	462	1
5967	3	463	1
5968	3	465	1
5969	3	466	1
5970	3	467	1
5971	3	468	1
5972	3	469	1
5973	3	470	1
5974	3	471	1
5975	3	472	1
5976	3	473	1
5977	3	474	1
5978	3	475	1
5979	3	476	1
5980	3	482	1
5981	3	477	1
5982	3	478	1
5983	3	479	1
5984	3	480	1
5985	3	481	1
5986	3	483	1
5987	3	464	1
5988	3	484	1
5989	3	485	1
5990	3	486	1
5991	3	487	1
5992	3	488	1
5993	3	489	1
5994	3	490	1
5995	3	491	1
5996	3	492	1
5997	3	493	1
5998	3	494	1
5999	3	495	1
6000	3	496	1
6001	3	502	1
6002	3	497	1
6003	3	498	1
1998	5	1	1
1999	5	2	1
2000	5	3	1
2001	5	4	1
2002	5	5	1
2003	5	6	1
2004	5	7	1
2005	5	8	1
2006	5	9	1
2007	5	10	1
2008	5	11	1
2009	5	12	1
2010	5	13	1
2011	5	14	1
2012	5	15	1
2013	5	16	1
2014	5	17	1
2015	5	18	1
2016	5	31	1
2017	5	19	1
2018	5	20	1
2019	5	21	1
2020	5	22	1
2021	5	23	1
2022	5	24	1
2023	5	25	1
2024	5	26	1
2025	5	27	1
2026	5	28	1
2027	5	29	1
2028	5	30	1
2029	5	32	1
2030	5	33	1
2031	5	34	1
2032	5	35	1
2033	5	36	1
2034	5	37	1
2035	5	38	1
2036	5	39	1
2037	5	40	1
2038	5	41	1
2039	5	43	1
2040	5	44	1
2041	5	42	1
2042	5	45	1
2043	5	46	1
2044	5	47	1
2045	5	48	1
2046	5	50	1
2047	5	49	1
2048	5	51	1
2049	5	52	1
2050	5	53	1
2051	5	54	1
2052	5	55	1
2053	5	57	1
2054	5	56	1
2055	5	58	1
2056	5	59	1
2057	5	60	1
2058	5	61	1
2059	5	62	1
2060	5	63	1
2061	5	64	1
2062	5	65	1
2063	5	66	1
2064	5	67	1
2065	5	68	1
2066	5	69	1
2067	5	70	1
2068	5	80	1
2069	5	71	1
2070	5	72	1
2071	5	73	1
2072	5	74	1
2073	5	75	1
2074	5	76	1
2075	5	77	1
2076	5	78	1
2077	5	79	1
2078	5	81	1
2079	5	82	1
2080	5	83	1
2081	5	84	1
2082	5	85	1
2083	5	86	1
2084	5	87	1
2085	5	88	1
2086	5	89	1
2087	5	90	1
2088	5	91	1
2089	5	92	1
2090	5	93	1
2091	5	94	1
2092	5	95	1
2093	5	96	1
2094	5	97	1
2095	5	98	1
2096	5	99	1
2097	5	100	1
2098	5	101	1
2099	5	102	1
2100	5	103	1
2101	5	107	1
2102	5	104	1
2103	5	105	1
2104	5	106	1
2105	5	109	1
2106	5	110	1
2107	5	111	1
2108	5	112	1
2109	5	113	1
2110	5	114	1
2111	5	117	1
2112	5	115	1
2113	5	116	1
2114	5	108	1
2115	5	118	1
2116	5	119	1
2117	5	120	1
2118	5	121	1
2119	5	122	1
2120	5	123	1
2121	5	124	1
2122	5	125	1
2123	5	126	1
2124	5	128	1
2125	5	127	1
2126	5	129	1
2127	5	130	1
2128	5	131	1
2129	5	132	1
2130	5	133	1
2131	5	137	1
2132	5	134	1
2133	5	135	1
2134	5	136	1
2135	5	138	1
2136	5	139	1
2137	5	140	1
2138	5	141	1
2139	5	142	1
2140	5	143	1
2141	5	144	1
2142	5	145	1
2143	5	146	1
2144	5	147	1
2145	5	148	1
2146	5	149	1
2147	5	150	1
2148	5	151	1
2149	5	152	1
2150	5	153	1
2151	5	154	1
2152	5	155	1
2153	5	156	1
2154	5	158	1
2155	5	157	1
2156	5	159	1
2157	5	160	1
2158	5	161	1
2159	5	162	1
2160	5	163	1
2161	5	164	1
2162	5	165	1
2163	5	166	1
2164	5	167	1
2165	5	168	1
2166	5	171	1
2167	5	170	1
2168	5	172	1
2169	5	173	1
2170	5	169	1
2171	5	174	1
2172	5	175	1
2173	5	176	1
2174	5	177	1
2175	5	178	1
2176	5	179	1
2177	5	180	1
2178	5	181	1
2179	5	182	1
2180	5	183	1
2181	5	184	1
2182	5	185	1
2183	5	186	1
2184	5	187	1
2185	5	188	1
2186	5	189	1
2187	5	190	1
2188	5	191	1
2189	5	192	1
2190	5	193	1
2191	5	194	1
2192	5	195	1
2193	5	196	1
2194	5	197	1
2195	5	198	1
2196	5	199	1
2197	5	200	1
2198	5	201	1
2199	5	202	1
2200	5	203	1
2201	5	204	1
2202	5	205	1
2203	5	206	1
2204	5	207	1
2205	5	208	1
2206	5	209	1
2207	5	210	1
2208	5	211	1
2209	5	212	1
2210	5	213	1
2211	5	214	1
2212	5	215	1
2213	5	217	1
2214	5	216	1
2215	5	218	1
2216	5	219	1
2217	5	220	1
2218	5	221	1
2219	5	222	1
2220	5	223	1
2221	5	224	1
2222	5	225	1
2223	5	226	1
2224	5	227	1
2225	5	228	1
2226	5	229	1
2227	5	230	1
2228	5	231	1
2229	5	232	1
2230	5	233	1
2231	5	234	1
2232	5	235	1
2233	5	236	1
2234	5	237	1
2235	5	238	1
2236	5	239	1
2237	5	240	1
2238	5	241	1
2239	5	242	1
2240	5	243	1
2241	5	244	1
2242	5	245	1
2243	5	246	1
2244	5	247	1
2245	5	248	1
2246	5	249	1
2247	5	251	1
2248	5	250	1
2249	5	252	1
2250	5	253	1
2251	5	255	1
2252	5	256	1
2253	5	254	1
2254	5	257	1
2255	5	258	1
2256	5	259	1
2257	5	260	1
2258	5	261	1
2259	5	262	1
2260	5	263	1
2261	5	264	1
2262	5	265	1
2263	5	266	1
2264	5	267	1
2265	5	268	1
2266	5	269	1
2267	5	270	1
2268	5	271	1
2269	5	272	1
2270	5	273	1
2271	5	275	1
2272	5	276	1
2273	5	274	1
2274	5	277	1
2275	5	278	1
2276	5	279	1
2277	5	280	1
2278	5	281	1
2279	5	282	1
2280	5	283	1
2281	5	286	1
2282	5	284	1
2283	5	285	1
2284	5	287	1
2285	5	288	1
2286	5	289	1
2287	5	290	1
2288	5	291	1
2289	5	292	1
2290	5	294	1
2291	5	295	1
2292	5	296	1
2293	5	293	1
2294	5	297	1
2295	5	298	1
2296	5	299	1
2297	5	300	1
2298	5	301	1
2299	5	302	1
2300	5	303	1
2301	5	304	1
2302	5	305	1
2303	5	306	1
2304	5	307	1
2305	5	308	1
2306	5	309	1
2307	5	310	1
2308	5	311	1
2309	5	312	1
2310	5	313	1
2311	5	314	1
2312	5	315	1
2313	5	316	1
2314	5	317	1
2315	5	318	1
2316	5	319	1
2317	5	320	1
2318	5	321	1
2319	5	322	1
2320	5	323	1
2321	5	324	1
2322	5	325	1
2323	5	326	1
2324	5	327	1
2325	5	328	1
2326	5	329	1
2327	5	330	1
2328	5	331	1
2329	5	332	1
2330	5	333	1
2331	5	334	1
2332	5	335	1
2333	5	336	1
2334	5	337	1
2335	5	338	1
2336	5	339	1
2337	5	340	1
2338	5	341	1
2339	5	342	1
2340	5	343	1
2341	5	345	1
2342	5	346	1
2343	5	344	1
2344	5	347	1
2345	5	348	1
2346	5	350	1
2347	5	351	1
2348	5	352	1
2349	5	353	1
2350	5	354	1
2351	5	355	1
2352	5	349	1
2353	5	356	1
2354	5	357	1
2355	5	358	1
2356	5	359	1
2357	5	360	1
2358	5	361	1
2359	5	362	1
2360	5	363	1
2361	5	372	1
2362	5	373	1
2363	5	364	1
2364	5	365	1
2365	5	366	1
2366	5	367	1
2367	5	368	1
2368	5	369	1
2369	5	370	1
2370	5	375	1
2371	5	376	1
2372	5	377	1
2373	5	378	1
2374	5	379	1
2375	5	374	1
2376	5	371	1
2377	5	380	1
2378	5	381	1
2379	5	382	1
2380	5	383	1
2381	5	384	1
2382	5	385	1
2383	5	386	1
2384	5	387	1
2385	5	388	1
2386	5	389	1
2387	5	390	1
2388	5	391	1
2389	5	392	1
2390	5	393	1
2391	5	394	1
2392	5	395	1
2393	5	396	1
2394	5	397	1
2395	5	398	1
2396	5	399	1
2397	5	400	1
2398	5	401	1
2399	5	402	1
2400	5	403	1
2401	5	404	1
2402	5	405	1
2403	5	406	1
2404	5	408	1
2405	5	409	1
2406	5	410	1
2407	5	411	1
2408	5	412	1
2409	5	407	1
2410	5	413	1
2411	5	414	1
2412	5	415	1
2413	5	416	1
2414	5	417	1
2415	5	418	1
2416	5	419	1
2417	5	420	1
2418	5	421	1
2419	5	422	1
2420	5	423	1
2421	5	424	1
2422	5	425	1
2423	5	426	1
2424	5	427	1
2425	5	428	1
2426	5	429	1
2427	5	430	1
2428	5	431	1
2429	5	432	1
2430	5	433	1
2431	5	434	1
2432	5	435	1
2433	5	436	1
2434	5	437	1
2435	5	440	1
2436	5	438	1
2437	5	439	1
2438	5	441	1
2439	5	442	1
2440	5	443	1
2441	5	444	1
2442	5	445	1
2443	5	446	1
2444	5	447	1
2445	5	448	1
2446	5	449	1
2447	5	451	1
2448	5	450	1
2449	5	453	1
2450	5	454	1
2451	5	452	1
2452	5	455	1
2453	5	456	1
2454	5	457	1
2455	5	458	1
2456	5	459	1
2457	5	460	1
2458	5	461	1
2459	5	462	1
2460	5	463	1
2461	5	464	1
2462	5	465	1
2463	5	466	1
2464	5	467	1
2465	5	468	1
2466	5	469	1
2467	5	470	1
2468	5	471	1
2469	5	472	1
2470	5	473	1
2471	5	474	1
2472	5	475	1
2473	5	476	1
2474	5	482	1
2475	5	477	1
2476	5	478	1
2477	5	479	1
2478	5	480	1
2479	5	481	1
2480	5	483	1
2481	5	484	1
2482	5	485	1
2483	5	486	1
2484	5	487	1
2485	5	488	1
2486	5	489	1
2487	5	490	1
2488	5	491	1
2489	5	492	1
2490	5	493	1
2491	5	494	1
2492	5	495	1
2493	5	496	1
2494	5	497	1
2495	5	498	1
3338	2	339	1
3339	2	340	1
3340	2	341	1
3341	2	342	1
3342	2	343	1
3343	2	345	1
3344	2	346	1
3345	2	344	1
3346	2	347	1
3347	2	348	1
3348	2	350	1
3349	2	351	1
3350	2	352	1
3351	2	353	1
3352	2	354	1
3353	2	355	1
3354	2	349	1
3355	2	356	1
3356	2	357	1
3357	2	358	1
3358	2	359	1
3359	2	360	1
3360	2	361	1
3361	2	362	1
3362	2	363	1
3363	2	372	1
3364	2	373	1
3365	2	364	1
3366	2	365	1
3367	2	366	1
3368	2	367	1
3369	2	368	1
3370	2	369	1
3371	2	370	1
3372	2	375	1
3373	2	376	1
3374	2	377	1
3375	2	379	1
3376	2	378	1
3377	2	374	1
3378	2	371	1
3379	2	380	1
3380	2	381	1
3381	2	382	1
3382	2	383	1
3383	2	384	1
3384	2	385	1
3385	2	386	1
3386	2	387	1
3387	2	388	1
3388	2	389	1
3389	2	390	1
3390	2	391	1
3391	2	392	1
3392	2	393	1
3393	2	394	1
3394	2	395	1
3395	2	396	1
3396	2	397	1
3397	2	398	1
3398	2	399	1
3399	2	400	1
3400	2	401	1
3401	2	402	1
3402	2	403	1
3403	2	404	1
3404	2	405	1
3405	2	406	1
3406	2	408	1
3407	2	409	1
3408	2	410	1
3409	2	411	1
3410	2	412	1
3411	2	407	1
3412	2	413	1
3413	2	414	1
3414	2	415	1
3415	2	416	1
3416	2	417	1
3417	2	418	1
3418	2	419	1
3419	2	420	1
3420	2	421	1
3421	2	422	1
3422	2	423	1
3423	2	424	1
3424	2	425	1
3425	2	426	1
3426	2	427	1
3427	2	428	1
3428	2	429	1
3429	2	430	1
3430	2	431	1
3431	2	432	1
3432	2	433	1
3433	2	434	1
3434	2	435	1
3435	2	436	1
3436	2	437	1
3437	2	440	1
3438	2	438	1
3439	2	439	1
3440	2	441	1
3441	2	442	1
3442	2	443	1
3443	2	444	1
3444	2	445	1
3445	2	446	1
3446	2	447	1
3447	2	448	1
3448	2	449	1
3449	2	451	1
3450	2	450	1
3451	2	453	1
3452	2	454	1
3453	2	452	1
3454	2	455	1
3455	2	456	1
3456	2	457	1
3457	2	458	1
3458	2	459	1
3459	2	460	1
3460	2	461	1
3461	2	462	1
3462	2	463	1
3463	2	464	1
3464	2	465	1
3465	2	466	1
3466	2	467	1
3467	2	468	1
3468	2	469	1
3469	2	470	1
3470	2	471	1
3471	2	472	1
3472	2	473	1
3473	2	474	1
3474	2	475	1
3475	2	476	1
3476	2	482	1
3477	2	477	1
3478	2	478	1
3479	2	479	1
3480	2	480	1
3481	2	481	1
3482	2	483	1
3483	2	484	1
3484	2	485	1
3485	2	486	1
3486	2	487	1
3487	2	488	1
3488	2	489	1
3489	2	490	1
3490	2	491	1
3491	2	492	1
3492	2	493	1
3493	2	494	1
3494	2	495	1
3495	2	496	1
3496	2	497	1
3497	2	498	1
3498	2	501	1
3499	1	1	1
3500	1	2	1
3501	1	3	1
3502	1	4	1
3503	1	5	1
3504	1	6	1
3505	1	7	1
3506	1	8	1
3507	1	9	1
3508	1	10	1
3509	1	11	1
3510	1	12	1
3511	1	13	1
3512	1	14	1
3513	1	15	1
3514	1	16	1
3515	1	17	1
3516	1	18	1
3517	1	31	1
3518	1	19	1
3519	1	20	1
3520	1	21	1
3521	1	22	1
3522	1	23	1
3523	1	24	1
3524	1	25	1
3525	1	26	1
3526	1	27	1
3527	1	28	1
3528	1	29	1
3529	1	30	1
3530	1	32	1
3531	1	33	1
3532	1	34	1
3533	1	35	1
3534	1	36	1
3535	1	37	1
3536	1	38	1
3537	1	39	1
3538	1	40	1
3539	1	41	1
3540	1	43	1
3541	1	44	1
3542	1	42	1
3543	1	45	1
3544	1	46	1
3545	1	47	1
3546	1	48	1
3547	1	50	1
3548	1	49	1
3549	1	51	1
3550	1	52	1
3551	1	53	1
3552	1	54	1
3553	1	55	1
3554	1	57	1
3555	1	56	1
3556	1	58	1
3557	1	59	1
3558	1	60	1
3559	1	61	1
3560	1	62	1
3561	1	63	1
3562	1	64	1
3563	1	65	1
3564	1	66	1
3565	1	67	1
3566	1	68	1
3567	1	69	1
3568	1	70	1
3569	1	80	1
3570	1	71	1
3571	1	72	1
3572	1	73	1
3573	1	74	1
3574	1	75	1
3575	1	76	1
3576	1	77	1
3577	1	78	1
3578	1	79	1
3579	1	81	1
3580	1	82	1
3581	1	83	1
3582	1	84	1
3583	1	85	1
3584	1	86	1
3585	1	87	1
3586	1	88	1
3587	1	89	1
3588	1	90	1
3589	1	91	1
3590	1	92	1
3591	1	93	1
3592	1	94	1
3593	1	95	1
3594	1	96	1
3595	1	97	1
3596	1	98	1
3597	1	99	1
3598	1	100	1
3599	1	101	1
3600	1	102	1
3601	1	103	1
3602	1	107	1
3603	1	104	1
3604	1	105	1
3605	1	106	1
3606	1	109	1
3607	1	110	1
3608	1	111	1
3609	1	112	1
3610	1	113	1
3611	1	114	1
3612	1	117	1
3613	1	115	1
3614	1	116	1
3615	1	108	1
3616	1	118	1
3617	1	119	1
3618	1	120	1
3619	1	121	1
3620	1	122	1
3621	1	123	1
3622	1	124	1
3623	1	125	1
3624	1	126	1
3625	1	128	1
3626	1	127	1
3627	1	129	1
3628	1	130	1
3629	1	131	1
3630	1	132	1
3631	1	133	1
3632	1	137	1
3633	1	134	1
3634	1	135	1
3635	1	136	1
3636	1	138	1
3637	1	139	1
3638	1	140	1
3639	1	141	1
3640	1	142	1
3641	1	143	1
3642	1	144	1
3643	1	145	1
3644	1	146	1
3645	1	147	1
3646	1	148	1
3647	1	149	1
3648	1	150	1
3649	1	151	1
3650	1	152	1
3651	1	153	1
3652	1	154	1
3653	1	155	1
3654	1	156	1
3655	1	158	1
3656	1	157	1
3657	1	159	1
3658	1	160	1
3659	1	161	1
3660	1	162	1
3661	1	163	1
3662	1	164	1
3663	1	165	1
3664	1	166	1
3665	1	167	1
3666	1	168	1
3667	1	171	1
3668	1	170	1
3669	1	172	1
3670	1	173	1
3671	1	169	1
3672	1	174	1
3673	1	175	1
3674	1	176	1
3675	1	177	1
3676	1	178	1
3677	1	179	1
3678	1	180	1
3679	1	181	1
3680	1	182	1
3681	1	183	1
3682	1	184	1
3683	1	185	1
3684	1	186	1
3685	1	187	1
3686	1	188	1
3687	1	189	1
3688	1	190	1
3689	1	191	1
3690	1	192	1
3691	1	193	1
3692	1	194	1
3693	1	195	1
3694	1	196	1
3695	1	197	1
3696	1	198	1
3697	1	199	1
3698	1	200	1
3699	1	201	1
3700	1	202	1
3701	1	203	1
3702	1	204	1
3703	1	205	1
3704	1	206	1
3705	1	207	1
3706	1	208	1
3707	1	209	1
3708	1	210	1
3709	1	211	1
3710	1	212	1
3711	1	213	1
3712	1	214	1
3713	1	215	1
3714	1	217	1
3715	1	216	1
3716	1	218	1
3717	1	219	1
3718	1	220	1
3719	1	221	1
3720	1	222	1
3721	1	223	1
3722	1	224	1
3723	1	225	1
3724	1	226	1
3725	1	227	1
3726	1	228	1
3727	1	229	1
3728	1	230	1
3729	1	231	1
3730	1	232	1
3731	1	233	1
3732	1	234	1
3733	1	235	1
3734	1	236	1
3735	1	237	1
3736	1	238	1
3737	1	239	1
3738	1	240	1
3739	1	241	1
3740	1	242	1
3741	1	243	1
3742	1	244	1
3743	1	245	1
3744	1	246	1
3745	1	247	1
3746	1	248	1
3747	1	249	1
3748	1	251	1
3749	1	250	1
3750	1	499	1
3751	1	252	1
3752	1	253	1
3753	1	255	1
3754	1	256	1
3755	1	254	1
3756	1	257	1
3757	1	258	1
3758	1	259	1
3759	1	260	1
3760	1	261	1
3761	1	262	1
3762	1	263	1
3763	1	264	1
3764	1	265	1
3765	1	266	1
3766	1	267	1
3767	1	283	1
3768	1	268	1
3769	1	269	1
3770	1	270	1
3771	1	271	1
3772	1	272	1
3773	1	273	1
3774	1	275	1
3775	1	276	1
3776	1	274	1
3777	1	277	1
3778	1	278	1
3779	1	279	1
3780	1	280	1
3781	1	281	1
3782	1	282	1
3783	1	286	1
3784	1	284	1
3785	1	285	1
3786	1	287	1
3787	1	288	1
3788	1	289	1
3789	1	290	1
3790	1	291	1
3791	1	292	1
3792	1	294	1
3793	1	295	1
3794	1	296	1
3795	1	293	1
3796	1	297	1
3797	1	298	1
3798	1	299	1
3799	1	300	1
3800	1	301	1
3801	1	302	1
3802	1	303	1
3803	1	304	1
3804	1	305	1
3805	1	306	1
3806	1	307	1
3807	1	308	1
3808	1	309	1
3809	1	310	1
3810	1	311	1
3811	1	312	1
3812	1	313	1
3813	1	314	1
3814	1	315	1
3815	1	316	1
3816	1	317	1
3817	1	318	1
3818	1	319	1
3819	1	320	1
3820	1	321	1
3821	1	322	1
3822	1	323	1
3823	1	324	1
3824	1	325	1
3825	1	326	1
3826	1	327	1
3827	1	328	1
3828	1	329	1
3829	1	330	1
3830	1	331	1
3831	1	332	1
3832	1	333	1
3833	1	334	1
3834	1	335	1
3835	1	336	1
3836	1	337	1
3837	1	500	1
3838	1	338	1
3839	1	339	1
3840	1	340	1
3841	1	341	1
3842	1	342	1
3843	1	343	1
3844	1	345	1
3845	1	346	1
3846	1	344	1
3847	1	348	1
3848	1	350	1
3849	1	351	1
3850	1	352	1
3851	1	353	1
3852	1	354	1
3853	1	355	1
3854	1	349	1
3855	1	356	1
3856	1	357	1
3857	1	358	1
3858	1	359	1
3859	1	360	1
3860	1	361	1
3861	1	362	1
3862	1	363	1
3863	1	372	1
3864	1	373	1
3865	1	364	1
3866	1	365	1
3867	1	366	1
3868	1	367	1
3869	1	368	1
3870	1	369	1
3871	1	370	1
3872	1	375	1
3873	1	376	1
3874	1	377	1
3875	1	378	1
3876	1	379	1
3877	1	374	1
3878	1	371	1
3879	1	380	1
3880	1	381	1
3881	1	382	1
3882	1	383	1
3883	1	384	1
3884	1	385	1
3885	1	386	1
3886	1	387	1
3887	1	388	1
3888	1	389	1
3889	1	390	1
3890	1	391	1
3891	1	392	1
3892	1	393	1
3893	1	394	1
3894	1	395	1
3895	1	396	1
3896	1	397	1
3897	1	398	1
3898	1	399	1
3899	1	400	1
3900	1	401	1
3901	1	402	1
3902	1	403	1
3903	1	404	1
3904	1	405	1
3905	1	406	1
3906	1	408	1
3907	1	409	1
3908	1	410	1
3909	1	411	1
3910	1	412	1
3911	1	407	1
3912	1	413	1
3913	1	414	1
3914	1	415	1
3915	1	416	1
3916	1	417	1
3917	1	418	1
3918	1	419	1
3919	1	420	1
3920	1	421	1
3921	1	422	1
3922	1	423	1
3923	1	424	1
3924	1	425	1
3925	1	426	1
3926	1	427	1
3927	1	428	1
3928	1	429	1
3929	1	430	1
3930	1	431	1
3931	1	432	1
3932	1	433	1
3933	1	434	1
3934	1	435	1
3935	1	436	1
3936	1	437	1
3937	1	440	1
3938	1	438	1
3939	1	439	1
3940	1	441	1
3941	1	442	1
3942	1	443	1
3943	1	444	1
3944	1	445	1
3945	1	446	1
3946	1	447	1
3947	1	448	1
3948	1	449	1
3949	1	451	1
3950	1	450	1
3951	1	453	1
3952	1	454	1
3953	1	452	1
3954	1	501	1
3955	1	455	1
3956	1	456	1
3957	1	457	1
3958	1	458	1
3959	1	459	1
3960	1	460	1
3961	1	461	1
3962	1	462	1
3963	1	463	1
3964	1	465	1
3965	1	466	1
3966	1	467	1
3967	1	468	1
3968	1	469	1
3969	1	470	1
3970	1	471	1
3971	1	472	1
3972	1	473	1
3973	1	474	1
3974	1	475	1
3975	1	476	1
3976	1	482	1
3977	1	477	1
3978	1	478	1
3979	1	479	1
3980	1	480	1
3981	1	481	1
3982	1	483	1
3983	1	464	1
3984	1	484	1
3985	1	485	1
3986	1	486	1
3987	1	487	1
3988	1	488	1
3989	1	489	1
3990	1	490	1
3991	1	491	1
3992	1	492	1
3993	1	493	1
3994	1	494	1
3995	1	495	1
3996	1	496	1
3997	1	502	1
3998	1	497	1
3999	1	498	1
4501	4	1	1
4502	4	2	1
4503	4	3	1
4504	4	4	1
4505	4	5	1
4506	4	6	1
4507	4	7	1
4508	4	8	1
4509	4	9	1
4510	4	10	1
4511	4	11	1
4512	4	12	1
4513	4	13	1
4514	4	14	1
4515	4	15	1
4516	4	16	1
4517	4	17	1
4518	4	18	1
4519	4	31	1
4520	4	19	1
4521	4	20	1
4522	4	21	1
4523	4	22	1
4524	4	23	1
4525	4	24	1
4526	4	25	1
4527	4	26	1
4528	4	27	1
4529	4	28	1
4530	4	29	1
4531	4	30	1
4532	4	32	1
4533	4	33	1
4534	4	34	1
4535	4	35	1
4536	4	36	1
4537	4	37	1
4538	4	38	1
4539	4	39	1
4540	4	40	1
4541	4	41	1
4542	4	43	1
4543	4	44	1
4544	4	42	1
4545	4	45	1
4546	4	46	1
4547	4	47	1
4548	4	48	1
4549	4	50	1
4550	4	49	1
4551	4	51	1
4552	4	52	1
4553	4	53	1
4554	4	54	1
4555	4	55	1
4556	4	57	1
4557	4	56	1
4558	4	58	1
4559	4	59	1
4560	4	60	1
4561	4	61	1
4562	4	62	1
4563	4	63	1
4564	4	64	1
4565	4	65	1
4566	4	66	1
4567	4	67	1
4568	4	68	1
4569	4	69	1
4570	4	70	1
4571	4	80	1
4572	4	71	1
4573	4	72	1
4574	4	73	1
4575	4	74	1
4576	4	75	1
4577	4	76	1
4578	4	77	1
4579	4	78	1
4580	4	79	1
4581	4	81	1
4582	4	82	1
4583	4	83	1
4584	4	84	1
4585	4	85	1
4586	4	86	1
4587	4	87	1
4588	4	88	1
4589	4	89	1
4590	4	90	1
4591	4	91	1
4592	4	92	1
4593	4	93	1
4594	4	94	1
4595	4	95	1
4596	4	96	1
4597	4	97	1
4598	4	98	1
4599	4	99	1
4600	4	100	1
4601	4	101	1
4602	4	102	1
4603	4	103	1
4604	4	107	1
4605	4	104	1
4606	4	105	1
4607	4	106	1
4608	4	109	1
4609	4	110	1
4610	4	111	1
4611	4	112	1
4612	4	113	1
4613	4	114	1
4614	4	117	1
4615	4	115	1
4616	4	116	1
4617	4	108	1
4618	4	118	1
4619	4	119	1
4620	4	120	1
4621	4	121	1
4622	4	122	1
4623	4	123	1
4624	4	124	1
4625	4	125	1
4626	4	126	1
4627	4	128	1
4628	4	127	1
4629	4	129	1
4630	4	130	1
4631	4	131	1
4632	4	132	1
4633	4	133	1
4634	4	137	1
4635	4	134	1
4636	4	135	1
4637	4	136	1
4638	4	138	1
4639	4	139	1
4640	4	140	1
4641	4	141	1
4642	4	142	1
4643	4	143	1
4644	4	144	1
4645	4	145	1
4646	4	146	1
4647	4	147	1
4648	4	148	1
4649	4	149	1
4650	4	150	1
4651	4	151	1
4652	4	152	1
4653	4	153	1
4654	4	154	1
4655	4	155	1
4656	4	156	1
4657	4	158	1
4658	4	157	1
4659	4	159	1
4660	4	160	1
4661	4	161	1
4662	4	162	1
4663	4	163	1
4664	4	164	1
4665	4	165	1
4666	4	166	1
4667	4	167	1
4668	4	168	1
4669	4	171	1
4670	4	170	1
4671	4	172	1
4672	4	173	1
4673	4	169	1
4674	4	174	1
4675	4	175	1
4676	4	176	1
4677	4	177	1
4678	4	178	1
4679	4	179	1
4680	4	180	1
4681	4	181	1
4682	4	182	1
4683	4	183	1
4684	4	184	1
4685	4	185	1
4686	4	186	1
4687	4	187	1
4688	4	188	1
4689	4	189	1
4690	4	190	1
4691	4	191	1
4692	4	192	1
4693	4	193	1
4694	4	194	1
4695	4	195	1
4696	4	196	1
4697	4	197	1
4698	4	198	1
4699	4	199	1
4700	4	200	1
4701	4	201	1
4702	4	202	1
4703	4	203	1
4704	4	204	1
4705	4	205	1
4706	4	206	1
4707	4	207	1
4708	4	208	1
4709	4	209	1
4710	4	210	1
4711	4	211	1
4712	4	212	1
4713	4	213	1
4714	4	214	1
4715	4	215	1
4716	4	217	1
4717	4	216	1
4718	4	218	1
4719	4	219	1
4720	4	220	1
4721	4	221	1
4722	4	222	1
4723	4	223	1
4724	4	224	1
4725	4	225	1
4726	4	226	1
4727	4	227	1
4728	4	228	1
4729	4	229	1
4730	4	230	1
4731	4	231	1
4732	4	232	1
4733	4	233	1
4734	4	234	1
4735	4	235	1
4736	4	236	1
4737	4	237	1
4738	4	238	1
4739	4	239	1
4740	4	240	1
4741	4	241	1
4742	4	242	1
4743	4	243	1
4744	4	244	1
4745	4	245	1
4746	4	246	1
4747	4	247	1
4748	4	248	1
4749	4	249	1
4750	4	251	1
4751	4	250	1
4752	4	499	1
4753	4	252	1
4754	4	253	1
4755	4	255	1
4756	4	256	1
4757	4	254	1
4758	4	257	1
4759	4	258	1
4760	4	259	1
4761	4	260	1
4762	4	261	1
4763	4	262	1
4764	4	263	1
4765	4	264	1
4766	4	265	1
4767	4	266	1
4768	4	267	1
4769	4	283	1
4770	4	268	1
4771	4	269	1
4772	4	270	1
4773	4	271	1
4774	4	272	1
4775	4	273	1
4776	4	275	1
4777	4	276	1
4778	4	274	1
4779	4	277	1
4780	4	278	1
4781	4	279	1
4782	4	280	1
4783	4	281	1
4784	4	282	1
4785	4	286	1
4786	4	284	1
4787	4	285	1
4788	4	287	1
4789	4	288	1
4790	4	289	1
4791	4	290	1
4792	4	291	1
4793	4	292	1
4794	4	294	1
4795	4	295	1
4796	4	296	1
4797	4	293	1
4798	4	297	1
4799	4	298	1
4800	4	299	1
4801	4	300	1
4802	4	301	1
4803	4	302	1
4804	4	303	1
4805	4	304	1
4806	4	305	1
4807	4	306	1
4808	4	307	1
4809	4	308	1
4810	4	309	1
4811	4	310	1
4812	4	311	1
4813	4	312	1
4814	4	313	1
4815	4	314	1
4816	4	315	1
4817	4	316	1
4818	4	317	1
4819	4	318	1
4820	4	319	1
4821	4	320	1
4822	4	321	1
4823	4	322	1
4824	4	323	1
4825	4	324	1
4826	4	325	1
4827	4	326	1
4828	4	327	1
4829	4	328	1
4830	4	329	1
4831	4	330	1
4832	4	331	1
4833	4	332	1
4834	4	333	1
4835	4	334	1
4836	4	335	1
4837	4	336	1
4838	4	337	1
4839	4	500	1
4840	4	338	1
4841	4	339	1
4842	4	340	1
4843	4	341	1
4844	4	342	1
4845	4	343	1
4846	4	345	1
4847	4	346	1
4848	4	344	1
4849	4	348	1
4850	4	350	1
4851	4	351	1
4852	4	352	1
4853	4	353	1
4854	4	354	1
4855	4	355	1
4856	4	349	1
4857	4	356	1
4858	4	357	1
4859	4	358	1
4860	4	359	1
4861	4	360	1
4862	4	361	1
4863	4	362	1
4864	4	363	1
4865	4	372	1
4866	4	373	1
4867	4	364	1
4868	4	365	1
4869	4	366	1
4870	4	367	1
4871	4	368	1
4872	4	369	1
4873	4	370	1
4874	4	375	1
4875	4	376	1
4876	4	377	1
4877	4	378	1
4878	4	379	1
4879	4	374	1
4880	4	371	1
4881	4	380	1
4882	4	381	1
4883	4	382	1
4884	4	383	1
4885	4	384	1
4886	4	385	1
4887	4	386	1
4888	4	387	1
4889	4	388	1
4890	4	389	1
4891	4	390	1
4892	4	391	1
4893	4	392	1
4894	4	393	1
4895	4	394	1
4896	4	395	1
4897	4	396	1
4898	4	397	1
4899	4	398	1
4900	4	399	1
4901	4	400	1
4902	4	401	1
4903	4	402	1
4904	4	403	1
4905	4	404	1
4906	4	405	1
4907	4	406	1
4908	4	408	1
4909	4	409	1
4910	4	410	1
4911	4	411	1
4912	4	412	1
4913	4	407	1
4914	4	413	1
4915	4	414	1
4916	4	415	1
4917	4	416	1
4918	4	417	1
4919	4	418	1
4920	4	419	1
4921	4	420	1
4922	4	421	1
4923	4	422	1
4924	4	423	1
4925	4	424	1
4926	4	425	1
4927	4	426	1
4928	4	427	1
4929	4	428	1
4930	4	429	1
4931	4	430	1
4932	4	431	1
4933	4	432	1
4934	4	433	1
4935	4	434	1
4936	4	435	1
4937	4	436	1
4938	4	437	1
4939	4	440	1
4940	4	438	1
4941	4	439	1
4942	4	441	1
4943	4	442	1
4944	4	443	1
4945	4	444	1
4946	4	445	1
4947	4	446	1
4948	4	447	1
4949	4	448	1
4950	4	449	1
4951	4	451	1
4952	4	450	1
4953	4	453	1
4954	4	454	1
4955	4	452	1
4956	4	501	1
4957	4	455	1
4958	4	456	1
4959	4	457	1
4960	4	458	1
4961	4	459	1
4962	4	460	1
4963	4	461	1
4964	4	462	1
4965	4	463	1
4966	4	465	1
4967	4	466	1
4968	4	467	1
4969	4	468	1
4970	4	469	1
4971	4	470	1
4972	4	471	1
4973	4	472	1
4974	4	473	1
4975	4	474	1
4976	4	475	1
4977	4	476	1
4978	4	482	1
4979	4	477	1
4980	4	478	1
4981	4	479	1
4982	4	480	1
4983	4	481	1
4984	4	483	1
4985	4	464	1
4986	4	484	1
4987	4	485	1
4988	4	486	1
4989	4	487	1
4990	4	488	1
4991	4	489	1
4992	4	490	1
4993	4	491	1
4994	4	492	1
4995	4	493	1
4996	4	494	1
4997	4	495	1
4998	4	496	1
4999	4	502	1
5000	4	497	1
5001	4	498	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.roles (cod_rol, nomb_rol, fecha, estado) FROM stdin;
1	ADMINISTRADOR TABLAS DE RETENCIÓN DOCUMENTAL	2018-08-08	1
3	FUNCIONARIO	2018-08-08	1
5	VENTANILLA DE RADICACIÓN	2018-08-08	1
2	ADMINISTRADOR DEL SISTEMA	2018-08-08	1
4	JEFE	2018-08-08	1
\.


--
-- Data for Name: servicios_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.servicios_pqrs (id_servicio_pqrs, nombre_servicio_pqrs) FROM stdin;
1	General
2	Urgencias
3	Consulta Externa
4	Hospitalización
5	Laboratorio Clínico
6	Imageniología
7	Oficina de Talento Humano
8	Oficina de Subsidios
9	Coordinación Administrativa
10	Coordinación Asistencial
11	Albergues
12	Gerencia
13	Pagaduría
\.


--
-- Data for Name: sgd_agen_agendados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_agen_agendados (sgd_agen_fech, sgd_agen_observacion, radi_nume_radi, usua_doc, depe_codi, sgd_agen_codigo, sgd_agen_fechplazo, sgd_agen_activo) FROM stdin;
\.


--
-- Data for Name: sgd_anar_anexarg; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_anar_anexarg (sgd_anar_codi, anex_codigo, sgd_argd_codi, sgd_anar_argcod) FROM stdin;
\.


--
-- Data for Name: sgd_anu_anulados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_anu_anulados (sgd_anu_id, sgd_anu_desc, radi_nume_radi, sgd_eanu_codi, sgd_anu_sol_fech, sgd_anu_fech, depe_codi, usua_doc, usua_codi, depe_codi_anu, usua_doc_anu, usua_codi_anu, usua_anu_acta, sgd_anu_path_acta, sgd_trad_codigo) FROM stdin;
\.


--
-- Data for Name: sgd_aper_adminperfiles; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_aper_adminperfiles (sgd_aper_codigo, sgd_aper_descripcion) FROM stdin;
\.


--
-- Data for Name: sgd_apli_aplintegra; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_apli_aplintegra (sgd_apli_codi, sgd_apli_descrip, sgd_apli_lk1desc, sgd_apli_lk1, sgd_apli_lk2desc, sgd_apli_lk2, sgd_apli_lk3desc, sgd_apli_lk3, sgd_apli_lk4desc, sgd_apli_lk4) FROM stdin;
0	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sgd_aplmen_aplimens; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_aplmen_aplimens (sgd_aplmen_codi, sgd_apli_codi, sgd_aplmen_ref, sgd_aplmen_haciaorfeo, sgd_aplmen_desdeorfeo) FROM stdin;
\.


--
-- Data for Name: sgd_aplus_plicusua; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_aplus_plicusua (sgd_aplus_codi, sgd_apli_codi, usua_doc, sgd_trad_codigo, sgd_aplus_prioridad) FROM stdin;
\.


--
-- Data for Name: sgd_arch_depe; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_arch_depe (sgd_arch_depe, sgd_arch_edificio, sgd_arch_item, sgd_arch_id) FROM stdin;
\.


--
-- Data for Name: sgd_archivo_central; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_archivo_central (sgd_archivo_id, sgd_archivo_tipo, sgd_archivo_orden, sgd_archivo_fechai, sgd_archivo_demandado, sgd_archivo_demandante, sgd_archivo_cc_demandante, sgd_archivo_depe, sgd_archivo_zona, sgd_archivo_carro, sgd_archivo_cara, sgd_archivo_estante, sgd_archivo_entrepano, sgd_archivo_caja, sgd_archivo_unidocu, sgd_archivo_anexo, sgd_archivo_inder, sgd_archivo_path, sgd_archivo_year, sgd_archivo_rad, sgd_archivo_srd, sgd_archivo_sbrd, sgd_archivo_folios, sgd_archivo_mata, sgd_archivo_fechaf, sgd_archivo_prestamo, sgd_archivo_funprest, sgd_archivo_fechprest, sgd_archivo_fechprestf, depe_codi, sgd_archivo_usua, sgd_archivo_fech) FROM stdin;
\.


--
-- Data for Name: sgd_archivo_fondo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_archivo_fondo (sgd_archivo_id, sgd_archivo_tipo, sgd_archivo_orden, sgd_archivo_fechai, sgd_archivo_demandado, sgd_archivo_demandante, sgd_archivo_cc_demandante, sgd_archivo_depe, sgd_archivo_zona, sgd_archivo_carro, sgd_archivo_cara, sgd_archivo_estante, sgd_archivo_entrepano, sgd_archivo_caja, sgd_archivo_unidocu, sgd_archivo_anexo, sgd_archivo_inder, sgd_archivo_path, sgd_archivo_year, sgd_archivo_rad, sgd_archivo_srd, sgd_archivo_folios, sgd_archivo_mata, sgd_archivo_fechaf, sgd_archivo_prestamo, sgd_archivo_funprest, sgd_archivo_fechprest, sgd_archivo_fechprestf, depe_codi, sgd_archivo_usua, sgd_archivo_fech) FROM stdin;
\.


--
-- Data for Name: sgd_archivo_hist; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_archivo_hist (depe_codi, hist_fech, usua_codi, sgd_archivo_rad, hist_obse, usua_doc, sgd_ttr_codigo, hist_id) FROM stdin;
\.


--
-- Data for Name: sgd_argd_argdoc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_argd_argdoc (sgd_argd_codi, sgd_pnufe_codi, sgd_argd_tabla, sgd_argd_tcodi, sgd_argd_tdes, sgd_argd_llist, sgd_argd_campo) FROM stdin;
\.


--
-- Data for Name: sgd_argup_argudoctop; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_argup_argudoctop (sgd_argup_codi, sgd_argup_desc, sgd_tpr_codigo) FROM stdin;
\.


--
-- Data for Name: sgd_auditoria; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_auditoria (usua_doc, ip, tipo, tabla, isql, fecha) FROM stdin;
1234567890	127.0.0.1	u	USUARIO	UPDATE USUARIO SET USUA_SESION= ^230814120342O127001ADMON^ ,USUA_FECH_SESION=(CURRENT_TIMESTAMP+INTERVAL^0 DAYS^)    WHERE  USUA_LOGIN = ^ADMON^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	2023-08-14 11:03:42.430847-05
1234567890	127.0.0.1	u	RADICADO	UPDATE RADICADO SET RADI_LEIDO=1    WHERE  RADI_DEPE_ACTU = ^998^  AND  RADI_USUA_ACTU = 1  AND  RADI_NUME_RADI = ^20219980000112^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2023-08-14 11:03:52.964383-05
1234567890	127.0.0.1	u	RADICADO	UPDATE RADICADO SET RADI_LEIDO=1    WHERE  RADI_DEPE_ACTU = ^998^  AND  RADI_USUA_ACTU = 1  AND  RADI_NUME_RADI = ^20219980000112^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2023-08-14 11:03:57.253715-05
1234567890	127.0.0.1	u	RADICADO	UPDATE RADICADO SET RADI_LEIDO=1    WHERE  RADI_DEPE_ACTU = ^998^  AND  RADI_USUA_ACTU = 1  AND  RADI_NUME_RADI = ^20219980000112^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2023-08-14 11:03:58.59766-05
1234567890	127.0.0.1	u	RADICADO	UPDATE RADICADO SET RADI_LEIDO=1    WHERE  RADI_DEPE_ACTU = ^998^  AND  RADI_USUA_ACTU = 1  AND  RADI_NUME_RADI = ^20219980000112^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2023-08-14 11:03:59.952206-05
1234567890	127.0.0.1	u	RADICADO	UPDATE RADICADO SET RADI_LEIDO=1    WHERE  RADI_DEPE_ACTU = ^998^  AND  RADI_USUA_ACTU = 1  AND  RADI_NUME_RADI = ^20219980000112^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2023-08-14 11:28:11.732767-05
1234567890	127.0.0.1	u	RADICADO	UPDATE RADICADO SET RADI_LEIDO=1    WHERE  RADI_DEPE_ACTU = ^998^  AND  RADI_USUA_ACTU = 1  AND  RADI_NUME_RADI = ^20219980000112^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2023-08-14 11:28:13.866139-05
1234567890	127.0.0.1	u	USUARIO	UPDATE USUARIO SET USUA_SESION= ^230816034449O127001ADMON^ ,USUA_FECH_SESION=(CURRENT_TIMESTAMP+INTERVAL^0 DAYS^)    WHERE  USUA_LOGIN = ^ADMON^                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	2023-08-16 14:44:49.184415-05
\.


--
-- Data for Name: sgd_camexp_campoexpediente; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_camexp_campoexpediente (sgd_camexp_codigo, sgd_camexp_campo, sgd_parexp_codigo, sgd_camexp_fk, sgd_camexp_tablafk, sgd_camexp_campofk, sgd_camexp_campovalor, sgd_camexp_orden) FROM stdin;
\.


--
-- Data for Name: sgd_carp_descripcion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_carp_descripcion (sgd_carp_depecodi, sgd_carp_tiporad, sgd_carp_descr) FROM stdin;
900	1	Oficio
\.


--
-- Data for Name: sgd_cau_causal; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_cau_causal (sgd_cau_codigo, sgd_cau_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_caux_causales; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_caux_causales (sgd_caux_codigo, radi_nume_radi, sgd_dcau_codigo, sgd_ddca_codigo, sgd_caux_fecha, usua_doc) FROM stdin;
\.


--
-- Data for Name: sgd_ciu_ciudadano; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_ciu_ciudadano (tdid_codi, sgd_ciu_codigo, sgd_ciu_nombre, sgd_ciu_direccion, sgd_ciu_apell1, sgd_ciu_apell2, sgd_ciu_telefono, sgd_ciu_email, muni_codi, dpto_codi, sgd_ciu_cedula, id_cont, id_pais, id_estado_civil_pqrs, genero_pqrs_id, id_users_pqrs, barrio, sgd_ciu_edad, sgd_ciu_ubicacion, trte_codi, tipo_poblacion) FROM stdin;
0	1	ANONIMO	Carrera 1 # 1 1 Sur	ANONIMO	\N	1111111111	\N	1	11	11111111111	1	170	1	1	1	1	1	3	10	1
\.


--
-- Data for Name: sgd_clta_clstarif; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_clta_clstarif (sgd_fenv_codigo, sgd_clta_codser, sgd_tar_codigo, sgd_clta_descrip, sgd_clta_pesdes, sgd_clta_peshast) FROM stdin;
1	1	1	ENVIÓ MENSAJERO PERSONAL	1	1
\.


--
-- Data for Name: sgd_cob_campobliga; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_cob_campobliga (sgd_cob_codi, sgd_cob_desc, sgd_cob_label, sgd_tidm_codi) FROM stdin;
1	PAIS_NOMBRE	PAIS_NOMBRE	2
2	NOMBRE	NOMBRE	1
3	MUNI_NOMBRE	MUNI_NOMBRE	1
4	DEPTO_NOMBRE	DEPTO_NOMBRE	1
5	F_RAD_S	F_RAD_S	1
6	TIPO	TIPO	2
7	NOMBRE	NOMBRE	2
8	MUNI_NOMBRE	MUNI_NOMBRE	2
9	DEPTO_NOMBRE	DEPTO_NOMBRE	2
10	DIR	DIR	2
\.


--
-- Data for Name: sgd_dcau_causal; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_dcau_causal (sgd_dcau_codigo, sgd_cau_codigo, sgd_dcau_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_ddca_ddsgrgdo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_ddca_ddsgrgdo (sgd_ddca_codigo, sgd_dcau_codigo, par_serv_secue, sgd_ddca_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_def_contactos; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_def_contactos (ctt_id, ctt_nombre, ctt_cargo, ctt_telefono, ctt_id_tipo, ctt_id_empresa) FROM stdin;
\.


--
-- Data for Name: sgd_def_continentes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_def_continentes (id_cont, nombre_cont) FROM stdin;
1	AMERICA
2	EUROPA
3	ASIA
4	AFRICA
5	OCEANIA
6	ANTARTIDA
\.


--
-- Data for Name: sgd_def_paises; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_def_paises (id_pais, id_cont, nombre_pais) FROM stdin;
170	1	COLOMBIA
862	1	VENEZUELA
214	1	REPUBLICA DOMINICANA
32	1	ARGENTINA
591	1	PANAMA
249	1	ESTADOS UNIDOS
276	2	ALEMANIA
55	1	BRASIL
244	4	ANGOLA
724	2	ESPAÑA
767	2	SUIZA
604	1	PERU
724	1	ESPAÑA
\.


--
-- Data for Name: sgd_deve_dev_envio; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_deve_dev_envio (sgd_deve_codigo, sgd_deve_desc) FROM stdin;
1	CASA DESOCUPADA
2	CAMBIO DE DOMICILIO USUARIO
3	CERRADO
4	DEVUELTO DE PORTERIA
5	DIRECCION DEFICIENTE
6	FALLECIDO
7	NO EXISTE NUMERO
8	NO RESIDE
9	NO RECLAMADO
10	NO EXISTE EMPRESA
11	ZONA DE ALTO RIESGO
12	SOBRE DESOCUPADO
13	FUERA PERIMETRO URBANO
14	ENVIADO A ADPOSTAL, CONTROL DE CALIDAD
15	SIN SELLO
16	DOCUMENTO MAL RADICADO
17	SOBREPASO TIEMPO DE ESPERA
18	SE TRASLADO
\.


--
-- Data for Name: sgd_dir_drecciones; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_dir_drecciones (sgd_dir_codigo, sgd_dir_tipo, sgd_oem_codigo, sgd_ciu_codigo, radi_nume_radi, sgd_esp_codi, muni_codi, dpto_codi, sgd_dir_direccion, sgd_dir_telefono, sgd_dir_mail, sgd_sec_codigo, sgd_temporal_nombre, anex_codigo, sgd_anex_codigo, sgd_dir_nombre, sgd_doc_fun, sgd_dir_nomremdes, sgd_trd_codigo, sgd_dir_tdoc, sgd_dir_doc, id_pais, id_cont) FROM stdin;
8	1	1	\N	20219980000031	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	Edith Liliana Becerra Abril	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
10	1	1	\N	20219980000021	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	Edith Liliana Becerra Abril	\N	SKINA TECHNOLOGIES SAS -- 	2	\N	\N	170	1
12	1	1	\N	20219980000041	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	JOSÉ LEODAN GUANGA	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
13	1	1	\N	20219980000012	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N	JOSÉ LEODAN GUANGA	\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
14	1	1	\N	20219980000051	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	JOSÉ LEODAN GUANGA	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
15	1	1	\N	20219980000022	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
16	1	1	\N	20219980000061	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
17	1	1	\N	20219980000071	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	JOSÉ LEODAN GUANGA	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
18	1	\N	\N	20219980000032	\N	1	11	Zona franca de bogota 		soporte@skinatech.com 	0	\N	\N	\N		1	USUARIO RECEPCIÓN INVIMA  RECEPCION.INVM	4	\N	1022982736	170	1
19	1	\N	\N	20219980000042	\N	1	11	Zona franca de bogota 		soporte@skinatech.com 	0	\N	\N	\N		1	USUARIO RECEPCIÓN INVIMA  RECEPCION.INVM	4	\N	1022982736	170	1
20	1	1	\N	20219980000081	\N	1	11	Carrera 37 No. 53-50			0	\N	\N	\N	NO REGISTRA	\N	SKINA TECHNOLOGIES SAS  	2	\N	\N	170	1
21	1	1	\N	20219980000091	\N	1	11	Carrera 37 No. 53-50			0	\N	\N	\N	NO REGISTRA	\N	SKINA TECHNOLOGIES SAS  	2	\N	\N	170	1
22	1	1	\N	20219980000101	\N	1	11	Carrera 37 No. 53-50			0	\N	\N	\N	NO REGISTRA	\N	SKINA TECHNOLOGIES SAS  	2	\N	\N	170	1
23	1	1	\N	20219980000052	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N	PRUEBAS	\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
25	1	1	\N	20219980000111	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	PRUEBAS	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
26	1	1	\N	20219980000121	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	PRUEBAS	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
27	1	1	\N	20219980000131	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	PRUEBAS	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
28	1	1	\N	20219980000062	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
29	1	1	\N	20219980000141	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
30	1	1	\N	20219980000072	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
31	1	1	\N	20219980000082	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
32	1	1	\N	20219980000151	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
33	1	1	\N	20219980000092	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
35	1	1	\N	20219980000161	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
36	1	1	\N	20219980000171	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
37	1	\N	\N	20219980000181	\N	1	11	Zona franca de bogota		soporte@skinatech.com	0	\N	\N	\N		1022982736	USUARIO RECEPCIÓN INVIMA	4	\N	1022982736	170	1
38	1	1	\N	20219980000102	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N	JOSÉ LEODAN GUANGA	\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
39	1	1	\N	20219980000191	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	JOSÉ LEODAN GUANGA	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
41	1	1	\N	20219980000201	\N	1	11	Carrera 37 No. 53-50	6431582	soporte@skinatech.com	0	\N	\N	\N	JOSÉ LEODAN GUANGA	\N	SKINA TECHNOLOGIES SAS	2	\N	\N	170	1
42	1	1	\N	20219980000014	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N	PRUEBAS	\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
43	1	1	\N	20219980000112	\N	1	11	Carrera 37 No. 53-50 	6431582	soporte@skinatech.com 	0	\N	\N	\N		\N	SKINA TECHNOLOGIES SAS  --	2	\N	8002509887	170	1
\.


--
-- Data for Name: sgd_dnufe_docnufe; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_dnufe_docnufe (sgd_dnufe_codi, sgd_pnufe_codi, sgd_tpr_codigo, sgd_dnufe_label, trte_codi, sgd_dnufe_main, sgd_dnufe_path, sgd_dnufe_gerarq, anex_tipo_codi) FROM stdin;
\.


--
-- Data for Name: sgd_dt_radicado; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_dt_radicado (radi_nume_radi, dias_termino) FROM stdin;
20219980000011	2
20219980000031	0
20219980000021	1
20219980000041	0
20219980000012	3
20219980000051	0
20219980000022	3
20219980000061	0
20219980000071	0
20219980000032	30
20219980000042	30
20219980000081	30
20219980000091	30
20219980000101	30
20219980000052	2
20219980000111	0
20219980000121	0
20219980000131	0
20219980000062	3
20219980000141	0
20219980000072	30
20219980000082	10
20219980000151	0
20219980000092	10
20219980000161	0
20219980000171	0
20219980000181	0
20219980000102	2
20219980000191	0
20219980000201	3
20219980000014	2
20219980000112	30
\.


--
-- Data for Name: sgd_eanu_estanulacion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_eanu_estanulacion (sgd_eanu_desc, sgd_eanu_codi) FROM stdin;
RADICADO EN SOLICITUD DE ANULACION	1
RADICADO ANULADO	2
RADICADO EN SOLICITUD DE REVIVIR	3
RADICADO IMPOSIBLE DE ANULAR	9
\.


--
-- Data for Name: sgd_einv_inventario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_einv_inventario (sgd_einv_codigo, sgd_depe_nomb, sgd_depe_codi, sgd_einv_expnum, sgd_einv_titulo, sgd_einv_unidad, sgd_einv_fech, sgd_einv_fechfin, sgd_einv_radicados, sgd_einv_folios, sgd_einv_nundocu, sgd_einv_nundocubodega, sgd_einv_caja, sgd_einv_cajabodega, sgd_einv_srd, sgd_einv_nomsrd, sgd_einv_sbrd, sgd_einv_nomsbrd, sgd_einv_retencion, sgd_einv_disfinal, sgd_einv_ubicacion, sgd_einv_observacion) FROM stdin;
\.


--
-- Data for Name: sgd_eit_items; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_eit_items (sgd_eit_codigo, sgd_eit_cod_padre, sgd_eit_nombre, sgd_eit_sigla, codi_dpto, codi_muni) FROM stdin;
1	0	SKINATECH	SKN	11	1
2	1	ARCHIVO GESTION	AG	\N	\N
3	2	ESTANTES 1	ES1	\N	\N
4	3	ENTREPAÑOS 1	EN1	\N	\N
5	4	CAJAS 1	CA1	\N	\N
\.


--
-- Data for Name: sgd_ejes_tematicos; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_ejes_tematicos (id_sgd_eje_tematico, nombre_eje_tematico, descripcion_eje_tematico, plazo_eje_tematico, tipo_plazo_eje_tematico, activo_eje_tematico) FROM stdin;
1	SOLICITUD DE INFORMACIÓN	Corrección de errores en facturas, recibos y pagos	15	Laboral	t
34	SOLICITUD DE DIVULGACIÓN DE INFORMCION	n/a	15	Laboral	t
35	IMPUESTO SOBRE EL ALUMBRADO PÚBLICO	n/a	15	Laboral	t
36	CONSTRUCCIÓN, MANTENIMIENTO E INSTALACIÓN DE OBRAS DE INFRAESTRUCTURA	Novedades,facturación,facilidades de pago	15	Laboral	t
37	ATENCIÓN AL CIUDADANO (ATENCIÓN DE PQRSD)	Obtener el préstamo o alquiler de los parques estadios o escenarios deportivos municipales o distritales.	15	Laboral	t
38	RADICACIÓN DE DOCUMENTOS PARA ADELANTAR ACTIVIDADES DE CONSTRUCCIÓN Y ENAJENACIÓN DE INMUEBLES DESTINADOS A VIVIENDA	Tramites de salud o aseguramiento	15	Laboral	t
39	MODIFICACIÓN DEL PLANO URBANÍSTICO	Reclamo ante la entidad por prestación de los servicios prestados	15	Laboral	t
40	LEGALIZACIÓN URBANÍSTICA DE ASENTAMIENTOS HUMANOS	Solicitud de formación en programas y/o servicios ofertados por la dependencia, en cumplimiento de los requisitos para tal fin.	15	Laboral	t
41	INSCRIPCIÓN O CAMBIO DEL REPRESENTANTE LEGAL Y/O REVISOR FISCAL DE LA PROPIEDAD HORIZONTAL	Permiso de extensión de horario permiso de pasacalles permiso de rifas permiso de enajenación permiso de espectáculos públicos permiso para inscripción como arrendador inscripción propiedad horizontal	15	Laboral	t
42	INSCRIPCIÓN DE LA PROPIEDAD HORIZONTAL	Recepción de denuncia por vulneración de derechos	15	Laboral	t
121	MANTENIMIENTO DE ZONAS VERDES	Informes, registros fotográficos, actas de satisfacción y liquidación	15	Laboral	t
43	IMPUESTO DE DELINEACIÓN URBANA	Denuncia por perdida de documentos registro de marca de ganado permiso para el transporte de menaje certificado de vecindad certificado de conducta diligencia de embargo y secuestro por orden judicial	15	Laboral	t
44	DETERMINANTES PARA LA FORMULACIÓN DE PLANES PARCIALES	Solicitud de visita domiciliaria y audiencia de conciliación para definir custodia y cuidados personales	15	Laboral	t
45	DETERMINANTES PARA EL AJUSTE DE UN PLAN PARCIAL	Solicitud de audiencia de conciliación para regular visitas	15	Laboral	t
46	COPIA CERTIFICADA DE PLANOS	Acción civil realizada en las denuncias por violencia intrafamiliar y violencia contra la mujer	15	Laboral	t
47	CONCEPTO DE USO DEL SUELO	Solicitud de audiencia de conciliación para regulación, aumento, disminución y exoneración de cuota de alimentos	10	Laboral	t
48	CERTIFICADO DE PERMISO DE OCUPACIÓN CONCEPTO DE NORMA URBANÍSTICA	Visita a los establecimientos abiertos al p¿publico con el fin de verificar el cumplimiento de la ley 232/95 y decreto 1879/08	15	Laboral	t
49	AUTORIZACIÓN PARA EL MOVIMIENTO DE TIERRAS	Solicitudes de restitución y recuperación de espacio público. Controla la publicidad visual exterior	10	Laboral	t
50	APROBACIÓN DE PISCINAS	Solicitud de apoyo en eventos y/o reuniones	15	Laboral	t
51	APROBACIÓN DE LOS PLANOS DE PROPIEDAD HORIZONTAL	Solicitud de facilidades de pago de las deudas con el municipio.	15	Laboral	t
52	AJUSTE DE UN PLAN PARCIAL ADOPTADO	Solicitud de inscripción de los establecimientos de comercio de los impuestos de industria y comercio.	15	Laboral	t
53	AJUSTE DE COTAS Y ÁREAS	Solicitud de levantamiento de embargos, levantamiento de afectación de valorización.	15	Laboral	t
54	INCORPORACIÓN Y ENTREGA DE LAS ÁREAS DE CESIÓN A FAVOR DEL MUNICIPIO	Solicitud de certificaciones de nomenclatura, certificaciones catastrales, certificaciones de impuesto predial, industria y comercio.	15	Laboral	t
55	FORMULACIÓN DEL PROYECTO DE PLAN DE REGULARIZACIÓN	Declaración privada de impuesto de industria y comercio.	15	Laboral	t
56	FORMULACIÓN DEL PROYECTO DE PLAN DE IMPLANTACIÓN	Solicitud mantenimiento correctivo y preventivo de equipos de tecnología.	15	Laboral	t
57	CONSULTA PRELIMINAR PARA LA FORMULACIÓN DE PLANES DE REGULARIZACIÓN	Certificado de descuentos comerciales	15	Laboral	t
58	CONSULTA PRELIMINAR PARA LA FORMULACIÓN DE PLANES DE IMPLANTACIÓN	Legalización de viáticos	15	Laboral	t
59	ASIGNACIÓN DE NOMENCLATURA	Solicitud inventario, baja, mantenimiento, seguimiento.	15	Laboral	t
60	FORMULACIÓN Y RADICACIÓN DEL PROYECTO DEL PLAN PARCIAL.	Acoso laboral según lo establecido en la ley 1010 de 2006	15	Laboral	t
61	RADICACIÓN DE DOCUMENTOS PARA ENAJENAR INSCRIPCIÓN DE PROPIEDAD HORIZONTAL.	Autenticación de actos administrativos	15	Laboral	t
62	INSCRIPCIÓN DE ENTIDADES URBANIZADORAS	Solicitud o autorización de recursos físicos, humanos, financieros, didácticos por parte de establecimientos educativos (biblioteca, hemeroteca, laboratorio, medios informáticos, medios audiovisuales). Asignación de recursos a ie, dotaciones	15	Laboral	t
63	RETIRO DE UN HOGAR DE LA BASE DE DATOS DEL SISTEMA DE IDENTIFICACIÓN Y CLASIFICACIÓN DE POTENCIALES BENEFICIARIOS DE PROGRAMAS SOCIALES - SISBEN	Comunicaciones, requerimientos relacionados con el sindicato	15	Laboral	t
64	RETIRO DE PERSONAS DE LA BASE DE DATOS DEL SISTEMA DE IDENTIFICACIÓN Y CLASIFICACIÓN DE POTENCIALES BENEFICIARIOS DE PROGRAMAS SOCIALES - SISBEN	Solicitud creación o cambio de contraseña en los sistemas	15	Laboral	t
65	INCLUSIÓN DE PERSONAS EN LA BASE DE DATOS DEL SISTEMA DE IDENTIFICACIÓN Y CLASIFICACIÓN DE POTENCIALES BENEFICIARIOS DE PROGRAMAS SOCIALES – SISBEN	Expedición del certificado de ingresos y retenciones	15	Laboral	t
66	ACTUALIZACIÓN DE DATOS DE IDENTIFICACIÓN EN LA BASE DE DATOS DEL SISTEMA DE IDENTIFICACIÓN Y CLASIFICACIÓN DE POTENCIALES BENEFICIARIOS DE PROGRAMAS SOCIALES – SISBEN	Oficios en los que se reportan los convenios por libranzas realizados por los funcionarios, solitud e inactividad de descuentos. Certificación de deducciones. Retiro de entidades.	15	Laboral	t
67	CLASIFICACIÓN SOCIO ECONÓMICA	Elaboración o solicitud de paz y salvo	15	Laboral	t
68	SUPERVISOR DELEGADO DE SORTEO Y CONCURSO	Emisión de bono pensional	15	Laboral	t
69	PERMISO PARA INSCRIPCION COMO ARRENDAR	Documentos para inclusión en historia laboral	15	Laboral	t
70	PERMISO PARA DEMOSTRACIONES PUBLICAS DE PÓLVORA ARTÍCULOS PIROTÉCNICOS O JUEGOS ARTIFICIAL.	Solicitud de la planta de cargos.	15	Laboral	t
71	PUBLICIDAD VISUAL EXTERIOR	Concepto de medicina laboral para traslado o reubicación por salud, por pensión de invalidez	15	Laboral	t
72	PRORROGA DE SORTEO DE RIFAS	Todo lo relacionado con salud ocupacional	15	Laboral	t
73	CONCEPTO DE EXCEPCIÓN DE JUEGOS DE SUERTE Y AZAR EN LA MODALIDAD DE RIFAS.	Concursos publico de meritos y convocatorias internas	15	Laboral	t
74	RECONOCIMIENTO DE ESCENARIOS HABILITADOS PARA LA REALIZACIÓN DE ESPECTÁCULOS PÚBLICOS DE ARTES ESCÉNICAS.	Certificado de no vinculado a la entidad.	15	Laboral	t
75	PERMISO PARA ESPECTÁCULOS PÚBLICOS DE LAS ESCÉNICAS EN ESCENARIOS NO HABILITADOS	Certificado de afiliación al fondo.	15	Laboral	t
76	ASESORÍA A VÍCTIMAS	Auxilio: auxilio por maternidad, auxilio por enfermedad profesional, auxilio por enfermedad no profesional, auxilio por accidente de trabajo, indemnización por accidente de trabajo, auxilio funerario por fallecimiento del pensionado, seguro por muerte pensión: solicitud de pensión invalidez, pensión por retiro por vejez, pensión por aportes al (i.s.s), re liquidación pensional,sustitución pensional, pensión post mortem 20 años, pensión post mortem 18 años, sobreviviente, indemnización sustitutiva (vejez, invalidez y sobrevivientes). Solicitud de certificado / ajuste pensión. Ordinaria de jubilación nacional, nacionalizado, territoriales cesantías: cesantías definitivas, cesantías definitivas por fallecimiento, cesantías parciales/ intereses de cesantías cancelación de prestaciones sociales y factores salariales que no tienen disponibilidad presupuestal	15	Laboral	t
77	ASESORÍA SICO-SOCIAL	Renuncias, retiros, declaratoria de vacancia, perdida de capacidad laboral, destituciones, traslados, fallecimientos	15	Laboral	t
78	ASESORÍA EN LEGISLACIÓN FAMILIAR	Incapacidades, licencias, comisiones, suspensión, separación temporal del cargo. Reporte de remisiones medicas. Ausentismo	15	Laboral	t
79	APOYO DE EMERGENCIA A VÍCTIMAS	Solicitud de documentos soportes de la hoja de vida (documentos / copias). Radicación de hoja de vida para solicitud de empleos. Recibo de documentos soportes para anexar a la hoja de vida	15	Laboral	t
80	APOYO A MENORES INFRACTORES	Solicitud de certificado de antecedentes disciplinarios	15	Laboral	t
81	VIGILANCIA A ESTABLECIMIENTOS ABIERTOS AL PÚBLICO	Certificación que establece el cargo, tiempo de servicio desde su vinculación a la entidad y el salario devengado.	15	Laboral	t
82	LICENCIA DE OCUPACIÓN DEL ESPACIO PÚBLICO PARA LA LOCALIZACIÓN DE EQUIPAMIENTO	Reconocimiento del 8%, 10%, 15%, 20% hasta el 40% para factor salarial	15	Laboral	t
83	LICENCIA DE INTERVENCIÓN DEL ESPACIO PÚBLICO	Certificación que establece el tiempo de servicio desde su vinculación a la entidad.	15	Laboral	t
84	DEVOLUCIÓN DE ELEMENTOS RETENIDOS POR OCUPACIÓN ILEGAL DEL ESPACIO PÚBLICO	Certificado para liquidación de prestaciones que incluye factor salarial	15	Laboral	t
85	VIGILANCIA AL ESPACIO PÚBLICO	Certificación que establece el salario devengado por el funcionario	15	Laboral	t
86	REGISTRO DE LA PUBLICIDAD EXTERIOR VISUAL	Duplicados de reporte de cesantías	15	Laboral	t
87	LICENCIA DE INHUMACIÓN DE CADÁVERES	Reclamaciones relacionadas con la nomina.	15	Laboral	t
88	AUTORIZACIÓN PARA LA OPERACIÓN DE JUEGOS DE SUERTE Y AZAR EN LA MODALIDAD DE RIFAS	Información relacionada con tecnología.	15	Laboral	t
89	TRASLADO DE CADÁVERES	Radicación de facturas y gestión para el pago de servicios públicos de los establecimientos públicos adscritos al municipio.	15	Laboral	t
90	REGISTRO DE MARCAS DE GANADO	Necesidades de construcción, reconstrucción, reparación, ampliación, mantenimiento y mejoramiento de bienes e inmuebles, proyectos, informes y estudios	15	Laboral	t
91	IMPUESTO SOBRE CASINOS Y JUEGOS PERMITIDOS	Indicadores de la gestión de infraestructura física y vivienda	15	Laboral	t
92	IMPUESTO DE ESPECTÁCULOS PÚBLICOS	Solicitud de retiro parcial y/o total del ahorro programado, o de proyecto.	15	Laboral	t
93	IMPUESTO AL DEGÜELLO DE GANADO MENOR	Población afectada por la violencia, discapacitados, reinsertados, afrodesendientes, madres cabeza de familias y población indígena.	15	Laboral	t
94	EXENCIÓN DEL IMPUESTO DE ESPECTÁCULOS PÚBLICOS	Proyecto de mejoramiento de vivienda, construcción en sitio propio, vivienda nueva.	15	Laboral	t
95	DERECHOS DE EXPLOTACIÓN DE JUEGOS DE SUERTE Y AZAR EN LA MODALIDAD DE RIFAS	Titulación de inmuebles fiscales ocupados por vivienda de interés social	15	Laboral	t
96	MATRICULA DE ARRENDADORES CANCELACIÓN DE LA MATRÍCULA DE ARRENDADORES	Levantamiento de condiciones resolutorias, hipotecas, y patrimonio de familia y gravamen de valorización	15	Laboral	t
97	EXPEDICIÓN DE CERTIFICADOS, DENUNCIAS, DECLARACIONES JURAMENTADAS, CONSTANCIAS	Quejas presentadas contra servidores públicos. En algunos caso debe enviarse a control interno disciplinario de la alcaldía o la gobernación para lo cual debe especificarse en el sistema	15	Laboral	t
98	QUERELLAS CIVILES	Inconformidad a la entrega de obras recibidas	15	Laboral	t
99	QUEJAS POLICIVAS	Certificación que establece vinculo laboral entre el contratista y el municipio, tiempo de servicio desde su vinculación a la institución y el valor del contrato.	15	Laboral	t
100	PERMISOS PARA: RIFAS, JUEGOS Y ESPECTÁCULOS, PASACALLES, TRANSPORTE O MENAJE, TRANSPORTE DE GANADO, REGISTRO, INHUMACIÓN	Certificación que acredita la posesión del bien inmueble.	15	Laboral	t
101	DERECHOS HUMANOS	Inauguraciones, entrega de obras de infraestructura, entrega de viviendas.	15	Laboral	t
102	GARANTÍAS PARA LA SEGURIDAD Y CONVIVENCIA (OBSERVATORIO DEL DELITO, MANUAL DE CONVIVENCIA, PLAN DE SEGURIDAD DEMOCRÁTICA)	Solicitud de información estadística.	15	Laboral	t
103	PREVENCIÓN (FRENTES DE SEGURIDAD, BOMBEROS, PROGRAMA DE CONVIVENCIA CIUDADANA).	Solicitud de determinantes, aprobación planos para propiedad horizontal, reproducción de sellos, aprobación de planes parciales, inquietudes.	15	Laboral	t
104	REACCIÓN (POLICÍAS BACHILLERES, POLICÍA COMUNITARIA, ATENCIÓN A PRESOS, HOGAR DE PASO, CAI, CÁMARAS DE VIGILANCIA, BOMBEROS.	Solicitud de cambio de estrato o actualización de este.	15	Laboral	t
106	DESARROLLO HUMANO Y SOCIAL EN MUJER Y FAMILIA, JUVENTUD, VÍCTIMAS, DISCAPACIDAD, ADULTO MAYOR, ETNIAS Y AFRODESCENDIENTES	Solicitudes de modificación, actualización, inclusión del sisben	15	Laboral	t
107	CONFORMACIÓN DE FORMAS ORGANIZATIVAS	Informes, registros fotográficos, actas de satisfacción y de liquidación	15	Laboral	t
108	FAMILIAS EN ACCIÓN; SUBSIDIOS ECONÓMICOS	Solicitud del consejo municipal de la gestion del riesgo.	15	Laboral	t
109	ADULTO MAYOR; SUBSIDIOS ECONÓMICOS, CASA HOGAR	Solicitud de certificado de usos del suelo y zonas de riesgo	15	Laboral	t
110	DISCAPACIDAD APARATOS DE LOCOMOCION	Solicitud de certificado de estratificación, retiros sisben y no sisben	15	Laboral	t
111	BIENESTARINA APOYO ALIMENTARIO	Solicitud de licencias urbanísticas	15	Laboral	t
112	SEGURIDAD ALIMENTARIA MANA INFANTIL	Solicitudes de comunidades indígenas, censos.	15	Laboral	t
113	ATENCIÓN AL CIUDADANO (ATENCION DE PQRSDF)	Solicitud de radicación de proyectos la banco de proyectos	15	Laboral	t
242	PROPUESTAS Y OBSERVACIONES	Información para la contratación.	15	Laboral	t
114	ASESORÍA EN TEMÁTICAS DE SALUD PUBLICA COMO SON SON HABILIDADES PARA LA VIDA, NUTRICIÓN PUBLICA,ATENCIÓN PRIMARIA EN SALUD,APS,ENFERMERÍA PSICOLOGÍA, TRABAJO SOCIAL, HIGIENE ORAL, ACTIVIDAD FÍSICA.	Certificaciones y liquidación de pagos de sentencias judiciales	15	Laboral	t
115	SUMINISTRO DE MEDICAMENTO	Ley 285 de 2009, decreto 1716 de 2009. Presentada la petición de conciliación ante la entidad, el comité de conciliación cuenta con quince (15) días a partir de su recibo para tomar la correspondiente decisión, la cual comunicará en el curso de la audiencia de conciliación, aportando copia auténtica de la respectiva acta o certificación en la que consten sus fundamentos. Las partes por mutuo acuerdo podrán prorrogar el término de tres (3) meses consagrado para el trámite conciliatorio extrajudicial, pero en dicho lapso no operará la suspensión del término de caducidad o prescripción.	15	Laboral	t
116	SUMINISTRO DE BIOLOGICO	Juzgados laborales, juagados civiles, penales, administrativos y fiscalía.	15	Laboral	t
117	SUBSIDIOS EN SALUD - SEC SALUD	Acciones de nulidad y restablecimiento del derecho, acciones de reparación directa, acciones de simple nulidad y ejecutivos	15	Laboral	t
118	FORMULACIÓN DE PROYECTOS -SAMA	Acciones de cumplimiento, acciones de grupo, acciones de tutelas y acciones populares	15	Laboral	t
119	ENTREGA DE INSUMO	Solicitudes o envío de documentos por parte de los ministerios. Solicitudes se encuentra indicadores de gestión	15	Laboral	t
120	RUIDO VIGILANCIA Y CONTROL	Información para la contratación.	15	Laboral	t
122	ASESORIA Y ASISTENCIA	Solicitud de copias de documentos	15	Laboral	t
123	APOYOS A PRODUCCIÓN AGROPECUARIA	Solicitud de tala o poda de arboles urbanos	15	Laboral	t
124	AUTORIZACIÓN PARA TALA Y PODA DE ARBOLES	Recibo de donaciones por parte de entidades	15	Laboral	t
125	CERTIFICADO DE CONDICIÓN FÍSICA ANIMAL EQUINOS SAMA	Recibo de cotizaciones de proveedores	15	Laboral	t
126	PLAN DE ACOMPAÑAMIENTO SOCIAL	Todos los requerimientos relacionado con el sistema integrado de gestión de la entidad territorial	15	Laboral	t
127	REGISTRO TRASLADO DE PERSONA EN ALTO RIESGO	Solicitud de realización de asistencia técnica rural.	15	Laboral	t
128	EJECUCIÓN DE PROYECTO DE VIVIENDA	Solicitud de informes de resultados de las inspecciones realizadas	15	Laboral	t
129	SUBSIDIOS Y ENTREGA DE VIVIENDAS	Estímulos, recreación, inducción	15	Laboral	t
130	REGISTRO PARA LEVANTAMIENTO DE CANCELACIÓN DE CONDICIÓN RESOLUTORIA DE TÍTULOS DE PROPIEDAD	Solicitud de certificado	15	Laboral	t
131	SOLICITUD DE ACLARACIONES Y CANCELACIÓN DE PATRIMONIO	Informes relacionados con comunidades indígenas	15	Laboral	t
132	TITULACIONES DE PREDIO	Solicitud de vinculación de funcionarios	15	Laboral	t
133	LEVANTAMIENTO DE GRAVAMENES Y ACLARACIONES DE LOS TITULOS TRASLATICIOS DE DOMINIO.EJES PROYECTOS ESPECIALES	Normas nacional, departamental, municipal y distrital: leyes, resoluciones, decretos orden	15	Laboral	t
135	PROCESOS CONTRAVENCIONALES	Información para publicar	1	Laboral	t
136	HABILITACIÓN DE EMPRESAS DE TRANSPORTE	Solicitud de campañas educativas, de información o comunicación, así como las de promoción de la salud y prevención de la enfermedad, acciones colectivas o de ivyc	15	Laboral	t
137	MATRICULAS DE VEHÍCULO DE IMPULCION HUMANA Y TRACCIÓN ANIMAL	Solicitud de vigilancia a eventos de riesgo al consumo, el ambiento o la zoonosis	15	Laboral	t
138	LICENCIAS DE CONDUCCION	Solicitud de vigilancia a eventos de salud pública o acciones de control	15	Laboral	t
139	TRAMITES DE VEHICULOS	Solicitud de asesoría y asistencia en programas y/o servicios ofertados por la dependencia, en cumplimiento de los requisitos para tal fin.	15	Laboral	t
140	EMBARGO Y SECUESTRE DE VEHÍCULOS EJES MOVILIDAD	Solicitud de asesoría y asistencia en programas y/o servicios ofertados por la dependencia, en cumplimiento de los requisitos para tal fin.	15	Laboral	t
142	FISCALIZACIÓN DE IMPUESTOS	Solicitud de impresos elaborados por la dependencia ya sean estadísticos, de promoción de la salud, prevención de la enfermedad, salud pública, aseguramiento, programas sociales, emergencias y desastres en salud	15	Laboral	t
143	CERTIFICADOS	Información sobre estadísticas de salud o promoción social, comportamientos epidemiológicos, entre otros	15	Laboral	t
144	MUTACION Y FOTOLECTURA	Solicitud de retiro de vehículos.	15	Laboral	t
145	PAZ Y SALVO MUNICIPALES	Solicitud de capacitación en seguridad vial.	15	Laboral	t
146	SOBRETASA MUNICIPAL O DISTRITAL A LA GASOLINA MOTOR	Solicitud de cierre de vías	15	Laboral	t
147	REGISTRO DE CONTRIBUYENTES DEL IMPUESTO DE INDUSTRIA Y COMERCIO.	Recurso procesal por el que unas actuaciones judiciales se remiten a un órgano superior con la posibilidad de practicar nuevas pruebas para que revoque la resolución dictada por otro inferior	15	Laboral	t
148	MODIFICACIÓN EN EL REGISTRO DE CONTRIBUYENTES DEL IMPUESTO DE INDUSTRIA Y COMERCIO	Recurso judicial que se interpone para que una resolución dictada sea modificada o se dejen sin efecto. Recurso de reposición frente a un acto administrativo, una decisión administrativa o sanción.	15	Laboral	t
149	FACILIDADES DE PAGO PARA LOS DEUDORES DE OBLIGACIONES TRIBUTARIAS	Solicitud de conceptos jurídicos relacionados con el sector de transito	15	Laboral	t
150	FACILIDADES DE PAGO PARA LOS DEUDORES DE OBLIGACIONES NO TRIBUTARIAS	Solicitud de información, fallo, terminación de procesos, modificación al fallo, certificado de embargos	15	Laboral	t
151	EXENCIÓN DEL IMPUESTO PREDIAL UNIFICADO	Contratación, proceso en el cual se pacta la prestación del servicio, interventorias de contratos (seguimiento y supervisión de contratos, notificaciones, actas de interventoria, informes de interventoria, planos e inventarios). Solicitud de ampliación de contratos de personal. Información relacionada con contratos. Documentación para tramite de pago (contratistas, proveedores, etc.). Convenios	15	Laboral	t
152	EXENCIÓN DEL IMPUESTO DE INDUSTRIA Y COMERCIO	Radicación de guías, cartillas, revistas, periódicos, boletines	15	Laboral	t
153	DEVOLUCIÓN Y / O COMPENSACIÓN DE PAGOS EN EXCESO Y PAGOS DE LO NO DEBIDO POR CONCEPTOS NO TRIBUTARIOS	Directivas, circulares, memorando	15	Laboral	t
154	DEVOLUCIÓN Y/O COMPENSACIÓN DE PAGOS EN EXCESO Y PAGOS DE LO NO DEBIDO.	Solicitudes o solicitudes de información por parte de otras entidades privadas. Dentro de solicitudes se encuentra indicadores de gestión	15	Laboral	t
155	CORRECCIÓN DE ERRORES E INCONSISTENCIAS EN DECLARACIONES Y RECIBOS DE PAGO	Requerimientos o solicitudes de información por ministerios diferente al de educación, icfes, icetex, sena, dian, conpes. Dentro de solicitudes se encuentra indicadores de gestión.	15	Laboral	t
156	CONTRIBUCION POR VALORIZACION	Requerimientos o solicitudes de información por parte de fiscalía, tribunales y entes judiciales, concejos nacionales, corte suprema. Dentro de solicitudes se encuentra indicadores de gestión	15	Laboral	t
157	CANCELACIÓN DEL REGISTRO DE CONTRIBUYENTES DEL IMPUESTO DE INDUSTRIA Y COMERCIO.	Requerimientos o solicitudes de información realizadas por los entes de control. Ej. Procuraduría, contraloría, defensoría del pueblo, personería municipales. Dentro de solicitudes se encuentra indicadores de gestión	15	Laboral	t
158	IMPUESTO Y CONTRIBUCIONES: PREDIAL,INDUSTRIA Y COMERCIO Y VALORIZACIÓN.(NOVEDADES,FACTURACIÓN,FACILIDADES DE PAGO.	Videos, fotos, periódicos, revistas	15	Laboral	t
159	PRESTAMOS DE PARQUES Y / ESCENARIOS DEPORTIVOS PARA LA RACIONALIZAN DE ESPECTÁCULOS DE LAS ARTES ESCENICAS	Solicitud audiencias o citas con el alcalde, los secretarios, gerente o jefes de oficina. Estas se programaran de acuerdo a agenda	15	Laboral	t
160	TRÁMITE DE SALUD O ASEGURAMIENTO	Campañas pedagogas, culturales, publicitarias e informativas	15	Laboral	t
161	RECLAMO CONTRA LA PRESTACIÓN DE UN SERVICIO	Felicitaciones emitidas por los ciudadanos.	15	Laboral	t
162	SOLICITUDES DE FORMACIÓN	Todas las invitaciones realizadas. Ej. Eventos, foros, capacitaciones, tarjetas, seminarios, etc.	15	Laboral	t
163	GESTIÓN DE TRAMITES DESPACHO GOBIERNO	Permiso de extensión de horario permiso de pasacalles permiso de rifas permiso de enajenación permiso de espectáculos públicos permiso para inscripción como arrendador inscripción propiedad horizontal	15	Laboral	t
164	QUEJA POLICIVA	Recepción de denuncia por vulneración de derechos	5	Laboral	t
165	GESTIÓN DE TRAMITES INSPECCIÓN DE POLICÍA	Denuncia por perdida de documentos registro de marca de ganado permiso para el transporte de menaje certificado de vecindad certificado de conducta diligencia de embargo y secuestro por orden judicial	5	Laboral	t
166	CUSTODIA Y CUIDADOS PERSONALES	Solicitud de visita domiciliaria y audiencia de conciliación para definir custodia y cuidados personales	5	Laboral	t
167	REGULACIÓN DE VISITAS	Solicitud de audiencia de conciliación para regular visitas	5	Laboral	t
168	VIOLENCIA INTRAFAMILIAR - VIF VIOLENCIA CONTRA LA MUJER	Acción civil realizada en las denuncias por violencia intrafamiliar y violencia contra la mujer	5	Laboral	t
169	PROCESO DE ALIMENTOS	Solicitud de audiencia de conciliación para regulación, aumento, disminución y exoneración de cuota de alimentos	5	Laboral	t
170	VIGILANCIA Y CONTROL ESTABLECIMIENTOS ABIERTOS AL PÚBLICO	Visita a los establecimientos abiertos al p¿publico con el fin de verificar el cumplimiento de la ley 232/95 y decreto 1879/08	5	Laboral	t
171	VIGILANCIA Y CONTROL ESPACIO PÚBLICO	Solicitudes de restitución y recuperación de espacio público. Controla la publicidad visual exterior	30	Laboral	t
172	EVENTOS	Solicitud de apoyo en eventos y/o reuniones	10	Laboral	t
173	ACUERDOS DE PAGO	Solicitud de facilidades de pago de las deudas con el municipio.	15	Laboral	t
174	MATRICULA ESTABLECIMIENTOS DE COMERCIO	Solicitud de inscripción de los establecimientos de comercio de los impuestos de industria y comercio.	15	Laboral	t
175	LEVANTAMIENTO DE MEDIDAS CAUTELARÍAS	Solicitud de levantamiento de embargos, levantamiento de afectación de valorización.	15	Laboral	t
176	CERTIFICACIONES DE IMPUESTOS Y CATASTRALES	Solicitud de certificaciones de nomenclatura, certificaciones catastrales, certificaciones de impuesto predial, industria y comercio.	15	Laboral	t
177	DECLARACIÓN DE INDUSTRIA Y COMERCIO	Declaración privada de impuesto de industria y comercio.	15	Laboral	t
178	SERVICIO TÉCNICO DE MANTENIMIENTO DE COMPUTADORES	Solicitud mantenimiento correctivo y preventivo de equipos de tecnología.	15	Laboral	t
179	CERTIFICADO DE DESCUENTOS COMERCIALES	Certificado de descuentos comerciales	15	Laboral	t
180	LEGALIZACIÓN DE VIÁTICOS	Legalización de viáticos	15	Laboral	t
181	BIENES Y MUEBLES	Solicitud inventario, baja, mantenimiento, seguimiento.	15	Laboral	t
182	ACOSO LABORAL	Acoso laboral según lo establecido en la ley 1010 de 2006	15	Laboral	t
183	AUTENTICACIÓN DE ACTOS ADMINISTRATIVOS	Autenticación de actos administrativos	15	Laboral	t
184	NECESIDADES DE RECURSOS	Solicitud o autorización de recursos físicos, humanos, financieros, didácticos por parte de establecimientos educativos (biblioteca, hemeroteca, laboratorio, medios informáticos, medios audiovisuales). Asignación de recursos a ie, dotaciones	15	Laboral	t
185	COMUNICACIONES SINDICATO	Comunicaciones, requerimientos relacionados con el sindicato	15	Laboral	t
186	CONTRASEÑA EN LOS SISTEMAS	Solicitud creación o cambio de contraseña en los sistemas	15	Laboral	t
187	CERTIFICADO DE INGRESOS Y RETENCIONES	Expedición del certificado de ingresos y retenciones	5	Laboral	t
188	TERCEROS POR LIBRANZAS	Oficios en los que se reportan los convenios por libranzas realizados por los funcionarios, solitud e inactividad de descuentos. Certificación de deducciones. Retiro de entidades.	15	Laboral	t
189	PAZ Y SALVO	Elaboración o solicitud de paz y salvo	15	Laboral	t
190	EMISIÓN DE BONO PENSIONAL	Emisión de bono pensional	15	Laboral	t
191	DOCUMENTOS PARA INCLUSIÓN EN HISTORIA LABORAL	Documentos para inclusión en historia laboral	15	Laboral	t
192	PLANTA DE CARGOS	Solicitud de la planta de cargos.	15	Laboral	t
193	VALORACIONES MEDICAS	Concepto de medicina laboral para traslado o reubicación por salud, por pensión de invalidez	15	Laboral	t
194	SALUD OCUPACIONAL	Todo lo relacionado con salud ocupacional	15	Laboral	t
195	CONCURSOS PUBLICO DE MERITOS Y CONVOCATORIAS INTERNAS	Concursos publico de meritos y convocatorias internas	15	Laboral	t
196	CERTIFICADO DE NO VINCULADO	Certificado de no vinculado a la entidad.	15	Laboral	t
197	CERTIFICADO DE PRESTACIONES SOCIALES Y ECONÓMICAS	Certificado de afiliación al fondo.	15	Laboral	t
237	CONCILIACIONES EXTRAJUDICIALES	Ley 285 de 2009, decreto 1716 de 2009. Presentada la petición de conciliación ante la entidad, el comité de conciliación cuenta con quince (15) días a partir de su recibo para tomar la correspondiente decisión, la cual comunicará en el curso de la audiencia de conciliación, aportando copia auténtica de la respectiva acta o certificación en la que consten sus fundamentos. Las partes por mutuo acuerdo podrán prorrogar el término de tres (3) meses consagrado para el trámite conciliatorio extrajudicial, pero en dicho lapso no operará la suspensión del término de caducidad o prescripción.	15	Laboral	t
238	DEMANDAS ORDINARIAS	Juzgados laborales, juagados civiles, penales, administrativos y fiscalía.	5	Laboral	t
198	PRESTACIONES SOCIALES Y ECONÓMICA	Auxilio: auxilio por maternidad, auxilio por enfermedad profesional, auxilio por enfermedad no profesional, auxilio por accidente de trabajo, indemnización por accidente de trabajo, auxilio funerario por fallecimiento del pensionado, seguro por muerte pensión: solicitud de pensión invalidez, pensión por retiro por vejez, pensión por aportes al (i.s.s), re liquidación pensional,sustitución pensional, pensión post mortem 20 años, pensión post mortem 18 años, sobreviviente, indemnización sustitutiva (vejez, invalidez y sobrevivientes). Solicitud de certificado / ajuste pensión. Ordinaria de jubilación nacional, nacionalizado, territoriales cesantías: cesantías definitivas, cesantías definitivas por fallecimiento, cesantías parciales/ intereses de cesantías cancelación de prestaciones sociales y factores salariales que no tienen disponibilidad presupuestal	15	Laboral	t
199	VACANTES DEFINITIVAS	Renuncias, retiros, declaratoria de vacancia, perdida de capacidad laboral, destituciones, traslados, fallecimientos	15	Laboral	t
200	VACANTES TEMPORALES	Incapacidades, licencias, comisiones, suspensión, separación temporal del cargo. Reporte de remisiones medicas. Ausentismo	15	Laboral	t
201	HOJAS DE VIDA (DOCUMENTACIÓN / COPIAS)	Solicitud de documentos soportes de la hoja de vida (documentos / copias). Radicación de hoja de vida para solicitud de empleos. Recibo de documentos soportes para anexar a la hoja de vida	15	Laboral	t
202	CERTIFICADO DE ANTECEDENTES DISCIPLINARIOS	Solicitud de certificado de antecedentes disciplinarios	15	Laboral	t
203	CERTIFICADO LABORAL	Certificación que establece el cargo, tiempo de servicio desde su vinculación a la entidad y el salario devengado.	15	Laboral	t
252	CERTIFICACIÓN DE FUNCIONES	Solicitud de certificado	15	Laboral	t
204	CERTIFICACIÓN DE SALARIOS Y DEVENGADOS	Reconocimiento del 8%, 10%, 15%, 20% hasta el 40% para factor salarial	15	Laboral	t
205	CERTIFICADO TIEMPO DE SERVICIO	Certificación que establece el tiempo de servicio desde su vinculación a la entidad.	15	Laboral	t
206	CERTIFICADO DE FACTOR SALARIAL	Certificado para liquidación de prestaciones que incluye factor salarial	15	Laboral	t
207	CERTIFICACIÓN SALARIAL	Certificación que establece el salario devengado por el funcionario	15	Laboral	t
208	REPORTE DE CESANTÍAS	Duplicados de reporte de cesantías	15	Laboral	t
209	NOMINA	Reclamaciones relacionadas con la nomina.	15	Laboral	t
210	GESTIÓN USO E IMPLEMENTACIÓN DE LAS MTIC	Información relacionada con tecnología.	15	Laboral	t
211	SERVICIOS PÚBLICOS	Radicación de facturas y gestión para el pago de servicios públicos de los establecimientos públicos adscritos al municipio.	15	Laboral	t
212	INFRAESTRUCTURA FÍSICA Y VIVIENDA	Necesidades de construcción, reconstrucción, reparación, ampliación, mantenimiento y mejoramiento de bienes e inmuebles, proyectos, informes y estudios	15	Laboral	t
213	GESTIÓN DE INFORMACIÓN	Indicadores de la gestión de infraestructura física y vivienda	15	Laboral	t
214	RETIRO DE PROYECTOS DE VIVIENDA	Solicitud de retiro parcial y/o total del ahorro programado, o de proyecto.	15	Laboral	t
215	POBLACIÓN VULNERABLE	Población afectada por la violencia, discapacitados, reinsertados, afrodesendientes, madres cabeza de familias y población indígena.	10	Laboral	t
216	CONVOCATORIAS	Proyecto de mejoramiento de vivienda, construcción en sitio propio, vivienda nueva.	15	Laboral	t
217	SOLICITUD DE TITULACIÓN DE INMUEBLES FISCALES	Titulación de inmuebles fiscales ocupados por vivienda de interés social	15	Laboral	t
218	SOLICITUD DE LEVANTAMIENTO DE GRAVAMEN	Levantamiento de condiciones resolutorias, hipotecas, y patrimonio de familia y gravamen de valorización	60	Laboral	t
219	QUEJAS CONTRA SERVIDORES PÚBLICOS	Quejas presentadas contra servidores públicos. En algunos caso debe enviarse a control interno disciplinario de la alcaldía o la gobernación para lo cual debe especificarse en el sistema	30	Laboral	t
220	QUEJAS Y REGLAMOS POR OBRAS DE INFRAESTRUCTURA FÍSICA Y VIVIENDA	Inconformidad a la entrega de obras recibidas	15	Laboral	t
221	CERTIFICADO DE OBRAS	Certificación que establece vinculo laboral entre el contratista y el municipio, tiempo de servicio desde su vinculación a la institución y el valor del contrato.	15	Laboral	t
222	CERTIFICACIONES DE POSESIÓN DE PREDIOS	Certificación que acredita la posesión del bien inmueble.	15	Laboral	t
223	EVENTOS DE INFRAESTRUCTURA FÍSICA Y VIVIENDA	Inauguraciones, entrega de obras de infraestructura, entrega de viviendas.	15	Laboral	t
224	ESTADÍSTICAS	Solicitud de información estadística.	15	Laboral	t
225	ACTUACIONES URBANÍSTICAS	Solicitud de determinantes, aprobación planos para propiedad horizontal, reproducción de sellos, aprobación de planes parciales, inquietudes.	15	Laboral	t
226	ESTRATIFICACIÓN SOCIO ECONÓMICA	Solicitud de cambio de estrato o actualización de este.	45	Laboral	t
227	SOLICITUD DE ENCUESTA	Solicitud de encuesta nueva, cambio de domicilio, cambio de residencia o por inconformidad.	60	Calendario	t
228	ACTUALIZACIONES E INCLUSIONES SISBEN	Solicitudes de modificación, actualización, inclusión del sisben	195	Calendario	t
229	SEGUIMIENTO A PROYECTOS DE INVERSIÓN Y TRANSFERENCIA POR ASIGNACIÓN DIRECTA	Informes, registros fotográficos, actas de satisfacción y de liquidación	180	Calendario	t
230	CERTIFICADOS DEL CONSEJO MUNICIPAL DE LA GESTION DEL RIESGO.	Solicitud del consejo municipal de la gestion del riesgo.	15	Laboral	t
231	CERTIFICADO DE USOS DEL SUELO Y ZONAS DE RIESGO	Solicitud de certificado de usos del suelo y zonas de riesgo	8	Laboral	t
232	CERTIFICADO DE ESTRATIFICACIÓN Y SISBEN	Solicitud de certificado de estratificación, retiros sisben y no sisben	8	Laboral	t
233	SOLICITUD DE LICENCIAS URBANÍSTICAS	Solicitud de licencias urbanísticas	8	Laboral	t
234	COMUNIDADES INDÍGENAS	Solicitudes de comunidades indígenas, censos.	45	Laboral	t
235	PROYECTOS	Solicitud de radicación de proyectos la banco de proyectos	15	Laboral	t
236	TRAMITE DE PAGOS DE SENTENCIAS JUDICIALES	Certificaciones y liquidación de pagos de sentencias judiciales	10	Laboral	t
239	DEMANDAS CONTENCIOSO ADMINISTRATIVO	Acciones de nulidad y restablecimiento del derecho, acciones de reparación directa, acciones de simple nulidad y ejecutivos	5	Laboral	t
240	DEMANDA CONSTITUCIONALES	Acciones de cumplimiento, acciones de grupo, acciones de tutelas y acciones populares	5	Laboral	t
241	COMUNICACIONES MINISTERIOS	Solicitudes o envío de documentos por parte de los ministerios. Solicitudes se encuentra indicadores de gestión	5	Laboral	t
243	SEGUIMIENTO A PROYECTOS DE INVERSIÓN	Informes, registros fotográficos, actas de satisfacción y liquidación	5	Laboral	t
244	FOTOCOPIA DE DOCUMENTOS	Solicitud de copias de documentos	15	Laboral	t
245	TALA O PODA DE ARBOLES URBANOS	Solicitud de tala o poda de arboles urbanos	15	Laboral	t
246	DONACIONES	Recibo de donaciones por parte de entidades	15	Laboral	t
247	COTIZACIONES	Recibo de cotizaciones de proveedores	15	Laboral	t
248	SISTEMAS INTEGRADOS DE GESTIÓN	Todos los requerimientos relacionado con el sistema integrado de gestión de la entidad territorial	15	Laboral	t
249	SOLICITUD DE ASISTENCIA TÉCNICA RURAL Y EXTENSIÓN	Solicitud de realización de asistencia técnica rural.	15	Laboral	t
250	INFORMES DE INSPECCIÓN Y VIGILANCIA	Solicitud de informes de resultados de las inspecciones realizadas	15	Laboral	t
251	BIENESTAR	Estímulos, recreación, inducción	15	Laboral	t
253	INFORMES COMUNIDADES INDÍGENAS	Informes relacionados con comunidades indígenas	15	Laboral	t
254	VINCULACIONES	Solicitud de vinculación de funcionarios	15	Laboral	t
255	NORMATIVIDAD	Normas nacional, departamental, municipal y distrital: leyes, resoluciones, decretos orden	30	Laboral	t
256	COMUNICACIONES ENTE TERRITORIAL	Solicitudes o envío de documentos por parte del ente territorial (alcaldía, gobernación, dependencias del ente territorial: secretarías de hacienda, secretarias de salud, etc.). Dentro las solicitudes se encuentra indicadores de gestión	15	Laboral	t
257	PROPUESTAS O PAUTAS PUBLICITARIAS	Información para publicar	10	Laboral	t
258	SOLICITUD DE CAMPAÑAS DE IEC, PYP O VYC	Solicitud de campañas educativas, de información o comunicación, así como las de promoción de la salud y prevención de la enfermedad, acciones colectivas o de ivyc	15	Laboral	t
259	SOLICITUDES DE VIGILANCIA Y CONTROL A FACTORES DE RIESGO	Solicitud de vigilancia a eventos de riesgo al consumo, el ambiento o la zoonosis	15	Laboral	t
260	VIGILANCIA EPIDEMIOLÓGICA O ACCIONES DE CONTROL	Solicitud de vigilancia a eventos de salud pública o acciones de control	15	Laboral	t
261	ASESORÍA Y ASISTENCIA EN PROGRAMAS OFERTADOS	Solicitud de asesoría y asistencia en programas y/o servicios ofertados por la dependencia, en cumplimiento de los requisitos para tal fin.	15	Laboral	t
262	SOLICITUDES DE ASESORÍA Y ASISTENCIA	Solicitud de asesoría y asistencia en programas y/o servicios ofertados por la dependencia, en cumplimiento de los requisitos para tal fin.	15	Laboral	t
263	SOLICITUDES DE APOYO SOCIAL	Solicitud de apoyo social en programas y/o servicios ofertados por la dependencia, en cumplimiento de los requisitos para tal fin.	15	Laboral	t
264	IMPRESOS E INFORMACIÓN	Solicitud de impresos elaborados por la dependencia ya sean estadísticos, de promoción de la salud, prevención de la enfermedad, salud pública, aseguramiento, programas sociales, emergencias y desastres en salud	15	Laboral	t
265	INFORMACIÓN Y ESTADÍSTICAS EN SALUD	Información sobre estadísticas de salud o promoción social, comportamientos epidemiológicos, entre otros	15	Laboral	t
266	RETIRO DE VEHÍCULOS	Solicitud de retiro de vehículos.	15	Laboral	t
267	CAPACITACIONES	Solicitud de capacitación en seguridad vial.	5	Laboral	t
268	CIERRE DE VÍA	Solicitud de cierre de vías	15	Laboral	t
269	RECURSO DE APELACIÓN	Recurso procesal por el que unas actuaciones judiciales se remiten a un órgano superior con la posibilidad de practicar nuevas pruebas para que revoque la resolución dictada por otro inferior	5	Laboral	t
270	RECURSO DE REPOSICIÓN	Recurso judicial que se interpone para que una resolución dictada sea modificada o se dejen sin efecto. Recurso de reposición frente a un acto administrativo, una decisión administrativa o sanción.	60	Calendario	t
271	CONCEPTOS JURÍDICOS	Solicitud de conceptos jurídicos relacionados con el sector de transito	60	Calendario	t
272	EMBARGOS JUDICIALES	Solicitud de información, fallo, terminación de procesos, modificación al fallo, certificado de embargos	15	Laboral	t
273	CONTRATACIÓN	Contratación, proceso en el cual se pacta la prestación del servicio, interventorias de contratos (seguimiento y supervisión de contratos, notificaciones, actas de interventoria, informes de interventoria, planos e inventarios). Solicitud de ampliación de contratos de personal. Información relacionada con contratos. Documentación para tramite de pago (contratistas, proveedores, etc.). Convenios	15	Laboral	t
274	DOCUMENTOS DE APOYO	Radicación de guías, cartillas, revistas, periódicos, boletines	15	Laboral	t
275	DIRECTRICES ORDEN NACIONAL Y/O DEPARTAMENTAL	Directivas, circulares, memorando	15	Laboral	t
276	COMUNICACIONES ENTIDADES PRIVADAS	Solicitudes o solicitudes de información por parte de otras entidades privadas. Dentro de solicitudes se encuentra indicadores de gestión	15	Laboral	t
277	COMUNICACIONES ENTES NACIONALES (ORGANISMOS ESTATALES)	Requerimientos o solicitudes de información por ministerios diferente al de educación, icfes, icetex, sena, dian, conpes. Dentro de solicitudes se encuentra indicadores de gestión.	15	Laboral	t
278	COMUNICACIONES ORGANISMOS JUDICIALES	Requerimientos o solicitudes de información por parte de fiscalía, tribunales y entes judiciales, concejos nacionales, corte suprema. Dentro de solicitudes se encuentra indicadores de gestión	10	Laboral	t
279	COMUNICACIONES ENTES DE CONTROL	Requerimientos o solicitudes de información realizadas por los entes de control. Ej. Procuraduría, contraloría, defensoría del pueblo, personería municipales. Dentro de solicitudes se encuentra indicadores de gestión	10	Laboral	t
280	EVIDENCIAS GRAFICAS O INFOGRAFICAS	Videos, fotos, periódicos, revistas	10	Laboral	t
281	AUDIENCIAS O CITAS PROGRAMADAS	Solicitud audiencias o citas con el alcalde, los secretarios, gerente o jefes de oficina. Estas se programaran de acuerdo a agenda	15	Laboral	t
282	CAMPAÑAS	Campañas pedagogas, culturales, publicitarias e informativas	5	Laboral	t
283	FELICITACIONES	Felicitaciones emitidas por los ciudadanos.	15	Laboral	t
284	INVITACIONES	Todas las invitaciones realizadas. Ej. Eventos, foros, capacitaciones, tarjetas, seminarios, etc.	5	Laboral	t
\.


--
-- Data for Name: sgd_ejes_tematicos_dependencia; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_ejes_tematicos_dependencia (id_sgd_eje_tematico_dependencia, id_sgd_eje_tematico, depe_codi, estado_eje_tematico) FROM stdin;
\.


--
-- Data for Name: sgd_empus_empusuario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_empus_empusuario (usua_login, identificador_empresa) FROM stdin;
\.


--
-- Data for Name: sgd_ent_entidades; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_ent_entidades (sgd_ent_nit, sgd_ent_codsuc, sgd_ent_pias, dpto_codi, muni_codi, sgd_ent_descrip, sgd_ent_direccion, sgd_ent_telefono) FROM stdin;
\.


--
-- Data for Name: sgd_enve_envioespecial; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_enve_envioespecial (sgd_fenv_codigo, sgd_enve_valorl, sgd_enve_valorn, sgd_enve_desc) FROM stdin;
\.


--
-- Data for Name: sgd_estc_estconsolid; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_estc_estconsolid (sgd_estc_codigo, sgd_tpr_codigo, dep_nombre, depe_codi, sgd_estc_ctotal, sgd_estc_centramite, sgd_estc_csinriesgo, sgd_estc_criesgomedio, sgd_estc_criesgoalto, sgd_estc_ctramitados, sgd_estc_centermino, sgd_estc_cfueratermino, sgd_estc_fechgen, sgd_estc_fechini, sgd_estc_fechfin, sgd_estc_fechiniresp, sgd_estc_fechfinresp, sgd_estc_dsinriesgo, sgd_estc_driesgomegio, sgd_estc_driesgoalto, sgd_estc_dtermino, sgd_estc_grupgenerado) FROM stdin;
\.


--
-- Data for Name: sgd_estinst_estadoinstancia; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_estinst_estadoinstancia (sgd_estinst_codi, sgd_apli_codi, sgd_instorf_codi, sgd_estinst_valor, sgd_estinst_habilita, sgd_estinst_mensaje) FROM stdin;
\.


--
-- Data for Name: sgd_exp_expediente; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_exp_expediente (sgd_exp_numero, radi_nume_radi, sgd_exp_fech, sgd_exp_fech_mod, depe_codi, usua_codi, usua_doc, sgd_exp_estado, sgd_exp_titulo, sgd_exp_asunto, sgd_exp_carpeta, sgd_exp_ufisica, sgd_exp_isla, sgd_exp_estante, sgd_exp_caja, sgd_exp_fech_arch, sgd_srd_codigo, sgd_sbrd_codigo, sgd_fexp_codigo, sgd_exp_subexpediente, sgd_exp_archivo, sgd_exp_unicon, sgd_exp_fechfin, sgd_exp_folios, sgd_exp_rete, sgd_exp_entrepa, radi_usua_arch, sgd_exp_edificio, sgd_exp_caja_bodega, sgd_exp_carro, sgd_exp_carpeta_bodega, sgd_exp_privado, sgd_exp_cd, sgd_exp_nref, sgd_sexp_paraexp1, id_expediente) FROM stdin;
20219981110000002E	20219980000021	2021-02-23	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
20219981110000002E	20219980000041	2021-02-23	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
20219981110000002E	20219980000022	2021-02-23	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3
20219981110000002E	20219980000061	2021-02-23	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
20219981110000002E	20219980000012	2021-02-23	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
20219981110000002E	20219980000071	2021-02-23	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6
20219981120000003E	20219980000052	2021-03-31	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7
20219981120000003E	20219980000121	2021-03-31	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8
20219981120000003E	20219980000131	2021-03-31	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
20219981120000004E	20219980000082	2021-04-13	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
20219981120000003E	20219980000201	2021-04-13	\N	998	1	1234567890	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14
20219981120000003E	20219980000092	2021-04-15	\N	998	1	1234567890	1			1	3	2	5	5	2021-04-15	\N	\N	\N	0	1	1	2022-04-15	0	0	0	ADMON	1	\N	4	\N	\N	\N	\N	\N	10
20219981120000003E	20219980000102	2021-04-15	\N	998	1	1234567890	1			1	3	2	5	5	2021-04-15	\N	\N	\N	0	1	1	2022-04-15	0	0	0	ADMON	1	\N	4	\N	\N	\N	\N	\N	12
20219981120000003E	20219980000191	2021-04-15	\N	998	1	1234567890	1			2	3	2	5	5	2021-04-15	\N	\N	\N	0	1	1	2022-04-15	0	0	0	ADMON	1	\N	4	\N	\N	\N	\N	\N	13
\.


--
-- Data for Name: sgd_fars_faristas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_fars_faristas (sgd_fars_codigo, sgd_pexp_codigo, sgd_fexp_codigoini, sgd_fexp_codigofin, sgd_fars_diasminimo, sgd_fars_diasmaximo, sgd_fars_desc, sgd_trad_codigo, sgd_srd_codigo, sgd_sbrd_codigo, sgd_fars_tipificacion, sgd_tpr_codigo, sgd_fars_automatico, sgd_fars_rolgeneral) FROM stdin;
\.


--
-- Data for Name: sgd_fenv_frmenvio; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_fenv_frmenvio (sgd_fenv_codigo, sgd_fenv_descrip, sgd_fenv_planilla, sgd_fenv_estado) FROM stdin;
1	MENSAJERO PERSONAL	1	1
\.


--
-- Data for Name: sgd_fexp_flujoexpedientes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_fexp_flujoexpedientes (sgd_fexp_codigo, sgd_pexp_codigo, sgd_fexp_orden, sgd_fexp_terminos, sgd_fexp_imagen, sgd_fexp_descrip) FROM stdin;
0	0	0	0		
\.


--
-- Data for Name: sgd_firmas_qr; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_firmas_qr (radi_nume_radi, usua_login, usua_nomb, usua_doc, depe_codi, firma_fecha, permiso_firma, usua_codi) FROM stdin;
20219980000031	ADMON	Usuario de Soporte	1234567890	998	2021-02-23 14:58:52.691107	1	1
20219980000021	ADMON	Usuario de Soporte	1234567890	998	2021-02-23 14:59:19.258168	1	1
20219980000041	ADMON	Usuario de Soporte	1234567890	998	2021-02-23 16:43:25.594178	1	1
20219980000061	ADMON	Usuario de Soporte	1234567890	998	2021-02-23 17:41:56.152507	1	1
20219980000121	ADMON	Usuario de Soporte	1234567890	998	2021-03-31 10:48:52.169581	1	1
20219980000181	ADMON	Usuario de Soporte	1234567890	998	2021-04-13 17:00:23.686539	1	1
\.


--
-- Data for Name: sgd_firrad_firmarads; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_firrad_firmarads (sgd_firrad_id, radi_nume_radi, usua_doc, sgd_firrad_firma, sgd_firrad_fecha, sgd_firrad_docsolic, sgd_firrad_fechsolic, sgd_firrad_pk) FROM stdin;
\.


--
-- Data for Name: sgd_fld_flujodoc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_fld_flujodoc (sgd_fld_codigo, sgd_fld_desc, sgd_tpr_codigo, sgd_fld_imagen, sgd_fld_grupoweb) FROM stdin;
\.


--
-- Data for Name: sgd_fun_funciones; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_fun_funciones (sgd_fun_codigo, sgd_fun_descrip, sgd_fun_fech_ini, sgd_fun_fech_fin) FROM stdin;
\.


--
-- Data for Name: sgd_hfld_histflujodoc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_hfld_histflujodoc (sgd_hfld_codigo, sgd_fexp_codigo, sgd_exp_fechflujoant, sgd_hfld_fech, sgd_exp_numero, radi_nume_radi, usua_doc, usua_codi, depe_codi, sgd_ttr_codigo, sgd_fexp_observa, sgd_hfld_observa, sgd_fars_codigo, sgd_hfld_automatico) FROM stdin;
\N	0	\N	2020-11-17 09:58:21.790507	00001	20201510000652	1082846888	4	151	62	\N	Incluir radicado en Expediente 00001	\N	\N
\N	0	\N	2020-11-27 14:19:03.109189	20209981100000001E	20209980000011	1234567890	1	998	51	\N	TRD COMUNICACIONES/Comunicaciones Oficiales (Creación de Expediente.)	\N	\N
\N	0	\N	2020-11-27 14:25:50.365649	20209981100000001E	20209980000021	1234567890	1	998	53	\N	Se ingresa al expediente del radicado padre (20209980000011)	\N	\N
\N	0	\N	2020-12-03 16:23:23.14673	20209981100000001E	20209980000014	1234567890	1	998	62	\N	Incluir radicado en Expediente 20209981100000001E	\N	\N
\N	0	\N	2020-12-04 11:58:46.556356	20209981100000001E	20209980000034	1234567890	1	998	62	\N	Incluir radicado en Expediente 20209981100000001E	\N	\N
\N	0	\N	2020-12-04 12:02:28.622612	20209981100000001E	20209980000024	1234567890	1	998	62	\N	Incluir radicado en Expediente 20209981100000001E	\N	\N
\N	0	\N	2020-12-10 16:52:33.287913	202009981120000001E	202009980000011	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-10 16:58:53.507617	202009981120000001E	202009980000012	1022982736	2	0998	62	\N	Incluir radicado en Expediente 202009981120000001E	\N	\N
\N	0	\N	2020-12-10 17:24:42.071457	202009981120000001E	202009980000034	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202009981120000001E	\N	\N
\N	0	\N	2020-12-16 10:15:28.693625	202009981120000001E	202009980000074	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202009981120000001E	\N	\N
\N	0	\N	2020-12-17 15:19:27.539694	202009981110000002E	202009980000032	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Envidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-17 15:20:28.47353	202009981120000002E	202009980000032	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-17 15:24:01.47623	202009981110000002E	202009980000032	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Envidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-17 15:30:50.961043	202009981120000001E	202009980000032	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202009981120000001E	\N	\N
\N	0	\N	2020-12-18 08:58:48.529239	202009981120000002E	202009980000042	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-18 08:59:15.979001	202009981120000002E	202009980000042	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-18 09:03:52.826048	202009981120000001E	202009980000042	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202009981120000001E	\N	\N
\N	0	\N	2020-12-18 09:06:21.003176	202009981120000001E	202009980000022	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202009981120000001E	\N	\N
\N	0	\N	2020-12-21 10:03:49.547746	202009981110000002E	202009980000084	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Envidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-21 11:06:22.770511	202009981120000001E	202009980000013	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202009981120000001E	\N	\N
\N	0	\N	2020-12-21 11:32:08.62809	202009981120000001E	202009980000154	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202009981120000001E	\N	\N
\N	0	\N	2020-12-22 09:27:02.956652	202009981110000002E	202009980000061	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Envidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-22 09:53:38.087379	202009981110000002E	202009980000061	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Envidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-22 09:58:49.389563	202009981110000002E	202009980000061	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Envidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-22 10:03:10.882133	202009981120000002E	202009980000061	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-22 10:23:53.563245	202009981110000002E	202009980000061	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Envidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-22 10:26:03.479632	202009981120000003E	202009980000184	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-23 07:55:31.251644	202009981120000004E	202009980000444	1234567890	1	0998	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2020-12-23 08:57:20.924583	202009981120000004E	202009980000462	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202009981120000004E	\N	\N
\N	0	\N	2020-12-28 10:02:55.999108	202009981120000004E	202009980000151	1234567890	1	0998	53	\N	Se ingresa al expediente del radicado padre (202009980000444)	\N	\N
\N	0	\N	2021-01-14 10:25:16.913518	202110301110000001E	202110300000111	81745108	1	1030	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones Oficiales Envidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-14 10:30:30.104265	202110301610000002E	202110000000194	52779966	4	1030	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-15 08:50:52.513804	202110601610000003E	202110210000204	20994882	5	1060	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-18 08:35:23.840197	202110301610000002E	202110210000584	20995001	2	1031	62	\N	Incluir radicado en Expediente 202110301610000002E	\N	\N
\N	1	\N	2021-01-18 08:37:08.922078	202110301610000002E	202110210000584	20995001	2	1031	58	\N	Se Cerro el Expediente  	\N	\N
\N	0	\N	2021-01-19 12:31:08.937707	202110501960000004E	202110210000032	80538280	1	1050	51	\N	TRD INFORMES/Informes de Gestión Institucional (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 08:29:14.687375	202110001110000005E	202110210000614	52153547	1	1000	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 08:53:53.299782	202110501960000004E	202110210002822	80538280	1	1050	62	\N	Incluir radicado en Expediente 202110501960000004E	\N	\N
\N	0	\N	2021-01-20 10:19:32.586021	202110601120000006E	202110210001462	1078366668	1	1060	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 10:27:00.14223	202110602310000007E	202110210000072	20994882	5	1060	51	\N	TRD LICENCIAS/Licencias de Construcción en Modalidades de Obra Nueva, Ampliación, Adecuación, Reconocimiento, Modificación, Urbanismo, Restauración, Reforzamiento Estructural, Demolición, Revalidación Reconstrucción, (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 10:35:48.117845	202110602310000007E	202110210002174	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-20 10:38:25.346421	202110601610000003E	202110210002174	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 10:40:21.276129	202110602310000007E	202110210002524	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-20 10:42:17.853318	202110602310000007E	202110210002504	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-20 10:43:28.554257	202110602310000007E	202110210001214	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-20 10:44:19.612115	202110601610000003E	202110210001124	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 10:44:51.317143	202110601610000003E	202110210000444	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 10:47:27.528967	202110601610000003E	202110210001114	79653907	6	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 10:48:35.745947	202110601610000003E	202110210000014	79653907	6	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 10:51:31.520063	202110601610000003E	202110210000042	79653907	6	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 11:26:56.067473	202110801610000008E	202110210000384	6761082	1	1080	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 13:59:00.066527	202110601610000003E	202110210000054	23857813	2	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 15:00:28.986262	202110601610000003E	202110210001154	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 15:20:18.362389	202110601610000003E	202110210001354	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-20 16:14:07.521561	202110322720000009E	202110210002082	1070952561	6	1032	51	\N	TRD PROCESOS/Procesos de Reconocimiento Voluntario de Paternidad (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 16:16:59.080607	202110322720000009E	202110210000092	1070952561	6	1032	62	\N	Incluir radicado en Expediente 202110322720000009E	\N	\N
\N	0	\N	2021-01-20 16:23:52.340614	202110801610000010E	202110210001342	6761082	1	1080	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 16:43:04.105132	202110305100000011E	202110210001784	81745108	1	1030	51	\N	TRD CERTIFICACIONES/Certificaciones de residencia (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 16:44:12.938294	202110305100000011E	202110210001774	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110305100000011E	\N	\N
\N	0	\N	2021-01-20 16:56:09.397226	202110321610000012E	202110210000874	1070952561	6	1032	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 17:14:50.904654	202110311610000013E	202110210000584	20995001	2	1031	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-20 17:18:42.503233	202110311610000013E	202110210000594	20995001	2	1031	62	\N	Incluir radicado en Expediente 202110311610000013E	\N	\N
\N	1	\N	2021-01-21 07:06:16.89901	202110601120000006E	202110210001462	1078366668	1	1060	58	\N	Se Cerro el Expediente  	\N	\N
\N	0	\N	2021-01-21 07:44:46.219772	202110602310000007E	202110210000652	23857813	2	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-21 07:45:36.798021	202110602310000007E	202110210000642	23857813	2	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-21 08:14:17.837933	202110602310000007E	202110210003172	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-21 09:06:21.715327	202110801110000014E	202110800000701	6761082	1	1080	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-21 09:12:57.016809	202110801110000014E	202110210001442	6761082	1	1080	62	\N	Incluir radicado en Expediente 202110801110000014E	\N	\N
\N	0	\N	2021-01-21 10:40:43.129103	202110311610000013E	202110210000914	20995001	2	1031	62	\N	Incluir radicado en Expediente 202110311610000013E	\N	\N
\N	0	\N	2021-01-21 11:01:57.084002	202110321120000015E	202110210000152	1070952561	6	1032	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-21 11:12:32.418731	202110801110000014E	202110800000731	6761082	1	1080	62	\N	Incluir radicado en Expediente 202110801110000014E	\N	\N
\N	0	\N	2021-01-21 11:15:15.585734	202110801110000016E	202110210001202	6761082	1	1080	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	1	\N	2021-01-21 11:15:38.559843	202110801110000016E	202110210001202	6761082	1	1080	58	\N	Se Cerro el Expediente  	\N	\N
\N	0	\N	2021-01-21 12:14:13.486272	202110305100000011E	202110210002952	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110305100000011E	\N	\N
\N	0	\N	2021-01-21 12:14:39.849988	202110305100000011E	202110210002962	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110305100000011E	\N	\N
\N	0	\N	2021-01-21 12:14:57.797402	202110305100000011E	202110210002932	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110305100000011E	\N	\N
\N	0	\N	2021-01-21 12:15:20.561356	202110305100000011E	202110210002622	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110305100000011E	\N	\N
\N	0	\N	2021-01-21 12:15:53.739393	202110305100000011E	202110210002592	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110305100000011E	\N	\N
\N	0	\N	2021-01-21 12:19:19.714011	202110301910000017E	202110210001682	81745108	1	1030	51	\N	TRD INFORMES/Informes a Entes de Control y vigilancia (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-21 14:01:32.393184	202110601610000003E	202110210003362	1078366668	1	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-21 14:48:54.115982	202110311610000013E	202110210001104	20995001	2	1031	62	\N	Incluir radicado en Expediente 202110311610000013E	\N	\N
\N	1	\N	2021-01-21 14:49:38.192718	202110311610000013E	202110210001104	20995001	2	1031	58	\N	Se Cerro el Expediente  	\N	\N
\N	0	\N	2021-01-21 16:08:19.552278	202110601610000003E	202110210000684	80409393	4	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-21 16:26:54.99616	202110605110000018E	202110210000742	80409393	4	1060	51	\N	TRD CERTIFICACIONES/Certificaciones de viabiidad del Uso del Suelo (Creación de Expediente.)	\N	\N
\N	1	\N	2021-01-21 16:28:30.275608	202110605110000018E	202110210000742	80409393	4	1060	58	\N	Se Cerro el Expediente  	\N	\N
\N	0	\N	2021-01-21 16:50:06.603735	202110601610000003E	202110210003144	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-21 16:59:26.008331	202110605110000019E	202110210000424	80409393	4	1060	51	\N	TRD CERTIFICACIONES/Certificaciones de viabiidad del Uso del Suelo (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-22 07:57:07.088044	202110301110000001E	202110300000043	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110301110000001E	\N	\N
\N	0	\N	2021-01-22 08:09:23.465582	202110302360000020E	202110300000431	80852213	3	1030	51	\N	TRD ACTAS/Actas de comité de Transporte (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-22 08:22:29.507147	202110302360000020E	202110300000821	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110302360000020E	\N	\N
\N	0	\N	2021-01-22 08:31:32.120784	202110302360000020E	202110300000851	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110302360000020E	\N	\N
\N	0	\N	2021-01-22 08:32:47.972999	202110302360000020E	202110210001802	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110302360000020E	\N	\N
\N	0	\N	2021-01-22 08:33:14.243232	202110302360000020E	202110210000562	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110302360000020E	\N	\N
\N	0	\N	2021-01-22 08:33:39.121599	202110302360000020E	202110210000432	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110302360000020E	\N	\N
\N	0	\N	2021-01-22 08:37:18.313402	202110302360000020E	202110210003344	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110302360000020E	\N	\N
\N	0	\N	2021-01-22 09:53:40.691708	202110305100000011E	202110210002092	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110305100000011E	\N	\N
\N	0	\N	2021-01-22 13:12:03.846996	202110201120000021E	202110210000282	1078370117	12	1020	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-22 13:14:39.043793	202110801110000022E	202110800000991	6761082	1	1080	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-22 13:15:34.551941	202110201120000021E	202110200000371	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201120000021E	\N	\N
\N	0	\N	2021-01-23 12:45:20.736673	202110701120000023E	202110210001722	1075651906	3	1070	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-25 08:33:03.806938	202110602310000007E	202110210003834	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-25 09:26:24.574582	202110601610000003E	202110210000294	1052396800	3	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-25 09:28:12.988701	202110601610000003E	202110210000304	1052396800	3	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-25 12:57:41.414571	202110201610000024E	202110210000184	20994213	1	1020	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-25 14:20:04.62584	202110302360000020E	202110210002702	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110302360000020E	\N	\N
\N	0	\N	2021-01-25 15:25:33.483221	202110101110000025E	202110100001001	1073502330	5	1010	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-26 08:27:52.376811	202110322710000026E	202110210000962	53139563	2	1032	51	\N	TRD PROCESOS/Procesos Administrativos de Restablecimiento de Derechos (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-26 09:57:52.799008	202110201120000027E	202110210000342	1078370117	12	1020	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-26 09:58:12.507612	202110201120000027E	202110210001732	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201120000027E	\N	\N
\N	0	\N	2021-01-26 09:58:29.36366	202110201120000027E	202110210002012	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201120000027E	\N	\N
\N	0	\N	2021-01-26 09:58:45.587621	202110201120000027E	202110210003802	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201120000027E	\N	\N
\N	0	\N	2021-01-26 10:50:28.756294	202110601610000003E	202110210003752	23857813	2	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-26 11:46:57.236127	202110301120000028E	202110210001712	81745108	1	1030	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-26 12:21:51.368155	202110301110000001E	202110300001371	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301110000001E	\N	\N
\N	0	\N	2021-01-26 12:23:21.993031	202110301110000001E	202110210003842	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110301110000001E	\N	\N
\N	0	\N	2021-01-26 12:47:45.125066	202110311120000029E	202110210002782	20995001	2	1031	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	1	\N	2021-01-26 13:09:49.808642	202110301610000002E	202110000000194	52779966	4	1030	59	\N	Se Reabrio el Expediente  	\N	\N
\N	0	\N	2021-01-26 13:10:41.232301	202110301610000002E	202110210001314	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110301610000002E	\N	\N
\N	0	\N	2021-01-26 13:12:04.901583	202110301110000001E	202110210001252	52779966	4	1030	62	\N	Incluir radicado en Expediente 202110301110000001E	\N	\N
\N	0	\N	2021-01-26 13:12:29.103592	202110301610000002E	202110210001182	52779966	4	1030	62	\N	Incluir radicado en Expediente 202110301610000002E	\N	\N
\N	0	\N	2021-01-26 14:45:47.889632	202110301120000028E	202110200000053	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110301120000028E	\N	\N
\N	0	\N	2021-01-26 14:48:35.807981	202110301120000030E	202110200000053	81745108	1	1030	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-26 14:48:35.907816	202110301120000031E	202110200000053	81745108	1	1030	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	1	\N	2021-01-26 14:52:26.232615	20211030112000028E	202110200000053	81745108	1	1030	58	\N	Se Cerro el Expediente  	\N	\N
\N	0	\N	2021-01-26 15:15:48.979386	202110201120000032E	202110100000103	20994213	1	1020	51	\N	TRD CONSECUTIVOS DE COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-26 16:22:25.285407	202110601610000003E	202110210004504	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-26 16:50:08.062496	202110201610000024E	202110200001441	20994213	1	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-01-27 08:54:34.294812	202110601610000003E	202110210004294	1052396800	3	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-27 08:55:54.547202	202110601610000003E	202110210004284	1052396800	3	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-27 08:56:48.5529	202110601610000003E	202110210004274	1052396800	3	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-27 12:02:57.597912	202110602310000007E	202110210003934	1052396800	3	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-27 12:04:29.158619	202110602310000007E	202110210003924	1052396800	3	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-27 12:42:27.19898	202110601610000003E	202110210004494	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-27 12:59:35.289037	202110201610000024E	202110210003824	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	1	\N	2021-01-27 14:51:00.677318	202110605110000019E	202110210000424	80409393	4	1060	58	\N	Se Cerro el Expediente  	\N	\N
\N	1	\N	2021-01-27 14:51:07.087913	202110605110000019E	202110210000424	80409393	4	1060	59	\N	Se Reabrio el Expediente  	\N	\N
\N	1	\N	2021-01-27 14:51:38.888171	202110605110000019E	202110210000424	80409393	4	1060	59	\N	Se Reabrio el Expediente  	\N	\N
\N	1	\N	2021-01-27 14:53:15.951309	202110305100000011E	202110210002932	80409393	4	1060	58	\N	Se Cerro el Expediente  	\N	\N
\N	1	\N	2021-01-27 14:53:20.145099	202110305100000011E	202110210002932	80409393	4	1060	59	\N	Se Reabrio el Expediente  	\N	\N
\N	1	\N	2021-01-27 15:12:35.218119	202110605110000018E	202110210000742	1078371056	7	1060	59	\N	Se Reabrio el Expediente  	\N	\N
\N	0	\N	2021-01-27 15:13:14.459433	202110605110000018E	202110210004482	1078371056	7	1060	62	\N	Incluir radicado en Expediente 202110605110000018E	\N	\N
\N	0	\N	2021-01-27 15:22:49.406935	202110501960000033E	202110210003892	80538280	1	1050	51	\N	TRD INFORMES/Informes de Gestión Institucional (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-27 16:59:48.358939	202110201610000024E	202110210003964	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-01-28 08:36:34.192713	202110301610000002E	202110210002654	80852213	3	1030	62	\N	Incluir radicado en Expediente 202110301610000002E	\N	\N
\N	0	\N	2021-01-28 10:14:32.826339	202110401110000034E	202110210004412	55221190	1	1040	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-28 10:15:15.206641	202110401110000034E	202110210003952	55221190	1	1040	62	\N	Incluir radicado en Expediente 202110401110000034E	\N	\N
\N	0	\N	2021-01-28 10:47:12.45793	202110601610000003E	202110210004844	20994882	5	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-28 11:19:27.216793	202110602310000007E	202110210002574	79653907	6	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-28 12:04:10.951057	202110602310000007E	202110210003044	79653907	6	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-28 12:18:10.378895	202110301610000002E	202110210002184	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301610000002E	\N	\N
\N	0	\N	2021-01-28 12:18:38.907595	202110301610000002E	202110210003264	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301610000002E	\N	\N
\N	0	\N	2021-01-28 12:18:54.62977	202110301610000002E	202110210003614	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301610000002E	\N	\N
\N	0	\N	2021-01-28 14:06:16.456172	202110601610000003E	202110210002882	1078371056	7	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-28 14:08:22.625092	202110601610000003E	202110210002724	1078371056	7	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-28 14:09:43.452541	202110601610000003E	202110210001074	1078371056	7	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-28 14:11:14.409301	202110601610000003E	202110210001994	1078371056	7	1060	62	\N	Incluir radicado en Expediente 202110601610000003E	\N	\N
\N	0	\N	2021-01-28 15:50:57.164572	202110602310000007E	202110210004012	23857813	2	1060	62	\N	Incluir radicado en Expediente 202110602310000007E	\N	\N
\N	0	\N	2021-01-28 16:40:24.565228	202110201610000024E	202110200001821	20994213	1	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-01-28 16:57:40.093234	202110301120000030E	202110210000172	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110301120000030E	\N	\N
\N	0	\N	2021-01-28 16:59:10.842458	202110301120000028E	202110210000172	81745108	1	1030	62	\N	Incluir radicado en Expediente 202110301120000028E	\N	\N
\N	0	\N	2021-01-29 07:47:48.152271	202109981110000035E	202109980000013	1234567890	1	0998	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-29 09:37:06.700866	202110801610000036E	202110210003904	6761082	1	1080	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-01-29 11:19:38.132337	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:20:18.353123	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:22:11.336514	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:26:20.482397	202110301910000017E	202110210003272	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301910000017E	\N	\N
\N	0	\N	2021-01-29 11:28:26.159139	202110301610000002E	202110210003272	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301610000002E	\N	\N
\N	0	\N	2021-01-29 11:28:32.031606	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:29:27.419247	202110701120000023E	202110210000662	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:36:36.641144	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:37:15.933212	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:44:09.046027	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:47:11.774	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	1	\N	2021-01-29 11:49:28.825193	202110701120000023E	202110210001722	20994603	1	1070	56	\N	Se modifico el responsable  	\N	\N
\N	1	\N	2021-01-29 11:49:47.453857	202110701120000023E	202110210001722	20994603	1	1070	58	\N	Se Cerro el Expediente  	\N	\N
\N	1	\N	2021-01-29 11:49:59.339129	202110701120000023E	202110210001722	20994603	1	1070	59	\N	Se Reabrio el Expediente  	\N	\N
\N	0	\N	2021-01-29 11:50:42.877059	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:51:43.246109	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:54:19.320687	202110701120000023E	202110700001301	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 11:58:11.007987	202110701120000023E	202110210003212	1075651906	3	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 12:04:30.83791	202110301110000001E	202110210003272	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301110000001E	\N	\N
\N	0	\N	2021-01-29 12:05:25.954685	202110301110000001E	202110210003272	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301110000001E	\N	\N
\N	0	\N	2021-01-29 12:06:30.096654	202110301110000001E	202110210003272	1078371179	5	1030	62	\N	Incluir radicado en Expediente 202110301110000001E	\N	\N
\N	0	\N	2021-01-29 12:25:28.51446	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 12:26:15.609468	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 12:30:39.168828	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 12:33:54.837226	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 12:35:23.874018	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 12:38:59.982664	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 12:44:53.741257	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 13:00:56.83738	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 13:03:29.741794	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 13:12:32.62685	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 13:12:41.201902	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 13:19:56.492038	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 13:23:35.195207	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 13:25:55.30724	202110701120000023E	202110210003212	20994603	1	1070	62	\N	Incluir radicado en Expediente 202110701120000023E	\N	\N
\N	0	\N	2021-01-29 16:21:41.515848	202110301110000001E	202109980000012	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202110301110000001E	\N	\N
\N	0	\N	2021-02-01 08:57:03.307812	202110201610000024E	202110200001981	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-02 08:45:06.392154	202110201610000024E	202110310005452	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-02 15:53:55.109537	202110201610000024E	202110200002011	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-02 16:01:56.212104	202110201610000024E	202109980000022	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-03 09:16:49.746593	202110201110000037E	202109980005464	1078370117	12	1020	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-02-03 09:17:39.225443	202110201120000021E	202110200002031	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201120000021E	\N	\N
\N	0	\N	2021-02-04 08:56:35.756142	202110201610000024E	202109980005684	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-04 16:15:21.298141	202110201120000032E	202110200000233	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201120000032E	\N	\N
\N	0	\N	2021-02-05 08:58:00.389178	202110201610000024E	202109980005694	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-05 09:12:04.276744	202110201120000027E	202110200002081	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201120000027E	\N	\N
\N	0	\N	2021-02-09 17:59:20.783699	202110201110000038E	202110210005152	20994213	1	1020	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-02-11 10:48:10.724092	202110201110000038E	202110200002101	20994213	1	1020	62	\N	Incluir radicado en Expediente 202110201110000038E	\N	\N
\N	0	\N	2021-02-12 15:38:29.053816	202110201610000024E	202110200001971	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-15 09:09:04.516035	202110201610000024E	202110200001991	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-15 14:14:29.615464	202109981110000039E	202109980000332	1234567890	1	0998	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-02-16 15:15:04.123796	202109981610000040E	202109980000322	1234567890	1	0998	51	\N	TRD DERECHOS DE PETICIÓN/Peticiones, Quejas, Reclamos y Sugerencias (Creación de Expediente.)	\N	\N
\N	0	\N	2021-02-16 17:54:17.50947	202109981110000035E	202109980000312	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202109981110000035E	\N	\N
\N	0	\N	2021-02-16 17:55:36.859268	202109981110000035E	202109980000302	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202109981110000035E	\N	\N
\N	0	\N	2021-02-16 18:02:49.746582	202109981110000035E	202109980000282	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202109981110000035E	\N	\N
\N	0	\N	2021-02-16 18:05:52.779907	202109981110000035E	202109980000292	1234567890	1	0998	62	\N	Incluir radicado en Expediente 202109981110000035E	\N	\N
\N	0	\N	2021-02-17 09:08:33.995518	202110201610000024E	202110210005924	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-22 10:18:24.909231	202110201610000024E	202110210005934	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201610000024E	\N	\N
\N	0	\N	2021-02-22 10:22:06.227433	202110201120000021E	202110200003011	1078370117	12	1020	62	\N	Incluir radicado en Expediente 202110201120000021E	\N	\N
\N	0	\N	2021-02-22 16:31:46.365481	202110201110000041E	202109980005944	1078370117	12	1020	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-02-23 16:19:38.928025	20219981110000001E	20219980000021	1234567890	1	998	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-02-23 16:23:17.541797	20219981110000002E	20219980000021	1234567890	1	998	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones enviadas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-02-23 16:45:16.700377	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:11:38.778718	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:14:06.80646	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:15:22.099582	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:15:41.172556	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:16:06.051323	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:27:52.304943	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:34:32.961004	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:35:31.546574	20219981110000002E	20219980000041	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:40:36.961582	20219981110000002E	20219980000022	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 17:41:50.203955	20219981110000002E	20219980000061	1234567890	1	998	53	\N	Se ingresa al expediente del radicado padre (20219980000022)	\N	\N
\N	0	\N	2021-02-23 17:43:53.93058	20219981110000002E	20219980000012	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981110000002E	\N	\N
\N	0	\N	2021-02-23 18:00:54.214015	20219981110000002E	20219980000071	1234567890	1	998	53	\N	Se ingresa al expediente del radicado padre (20219980000012)	\N	\N
\N	0	\N	2021-03-31 10:39:12.517083	20219981120000003E	20219980000052	1234567890	1	998	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-03-31 10:48:36.719563	20219981120000003E	20219980000121	1234567890	1	998	53	\N	Se ingresa al expediente del radicado padre (20219980000052)	\N	\N
\N	0	\N	2021-03-31 10:50:01.230526	20219981120000003E	20219980000131	1234567890	1	998	53	\N	Se ingresa al expediente del radicado padre (20219980000052)	\N	\N
\N	0	\N	2021-04-13 16:24:49.469453	20219981120000003E	20219980000092	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981120000003E	\N	\N
\N	0	\N	2021-04-13 16:29:58.979474	20219981120000004E	20219980000082	1234567890	1	998	51	\N	TRD COMUNICACIONES OFICIALES/Consecutivo de Comunicaciones recibidas (Creación de Expediente.)	\N	\N
\N	0	\N	2021-04-13 17:27:20.96424	20219981120000003E	20219980000102	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981120000003E	\N	\N
\N	0	\N	2021-04-13 17:27:48.316339	20219981120000003E	20219980000191	1234567890	1	998	53	\N	Se ingresa al expediente del radicado padre (20219980000102)	\N	\N
\N	0	\N	2021-04-13 17:31:32.476118	20219981120000003E	20219980000201	1234567890	1	998	62	\N	Incluir radicado en Expediente 20219981120000003E	\N	\N
\N	0	\N	2021-04-15 11:18:37.395533	20219981120000003E	20219980000092	1234567890	1	998	68	\N	Se transfiere el radicado 20219980000092 al archivo central.	\N	\N
\N	0	\N	2021-04-15 14:43:09.853069	20219981120000003E	20219980000102	1234567890	1	998	68	\N	Se transfiere el radicado 20219980000102 al archivo central.	\N	\N
\N	0	\N	2021-04-15 15:16:55.314601	20219981120000003E	20219980000191	1234567890	1	998	68	\N	Se transfiere el radicado 20219980000191 al archivo central.	\N	\N
\.


--
-- Data for Name: sgd_hmtd_hismatdoc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_hmtd_hismatdoc (sgd_hmtd_codigo, sgd_hmtd_fecha, radi_nume_radi, usua_codi, sgd_hmtd_obse, usua_doc, depe_codi, sgd_mtd_codigo) FROM stdin;
\.


--
-- Data for Name: sgd_instorf_instanciasorfeo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_instorf_instanciasorfeo (sgd_instorf_codi, sgd_instorf_desc) FROM stdin;
\.


--
-- Data for Name: sgd_lip_linkip; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_lip_linkip (sgd_lip_id, sgd_lip_ipini, sgd_lip_ipfin, sgd_lip_dirintranet, depe_codi, sgd_lip_arch, sgd_lip_diascache, sgd_lip_rutaftp, sgd_lip_servftp, sgd_lip_usbd, sgd_lip_nombd, sgd_lip_pwdbd, sgd_lip_usftp, sgd_lip_pwdftp) FROM stdin;
\.


--
-- Data for Name: sgd_mat_matriz; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_mat_matriz (sgd_mat_codigo, depe_codi, sgd_fun_codigo, sgd_prc_codigo, sgd_prd_codigo, sgd_mat_fech_ini, sgd_mat_fech_fin, sgd_mat_peso_prd) FROM stdin;
\.


--
-- Data for Name: sgd_mpes_mddpeso; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_mpes_mddpeso (sgd_mpes_codigo, sgd_mpes_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_mrd_matrird; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_mrd_matrird (sgd_mrd_codigo, depe_codi, sgd_srd_codigo, sgd_sbrd_codigo, sgd_tpr_codigo, soporte, sgd_mrd_fechini, sgd_mrd_fechfin, sgd_mrd_esta) FROM stdin;
2612	998	16	1	413	Electronico	2021-02-23	2050-12-31	1
2617	998	11	2	327	Electronico	2021-03-31	2050-12-31	1
2618	998	11	2	248	Electronico	2021-04-13	2050-12-31	1
2613	998	11	1	413	Electronico	2021-02-23	2050-12-31	1
2619	998	11	2	477	Electronico	2021-04-13	2050-12-31	1
2614	998	16	1	455	Electronico	2021-02-23	2050-12-31	1
2615	998	11	1	455	Electronico	2021-02-23	2050-12-31	1
2616	998	11	1	459	Electronico	2021-02-23	2050-12-31	1
2300	998	11	1	58	2	2020-12-10	\N	1
2299	998	11	1	155	2	2020-12-10	\N	1
2301	998	11	2	58	2	2020-12-10	\N	1
2302	998	11	2	155	2	2020-12-10	\N	1
2303	998	11	2	154	Electronico	2020-12-10	2050-12-31	1
2304	998	11	2	201	Electronico	2020-12-10	2050-12-31	1
2305	998	11	1	92	Electronico	2020-12-17	2050-12-31	1
2306	998	11	2	92	Electronico	2020-12-17	2050-12-31	1
2307	998	11	1	146	Electronico	2020-12-21	2050-12-31	1
2308	998	11	2	1	Electronico	2020-12-21	2050-12-31	1
2309	998	11	2	347	Electronico	2020-12-21	2050-12-31	1
2310	998	11	1	118	Electronico	2020-12-22	2050-12-31	1
2311	998	11	2	118	Electronico	2020-12-22	2050-12-31	1
2312	998	11	2	499	Electronico	2020-12-23	2050-12-31	1
2586	998	11	1	283	Electronico	2021-01-29	2050-12-31	1
2591	998	11	1	105	Electronico	2021-01-29	2050-12-31	1
2601	998	11	1	112	Electronico	2021-02-15	2050-12-31	1
2602	998	11	1	122	Electronico	2021-02-16	2050-12-31	1
2603	998	16	1	204	2	2021-02-16	\N	1
2604	998	16	1	208	2	2021-02-16	\N	1
2605	998	16	1	210	2	2021-02-16	\N	1
2606	998	16	1	122	Electronico	2021-02-16	2050-12-31	1
2607	998	11	1	106	Electronico	2021-02-16	2050-12-31	1
2608	998	11	2	116	Electronico	2021-02-16	2050-12-31	1
2609	998	11	1	116	Electronico	2021-02-16	2050-12-31	1
2610	998	16	1	155	Electronico	2021-02-17	2050-12-31	1
2611	998	16	1	11	Electronico	2021-02-18	2050-12-31	1
\.


--
-- Data for Name: sgd_msdep_msgdep; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_msdep_msgdep (sgd_msdep_codi, depe_codi, sgd_msg_codi) FROM stdin;
\.


--
-- Data for Name: sgd_msg_mensaje; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_msg_mensaje (sgd_msg_codi, sgd_tme_codi, sgd_msg_desc, sgd_msg_fechdesp, sgd_msg_url, sgd_msg_veces, sgd_msg_ancho, sgd_msg_largo) FROM stdin;
\.


--
-- Data for Name: sgd_mtd_matriz_doc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_mtd_matriz_doc (sgd_mtd_codigo, sgd_mat_codigo, sgd_tpr_codigo) FROM stdin;
\.


--
-- Data for Name: sgd_noh_nohabiles; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_noh_nohabiles (noh_fecha) FROM stdin;
2019-01-01
2019-01-06
2019-01-07
2019-01-13
2019-01-20
2019-01-27
2019-02-02
2019-02-10
2019-02-17
2019-02-24
2019-03-03
2019-03-10
2019-03-17
2019-03-24
2019-03-25
2019-03-31
2019-04-07
2019-04-14
2019-04-18
2019-04-19
2019-04-21
2019-04-28
2019-05-05
2019-05-12
2019-05-19
2019-05-26
2019-06-02
2019-06-03
2019-06-09
2019-06-16
2019-06-23
2019-06-24
2019-06-30
2019-07-01
2019-07-07
2019-07-14
2019-07-20
2019-07-21
2019-07-28
2019-08-04
2019-08-07
2019-08-11
2019-08-18
2019-08-19
2019-08-25
2019-09-01
2019-09-08
2019-09-15
2019-09-22
2019-09-29
2019-10-06
2019-10-13
2019-10-14
2019-10-20
2019-10-27
2019-11-03
2019-11-04
2019-11-10
2019-11-11
2019-11-17
2019-11-24
2019-12-01
2019-12-08
2019-12-15
2019-12-22
2019-12-25
2019-12-29
2020-01-01
2020-01-05
2020-01-06
2020-01-12
2020-01-19
2020-01-26
2020-02-02
2020-02-09
2020-02-16
2020-02-23
2020-03-01
2020-03-08
2020-03-15
2020-03-22
2020-03-23
2020-03-29
2020-04-05
2020-04-09
2020-04-10
2020-04-12
2020-04-19
2020-04-26
2020-05-01
2020-05-03
2020-05-10
2020-05-17
2020-05-24
2020-05-25
2020-05-31
2020-06-07
2020-06-14
2020-06-15
2020-06-21
2020-06-22
2020-06-28
2020-06-29
2020-07-05
2020-07-12
2020-07-19
2020-07-20
2020-07-26
2020-08-02
2020-08-07
2020-08-09
2020-08-16
2020-08-17
2020-08-23
2020-08-30
2020-09-06
2020-09-13
2020-09-20
2020-09-27
2020-10-04
2020-10-11
2020-10-12
2020-10-18
2020-10-25
2020-11-01
2020-11-02
2020-11-08
2020-11-15
2020-11-16
2020-11-22
2020-11-29
2020-12-06
2020-12-08
2020-12-13
2020-12-20
2020-12-25
2020-12-27
2021-01-01
2021-01-03
2021-01-10
2021-01-11
2021-01-17
2021-01-24
2021-02-14
2021-02-21
2021-02-28
2021-03-07
2021-03-14
2021-03-21
2021-03-22
2021-03-28
2021-04-01
2021-04-02
2021-04-04
2021-04-11
2021-04-18
2021-04-25
2021-05-01
2021-05-02
2021-05-09
2021-05-16
2021-05-17
2021-05-23
2021-05-30
2021-06-06
2021-06-07
2021-06-13
2021-06-14
2021-06-20
2021-06-27
2021-07-04
2021-07-05
2021-07-11
2021-07-18
2021-07-20
2021-07-25
2021-08-01
2021-08-07
2021-08-08
2021-08-15
2021-08-16
2021-08-22
2021-08-29
2021-09-05
2021-09-12
2021-09-19
2021-09-26
2021-10-03
2021-10-10
2021-10-17
2021-10-18
2021-10-24
2021-10-31
2021-11-01
2021-11-07
2021-11-14
2021-11-15
2021-11-21
2021-11-28
2021-12-05
2021-12-08
2021-12-12
2021-12-19
2021-12-25
2021-12-26
2022-01-01
2022-01-02
2022-01-09
2022-01-10
2022-01-16
2022-01-23
2022-01-30
2022-02-06
2022-02-13
2022-02-20
2022-02-27
2022-03-06
2022-03-13
2022-03-20
2022-03-21
2022-04-10
2022-04-14
2022-04-15
2022-04-17
2022-04-24
2022-05-01
2022-05-08
2022-05-15
2022-05-22
2022-05-29
2022-05-30
2022-06-05
2022-06-12
2022-06-19
2022-06-20
2022-06-26
2022-06-27
2022-07-03
2022-07-04
2022-07-10
2022-07-17
2022-07-20
2022-07-24
2022-07-31
2022-08-07
2022-08-14
2022-08-15
2022-08-21
2022-08-28
2022-09-04
2022-09-11
2022-09-18
2022-09-25
2022-10-02
2022-10-09
2022-10-16
2022-10-17
2022-10-23
2022-10-30
2022-11-06
2022-11-07
2022-11-13
2022-11-14
2022-11-20
2022-11-27
2022-12-04
2022-12-08
2022-12-11
2022-12-18
2022-12-25
2020-12-05
2021-02-13
2021-02-06
2021-02-20
2021-02-27
2021-03-06
2021-03-13
2021-03-20
2021-03-27
\.


--
-- Data for Name: sgd_not_notificacion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_not_notificacion (sgd_not_codi, sgd_not_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_ntrd_notifrad; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_ntrd_notifrad (radi_nume_radi, sgd_not_codi, sgd_ntrd_notificador, sgd_ntrd_notificado, sgd_ntrd_fecha_not, sgd_ntrd_num_edicto, sgd_ntrd_fecha_fija, sgd_ntrd_fecha_desfija, sgd_ntrd_observaciones) FROM stdin;
\.


--
-- Data for Name: sgd_oem_oempresas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_oem_oempresas (sgd_oem_codigo, tdid_codi, sgd_oem_oempresa, sgd_oem_rep_legal, sgd_oem_nit, sgd_oem_sigla, muni_codi, dpto_codi, sgd_oem_direccion, sgd_oem_telefono, id_cont, id_pais, email) FROM stdin;
1	4	SKINA TECHNOLOGIES SAS	--	8002509887		1	11	Carrera 37 No. 53-50	6431582	1	170	soporte@skinatech.com
\.


--
-- Data for Name: sgd_panu_peranulados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_panu_peranulados (sgd_panu_codi, sgd_panu_desc) FROM stdin;
\.


--
-- Data for Name: sgd_parametro; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_parametro (param_nomb, param_codi, param_valor) FROM stdin;
PRESTAMO_ESTADO	5	Prestamo indefinido
PRESTAMO_REQUERIMIENTO	1	Documento
PRESTAMO_REQUERIMIENTO	2	Anexo
PRESTAMO_REQUERIMIENTO	3	Anexo y Documento
PRESTAMO_DIAS_PREST	1	8
PRESTAMO_DIAS_CANC	1	2
PRESTAMO_PASW	1	1
PRESTAMO_ESTADO	4	Cancelado
PRESTAMO_ESTADO	3	Devuelto
PRESTAMO_ESTADO	2	Prestado
PRESTAMO_ESTADO	1	Solicitado
\.


--
-- Data for Name: sgd_parexp_paramexpediente; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_parexp_paramexpediente (sgd_parexp_codigo, depe_codi, sgd_parexp_tabla, sgd_parexp_etiqueta, sgd_parexp_orden, sgd_parexp_editable) FROM stdin;
1	998		Nombre de Carpeta	1	1
2	999		Nombre de Carpeta	1	1
\.


--
-- Data for Name: sgd_pen_pensionados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_pen_pensionados (tdid_codi, sgd_ciu_codigo, sgd_ciu_nombre, sgd_ciu_direccion, sgd_ciu_apell1, sgd_ciu_apell2, sgd_ciu_telefono, sgd_ciu_email, muni_codi, dpto_codi, sgd_ciu_cedula, id_cont, id_pais) FROM stdin;
\.


--
-- Data for Name: sgd_pexp_procexpedientes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_pexp_procexpedientes (sgd_pexp_codigo, sgd_pexp_descrip, sgd_pexp_terminos, sgd_srd_codigo, sgd_sbrd_codigo, sgd_pexp_automatico, sgd_pexp_tieneflujo) FROM stdin;
0	\N	0	\N	\N	1	0
\.


--
-- Data for Name: sgd_pnufe_procnumfe; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_pnufe_procnumfe (sgd_pnufe_codi, sgd_tpr_codigo, sgd_pnufe_descrip, sgd_pnufe_serie) FROM stdin;
\.


--
-- Data for Name: sgd_pnun_procenum; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_pnun_procenum (sgd_pnun_codi, sgd_pnufe_codi, depe_codi, sgd_pnun_prepone) FROM stdin;
\.


--
-- Data for Name: sgd_prc_proceso; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_prc_proceso (sgd_prc_codigo, sgd_prc_descrip, sgd_prc_fech_ini, sgd_prc_fech_fin) FROM stdin;
\.


--
-- Data for Name: sgd_prd_prcdmentos; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_prd_prcdmentos (sgd_prd_codigo, sgd_prd_descrip, sgd_prd_fech_ini, sgd_prd_fech_fin) FROM stdin;
\.


--
-- Data for Name: sgd_rda_retdoca; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_rda_retdoca (anex_radi_nume, anex_codigo, radi_nume_salida, anex_borrado, sgd_mrd_codigo, depe_codi, usua_codi, usua_doc, sgd_rda_fech, sgd_deve_codigo, anex_solo_lect, anex_radi_fech, anex_estado, anex_nomb_archivo, anex_tipo, sgd_dir_tipo) FROM stdin;
\.


--
-- Data for Name: sgd_rdf_retdocf; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_rdf_retdocf (sgd_mrd_codigo, radi_nume_radi, depe_codi, usua_codi, usua_doc, sgd_rdf_fech) FROM stdin;
2613	20219980000021	998	1	1234567890	2021-02-23
2615	20219980000041	998	1	1234567890	2021-02-23
2616	20219980000022	998	1	1234567890	2021-02-23
2299	20219980000012	998	1	1234567890	2021-02-23
2299	20219980000081	998	1	1234567890	2021-03-09
2299	20219980000091	998	1	1234567890	2021-03-09
2299	20219980000101	998	1	1234567890	2021-03-09
2617	20219980000052	998	1	1234567890	2021-03-31
2618	20219980000092	998	1	1234567890	2021-04-13
2619	20219980000082	998	1	1234567890	2021-04-13
2302	20219980000102	998	1	1234567890	2021-04-13
2302	20219980000201	998	1	1234567890	2021-04-13
\.


--
-- Data for Name: sgd_renv_regenvio; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_renv_regenvio (sgd_renv_codigo, sgd_fenv_codigo, sgd_renv_fech, radi_nume_sal, sgd_renv_destino, sgd_renv_telefono, sgd_renv_mail, sgd_renv_peso, sgd_renv_valor, sgd_renv_certificado, sgd_renv_estado, usua_doc, sgd_renv_nombre, sgd_rem_destino, sgd_dir_codigo, sgd_renv_planilla, sgd_renv_fech_sal, depe_codi, sgd_dir_tipo, radi_nume_grupo, sgd_renv_dir, sgd_renv_depto, sgd_renv_mpio, sgd_renv_tel, sgd_renv_cantidad, sgd_renv_tipo, sgd_renv_observa, sgd_renv_grupo, sgd_deve_codigo, sgd_deve_fech, sgd_renv_valortotal, sgd_renv_valistamiento, sgd_renv_vdescuento, sgd_renv_vadicional, sgd_depe_genera, sgd_renv_pais, sgd_renv_guia) FROM stdin;
1	1	2021-02-23 16:39:26.218571	20219980000021	BOGOTA	6431582	soporte@skinatech.com	1	214	0	1	1234567890	SKINA TECHNOLOGIES SAS -- 	0	10	1	\N	998	1	20219980000021	Carrera 37 No. 53-50	D.C.	BOGOTA	\N	1	0	20219980000021	\N	\N	\N	0	0	0	0	\N	COLOMBIA	20219980000021
2	1	2021-02-23 16:54:40.944345	20219980000051	BOGOTA	6431582	soporte@skinatech.com	1	214	0	1	1234567890	SKINA TECHNOLOGIES SAS	0	14	2	\N	998	1	20219980000051	Carrera 37 No. 53-50	D.C.	BOGOTA	\N	1	0	20219980000051	\N	\N	\N	0	0	0	0	\N	COLOMBIA	20219980000051
3	1	2021-02-23 17:56:29.382501	20219980000061	BOGOTA	6431582	soporte@skinatech.com	1	214	0	1	1234567890	SKINA TECHNOLOGIES SAS	0	16	3	\N	998	1	20219980000061	Carrera 37 No. 53-50	D.C.	BOGOTA	\N	1	0	20219980000061	\N	\N	\N	0	0	0	0	\N	COLOMBIA	20219980000061
4	1	2021-02-23 18:01:08.526438	20219980000071	BOGOTA	6431582	soporte@skinatech.com	1	214	0	1	1234567890	SKINA TECHNOLOGIES SAS	0	17	4	\N	998	1	20219980000071	Carrera 37 No. 53-50	D.C.	BOGOTA	\N	1	0	20219980000071	\N	\N	\N	0	0	0	0	\N	COLOMBIA	20219980000071
5	\N	2021-03-09 10:27:49.103704	20219980000081	1				\N	0	1	1234567890	SKINA TECHNOLOGIES SAS	0	\N	\N	\N	998	1	20219980000081	Carrera 37 No. 53-50	D.C.	BOGOTA	\N	0	1	Masiva grupo 20219980000081	\N	\N	\N	0	0	0	0	998	COLOMBIA	\N
5	\N	2021-03-09 10:27:49.103704	20219980000091	1				\N	0	1	1234567890	SKINA TECHNOLOGIES SAS	0	\N	\N	\N	998	1	20219980000081	Carrera 37 No. 53-50	D.C.	BOGOTA	\N	0	1	Masiva grupo 20219980000081	\N	\N	\N	0	0	0	0	998	COLOMBIA	\N
5	\N	2021-03-09 10:27:49.103704	20219980000101	1				\N	0	1	1234567890	SKINA TECHNOLOGIES SAS	0	\N	\N	\N	998	1	20219980000081	Carrera 37 No. 53-50	D.C.	BOGOTA	\N	0	1	Masiva grupo 20219980000081	\N	\N	\N	0	0	0	0	998	COLOMBIA	\N
\.


--
-- Data for Name: sgd_rmr_radmasivre; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_rmr_radmasivre (sgd_rmr_grupo, sgd_rmr_radi) FROM stdin;
\.


--
-- Data for Name: sgd_sbrd_subserierd; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_sbrd_subserierd (sgd_srd_codigo, sgd_sbrd_codigo, sgd_sbrd_descrip, sgd_sbrd_fechini, sgd_sbrd_fechfin, sgd_sbrd_tiemag, sgd_sbrd_tiemac, sgd_sbrd_dispfin, sgd_sbrd_soporte, sgd_sbrd_procedi, id_tabla) FROM stdin;
1	1	Acciones de Cumplimiento	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Subserie documental en la que se conservan los documentos por los cuales un ciudadano acude ante un juez administrativo para hacer efectivo el cumplimiento de una ley o un acto administrativo, buscando así que se ordene a la autoridad correspondiente el cumplimiento del deber omitido. Manual para el ejercicio de las acciones constitucionales. Bogotá: Editorial Universidad del Rosario, 2007. Pág. 14 Serie Documental con valor primario denttro de las funciones admisnitartivas de la alcaldía, culminandoa el tiempo de retención en el Archivo Central, se procede a tomar una muestra aleatoria simple del 5% para su conservación. La demás documentación se destruye a través del método de picado.	1
1	2	Acciones de Grupo	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Subserie documental en la que se conservan los documentos por los cuales un grupo de personas afectadas por una misma causa acuden a las autoridades judiciales para obtener el reconocimiento y pago de la indemnización por los perjuicios recibidos. Manual para el ejercicio de las acciones constitucionales. Bogotá: Editorial Universidad del Rosario, 2007. Pág. 12. posse  valor primario denttro de las funciones admisnitartivas de la alcaldía, culminandoa el tiempo de retención en el Archivo Central, se procede a tomar una muestra aleatoria simple del 5% para su conservación. La demás documentación se destruye a través del método de picado.	2
1	3	Acciones de Tutela	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Subserie documental en la que se conservan los documentos por los cuales un ciudadano acude ante un juez de la República, con el fin de buscar un pronunciamiento que proteja un derecho constitucional fundamental vulnerado o amenazado por acción u omisión de una entidad pública o particular. Guía de mecanismos constitucionales de protección de Derechos Humanos. Pág. 72. Serie Documental con valor primario denttro de las funciones admisnitartivas de la alcaldía, culminandoa el tiempo de retención en el Archivo Central, se procede a tomar una muestra aleatoria simple del 5% para su conservación. La demás documentación se destruye a través del método de picado.	3
1	4	Acciones Populares	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Subserie documental en la que se conservan los documentos por los cuales una persona, colectivo o entidad acude ante un juez de la República en defensa y protección de los derechos e intereses colectivos enunciados en el artículo 88 de la Constitución Política de Colombia y el artículo 4 de la Ley 472 de 1998. Manual para el ejercicio de las acciones constitucionales. Bogotá: Editorial Universidad del Rosario, 2007. Pág. 10. Serie Documental con valor primario denttro de las funciones admisnitartivas de la alcaldía, culminandoa el tiempo de retención en el Archivo Central, se procede a tomar una muestra aleatoria simple del 5% para su conservación. La demás documentación se destruye a través del método de picado.	4
2	1	Actas Comité Institucional de Gestión y Desempeño	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	5
2	2	Actas Comité Asesor de Contratación Municipal	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	6
2	3	Actas Comité de Aprobación de Exenciones	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	7
2	4	Actas Comité de Atención Integral al Adulto Mayor	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	8
2	5	Actas Comité de Certificación Municipal	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	9
2	6	Actas Comité de Comisión de Personal	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	10
2	7	Actas Comité de Convivencia Escolar	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	11
2	8	Actas de Comité de Coordinación del Sistema de Control Interno	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	12
2	9	Actas Comité de Discapacidad	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	13
2	10	Actas Comité de Erradicación de Trabajo Infantil (CETI)	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	14
2	11	Actas Comité de Participación Local de Salud (COPACO)	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	15
2	12	Actas Comité Derechos Humanos	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	16
2	13	Actas Comité Fondo Luis Carlos Galán	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	17
2	14	Actas Comité Garantías Electorales	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	18
2	15	Actas Comité Gestión de Riesgos de Desastres	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	19
2	16	Actas Comité Infancia y Adolescencia	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	20
2	17	Actas Comité Interno Disciplinario	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	21
2	18	Actas Comité Municipal de Convivencia Escolar	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	22
2	19	Actas Comité Municipal de Igualdad de Oportunidades	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	23
2	20	Actas Comité para la Prevención Integral del Consumo de SPA	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	24
2	21	Actas Comité Paritario de Seguridad  y Salud en el Trabajo	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	25
2	22	Actas Comité Permanente de Estratificación	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	26
2	23	Actas Comité Red de Buen Trato	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	27
2	24	Actas Comité Sostenibilidad Contable	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	28
2	25	Actas Comité Técnico de Administración del SISBEN	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	29
2	26	Actas Comité Técnico Interinstitucional de Educación Ambiental Municipal (CIDEAM)	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	30
2	28	Actas Consejo de Desarrollo Rural	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	31
2	29	Actas Consejo de Gobierno en Linea	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	32
2	30	Actas Consejo de Juventud	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	33
2	31	Actas Consejo de Política Económica y Social (COMPES)	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	34
2	32	Actas Consejo de Política Social	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	35
2	33	Actas Consejo de Seguridad	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	36
2	34	Actas Consejo Fondo de Vivienda de Interés Social  (FOVIS)	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	37
2	35	Actas Consejo Territorial de Planeación	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	38
2	27	Actas de Anulación de Consecutivo	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	39
2	36	Actas de comité de Transporte	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	40
2	37	Actas de Conciliaciòn	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	41
2	38	Actas de Gestión Oficina de Comunicaciones	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	42
2	39	Actas de Incautación de Mercancia	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	43
2	40	Actas de Incautación de Sustancias Psicoactivas	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	44
2	41	Actas de Justicia Transicional	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	45
2	42	Actas de Posesion	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	46
2	43	Actas de Reuniones Administrativas	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	47
2	44	Actas del Consejo de Política Fiscal (CONFIS)	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	48
2	45	Actas Entrega de cargo	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	49
2	46	Actas Inspección, Vigilancia y Control de Saneamiento Ambiental	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	50
2	47	Actas Junta Defensora de Animales	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	51
2	48	Actas Mesa Intersectorial de Infancia y Adolescencia	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	52
2	49	Actas Mesa Técnica de Familia	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	53
2	50	Actas Mesa Técnica Infancia y Adolescencia	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	54
2	51	Actas Mesa Técnica Primera Infancia	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	55
2	52	Actas  de Verificacion Ocular de Predios	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	56
2	53	Actas Organo Colegiado de Administración y Decisión (OCAD)	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	57
4	1	Autorizaciones de Pago	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	58
4	2	Autorizaciones de Transito	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	59
4	3	Autorizaciones de Vallas y Pasacalles	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	60
4	4	Autorizaciones Eventos y Espectáculos	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	61
4	5	Autorizaciones Urbanisticas	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	62
3	1	Nomina	2020-12-10	2025-11-25	10	90	M.TECNOLOGICO / SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	63
3	2	Pasivocol	2020-12-10	2025-11-25	5	15	ELIMINACION	PAPEL / ELECTRONICO	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	64
5	1	Certificaciones Contractuales	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	65
5	2	Certificaciones convenio universidades	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	66
5	3	Certificaciones de EOT	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	67
5	4	Certificaciones de Estratificación	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	68
5	5	Certificaciones de no riesgo	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	69
5	6	Certificaciones de Nomenclatura	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	70
5	7	Certificaciones de Paz y Salvo	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	71
5	8	Certificaciones de Población Especial	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	72
5	9	Certificaciones de registro en Banco de Proyectos	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	73
5	10	Certificaciones de residencia	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	74
5	11	Certificaciones de viabiidad del Uso del Suelo	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	75
5	12	Certificaciones Horas Sociales	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	76
5	13	Certificaciones Laborales	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	77
5	14	Certificaciones del Sisben	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	78
5	15	Certificacion de Plusvalia	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	79
5	16	Certificaciones servicio social	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Sin procedimiento parametrizado	80
6	1	Circulares Dispositivas	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Esta subserie Dispositiva se consigna la toma de decisiones, dirigidas a personas o instituciones en aspectos administrativos, jurídicos, económicos y sociales. Será fuente de información, para investigaciones de carácter histórico sobre los desarrollos administrativos de las entidades públicas.	82
6	2	Circulares Informativas	2020-12-10	2025-11-25	2	2	ELIMINACION	PAPEL	Tenienedo encuenta que la Circular informativa se expide con propósitos internos meramente de carácter administrativo, para informar, regular o establecer aspectos generales, que no están en los reglamentos internos del trabajo.Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	83
7	1	Comprobantes de baja de bienes de almacén	2020-12-10	2030-11-25	3	7	ELIMINACION	PAPEL	Teniendo en cuenta que esta subserie no posee valores para la investigación, debido a que la información se encuentra contenida en otros documentos tales como los inventarios generales y actas expedidas por el comité de inventarios, se debe eliminar el soporte de estos documentos, de acuerdo a lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo	85
7	2	Comprobantes de egreso de bienes de almacén	2020-12-10	2030-11-25	3	7	ELIMINACION	PAPEL	Sin procedimiento parametrizado	86
7	3	Comprobantes de ingreso de bienes de almacén	2020-12-10	2030-11-25	3	7	ELIMINACION	PAPEL	Sin procedimiento parametrizado	87
8	1	Comprobantes contables de Egreso	2020-12-10	2030-11-25	2	8	ELIMINACION	PAPEL	"Esta subserie no posee posibilidades para la investigación, debido a que la información se encuentra consolidada en otras fuentes tales como los Libros principales contables	88
8	2	Comprobantes Contables de Ingreso	2020-12-10	2030-11-25	2	8	ELIMINACION	PAPEL	"Esta subserie no posee posibilidades para la investigación, debido a que la información se encuentra consolidada en otras fuentes tales como los Libros principales contables	89
9	1	Conceptos Jurìdicos	2020-12-10	2030-11-25	2	8	C.TOTAL / M.TECNOLOGICO	PAPEL	La Serie permanece dos años en el Archivo de Gestión, posteriormente se transfiere al Archivo Central donde se reproduce en Medio Técnico y se conserva por ocho años más, para luego ser transferidas al Archivo Histórico dada la importancia de su contenido	90
9	2	Conceptos Técnicos Agropecuarios	2020-12-10	2030-11-25	2	8	C.TOTAL / M.TECNOLOGICO	PAPEL	La Serie permanece dos años en el Archivo de Gestión, posteriormente se transfiere al Archivo Central donde se reproduce en Medio Técnico y se conserva por ocho años más, para luego ser transferidas al Archivo Histórico dada la importancia de su contenido	91
9	3	Conceptos Técnicos Ambientales	2020-12-10	2030-11-25	2	8	C.TOTAL / M.TECNOLOGICO	PAPEL	La Serie permanece dos años en el Archivo de Gestión, posteriormente se transfiere al Archivo Central donde se reproduce en Medio Técnico y se conserva por ocho años más, para luego ser transferidas al Archivo Histórico dada la importancia de su contenido	92
9	4	Conceptos de Normas Urbanísticas	2020-12-10	2030-11-25	2	8	C.TOTAL / M.TECNOLOGICO	PAPEL	La Serie permanece dos años en el Archivo de Gestión, posteriormente se transfiere al Archivo Central donde se reproduce en Medio Técnico y se conserva por ocho años más, para luego ser transferidas al Archivo Histórico dada la importancia de su contenido	93
10	1	Conciliaciones Bancarias	2020-12-10	2030-11-25	2	8	ELIMINACION	PAPEL	"Esta subserie no posee posibilidades para la investigación, debido a que la información se encuentra consolidada en otras fuentes tales como los Libros principales contables	95
12	1	Contratos de Arrendamiento	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	"Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, La alcaldía municipal determinara el proceso de selección teniendo en cuenta que este puede realizarse cuantitativa y cualitativamente. La selección cuantitativa se relaciona con la definición de un porcentaje de muestra el cual debe considerar el volumen de producción documental anual	99
12	2	Contratos de Comodato	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	100
12	3	Contratos de Consultoría	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	101
12	4	Contratos de Obra	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	102
12	5	Contratos de Prestación de Servicios	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	103
12	6	Contratos de Suministros	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	104
13	1	Convenios de cooperación internacional	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	105
13	2	Convenios de cooperación nacional	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	106
13	3	Convenios de organización osociacion	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	107
13	4	Convenios Interadministrativos	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	108
13	5	Convenios interinstitucionales	2020-12-10	2038-11-25	2	18	SELECCION	PAPEL	Sin procedimiento parametrizado	109
25	1	Esquema de Ordenamiento Territorial Vigente	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	182
11	2	Consecutivo de Comunicaciones recibidas	2021-01-14	2025-01-08	2	2	2	Electronico	Consecutivo de Comunicaciones recibidas 	97
9	5	Conceptos Locativos	2020-12-10	2030-11-25	2	8		PAPEL	La Serie permanece dos años en el Archivo de Gestión, posteriormente se transfiere al Archivo Central donde se reproduce en Medio Técnico y se conserva por ocho años más, para luego ser transferidas al Archivo Histórico dada la importancia de su contenido	94
14	1	Declaraciones por Recaudo de Impuesto Aportes y participaciones	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	110
14	2	Declaraciones por Recaudo de Impuesto de Aviso y Tableros	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	111
14	3	Declaraciones por Recaudo de Impuesto de Espectáculos Públicos	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	112
14	4	Declaraciones por Recaudo de Impuesto de Industria y Comercio	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	113
14	5	Declaraciones por Recaudo de Impuesto de Multas	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	114
14	6	Declaraciones por Recaudo de Impuesto de Rentas contractuales	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	115
14	7	Declaraciones por Recaudo de Impuesto de Sobretasa a la Gasolina	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	116
14	8	Declaraciones por Recaudo de Impuesto de Tasas	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	117
14	9	Declaraciones por Recaudo de Impuesto Predial	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	118
14	10	Declaraciones por Recaudo de Impuesto Rifas Municipales	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	119
15	1	Decretos Municipales	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 1000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	120
16	1	Peticiones, Quejas, Reclamos y Sugerencias	2020-12-10	2040-12-31	2	8	M.TECNOLOGICO / SELECCION	PAPEL / ELECTRONICO	Conservar dos años en el archivo de gestión, transferir al archivo central y conservar ocho años, transcurrido el tiempo de retención seleccionar una muestra aleatoria del 10% por cada año de producción documental, de los derechos de petición que se relacionen con temas misionales de la entidad.	121
17	1	Fichas de Caracterizacion Socioeconomica - Sisben	2020-12-10	2040-12-31	2	1	ELIMINACION	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retecnion por ser documentos con valor administrativo, se elimina completamente una vez transcurrió el tiempo de retención en el Archivo Central.	122
17	2	Retiros de Ficha	2020-12-10	2040-12-31	2	1	ELIMINACION	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retecnion por ser documentos con valor administrativo, se elimina completamente una vez transcurrió el tiempo de retención en el Archivo Central.	123
17	3	Retiro de Personas	2020-12-10	2040-12-31	2	1	ELIMINACION	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retecnion por ser documentos con valor administrativo, se elimina completamente una vez transcurrió el tiempo de retención en el Archivo Central.	124
17	4	Inclusión de Persona	2020-12-10	2040-12-31	2	1	ELIMINACION	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retecnion por ser documentos con valor administrativo, se elimina completamente una vez transcurrió el tiempo de retención en el Archivo Central.	125
17	5	Modificación de Ficha	2020-12-10	2040-12-31	2	1	ELIMINACION	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retecnion por ser documentos con valor administrativo, se elimina completamente una vez transcurrió el tiempo de retención en el Archivo Central.	126
18	1	Historias Laborales	2020-12-10	2040-12-31	10	90	M.TECNOLOGICO / SELECCION	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, Se selecciona un 10% de lo producido en el periodo administrativo  El proceso de selección será realizado por el Comité Interno de Archivo, el jefe de la dependencia productora y los interesados. La documentación seleccionada, se debe transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. La Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio	132
18	2	Historia Equipos de Computo	2020-12-10	2040-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	133
18	3	Historia Herramientas Agrícolas	2020-12-10	2040-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	134
18	4	Historias de vehículos y maquinaria	2020-12-10	2040-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	135
18	5	Historial de bienes e inmuebles	2020-12-10	2040-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	136
19	1	Informes a Entes de Control y vigilancia	2020-12-10	2025-11-25	2	3	SELECCION	PAPEL / ELECTRONICO	La subserie documental se fundamenta en la Ley 951 de 2005 y en la Resolución orgánica 6289 del 8 de marzo de 2011 expedida por la Contraloria General de la Nación Esta serie se selecciona después de pasado su tiempo de retención en el Archivo Central, ya que adquiere valores secundarios para la Alcaldía, se realiza a través de una muestra representativa, según manual de selección avalada por el comité de Gestión.	137
19	2	Informes de Auditorías de Control Interno y Calidad	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retecnion por ser documentos con valor administrativo, se elimina completamente una vez transcurrió el tiempo de retención en el Archivo Central.	138
19	3	Informes de Auditorías Externas	2020-12-10	2025-11-25	2	3	SELECCION	PAPEL / ELECTRONICO	La subserie documental se fundamenta en la Ley 951 de 2005 y en la Resolución orgánica 6289 del 8 de marzo de 2011 expedida por la Contraloria General de la Nación Esta serie se selecciona después de pasado su tiempo de retención en el Archivo Central, ya que adquiere valores secundarios para la Alcaldía, se realiza a través de una muestra representativa, según manual de selección avalada por el comité de Gestión.	139
19	4	Informes de ejecución presupuestal	2020-12-10	2025-11-25	4	16	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retecncion en el archivo de gestion 3 años, posteriormente 17 años en el archivo central, transcurrido el tiempo de retención eliminar.	140
19	5	Informes de Estados Financieros	2020-12-10	2025-11-25	4	16	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retecncion en el archivo de gestion 3 años, posteriormente 17 años en el archivo central, transcurrido el tiempo de retención eliminar.	141
19	6	Informes de Gestión Institucional	2020-12-10	2030-11-25	2	18	ELIMINACION	PAPEL / ELECTRONICO	La subserie documental se fundamenta en la Ley 951 de 2005 y en la circular 11 de 2006 expedida por la Contraloria General de la Nación. Una vez cumplido el tiempo de retencion en el archivo central, la documentacion debera ser eliminada, ya que ha persido sus valores primarios y no posee valores secundarios.	142
20	1	Agenda de compromisos	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL	Una vez cumplido el tiempo de retencion en el archivo de gestion 2 años, posteriormente 3 años en el archivo central, transcurrido el tiempo de retención eliminar.	143
20	2	Registro de atención al usuario	2020-12-10	2024-11-25	4	1	ELIMINACION	PAPEL	Una vez cumplido el tiempo de retencion en el archivo de gestion 4 años, transcurrido el tiempo de retención eliminar.	144
20	3	Planillas de Atención al Usuario	2020-12-10	2024-11-25	4	1	ELIMINACION	PAPEL / ELECTRONICO	Una vez cumplido el tiempo de retencion en el archivo de gestion 4 años, transcurrido el tiempo de retención eliminar.	147
20	5	Libro de Control de Citaciones	2020-12-10	2023-11-25	2	3	ELIMINACION	PAPEL	Una vez cumplido el tiempo de retencion en el archivo de gestion 2 años, posteriormente 3 años en el archivo central, transcurrido el tiempo de retención eliminar.	149
20	6	Libros de Citaciones	2020-12-10	2023-11-25	2	3	ELIMINACION	PAPEL	Una vez cumplido el tiempo de retencion en el archivo de gestion 2 años, posteriormente 3 años en el archivo central, transcurrido el tiempo de retención eliminar.	150
20	7	Registro de comunicaciones oficiales (VENTANILLA UNICA DIGITAL)	2020-12-10	2023-11-25	2	3	ELIMINACION	PAPEL	Una vez cumplido el tiempo de retencion en el archivo de gestion 2 años, posteriormente 3 años en el archivo central, transcurrido el tiempo de retención eliminar.	151
20	8	Registro de préstamo documental	2020-12-10	2023-11-25	2	3	ELIMINACION	PAPEL	Una vez cumplido el tiempo de retencion en el archivo de gestion 2 años, posteriormente 3 años en el archivo central, transcurrido el tiempo de retención eliminar.	154
20	9	Registro de transferencias documentales	2020-12-10	2025-11-25	2	5	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total.	155
20	10	Tablas de retención documental	2020-12-10	2025-11-25	2	5	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total.	157
20	11	Tablas de valoración documental	2020-12-10	2025-11-25	2	5	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total.	158
20	12	Títulos de Propiedad	2020-12-10	2025-11-25	2	5	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total.	159
21	1	Inventarios de semillas y material vegetal	2020-12-10	2025-11-25	2	3	ELIMINACION	PAPEL / ELECTRONICO	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio. Teniendo en cuenta que estos documentos no ofrecen posibilidades investigativas, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	162
21	2	Inventarios documentales	2020-12-10	2025-11-25	2	3	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total.	163
21	3	Inventarios generales de bienes muebles e inmuebles	2020-12-10	2025-11-25	2	3	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Subserie que posee valor probatorio y responsabilidad fiscal, ya que refleja y consolida los activos fijos y los bienes de la entidad. Una vez el Bien Mueble e Inmueble deje de hacer parte del inventario de bienes de la entidad, bien sea por baja o enajenación y cumplido el tiempo de retención se recomienda conservar totalmente para fines de auditorias de entes de control. Ley 42 del 26 de enero 1993 ” sobre la organización del Sistema de Control Fiscal y Financiero y los organismos que lo ejercen”	164
21	4	Inventarios individuales de bienes devolutivos	2020-12-10	2024-11-25	4	1	ELIMINACION	PAPEL / ELECTRONICO	Subserie que tiene valor administrativo, contable, legal einvestigativo, finalizado el período de retención no desarrolla valores secundarios y se procede a la eliminación según procedimiento previsto en Acuerdo 04 de 2013 (art. 15)	165
22	1	Libro Auxiliar de Bancos	2020-12-10	2030-11-25	2	8	ELIMINACION	PAPEL	Debido a que la información del Libro Auxiliar se halla consolidada en los Libros Mayor y Balances, y en los Estados Financieros a 31 de diciembre de cada vigencia anual, pierde sus valores investigativos. Por lo tanto, una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se debe eliminar el soporte de estos documentos, teniendo en cuenta lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo.	166
22	2	Libro Auxiliar de Contabilidad	2020-12-10	2030-11-25	2	8	ELIMINACION	PAPEL	Sin procedimiento parametrizado	167
22	3	Libro Comprobante Diario	2020-12-10	2030-11-25	2	8	ELIMINACION	PAPEL	Sin procedimiento parametrizado	168
22	4	Libro de Presupuesto de Ingresos y Gastos	2020-12-10	2030-11-25	2	8	C.TOTAL / M.TECNOLOGICO	PAPEL	El Libro de presupuestos de ingreso y gastos son una fuente de información para la investigación en estudios económicos de la administración municipal sobre el manejo, distribución y ejecución de los recursos. Sirve para hacer comparativos de la administración de cada alcalde. Por estas razones, son de conservación permanente,  los documentos originales que posean valoreshistóricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio  (Ley 594 de 2000, artículo 19, parágrafo 2).Por lo anterior, una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.  Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	169
22	5	Libro Mayor y Balances	2020-12-10	2030-11-25	2	8	C.TOTAL / M.TECNOLOGICO	PAPEL	El Libro Mayor y Balances es fuente de información para la investigación en estudios económicos de la administración municipal sobre el manejo, distribución y ejecución de los recursos. Sirve para hacer comparativos de la administración de cada alcalde. Por estas razones, son de conservación permanente,  los documentos originales que posean valoreshistóricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio  (Ley 594 de 2000, artículo 19, parágrafo 2). Por lo anterior, una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.  Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	170
23	1	Licencias de Construcción en Modalidades de Obra Nueva, Ampliación, Adecuación, Reconocimiento, Modificación, Urbanismo, Restauración, Reforzamiento Estructural, Demolición, Revalidación Reconstrucción,	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	171
23	2	Licencias de Intervenciones y ocupaciones  del espacio Público	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	172
23	3	Licencias de Parcelación	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	173
23	4	Licencias de Subdivisión	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	174
23	5	Licencias de Transporte de Semovientes	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	175
23	6	Licencias Urbanísticas	2020-12-10	2038-11-25	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias.	176
24	1	Manuales de funciones por dependencia	2020-12-10	2025-11-25	2	3	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Cumplido el tiempo de retención, se procede a conservar la documentación en medio tecnologico, debido a que la información procedimental debe ser conservada por constribuir a la historia organizacional.	180
24	2	Manuales específicos de funciones y requisitos	2020-12-10	2025-11-25	2	3	C.TOTAL / M.TECNOLOGICO	PAPEL / ELECTRONICO	Cumplido el tiempo de retención, se procede a conservar la documentación en medio tecnologico, debido a que la información procedimental debe ser conservada por constribuir a la historia organizacional.	181
25	2	Plan Agropecuario Municipal	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	183
25	3	Plan Anual de Adquisiciones	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	184
25	4	Plan de Accion	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	185
25	5	Plan de Asistencia Técnica	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	186
25	6	Plan de Bienestar Social y Estimulo Laboral	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	187
25	7	Plan de Convivencia social y salud mental	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	188
25	8	Plan de Dotación y Fortalecimiento de la Colección de la Biblioteca Municipal	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	189
25	9	Plan de Educación Municipal	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	190
25	10	Plan de Incentivos	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	191
25	11	Plan de Inducción y Reinducción	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	192
25	12	Plan de Movilidad	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	193
25	13	Plan de Ordenamiento Territorial - POT	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	194
25	14	Plan de Salud Publica de Intervenciones Colectivas	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	195
25	15	Plan de Seguridad alimentaria y nutricional Actividades del PIC Municipal	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	196
25	16	Plan de Seguridad y Privacidad de la Información	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	197
25	17	Plan de Señalización y Demarcación	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	198
25	18	Plan de Turismo Municipal	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	199
25	19	Plan de Vida Saludable y enfermedades transmisibles	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	200
25	20	Plan de Vivienda	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	201
25	21	Plan Estratégico de Seguridad Vial	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	202
25	22	Plan Estratégico de Tecnologías de la Información y las Comunicaciones PETI	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	203
25	23	Plan Indicativo	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	204
25	24	"Plan Institucional de Gestión Ambiental ""PIGA""."	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	205
25	25	Plan Institucionales de Capacitaciones - PIC	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	206
25	26	Plan Local de Salud	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	207
25	27	Plan Local de Seguridad Vial	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	208
25	28	Plan Operativo Anual de inversión Municipal POAIM	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	209
25	29	Plan Operativo Anual de Salud Pública	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	210
25	30	Plan Vacaciones Personal	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	211
25	31	Planes de Desarrollo Municipal	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	212
25	32	Planes de Mejoramiento	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	213
25	33	Planes municipales para la prevención y atención de emergencias y desastres	2020-12-10	2030-11-25	2	8	CONSERVACION TOTAL	PAPEL	Cumplido 2 años en el Archivo de Gestión se transfiere al Archivo Central para un tiempo de retención de 8 años, para su conservación total por tratarse de documentos que permiten garantizar la trazabilidad en la implementación de planes, programas y proyectos.	214
26	1	Presupuestos -Ejecuciones	2020-12-10	2025-11-25	2	5	C.TOTAL / M.TECNOLOGICO	PAPEL	Serie documental de vital importancia para el logro de los objetivos del plan de gobierno de la Alcaldia Municipal de Tenjo, su conservación será permanente.	215
27	1	Procesos Administrativos de Restablecimiento de Derechos	2020-12-10	2025-11-25	2	5	C.TOTAL / M.TECNOLOGICO	PAPEL	Serie documental de vital importancia para el logro de los objetivos del plan de gobierno de la Alcaldia Municipal de Tenjo, su conservación será permanente.	216
27	2	Procesos de Reconocimiento Voluntario de Paternidad	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	217
27	3	Procesos de Violencia intrafamiliar	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	218
28	1	Procesos calibracion de surtidores de combustibles	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	219
28	2	Contravenciones en general	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	220
28	3	Procesos de control de establecimientos de comercio	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	221
28	4	Procesos de control de Pesos y Medidas	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	222
28	5	Procesos de Despachos comisorios	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	223
28	6	Procesos Querellas Policivas	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	224
29	1	Programa Primera Infancia	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	225
29	2	Programas Anual de Auditoria	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	226
29	3	Programa Adulto Mayor	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	227
29	4	Programa Alianzas con Entidades Educativas para la formación.	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	228
29	5	Programa Alianzas con Entidades Educativas y/o formación Empresarial	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	229
29	6	Programa Alimentación Escolar PAE	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	230
29	7	Programa Asociación de Artesanos	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	231
29	8	Programa Colombia Mayor	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	232
29	9	Programa Computadores para Educar	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	233
29	10	Programa de Apoyo a los Artesanos	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	234
29	11	Programa de apoyo ASOFAMAS	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	235
29	12	Programa de Aseguramiento Régimen Subsidiado	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	236
29	13	Programa de Atención Integral a la población Victima del Conflicto Armado	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	237
29	14	Programa de bienestar del Talento Humano	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	238
29	15	Programa de Discapacidad	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	239
29	16	Programa de Empleabilidad	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	240
29	17	Programa de Esterilización Canina y Felina	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	241
29	18	Programa de gestión de calidad	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	242
29	19	Programa de Gestión Documental	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	243
29	20	Programa de Inducción y Re inducción	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	244
29	21	Programa de Juveniles	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	245
29	22	Programa de Registro de Notificaciones semanales de Violencia Intrafamiliar,	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	246
29	23	Programa de Seguimiento a convenios centro de protección al Adulto Mayor	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	247
29	24	Programa de Urgencias Veterinarias	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	248
29	25	Programa de Vivienda de Interés Social y/o mejoramiento de vivienda.	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	249
29	26	Programa Estudiantes beneficiados en transporte escolar planillas Rutas	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	250
29	27	Programa Ferias Artesanales y Empresariales	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	251
29	28	Programa Fondo de educación superior subsidio matricula.	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	252
29	29	Programa Fortalecimiento y emprendimiento empresarial	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	253
29	30	Programa Nutricional Gobernación	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	254
29	31	Programa Nutricional ICBF	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	255
29	32	Programas de Infraestructura	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	256
29	33	Programa subsidio de Transporte Universitario Beneficiarios y no beneficiarios	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	257
29	34	Programa subsidio matricula no admitidos (Fondo de educación superior)	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	258
29	35	Programas anuales de caja (PAC)	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	259
29	36	Programas de asistencia técnica agrícola	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	260
29	37	Programas de asistencia técnica pecuaria	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	261
29	38	Programas de Capacitación	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	262
29	39	Programas de Equidad y Género	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	263
29	40	Programas de Familias en Acción	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	264
29	41	Programas de Perfil Epidemiológico - ASIS	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	265
29	42	Programas de Prevención de Violencia Intrafamiliar, abuso sexual y maltrato	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	266
29	43	Programas de promoción y prevención	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	267
29	44	Programas de Salud Publica	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	268
29	45	Programas de Transporte escolar	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	269
29	46	Programas de vigilancia epidemiológica de la salud de los trabajadores	2020-12-10	2023-11-25	2	3	CONSERVACION TOTAL	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 2000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	270
30	1	Banco de Proyectos	2020-12-10	2040-12-31	2	18	CONSERVACION TOTAL	PAPEL	"Debido a que la serie ofrece posibilidades investigativas en diversos ámbitos de las ciencias humanas, se debe seleccionar un porcentaje para conservación permanente sobre aquellos Proyectos de Acuerdo en temas relacionados con Programas de Desarrollo de alto impacto social, en infraestructura, educación, cultura, salud, entre otros, para cada administración de Gobierno.  Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio. La alcaldía municipal determinara el proceso de selección teniendo en cuenta que este puede realizarse cuantitativa y cualitativamente. La selección cuantitativa se relaciona con la definición de un porcentaje de muestra el cual debe considerar el volumen de producción documental anual	271
30	2	Proyecto de compra de predios	2020-12-10	2040-12-31	2	18	CONSERVACION TOTAL	PAPEL	"Debido a que la serie ofrece posibilidades investigativas en diversos ámbitos de las ciencias humanas, se debe seleccionar un porcentaje para conservación permanente sobre aquellos Proyectos de Acuerdo en temas relacionados con Programas de Desarrollo de alto impacto social, en infraestructura, educación, cultura, salud, entre otros, para cada administración de Gobierno.  Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio. La alcaldía municipal determinara el proceso de selección teniendo en cuenta que este puede realizarse cuantitativa y cualitativamente. La selección cuantitativa se relaciona con la definición de un porcentaje de muestra el cual debe considerar el volumen de producción documental anual	272
30	3	Proyecto de Inversión	2020-12-10	2040-12-31	2	18	CONSERVACION TOTAL	PAPEL	"Debido a que la serie ofrece posibilidades investigativas en diversos ámbitos de las ciencias humanas, se debe seleccionar un porcentaje para conservación permanente sobre aquellos Proyectos de Acuerdo en temas relacionados con Programas de Desarrollo de alto impacto social, en infraestructura, educación, cultura, salud, entre otros, para cada administración de Gobierno.  Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio. La alcaldía municipal determinara el proceso de selección teniendo en cuenta que este puede realizarse cuantitativa y cualitativamente. La selección cuantitativa se relaciona con la definición de un porcentaje de muestra el cual debe considerar el volumen de producción documental anual	273
30	4	Proyectos de Acuerdo Municipal	2020-12-10	2040-12-31	2	18	CONSERVACION TOTAL	PAPEL	"Debido a que la serie ofrece posibilidades investigativas en diversos ámbitos de las ciencias humanas, se debe seleccionar un porcentaje para conservación permanente sobre aquellos Proyectos de Acuerdo en temas relacionados con Programas de Desarrollo de alto impacto social, en infraestructura, educación, cultura, salud, entre otros, para cada administración de Gobierno.  Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio. La alcaldía municipal determinara el proceso de selección teniendo en cuenta que este puede realizarse cuantitativa y cualitativamente. La selección cuantitativa se relaciona con la definición de un porcentaje de muestra el cual debe considerar el volumen de producción documental anual	274
30	5	Proyectos de presupuesto	2020-12-10	2040-12-31	2	18	CONSERVACION TOTAL	PAPEL	"Debido a que la serie ofrece posibilidades investigativas en diversos ámbitos de las ciencias humanas, se debe seleccionar un porcentaje para conservación permanente sobre aquellos Proyectos de Acuerdo en temas relacionados con Programas de Desarrollo de alto impacto social, en infraestructura, educación, cultura, salud, entre otros, para cada administración de Gobierno.  Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio. La alcaldía municipal determinara el proceso de selección teniendo en cuenta que este puede realizarse cuantitativa y cualitativamente. La selección cuantitativa se relaciona con la definición de un porcentaje de muestra el cual debe considerar el volumen de producción documental anual	275
31	1	Resoluciones Municipales	2020-12-10	2040-12-31	2	18	C.TOTAL / M.TECNOLOGICO	PAPEL	Una vez la Subserie cumpla los tiempos de retención contados a partir del cierre del expediente o trámite que le dio inicio, se deben transferir al Archivo Histórico para su conservación total, de acuerdo con lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura, en su Capítulo I, Artículo 2.8.2.1.5. De los Archivos Generales Territoriales y el Capítulo IX, Artículo 2.8.2.9.1 Transferencias secundarias. Además, la Ley 594 de 1000, artículo 19, parágrafo 2.  Los documentos originales que posean valores históricos no podrán ser destruidos, aun cuando hayan sido reproducidos y/o almacenados mediante cualquier medio .	276
32	1	Expediente Terapéutico Discapacidad	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Cumplido en tiemp de retención, se procede a seleccionar un 10% de la documentación con el fin de dar testimonio de los programas y acciones adelantadas a nivel territorial para esta poblacion. Decreto 2082 de 1996.	277
32	2	Expediente Terapéutico Barreras de Aprendizaje	2020-12-10	2030-11-25	2	8	SELECCION	PAPEL	Cumplido en tiemp de retención, se procede a seleccionar un 10% de la documentación con el fin de dar testimonio de los programas y acciones adelantadas a nivel territorial para esta poblacion. Decreto 2082 de 1996.	278
11	1	Consecutivo de Comunicaciones enviadas	2021-01-14	2025-01-08	2	2	2	Electronico	Copia de las comunicaciones oficiales enviadas que conforman un registro consecutivo en razón del número de radicación y se administran en la unidad de correspondencia o la que haga sus veces. Artículo 11, Acuerdo 060 de 2001; se debe eliminar el soporte de estos documentos, de acuerdo a lo establecido en el Decreto 1080 de 2015 del Ministerio de Cultura en el Artículo 2.8.2.2.5 Eliminación de documentos, dejando constancia mediante Inventario y Acta de Eliminación aprobada por el Comité Interno de Archivo	96
11	3	Consecutivo de Comunicaciones internas	2021-01-14	2025-01-08	2	2	1	ELECTRONICO		279
\.


--
-- Data for Name: sgd_sed_sede; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_sed_sede (sgd_sed_codi, sgd_sed_desc) FROM stdin;
\.


--
-- Data for Name: sgd_senuf_secnumfe; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_senuf_secnumfe (sgd_senuf_codi, sgd_pnufe_codi, depe_codi, sgd_senuf_sec) FROM stdin;
\.


--
-- Data for Name: sgd_sexp_secexpedientes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_sexp_secexpedientes (sgd_exp_numero, sgd_srd_codigo, sgd_sbrd_codigo, sgd_sexp_secuencia, depe_codi, usua_doc, sgd_sexp_fech, sgd_fexp_codigo, sgd_sexp_ano, usua_doc_responsable, sgd_sexp_parexp1, sgd_sexp_parexp2, sgd_sexp_parexp3, sgd_sexp_parexp4, sgd_sexp_parexp5, sgd_pexp_codigo, sgd_exp_fech_arch, sgd_fld_codigo, sgd_exp_fechflujoant, sgd_mrd_codigo, sgd_exp_subexpediente, sgd_exp_privado, sgd_sexp_estado) FROM stdin;
20219981110000001E	11	1	1	998	1234567890	2021-02-23	0	2021	1234567890	COMUNICACIONES (998)	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0
20219981110000002E	11	1	2	998	1234567890	2021-02-23	0	2021	1234567890	COMUNICACIONES DOS (998)	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0
20219981120000003E	11	2	3	998	1234567890	2021-03-31	0	2021	1234567890	skinatech (998)	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0
20219981120000004E	11	2	4	998	1234567890	2021-04-13	0	2021	1234567890	INFORMATIVAS (998)	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0
\.


--
-- Data for Name: sgd_srd_seriesrd; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_srd_seriesrd (sgd_srd_codigo, sgd_srd_descrip, sgd_srd_fechini, sgd_srd_fechfin) FROM stdin;
1	ACCIONES CONSTITUCIONALES	2020-12-10	2550-12-31
2	ACTAS	2020-12-10	2550-12-31
3	ADMINISTRACION DE PERSONAL	2020-12-10	2550-12-31
4	AUTORIZACIONES	2020-12-10	2550-12-31
5	CERTIFICACIONES	2020-12-10	2550-12-31
6	CIRCULARES	2020-12-10	2550-12-31
7	COMPROBANTES DE ALMACEN	2020-12-10	2550-12-31
8	COMPROBANTES DE CONTABILIDAD	2020-12-10	2550-12-31
9	CONCEPTOS	2020-12-10	2550-12-31
10	CONCILIACIONES BANCARIAS	2020-12-10	2550-12-31
12	CONTRATOS	2020-12-10	2550-12-31
13	CONVENIOS	2020-12-10	2550-12-31
14	DECLARACIONES POR RECAUDO DE IMPUESTOS MUNICIPALES	2020-12-10	2550-12-31
15	DECRETOS MUNICIPALES	2020-12-10	2550-12-31
16	DERECHOS DE PETICIÓN	2020-12-10	2550-12-31
17	FICHAS	2020-12-10	2550-12-31
18	HISTORIAL	2020-12-10	2550-12-31
19	INFORMES	2020-12-10	2550-12-31
20	INSTRUMENTOS DE DESCRIPCION Y CONSULTA	2020-12-10	2550-12-31
21	INVENTARIOS	2020-12-10	2550-12-31
22	LIBROS CONTABLES	2020-12-10	2550-12-31
23	LICENCIAS	2020-12-10	2550-12-31
24	MANUALES	2020-12-10	2550-12-31
25	PLANES	2020-12-10	2550-12-31
26	PRESUPUESTOS	2020-12-10	2550-12-31
27	PROCESOS	2020-12-10	2550-12-31
28	PROCESOS POLICIVOS	2020-12-10	2550-12-31
29	PROGRAMAS	2020-12-10	2550-12-31
30	PROYECTOS	2020-12-10	2550-12-31
31	RESOLUCIONES MUNICIPALES	2020-12-10	2550-12-31
32	UNIDAD DE ATENCION INTEGRAL UAID	2020-12-10	2550-12-31
11	COMUNICACIONES OFICIALES	2021-01-04	2026-01-21
\.


--
-- Data for Name: sgd_tar_tarifas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tar_tarifas (sgd_fenv_codigo, sgd_tar_codser, sgd_tar_codigo, sgd_tar_valenv1, sgd_tar_valenv2, sgd_tar_valenv1g1, sgd_clta_codser, sgd_tar_valenv2g2, sgd_clta_descrip) FROM stdin;
4	\N	1	866	866	0	1	0	\N
5	\N	1	1337	1337	0	1	0	\N
8	\N	1	3412	3412	0	1	0	\N
7	\N	1	14259	14259	0	1	0	\N
6	\N	1	10694	10694	0	1	0	\N
3	\N	1	59	59	0	1	0	\N
1	\N	1	214	214	0	1	0	\N
2	\N	1	109	109	0	1	0	\N
9	\N	1	1	1	0	1	0	\N
\.


--
-- Data for Name: sgd_tdec_tipodecision; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tdec_tipodecision (sgd_apli_codi, sgd_tdec_codigo, sgd_tdec_descrip, sgd_tdec_sancionar, sgd_tdec_firmeza, sgd_tdec_versancion, sgd_tdec_showmenu, sgd_tdec_updnotif, sgd_tdec_veragota) FROM stdin;
\.


--
-- Data for Name: sgd_tid_tipdecision; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tid_tipdecision (sgd_tid_codi, sgd_tid_desc, sgd_tpr_codigo, sgd_pexp_codigo, sgd_tpr_codigop) FROM stdin;
\.


--
-- Data for Name: sgd_tidm_tidocmasiva; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tidm_tidocmasiva (sgd_tidm_codi, sgd_tidm_desc) FROM stdin;
1	PLANTILLA
2	CSV
\.


--
-- Data for Name: sgd_tip3_tipotercero; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tip3_tipotercero (sgd_tip3_codigo, sgd_dir_tipo, sgd_tip3_nombre, sgd_tip3_desc, sgd_tip3_imgpestana, sgd_tpr_tp1, sgd_tpr_tp2, sgd_tpr_tp4) FROM stdin;
1	\N	\N	\N	\N	0	0	1
\.


--
-- Data for Name: sgd_tma_temas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tma_temas (sgd_tma_codigo, depe_codi, sgd_prc_codigo, sgd_tma_descrip) FROM stdin;
\.


--
-- Data for Name: sgd_tme_tipmen; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tme_tipmen (sgd_tme_codi, sgd_tme_desc) FROM stdin;
\.


--
-- Data for Name: sgd_tpr_tpdcumento; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tpr_tpdcumento (sgd_tpr_codigo, sgd_tpr_descrip, sgd_tpr_termino, sgd_tpr_tpuso, sgd_tpr_numera, sgd_tpr_radica, sgd_tpr_tp1, sgd_tpr_tp2, sgd_tpr_estado, sgd_termino_real, sgd_tpr_web, sgd_tpr_tiptermino, sgd_tpr_tp4) FROM stdin;
29	Actas de Justicia Transicional	30	\N	\N	1	0	0	1	\N	0	\N	1
111	Certificaciones de devolución	30	\N	\N	1	1	1	1	\N	0	\N	1
112	Certificaciones de estudio	30	\N	\N	1	1	1	1	\N	0	\N	1
499	Felicitaciones	0	\N	\N	1	0	1	1	\N	1	\N	1
18	Acta de terminación	0	\N	\N	1	1	1	1	0	0	\N	1
113	Certificaciones de estudios académicos	30	\N	\N	1	1	1	1	\N	0	\N	1
114	Certificaciones de experiencia de trabajo	30	\N	\N	1	1	1	1	\N	0	\N	1
501	respuesta	45	\N	\N	0	1	0	1	\N	0	\N	0
115	Certificaciones De Uso Del Suelo	30	\N	\N	1	1	1	1	\N	0	\N	1
116	Certificaciones De Viabilidad Del Uso Del Suelo	30	\N	\N	1	1	1	1	\N	0	\N	1
117	Certificaciones Demarcaciones Del Inmueble	30	\N	\N	1	1	1	1	\N	0	\N	1
118	Certificado de afiliación a la ARL	30	\N	\N	1	1	1	1	\N	0	\N	1
92	Avisos	30	\N	\N	1	1	1	1	\N	0	\N	1
120	Certificado de antecedentes fiscales	30	\N	\N	1	1	1	1	\N	0	\N	1
121	Certificado de antecedentes judiciales	30	\N	\N	1	1	1	1	\N	0	\N	1
122	Certificado de aportes a parafiscales	30	\N	\N	1	1	1	1	\N	0	\N	1
123	Certificado de aportes a seguridad social	30	\N	\N	1	1	1	1	\N	0	\N	1
146	Citaciones	30	\N	\N	1	1	1	1	\N	0	\N	1
502	Traslado por competencia 	5	\N	\N	1	1	1	1	\N	0	\N	1
124	Certificado de aportes parafiscales	30	\N	\N	1	1	1	1	\N	0	\N	1
238	Estudios de Suelos	30	\N	\N	1	0	0	1	\N	0	\N	1
125	Certificado de aptitud laboral (examen médico de ingreso)	30	\N	\N	1	1	1	1	\N	0	\N	1
126	Certificado de Calibración	30	\N	\N	1	1	1	1	\N	0	\N	1
127	Certificado de Disponibilidad Presupuestal	30	\N	\N	1	1	1	1	\N	0	\N	1
128	Certificado de disponibilidad presupuestal	30	\N	\N	1	1	1	1	\N	0	\N	1
129	Certificado de existencia y representación legal	30	\N	\N	1	1	1	1	\N	0	\N	1
130	Certificado de existencia y representación legal (personas Juridicas)	30	\N	\N	1	1	1	1	\N	0	\N	1
131	Certificado de inscripción ante el RUNT Seguro Obligatorio-SOAT	30	\N	\N	1	1	1	1	\N	0	\N	1
132	Certificado de insuficiencia o inexistencia de personal en planta	30	\N	\N	1	1	1	1	\N	0	\N	1
133	Certificado de la Revisión Tecnicomecánica y de Emisiones Contaminantes	30	\N	\N	1	1	1	1	\N	0	\N	1
134	Certificado de presentación del informe ejecutivo anual de evaluación al Sistema de Control Interno	30	\N	\N	1	1	1	1	\N	0	\N	1
135	Certificado de registro presupuestal	30	\N	\N	1	1	1	1	\N	0	\N	1
136	Certificado de tradición y libertad de inmueble	30	\N	\N	1	1	1	1	\N	0	\N	1
137	Certificado del SISBEN	30	\N	\N	1	1	1	1	\N	0	\N	1
138	Certificado finaciero de deuda cancelada	30	\N	\N	1	1	1	1	\N	0	\N	1
139	Certificado registro presupuestal	30	\N	\N	1	1	1	1	\N	0	\N	1
140	Certificados de antecedentes fiscales	30	\N	\N	1	1	1	1	\N	0	\N	1
141	Certificados de Disponibilidad Presupuestal	30	\N	\N	1	1	1	1	\N	0	\N	1
142	Certificados de registro presupuestal	30	\N	\N	1	1	1	1	\N	0	\N	1
143	Certificados de Residencia	30	\N	\N	1	1	1	1	\N	0	\N	1
144	Certificados de responsabilidad estructural	30	\N	\N	1	1	1	1	\N	0	\N	1
145	Circulares	30	\N	\N	1	1	1	1	\N	0	\N	1
147	Comparendos fisicos	30	\N	\N	1	1	1	1	\N	0	\N	1
148	Comprobante contable de egresos	30	\N	\N	1	0	0	1	\N	0	\N	1
149	Comprobante contable de Ingreso	30	\N	\N	1	0	0	1	\N	0	\N	1
150	Comprobante de Baja de bienes de almacén	30	\N	\N	1	0	0	1	\N	0	\N	1
151	Comprobante de ingreso de bienes a almacén	30	\N	\N	1	0	0	1	\N	0	\N	1
152	Comprobantes de contabilidad	30	\N	\N	1	0	0	1	\N	0	\N	1
153	Compromisos	30	\N	\N	1	0	0	1	\N	0	\N	1
154	Comunicaciones con otras entidades	30	\N	\N	1	1	1	1	\N	0	\N	1
155	Comunicaciones oficiales	30	\N	\N	1	1	1	1	\N	0	\N	1
156	Comunicaciones oficiales consecutivo PQRS	30	\N	\N	1	1	1	1	\N	0	\N	1
157	Concepto de viabilidad	30	\N	\N	1	1	1	1	\N	0	\N	1
158	Concepto del bien	30	\N	\N	1	1	1	1	\N	0	\N	1
159	Concepto jurídico	30	\N	\N	1	1	1	1	\N	0	\N	1
160	Conceptos	30	\N	\N	1	1	1	1	\N	0	\N	1
161	Conceptos De Normas Urbanísticas	30	\N	\N	1	1	1	1	\N	0	\N	1
162	Conceptos De Reparaciones Locativas	30	\N	\N	1	1	1	1	\N	0	\N	1
163	Conceptos Técnicos	30	\N	\N	1	1	1	1	\N	0	\N	1
164	Conceptos Técnicos Agropecuarios	30	\N	\N	1	1	1	1	\N	0	\N	1
165	Conceptos Técnicos Ambientales	30	\N	\N	1	1	1	1	\N	0	\N	1
166	Conciliación Bancaria	30	\N	\N	1	1	1	1	\N	0	\N	1
167	Constancia ejecutoria	30	\N	\N	1	1	1	1	\N	0	\N	1
168	Construcción adecuación y manetenimiento de andenes senderos peatonales y ciclorutas	30	\N	\N	1	1	1	1	\N	0	\N	1
169	Construcción ampliación y mantenimiento   Infraestructura Fisica Educativa	30	\N	\N	1	1	1	1	\N	0	\N	1
170	Construcción ampliación y mantenimiento  Infraestructura  Alumbrado Público	30	\N	\N	1	1	1	1	\N	0	\N	1
171	Construcción ampliación y mantenimiento Infraestructura Adulto Mayor	30	\N	\N	1	1	1	1	\N	0	\N	1
172	Construcción ampliación y mantenimiento Infraestructura Fisica Cultural	30	\N	\N	1	1	1	1	\N	0	\N	1
173	Construcción ampliación y mantenimiento Infraestructura Fisica Deportiva	30	\N	\N	1	1	1	1	\N	0	\N	1
174	Construcción ampliación y mantenimiento Infraestructura Personas Diversamente Hábiles	30	\N	\N	1	1	1	1	\N	0	\N	1
251	Fallos	30	\N	\N	1	1	1	1	\N	0	\N	1
474	Solicitud de información	30	\N	\N	1	1	1	1	\N	0	\N	1
497	Tutelas	1	\N	\N	1	0	1	1	1	0	\N	1
175	Construcción ampliación y mantenimiento Infraestructura Primera Infancia	30	\N	\N	1	1	1	1	\N	0	\N	1
176	Contenido de la publicidad	30	\N	\N	1	1	1	1	\N	0	\N	1
177	Contestación de la demanda	30	\N	\N	1	1	1	1	\N	0	\N	1
178	Contestación del recurso	30	\N	\N	1	1	1	1	\N	0	\N	1
179	Convocatorias de Emprendimiento	30	\N	\N	1	0	1	1	\N	0	\N	1
180	Convocatorias públicas	30	\N	\N	1	0	1	1	\N	0	\N	1
181	Copia certificado de libertad	30	\N	\N	1	1	1	1	\N	0	\N	1
182	Copia de facturas	30	\N	\N	1	1	1	1	\N	0	\N	1
183	Copia recibo del impuesto predial cancelado	30	\N	\N	1	1	1	1	\N	0	\N	1
184	Copias documentos de identidad	30	\N	\N	1	0	1	1	\N	0	\N	1
185	Cronogramas de actividades	30	\N	\N	1	0	0	1	\N	0	\N	1
186	Cuadros de clasificación documental	30	\N	\N	1	1	1	1	\N	0	\N	1
187	Cuenta de cobro	30	\N	\N	1	0	0	1	\N	0	\N	1
188	Datos de hogares Sisbenizados (software SISBEN III)	30	\N	\N	1	1	1	1	\N	0	\N	1
189	Declaración de Bienes y Rentas	30	\N	\N	1	1	1	1	\N	0	\N	1
190	Declaraciones por Recaudo de Impuesto Aportes y participaciones	30	\N	\N	1	1	1	1	\N	0	\N	1
193	Declaraciones por Recaudo de Impuesto de Industria y Comercio	30	\N	\N	1	1	1	1	\N	0	\N	1
194	Declaraciones por Recaudo de Impuesto de Multas	30	\N	\N	1	1	1	1	\N	0	\N	1
195	Declaraciones por Recaudo de Impuesto de Rentas contractuales	30	\N	\N	1	1	1	1	\N	0	\N	1
196	Declaraciones por Recaudo de Impuesto de Sobretasa a la Gasolina	30	\N	\N	1	1	1	1	\N	0	\N	1
197	Declaraciones por Recaudo de Impuesto de Tasas	30	\N	\N	1	1	1	1	\N	0	\N	1
198	Declaraciones por Recaudo de Impuesto Predial	30	\N	\N	1	1	1	1	\N	0	\N	1
199	Declaraciones por Recaudo de Impuesto Rifas Municipales	30	\N	\N	1	1	1	1	\N	0	\N	1
200	Decretos	30	\N	\N	1	1	1	1	\N	0	\N	1
202	Demarcación del predio	30	\N	\N	1	1	1	1	\N	0	\N	1
205	Desarrollo de eventos	30	\N	\N	1	1	1	1	\N	0	\N	1
206	Designación de comité evaluador	30	\N	\N	1	1	1	1	\N	0	\N	1
207	Despachos comisorios	30	\N	\N	1	1	1	1	\N	0	\N	1
208	Diagnostico	30	\N	\N	1	1	1	1	\N	0	\N	1
209	Diagnóstico de las necesidades de aprendizaje	30	\N	\N	1	0	0	1	\N	0	\N	1
210	Diagnóstico de necesidades	30	\N	\N	1	0	0	1	\N	0	\N	1
211	Diagnostico documental	30	\N	\N	1	0	0	1	\N	0	\N	1
212	Dictamen técnico del Consejo Consultivo de Ordenamiento Territorial en el que se conceptúa favorablemente respecto a la revisión	30	\N	\N	1	0	0	1	\N	0	\N	1
213	Diseño geometrico de via	30	\N	\N	1	0	0	1	\N	0	\N	1
214	Diseño y Contrucción Sistema Aprovechamiento de   Plantas de Tratamiento de agua	30	\N	\N	1	0	0	1	\N	0	\N	1
215	Disponibilidad inmediata de servicios públicos	30	\N	\N	1	0	0	1	\N	0	\N	1
216	Documento Técnico de Soporte de la revisión que explica las decisiones adoptadas en el proyecto de acuerdo	30	\N	\N	1	0	0	1	\N	0	\N	1
217	Documentos requisitos postulante	30	\N	\N	1	0	0	1	\N	0	\N	1
218	Dotación de unidades sanitarias	30	\N	\N	1	0	0	1	\N	0	\N	1
219	Emplazamientom para decalrar y para corregir	30	\N	\N	1	0	0	1	\N	0	\N	1
220	Entrega de Insumos agropecuariso	30	\N	\N	1	0	0	1	\N	0	\N	1
221	Escrito de recurso	30	\N	\N	1	0	0	1	\N	0	\N	1
222	Escrito descargos	30	\N	\N	1	0	0	1	\N	0	\N	1
223	Escrito recurso de apelación	30	\N	\N	1	0	0	1	\N	0	\N	1
224	Escritura Pública	30	\N	\N	1	0	0	1	\N	0	\N	1
225	Especificaciones técnicas del producto o servicio	30	\N	\N	1	0	0	1	\N	0	\N	1
226	Estado de Cambios en el Patrimonio	30	\N	\N	1	0	0	1	\N	0	\N	1
227	Estado de Cambios en la Situación Financiera	30	\N	\N	1	0	0	1	\N	0	\N	1
228	Estado de Flujos de Efectivo	30	\N	\N	1	1	1	1	\N	0	\N	1
229	Estado de Inventarios	30	\N	\N	1	0	0	1	\N	0	\N	1
230	Estado de Resultados	30	\N	\N	1	0	0	1	\N	0	\N	1
231	Estados de Costos	30	\N	\N	1	1	1	1	\N	0	\N	1
232	Estados de Liquidación	30	\N	\N	1	1	1	1	\N	0	\N	1
233	Estados Financieros Consolidados	30	\N	\N	1	1	1	1	\N	0	\N	1
234	Estados Financieros de Períodos Intermedios	30	\N	\N	1	1	1	1	\N	0	\N	1
235	Estados Financieros Extraordinarios	30	\N	\N	1	1	1	1	\N	0	\N	1
294	Inventario documental archivo de gestión	30	\N	\N	1	0	0	1	30	0	\N	1
236	Estudio de conveniencia y oportunidad	30	\N	\N	1	0	0	1	\N	0	\N	1
68	Auto de archivo	30	\N	\N	1	0	0	1	\N	0	\N	1
491	Sugerencias	30	\N	\N	1	0	1	1	30	1	\N	1
204	Derecho de petición	30	\N	\N	1	0	1	1	30	0	\N	1
203	Denuncia	30	\N	\N	1	1	1	1	\N	1	\N	1
420	Queja	30	\N	\N	1	0	1	1	30	1	\N	1
347	Petición	30	\N	\N	1	0	1	0	30	1	\N	1
283	Informe	0	\N	\N	1	1	1	1	0	0	\N	1
237	Estudios de evaluación de factores de selección	30	\N	\N	1	0	0	1	\N	0	\N	1
239	Estudios de viabilidad	30	\N	\N	1	1	1	1	\N	0	\N	1
240	Estudios jurídicos	30	\N	\N	1	1	1	1	\N	0	\N	1
241	Estudios previos	30	\N	\N	1	1	1	1	\N	0	\N	1
242	Estudios técnicos	30	\N	\N	1	1	1	1	\N	0	\N	1
243	Estudios técnicos de soporte sobre los hechos condiciones o circunstancias que dan lugar a la revisión según sea el caso	30	\N	\N	1	1	1	1	\N	0	\N	1
244	Evaluación	30	\N	\N	1	1	1	1	\N	0	\N	1
245	Evaluación inicial del sistema de seguridad y salud en el trabajo	30	\N	\N	1	1	1	1	\N	0	\N	1
246	Examen médico pre-ocupacional	30	\N	\N	1	1	1	1	\N	0	\N	1
247	Extractos bancarios	30	\N	\N	1	1	1	1	\N	0	\N	1
248	Factura	30	\N	\N	1	1	1	1	\N	0	\N	1
249	Fallo de primera instancia	30	\N	\N	1	1	1	1	\N	0	\N	1
250	Fallo segunda instancia	30	\N	\N	1	1	1	1	\N	0	\N	1
252	Feria Dominical	30	\N	\N	1	1	1	1	\N	0	\N	1
253	Ficha MGA	30	\N	\N	1	1	1	1	\N	0	\N	1
254	Ficha Técnica	30	\N	\N	1	1	1	1	\N	0	\N	1
255	Fichas de eventos	30	\N	\N	1	1	1	1	\N	0	\N	1
256	Fichas del SISBEN	30	\N	\N	1	1	1	1	\N	0	\N	1
257	Formacion para el Emprendimiento	30	\N	\N	1	1	1	1	\N	0	\N	1
258	Formato de Solicitud de Autorizaciones Eventos y Espectáculos	30	\N	\N	1	1	1	1	\N	0	\N	1
259	Formulario de cancelación de registro de contribuyentes del impuesto de industria y comercio	30	\N	\N	1	1	1	1	\N	0	\N	1
260	Formulario unico nacional	30	\N	\N	1	1	1	1	\N	0	\N	1
261	Fotocopia de la factura de servicios públicos domiciliarios de la vivienda	30	\N	\N	1	1	1	1	\N	0	\N	1
262	Garantías	30	\N	\N	1	1	1	1	\N	0	\N	1
263	Garantía única y/o de responsabilidad civil extracontractual	30	\N	\N	1	1	1	1	\N	0	\N	1
264	Hoja de vida de la Función Pública para oferentes personas naturales y personas jurídicas	30	\N	\N	1	1	1	1	\N	0	\N	1
201	Demanda	10	\N	\N	1	1	1	1	\N	0	\N	1
266	Incautaciones o embargos	30	\N	\N	1	1	1	1	\N	0	\N	1
267	Indicadores	30	\N	\N	1	1	1	1	\N	0	\N	1
268	Informe de adjudicación	30	\N	\N	1	1	1	1	\N	0	\N	1
269	Informe de auditoría del Sistema de Gestión de Calidad	30	\N	\N	1	1	1	1	\N	0	\N	1
270	Informe de Ejecución	30	\N	\N	1	1	1	1	\N	0	\N	1
271	Informe de ejecución presupuestal	30	\N	\N	1	1	1	1	\N	0	\N	1
272	Informe de inconsistencias encontradas	30	\N	\N	1	1	1	1	\N	0	\N	1
273	Informe de interventoría	30	\N	\N	1	1	1	1	\N	0	\N	1
274	Informe de supervisión de contrato	30	\N	\N	1	1	1	1	\N	0	\N	1
275	Informe del plan	30	\N	\N	1	1	1	1	\N	0	\N	1
276	Informe del plan Agropecuario Municipal	30	\N	\N	1	1	1	1	\N	0	\N	1
277	Informe ejecutivo anual de evaluación al Sistema de Control Interno	30	\N	\N	1	1	1	1	\N	0	\N	1
278	Informe final de evaluación	30	\N	\N	1	1	1	1	\N	0	\N	1
279	Informe final de verificación del comité y calificación final	30	\N	\N	1	1	1	1	\N	0	\N	1
280	Informe pasivo pensional	30	\N	\N	1	1	1	1	\N	0	\N	1
281	Informe pormenorizado del estado de Control Interno	30	\N	\N	1	1	1	1	\N	0	\N	1
282	Informe preliminar de evaluación	30	\N	\N	1	1	1	1	\N	0	\N	1
288	Inscripciones	30	\N	\N	1	0	0	1	\N	0	\N	1
289	Instructivos	30	\N	\N	1	1	1	1	\N	0	\N	1
290	Instrumento de control del mantenimiento preventivo y correctivo	30	\N	\N	1	1	1	1	\N	0	\N	1
291	Intervención Metros Lineales de Alcantarillado	30	\N	\N	1	1	1	1	\N	0	\N	1
292	Inventario de elementos devolutivos	30	\N	\N	1	1	1	1	\N	0	\N	1
293	Inventarios documentales- Transferencias	30	\N	\N	1	1	1	1	\N	0	\N	1
295	Inventarios de Bienes Generales	30	\N	\N	1	1	1	1	\N	0	\N	1
296	Inventarios de Bienes Individuales	30	\N	\N	1	1	1	1	\N	0	\N	1
297	Invitación pública	30	\N	\N	1	1	1	1	\N	0	\N	1
298	Justificación de contratación directa	30	\N	\N	1	1	1	1	\N	0	\N	1
299	Justificación del Anteproyecto	30	\N	\N	1	1	1	1	\N	0	\N	1
300	Libros Auxiliares de Bancos	30	\N	\N	1	1	1	1	\N	0	\N	1
301	Libros Auxiliares de Caja	30	\N	\N	1	1	1	1	\N	0	\N	1
302	Libros de Registro de Apropiaciones	30	\N	\N	1	1	1	1	\N	0	\N	1
303	Libros de registros de cuentas por pagar	30	\N	\N	1	1	1	1	\N	0	\N	1
304	Libros de registros de ingresos	30	\N	\N	1	1	1	1	\N	0	\N	1
305	Libros de Registros de Reservas Presupuestales	30	\N	\N	1	1	1	1	\N	0	\N	1
306	Libros de Registros de Vigencias Futuras	30	\N	\N	1	1	1	1	\N	0	\N	1
307	Libros Diarios	30	\N	\N	1	1	1	1	\N	0	\N	1
308	Libros Mayores y de Balances	30	\N	\N	1	1	1	1	\N	0	\N	1
309	Licencia de Construcción	30	\N	\N	1	1	1	1	\N	0	\N	1
286	Informes de Gestión	0	\N	\N	1	1	1	1	0	0	\N	1
310	Licencias de exhumación	30	\N	\N	1	1	1	1	\N	0	\N	1
311	Licencias de Inhumación	30	\N	\N	1	1	1	1	\N	0	\N	1
312	Licencias de Transporte de Semovientes	30	\N	\N	1	1	1	1	\N	0	\N	1
284	Informes de Seguimiento	0	\N	\N	0	0	0	1	0	0	\N	0
285	Informes de valoración psicológica	0	\N	\N	0	0	0	1	0	0	\N	0
287	Informes Sistema de Salud Pública -SIVIGILA	0	\N	\N	0	0	0	1	0	0	\N	0
500	OTRO	0	\N	\N	0	0	0	1	0	0	\N	0
346	Permisos Laborales	0	\N	\N	1	1	1	1	0	0	\N	0
313	Lista de oferentes habilitados para participar en la subasta	30	\N	\N	1	0	0	1	\N	0	\N	1
314	Listado de números radicados anulados	30	\N	\N	1	0	0	1	\N	0	\N	1
315	Listado maestro de documentos	30	\N	\N	1	0	0	1	\N	0	\N	1
316	Listados de Asistencia	30	\N	\N	1	0	0	1	\N	0	\N	1
317	Mantenimiento Red Vial Urbana	30	\N	\N	1	0	0	1	\N	0	\N	1
318	Mantenimiento Vías Terciarias	30	\N	\N	1	0	0	1	\N	0	\N	1
319	Manual de Funciones	30	\N	\N	1	0	0	1	\N	0	\N	1
320	Manual de procesos y procedimientos	30	\N	\N	1	0	0	1	\N	0	\N	1
321	Matriz de Ruta Integral de atención	30	\N	\N	1	0	0	1	\N	0	\N	1
322	Memoria justificativa	30	\N	\N	1	0	0	1	\N	0	\N	1
323	Memorias de ayudas	30	\N	\N	1	0	0	1	\N	0	\N	1
324	Memorias de Calculo	30	\N	\N	1	0	0	1	\N	0	\N	1
325	Minuta contractual	30	\N	\N	1	0	0	1	\N	0	\N	1
326	Minuta de contrato o convenio	30	\N	\N	1	1	1	1	\N	0	\N	1
327	Modificaciones	30	\N	\N	1	1	1	1	\N	0	\N	1
328	Nómina	30	\N	\N	1	1	1	1	\N	0	\N	1
329	Notas internas	30	\N	\N	1	0	0	1	\N	0	\N	1
330	Novedades	30	\N	\N	1	1	1	1	\N	0	\N	1
331	Obligaciones	30	\N	\N	1	1	1	1	\N	0	\N	1
332	Obras de Mitigación del Riesgo de Desastres	30	\N	\N	1	0	0	1	\N	0	\N	1
333	Observaciones al proyecto pliego de condiciones	30	\N	\N	1	0	0	1	\N	0	\N	1
334	Observaciones de los oferentes sobre las calificaciones	30	\N	\N	1	0	0	1	\N	0	\N	1
335	Oficios remisiorios	30	\N	\N	1	0	0	1	\N	0	\N	1
336	Orden de compra	30	\N	\N	1	0	0	1	\N	0	\N	1
337	Orden de pago	30	\N	\N	1	0	0	1	\N	0	\N	1
338	Pago Impuesto	30	\N	\N	1	0	0	1	\N	0	\N	1
339	Pagos	30	\N	\N	1	0	0	1	\N	0	\N	1
340	Participacion en eventos empresariales	30	\N	\N	1	0	0	1	\N	0	\N	1
341	Pasado Judicial - Certificado de Antecedentes Penales	30	\N	\N	1	0	0	1	\N	0	\N	1
342	Pavimentación y Construcción de Vías	30	\N	\N	1	0	0	1	\N	0	\N	1
344	Permiso tala de Arboles	30	\N	\N	1	0	0	1	\N	0	\N	1
345	Permisos de Tránsito vehícullos de más de 2 ejes	30	\N	\N	1	0	1	1	\N	0	\N	1
349	Plan  de capacitación	30	\N	\N	1	0	0	1	\N	0	\N	1
350	Plan Agropecuario Municipal	30	\N	\N	1	0	0	1	\N	0	\N	1
351	Plan anual de incentivos institucional	30	\N	\N	1	0	0	1	\N	0	\N	1
352	Plan de acción	30	\N	\N	1	0	0	1	\N	0	\N	1
353	Plan de Asistencia Técnica	30	\N	\N	1	0	0	1	\N	0	\N	1
354	Plan de atención de emergencias ambientales	30	\N	\N	1	0	0	1	\N	0	\N	1
355	Plan de Bienestar Social y Estimulo Laboral	30	\N	\N	1	0	0	1	\N	0	\N	1
356	Plan de contigencia	30	\N	\N	1	0	0	1	\N	0	\N	1
357	Plan de Desarrollo de Ecoturismo	30	\N	\N	1	0	0	1	\N	0	\N	1
358	Plan de manejo ambiental	30	\N	\N	1	0	0	1	\N	0	\N	1
359	Plan de Manejo de Tráfico	30	\N	\N	1	0	1	1	\N	0	\N	1
360	Plan de trabajo anual del Sistema De Seguridad y Salud en el Trabajo	30	\N	\N	1	0	0	1	\N	0	\N	1
361	Plan de Turismo Municipal	30	\N	\N	1	0	0	1	\N	0	\N	1
362	Plan de Vacaciones	30	\N	\N	1	0	0	1	\N	0	\N	1
363	Plan de Vivienda de Interés Social	30	\N	\N	1	0	0	1	\N	0	\N	1
364	Plan indicativo	30	\N	\N	1	0	0	1	\N	0	\N	1
365	Plan Institucional de Archivos - PINAR	30	\N	\N	1	0	0	1	\N	0	\N	1
366	"Plan Institucional de Gestión Ambiental ""PIGA"""	30	\N	\N	1	0	0	1	\N	0	\N	1
367	Plan Local de Salud	30	\N	\N	1	0	0	1	\N	0	\N	1
368	Plan Municipal de Juventud	30	\N	\N	1	0	0	1	\N	0	\N	1
369	Plan operativo anual de inversión	30	\N	\N	1	0	0	1	\N	0	\N	1
370	Plan Operativo Anual de Salud Pública	30	\N	\N	1	0	0	1	\N	0	\N	1
371	Plan Salud Pública de Intervenciones Colectivas	30	\N	\N	1	0	0	1	\N	0	\N	1
372	Planes Anuales de Adquisiciones	30	\N	\N	1	0	0	1	\N	0	\N	1
373	Planillas de control de comunicaciones oficiales	30	\N	\N	1	0	0	1	\N	0	\N	1
374	Plano topografico	30	\N	\N	1	0	0	1	\N	0	\N	1
375	Planos arquitectonicos	30	\N	\N	1	1	1	1	\N	0	\N	1
376	Planos de evacuación	30	\N	\N	1	1	1	1	\N	0	\N	1
377	Planos estructurales	30	\N	\N	1	1	1	1	\N	0	\N	1
378	Planos hidraulicos sanitarios y electricos	30	\N	\N	1	1	1	1	\N	0	\N	1
379	Planos hidraulicos sanitarios y electricos	30	\N	\N	1	1	1	1	\N	0	\N	1
380	Pliego de condiciones	30	\N	\N	1	0	0	1	\N	0	\N	1
381	Plusvalia	30	\N	\N	1	0	1	1	\N	0	\N	1
382	Poder autenticado (apoderado)	30	\N	\N	1	0	0	1	\N	0	\N	1
383	Póliza	30	\N	\N	1	1	1	1	\N	0	\N	1
384	Práctica de pruebas	30	\N	\N	1	0	0	1	\N	0	\N	1
385	Presentación del proyecto a la autoridad ambiental	30	\N	\N	1	0	0	1	\N	0	\N	1
386	Prestamo maquinaria y equipo agropecuario	30	\N	\N	1	0	0	1	\N	0	\N	1
387	Presupuesto Municipal	30	\N	\N	1	1	1	1	\N	0	\N	1
388	Proceso de Exclusión	30	\N	\N	1	1	1	1	\N	0	\N	1
389	Procesos civiles en contra de la entidad	30	\N	\N	1	1	1	1	\N	0	\N	1
390	Procesos civiles iniciados por la entidad	30	\N	\N	1	1	1	1	\N	0	\N	1
391	Procesos contencioso administrativo	30	\N	\N	1	1	1	1	\N	0	\N	1
392	Procesos Laborales	30	\N	\N	1	1	1	1	\N	0	\N	1
455	Respuesta	0	\N	\N	1	1	1	1	0	0	\N	1
393	Procesos Ordinarios	30	\N	\N	1	1	1	1	\N	0	\N	1
394	Procesos Penales	30	\N	\N	1	1	1	1	\N	0	\N	1
395	Programa	30	\N	\N	1	0	0	1	\N	0	\N	1
396	Programa anual de auditoria	30	\N	\N	1	0	0	1	\N	0	\N	1
397	Programa Anual Mensualizado de Caja – PAC	30	\N	\N	1	0	0	1	\N	0	\N	1
398	Programa de capacitación agropecuaria	30	\N	\N	1	0	0	1	\N	0	\N	1
399	Programa de Gestión del Riesgo de Desastres	30	\N	\N	1	0	0	1	\N	0	\N	1
400	Programa de Gobierno	30	\N	\N	1	0	0	1	\N	0	\N	1
401	Programa de Infraestructura  Gas natural	30	\N	\N	1	0	0	1	\N	0	\N	1
402	Programa de Infraestructura  Red Vial	30	\N	\N	1	0	0	1	\N	0	\N	1
403	Programa de primera Infancia	30	\N	\N	1	0	0	1	\N	0	\N	1
404	Programa de Salud Ocupacional	30	\N	\N	1	0	0	1	\N	0	\N	1
405	Programa Mantenimiento Edificios Públicos Municipales	30	\N	\N	1	0	0	1	\N	0	\N	1
406	Programa Mejoramiento Habitat	30	\N	\N	1	0	0	1	\N	0	\N	1
407	Programa Sostenibilidad Ambiental -GIRS	30	\N	\N	1	0	0	1	\N	0	\N	1
408	Programas Anuales Mensualizados de Caja PAC	30	\N	\N	1	0	0	1	\N	0	\N	1
409	Programas de gestión documental	30	\N	\N	1	0	1	1	\N	0	\N	1
410	Programas de Infraestructura Agua Potable y Saneamiento basico	30	\N	\N	1	0	0	1	\N	0	\N	1
411	Programas de infraestructura Redes Eléctricas	30	\N	\N	1	0	0	1	\N	0	\N	1
412	Programas de infraestructura Telefonía y Datos	30	\N	\N	1	0	0	1	\N	0	\N	1
413	Propuestas	30	\N	\N	1	1	1	1	\N	0	\N	1
414	Propuestas no seleccionadas	30	\N	\N	1	0	0	1	\N	0	\N	1
415	Proyecto	30	\N	\N	1	0	0	1	\N	0	\N	1
416	Proyecto Parcelas Demostrativas	30	\N	\N	1	0	0	1	\N	0	\N	1
417	Proyectos de Mantenimiento de Bienes Muebles	30	\N	\N	1	0	0	1	\N	0	\N	1
418	Pruebas	30	\N	\N	1	0	0	1	\N	0	\N	1
419	Publicacion en pagina web	30	\N	\N	1	1	1	1	\N	0	\N	1
421	Radicado de Solicitud	30	\N	\N	1	1	1	1	\N	0	\N	1
422	Ratificación y ampliación de queja Pruebas	30	\N	\N	1	1	1	1	\N	0	\N	1
423	Recibo a satisfacción	30	\N	\N	1	1	1	1	\N	0	\N	1
424	Recibo de pago de impuesto	30	\N	\N	1	1	1	1	\N	0	\N	1
425	Recibos Universales	30	\N	\N	1	0	1	1	\N	0	\N	1
428	Registro de acuerdos comerciales	30	\N	\N	1	1	1	1	\N	0	\N	1
429	Registro de asistencia	30	\N	\N	1	1	1	1	\N	0	\N	1
430	Registro de Clasificación económica de los gastos	30	\N	\N	1	1	1	1	\N	0	\N	1
431	Registro de Modificaciones del PAC	30	\N	\N	1	1	1	1	\N	0	\N	1
432	Registro de novedades de nómina	30	\N	\N	1	1	1	1	\N	0	\N	1
433	Registro de Pagos programados de deuda pública	30	\N	\N	1	1	1	1	\N	0	\N	1
434	Registro de Proyección de Planta de personal del año próximo	30	\N	\N	1	1	1	1	\N	0	\N	1
436	Registro de publicación en página web	30	\N	\N	1	1	1	1	\N	0	\N	1
437	Registro publicación en el SECOP	30	\N	\N	1	1	1	1	\N	0	\N	1
438	Registro Único Tributario	30	\N	\N	1	1	1	1	\N	0	\N	1
439	Registro y Control del PAC	30	\N	\N	1	1	1	1	\N	0	\N	1
440	Registros de Cálculo de los ingresos corrientes por producto	30	\N	\N	1	1	1	1	\N	0	\N	1
441	Relación de bienes a dar baja	30	\N	\N	1	1	1	1	\N	0	\N	1
442	Relación de descuentos de salud pensión parafiscales y cesantías	30	\N	\N	1	1	1	1	\N	0	\N	1
443	Remisión de informe a la entidad correspondiente	30	\N	\N	1	1	1	1	\N	0	\N	1
444	Reporte de comparendos	30	\N	\N	1	1	1	1	\N	0	\N	1
445	Reporte de incidentes	30	\N	\N	1	1	1	1	\N	0	\N	1
446	Reporte SIIF	30	\N	\N	1	1	1	1	\N	0	\N	1
447	Requerimiento Especial	30	\N	\N	1	1	1	1	\N	0	\N	1
448	Requerimiento ordinario	30	\N	\N	1	1	1	1	\N	0	\N	1
449	Resolución de apertura licitación o concurso	30	\N	\N	1	1	1	1	\N	0	\N	1
450	Resolución de justificación de la contratación directa	30	\N	\N	1	1	1	1	\N	0	\N	1
451	Resolución Declaratoria desierta	30	\N	\N	1	1	1	1	\N	0	\N	1
452	Resolución para dar de baja los bienes	30	\N	\N	1	1	1	1	\N	0	\N	1
453	Resoluciones	30	\N	\N	1	1	1	1	\N	0	\N	1
454	Resoluciones definitivas de medidas de protección	30	\N	\N	1	1	1	1	\N	0	\N	1
456	Respuesta a observaciones al pliego de condiciones	30	\N	\N	1	1	1	1	\N	0	\N	1
457	Respuesta Derecho de Petición	30	\N	\N	1	1	1	1	\N	0	\N	1
458	Saneamiento y Manejo de Vertimientos	30	\N	\N	1	0	0	1	\N	0	\N	1
459	Seguimiento	30	\N	\N	1	1	1	1	\N	0	\N	1
460	Seguimiento y Evaluación del POT vigente	30	\N	\N	1	0	1	1	\N	0	\N	1
461	Serivicio de consulta asistencia	30	\N	\N	1	0	0	1	\N	0	\N	1
462	Servicio de consulta agricola	30	\N	\N	1	1	1	1	\N	0	\N	1
463	Servicio de consulta veterinaria	30	\N	\N	1	1	1	1	\N	0	\N	1
465	Solicitud al Consultorio Jurídico de un defensor de oficio	30	\N	\N	1	0	0	1	\N	0	\N	1
466	Solicitud al ordenador del gasto sobre adjudicación del proceso	30	\N	\N	1	0	0	1	\N	0	\N	1
467	Solicitud de adición o prórroga	30	\N	\N	1	1	1	1	\N	0	\N	1
67	Auto de admisión de recurso	30	\N	\N	1	0	0	1	\N	0	\N	1
57	Análisis del sector económico y de los oferentes	30	\N	\N	1	0	0	1	\N	0	\N	1
435	Registro de publicación en el SECOP	0	\N	\N	1	1	1	1	0	0	\N	1
59	Antecedentes propios de tipo contractualInforme de Evaluación contemplando en observaciones	30	\N	\N	1	0	0	1	\N	0	\N	1
60	Anteproyecto del presupuesto de gastos	30	\N	\N	1	0	0	1	\N	0	\N	1
61	Anteproyecto del presupuesto de ingresos	30	\N	\N	1	0	0	1	\N	0	\N	1
62	Apoyo y Fortalecimiento Empresarial	30	\N	\N	1	0	0	1	\N	0	\N	1
63	Auto apertura de investigación	30	\N	\N	1	0	0	1	\N	0	\N	1
64	Auto concediendo recurso de queja	30	\N	\N	1	1	1	1	\N	0	\N	1
65	Auto corriendo traslado para alegar de conclusión	30	\N	\N	1	0	0	1	\N	0	\N	1
66	Auto de admisión	30	\N	\N	1	0	0	1	\N	0	\N	1
478	Solicitud de personal	30	\N	\N	1	1	1	1	\N	0	\N	1
69	Auto de cierre de investigación	30	\N	\N	1	0	0	1	\N	0	\N	1
70	Auto de conociemiento	30	\N	\N	1	0	0	1	\N	0	\N	1
71	Auto de incorporación y/o acumulación de expedientes	30	\N	\N	1	0	0	1	\N	0	\N	1
72	Auto de indagación	30	\N	\N	1	0	0	1	\N	0	\N	1
73	Auto de investigación	30	\N	\N	1	0	0	1	\N	0	\N	1
74	Auto de Mandamiento de pago	30	\N	\N	1	0	0	1	\N	0	\N	1
75	Auto de obedézcase y cúmplase lo resuelto por la segunda instancia	30	\N	\N	1	0	0	1	\N	0	\N	1
14	Acta de presentación personal del defensor de oficio	30	\N	\N	1	0	0	1	\N	0	\N	1
20	Actas  Comité de Participación Local de Salud (COPACO)	30	\N	\N	1	0	0	1	\N	0	\N	1
22	Actas Consejo de Política Social	30	\N	\N	1	0	0	1	\N	0	\N	1
23	Actas Consejo Fondo de Vivienda de Interés Social (FOVIS)	30	\N	\N	1	0	0	1	\N	0	\N	1
24	Actas Consejo Territorial de Planeación	30	\N	\N	1	0	0	1	\N	0	\N	1
26	Actas de finalización del convenio	30	\N	\N	1	0	0	1	\N	0	\N	1
27	Actas de Incautación de Mercancia	30	\N	\N	1	0	0	1	\N	0	\N	1
28	Actas de Incautación de Sustancias Psicoactivas	30	\N	\N	1	0	0	1	\N	0	\N	1
76	Auto de pliego de cargos	30	\N	\N	1	0	0	1	\N	0	\N	1
77	Auto de prorroga en proceso de investigación	30	\N	\N	1	0	0	1	\N	0	\N	1
78	Auto de pruebas	30	\N	\N	1	0	0	1	\N	0	\N	1
79	Auto de resolución de recurso	30	\N	\N	1	0	0	1	\N	0	\N	1
80	Auto decretando pruebas	30	\N	\N	1	0	0	1	\N	0	\N	1
81	Auto inhibitorio	30	\N	\N	1	0	0	1	\N	0	\N	1
82	Auto nombrando un defensor de oficio	30	\N	\N	1	0	0	1	\N	0	\N	1
83	Auto que resuelve recursos	30	\N	\N	1	0	0	1	\N	0	\N	1
84	Auto resolviendo nulidad	30	\N	\N	1	0	0	1	\N	0	\N	1
85	Auto resolviendo pruebas en descargos	30	\N	\N	1	0	0	1	\N	0	\N	1
86	Autorización Cambio de IPS	30	\N	\N	1	1	1	1	\N	0	\N	1
87	Autorización de baja de bienes	30	\N	\N	1	1	1	1	\N	0	\N	1
88	Autorizaciones de Modificación de Planos Urbanísticos	30	\N	\N	1	1	1	1	\N	0	\N	1
89	Autorizaciones de Movimiento de Tierras	30	\N	\N	1	1	1	1	\N	0	\N	1
90	Autorizaciones de Propiedad Horizontal y sus Modificaciones	30	\N	\N	1	1	1	1	\N	0	\N	1
91	Avaluo y/o peritaje	30	\N	\N	1	1	0	1	\N	0	\N	1
93	Avisos de prensa	30	\N	\N	1	0	1	1	\N	0	\N	1
94	Balance General	30	\N	\N	1	1	1	1	\N	0	\N	1
95	Balance Inicial	30	\N	\N	1	1	1	1	\N	0	\N	1
96	Banco de Proyectos	30	\N	\N	1	1	1	1	\N	0	\N	1
97	Banco Terminológico de series y subseries documentales	30	\N	\N	1	0	0	1	\N	0	\N	1
98	Boleta citación	30	\N	\N	1	1	1	1	\N	0	\N	1
99	Boletin Epidemiológico Municipal	30	\N	\N	1	1	1	1	\N	0	\N	1
100	Cartografía oficial	30	\N	\N	1	0	1	1	\N	0	\N	1
101	Ceriticaciones de Retiro de EPS	30	\N	\N	1	0	1	1	\N	0	\N	1
102	Certificación bancaria	30	\N	\N	1	1	1	1	\N	0	\N	1
103	Certificación de la vigencia de la tarjeta profesional de todos los profesionales responsables del proyecto	30	\N	\N	1	0	1	1	\N	0	\N	1
104	Certificacion de retiro de SISBEN	30	\N	\N	1	1	1	1	\N	0	\N	1
105	Certificación de supervisión	30	\N	\N	1	1	1	1	\N	0	\N	1
106	Certificación de supervisión para trámite de pago de contrato de compraventa	30	\N	\N	1	1	1	1	\N	0	\N	1
107	Certificación del nuevo del SISBEN	30	\N	\N	1	1	1	1	\N	0	\N	1
58	Anexos	30	\N	\N	1	0	0	1	\N	0	\N	1
343	Peritaje técnico	30	\N	\N	1	0	0	1	\N	0	\N	1
6	Acta de Comité	0	\N	\N	1	1	1	1	0	0	\N	1
3	Acta de adjudicación o Remate	0	\N	\N	1	1	1	1	0	0	\N	1
4	Acta de aprobación	0	\N	\N	1	1	1	1	0	0	\N	1
5	Acta de audiencia	0	\N	\N	1	1	1	1	0	0	\N	1
7	Acta de Conciliación	0	\N	\N	1	1	1	1	0	0	\N	1
8	Acta de Consejo	0	\N	\N	1	1	1	1	0	0	\N	1
9	Acta de entrega de inmueble entregado en arrendamiento	0	\N	\N	1	1	1	1	0	0	\N	1
10	Acta de inicio	0	\N	\N	1	1	1	1	0	0	\N	1
11	Acta de liquidación	0	\N	\N	1	1	1	1	0	0	\N	1
12	Acta de Obra	0	\N	\N	1	1	1	1	0	0	\N	1
13	Acta de posesión	0	\N	\N	1	1	1	1	0	0	\N	1
15	Acta de recibido	0	\N	\N	1	1	1	1	0	0	\N	1
17	Acta de reunión	0	\N	\N	1	1	1	1	0	0	\N	1
16	Acta de Reconocimiento Voluntario de Paternidad	0	\N	\N	1	1	1	1	0	0	\N	1
21	Actas Consejo de Política Económica y Social (COMPES)	0	\N	\N	1	1	1	1	0	0	\N	1
25	Actas de finalización	0	\N	\N	1	1	1	1	0	0	\N	1
2	Acta	0	\N	\N	1	1	1	1	0	0	\N	1
19	Acta Equipo Operativo MIPG	0	\N	\N	1	1	1	1	0	0	\N	1
30	Actas de manifestación de interés para participar en el proceso	30	\N	\N	1	0	0	1	\N	0	\N	1
32	Acto administrativo de adjudicación	30	\N	\N	1	0	0	1	\N	0	\N	1
33	Acto administrativo de adopción	30	\N	\N	1	0	0	1	\N	0	\N	1
34	Acto administrativo de apertura del proceso de contratación	30	\N	\N	1	0	0	1	\N	0	\N	1
35	Acto administrativo de aprobación	30	\N	\N	1	0	0	1	\N	0	\N	1
36	Acto administrativo de establecimiento del convenio	30	\N	\N	1	0	0	1	\N	0	\N	1
37	Acto Administrativo de liquidacion oficial	30	\N	\N	1	0	0	1	\N	0	\N	1
38	Acto administrativo de nombramiento o contrato de trabajo  Oficio de notificación del nombramiento o contrato de trabajo	30	\N	\N	1	0	0	1	\N	0	\N	1
39	Acto administrativo de retiro o desvinculación del servidor de la entidad donde consten las razones del mismo	30	\N	\N	1	0	0	1	\N	0	\N	1
40	Acto administrativo de secuestre	30	\N	\N	1	0	0	1	\N	0	\N	1
41	Acto administrativo donde se notifica declaratoria de desierta	30	\N	\N	1	0	0	1	\N	0	\N	1
42	Acto administrativo por el cual se adopta el Plan  de vacaciones	30	\N	\N	1	0	0	1	\N	0	\N	1
43	Acto administrativo por el cual se adopta el Plan de Bienestar Social y Estimulo Laboral	30	\N	\N	1	0	0	1	\N	0	\N	1
44	Acto administrativo por el cual se adopta el plan de trabajo anual del sistema de seguridad y salud en el trabajo	30	\N	\N	1	0	0	1	\N	0	\N	1
45	Acto administrativo por el cual se adopta el Programa de Salud Ocupacional	30	\N	\N	1	0	0	1	\N	0	\N	1
47	Actos administrativos de avaluos y soportes	30	\N	\N	1	0	0	1	\N	0	\N	1
50	Acuerdo del Concejo municipal o Decreto municipal de adopción del Plan Documento de remisión a entes interesados	30	\N	\N	1	0	0	1	\N	0	\N	1
53	Adendas a los términos de referencia	30	\N	\N	1	0	0	1	\N	0	\N	1
54	Adición de afiliados o retiro cuando aplique	30	\N	\N	1	0	0	1	\N	0	\N	1
55	Afiliaciones a: Régimen de salud (EPS) pensión cesantías caja de compensación etc	30	\N	\N	1	0	0	1	\N	0	\N	1
56	Análisis de riesgos previsible en el proceso	30	\N	\N	1	0	0	1	\N	0	\N	1
119	Certificado de antecedentes disciplinarios	30	\N	\N	1	1	1	1	\N	0	\N	1
191	Declaraciones por Recaudo de Impuesto de Aviso y Tableros	30	\N	\N	1	1	1	1	\N	0	\N	1
192	Declaraciones por Recaudo de Impuesto de Espectáculos Públicos	30	\N	\N	1	1	1	1	\N	0	\N	1
265	Hoja de vida de la Función Pública para personas naturales o personas jurídicas	30	\N	\N	1	1	1	1	\N	0	\N	1
108	Certificación individual de aduana para vehículos automotores	30	\N	\N	1	1	1	1	\N	0	\N	1
109	Certificaciones	30	\N	\N	1	1	1	1	\N	0	\N	1
110	Certificaciones de compensación	30	\N	\N	1	1	1	1	\N	0	\N	1
31	Acta de visita	0	\N	\N	1	1	1	1	0	0	\N	1
46	Actos administrativos	0	\N	\N	1	1	1	1	0	0	\N	1
48	Actualización Escolar	0	\N	\N	1	1	1	1	0	0	\N	1
49	Acuerdo de pago	0	\N	\N	1	1	1	1	0	0	\N	1
51	Acuerdos de Confidencialidad	0	\N	\N	1	1	1	1	0	0	\N	1
52	Adendas	0	\N	\N	1	1	1	1	0	0	\N	1
348	Plan	0	\N	\N	1	1	1	1	0	0	\N	1
468	Solicitud de adición o prórroga del convenio	30	\N	\N	1	1	1	1	\N	0	\N	1
469	Solicitud de bienes y servicios	30	\N	\N	1	1	1	1	\N	0	\N	1
470	Solicitud de certificado de disponibilidad presupuestal	30	\N	\N	1	1	1	1	\N	0	\N	1
471	Solicitud de contratación con lista de chequeo	30	\N	\N	1	1	1	1	\N	0	\N	1
473	Solicitud de fotocopias del expediente	30	\N	\N	1	1	1	1	\N	0	\N	1
475	Solicitud de ingreso de los bienes a almacén	30	\N	\N	1	1	1	1	\N	0	\N	1
476	Solicitud de la Proyección de Ingresos y/o Marco Fiscal Actualizado	30	\N	\N	1	1	1	1	\N	0	\N	1
477	Solicitud de permiso para tala de Arboles	30	\N	\N	1	1	1	1	\N	0	\N	1
479	Solicitud de Presentación de Proyectos	30	\N	\N	1	1	1	1	\N	0	\N	1
480	Solicitud de reposición y/o apelación	30	\N	\N	1	1	1	1	\N	0	\N	1
481	Solicitud de suministros	30	\N	\N	1	1	1	1	\N	0	\N	1
482	Solicitud del PAC	30	\N	\N	1	1	1	1	\N	0	\N	1
483	Solicitud elaboración de contrato	30	\N	\N	1	1	1	1	\N	0	\N	1
484	Solicitud Salidas Turisticas	30	\N	\N	1	1	1	1	\N	0	\N	1
485	Solución a agua potable y alcantarillado	30	\N	\N	1	1	1	1	\N	0	\N	1
486	Solución a residuos liquidos	30	\N	\N	1	1	1	1	\N	0	\N	1
487	Soportes contables	30	\N	\N	1	1	1	1	\N	0	\N	1
488	Soportes de pago	30	\N	\N	1	1	1	1	\N	0	\N	1
489	Soportes de remates	30	\N	\N	1	1	1	1	\N	0	\N	1
490	Soportes documentales de estudios	30	\N	\N	1	1	1	1	\N	0	\N	1
492	Suspendidos	30	\N	\N	1	0	0	1	\N	0	\N	1
493	Tabla de control de acceso	30	\N	\N	1	1	1	1	\N	0	\N	1
494	Tablas de retención documental	30	\N	\N	1	1	1	1	\N	0	\N	1
495	Tablas de valoración documental	30	\N	\N	1	1	1	1	\N	0	\N	1
496	Tarjeta de Propiedad	30	\N	\N	1	0	1	1	\N	0	\N	1
427	Recurso de Consideración	30	\N	\N	1	0	1	1	30	0	\N	1
498	Verificaciones	30	\N	\N	1	0	0	1	30	0	\N	1
426	reclamo	30	\N	\N	1	0	1	1	30	1	\N	1
1	Acciones populares	10	\N	\N	1	1	1	1	10	0	\N	1
464	Solicitud Interna	15	\N	\N	1	1	1	1	15	0	\N	0
472	Solicitud de disponibilidad presupuestal	0	\N	\N	1	0	0	1	0	0	\N	0
503	Solicitud de permiso ambiental	10	\N	\N	0	0	1	1	\N	0	\N	0
\.


--
-- Data for Name: sgd_trad_tiporad; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_trad_tiporad (sgd_trad_codigo, sgd_trad_descr, sgd_trad_icono, sgd_trad_diasbloqueo, sgd_trad_genradsal, tiporadi_email, mostrar_como_tipo) FROM stdin;
2	Entrada	\N	1	\N	1	1
1	Salida	\N	1	\N	0	1
4	Pqrsd	\N	1	\N	1	1
\.


--
-- Data for Name: sgd_transfe_documentales; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_transfe_documentales (id_trans, sgd_exp_numero, sgd_srd_codigo, sgd_sbrd_codigo, sgd_tpr_codigo, radi_nume_radi, fecha_archivado, depe_codi_arch, usua_codi_arch, fecha_transferencia, depe_codi_trans, usua_codi_trans, nombre_archivo) FROM stdin;
1	20219981120000003E	11	2	248	20219980000092	2021-04-15 10:13:58.192931-05	998	1	2021-04-15 11:18:37.386882-05	998	1	transferencia_998_20210415111837.pdf
2	20219981120000003E	11	2	155	20219980000102	2021-04-15 14:42:11.633787-05	998	1	2021-04-15 14:43:09.848611-05	998	1	transferencia_998_20210415144309.pdf
3	20219981120000003E	11	2	2	20219980000191	2021-04-15 15:08:31.100841-05	998	1	2021-04-15 15:16:55.310281-05	998	1	transferencia_998_20210415151655.pdf
\.


--
-- Data for Name: sgd_ttr_transaccion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_ttr_transaccion (sgd_ttr_codigo, sgd_ttr_descrip) FROM stdin;
40	Firma Digital de Documento
41	Eliminacion solicitud de Firma Digital
50	Cambio de Estado Expediente
51	Creacion Expediente
1	Recuperacion Radicado
9	Reasignacion
8	Informar
19	Cambiar Tipo de Documento
20	Crear Registro
21	Editar Registro
10	Movimiento entre Carpetas
11	Modificacion Radicado
7	Borrar Informado
12	Devuelto-Reasignar
13	Archivar
14	Agendar
15	Sacar de la agenda
0	--
16	Reasignar para Vo.Bo.
2	Radicacion
22	Digitalizacion de Radicado
23	Digitalizacion - Modificacion
24	Asociacion Imagen fax
30	Radicacion Masiva
17	Modificacion de Causal
18	Modificacion del Sector
25	Solicitud de Anulacion
26	Anulacion Rad
27	Rechazo de Anulacion
37	Cambio de Estado del Documento
28	Devolucion de correo
29	Digitalizacion de Anexo
31	Borrado de Anexo a radicado
32	Asignacion TRD
33	Eliminar TRD
35	Tipificacion de la decision
36	Cambio en la Notificacion
38	Cambio Vinculacion Documento
39	Solicitud de Firma
42	Digitalizacion Radicado(Asoc. Imagen Web)
52	Excluir radicado de expediente
53	Incluir radicado en expediente
54	Cambio Seguridad del Documento
57	Ingreso al Archivo Fisico
55	Creación Subexpediente
56	Cambio de Responsable
58	Expediente Cerrado
59	Expediente Reabierto
61	Asignar TRD Multiple
62	Insercion Expediente Multiple
65	Archivado NRR
66	Reasignación masiva
67	Se firma el documento radicado
68	Transferencia documental
69	Cambio de Estado
70	Publicar Documento
71	Notificación de Correo
72	Cambió el estado del anexo publico
\.


--
-- Data for Name: sgd_tvd_dependencia; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tvd_dependencia (sgd_depe_codi, sgd_depe_nombre, sgd_depe_fechini, sgd_depe_fechfin) FROM stdin;
\.


--
-- Data for Name: sgd_tvd_series; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_tvd_series (sgd_depe_codi, sgd_stvd_codi, sgd_stvd_nombre, sgd_stvd_ac, sgd_stvd_dispfin, sgd_stvd_proc) FROM stdin;
\.


--
-- Data for Name: sgd_ush_usuhistorico; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_ush_usuhistorico (sgd_ush_admcod, sgd_ush_admdep, sgd_ush_admdoc, sgd_ush_usucod, sgd_ush_usudep, sgd_ush_usudoc, sgd_ush_modcod, sgd_ush_fechevento, sgd_ush_usulogin) FROM stdin;
1	998	1234567890	1	998	1234567890	40	2021-02-23	ADMON
1	998	1234567890	1	998	1234567890	53	2021-02-23	ADMON
1	998	1234567890	2	101	1022982735	1	2021-04-13	JMGAMEZ
1	998	1234567890	2	101	1022982735	53	2021-04-13	JMGAMEZ
1	998	1234567890	1	0998	1234567890	40	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-15	ADMON
1	998	1234567890	1	100	1022982736	1	2021-02-24	RECEPCION.INVM
1	998	1234567890	1	100	1022982736	53	2021-02-24	RECEPCION.INVM
1	998	1234567890	1	999	12345678909	40	2021-04-13	DSALIDA
1	998	1234567890	1	999	12345678909	53	2021-04-13	DSALIDA
1	998	1234567890	1	101	1022982737	1	2021-02-24	RECEPCION.SKN
1	998	1234567890	1	101	1022982737	53	2021-02-24	RECEPCION.SKN
1	998	1234567890	1	998	1234567890	40	2021-04-15	ADMON
1	998	1234567890	1	998	1234567890	53	2021-04-15	ADMON
3	998	1111000222333	1	1020	20994213	53	2021-01-14	GARCIA.CONSTANZA
3	998	1111000222333	1	1021	1078370117	40	2021-01-14	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1021	1078370117	53	2021-01-14	PAOLA.RODRIGUEZ
1	998	1234567890	4	1021	119680348	1	2021-01-15	EVALERA
1	998	1234567890	4	1021	119680348	53	2021-01-15	EVALERA
3	998	1111000222333	3	1020	20994822	40	2021-01-18	ARIAS.ROSA
3	998	1111000222333	3	1020	20994822	53	2021-01-18	ARIAS.ROSA
3	998	1111000222333	3	1020	20994822	40	2021-01-18	ARIAS.ROSA
3	998	1111000222333	3	1020	20994822	53	2021-01-18	ARIAS.ROSA
3	998	1111000222333	3	1020	20994822	40	2021-01-19	ARIAS.ROSA
3	998	1111000222333	3	1020	20994822	53	2021-01-19	ARIAS.ROSA
3	998	1111000222333	4	1021	1078370117	50	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	4	1021	1078370117	40	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	4	1021	1078370117	53	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	12	1020	1078370117	3	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	12	1020	1078370117	40	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	12	1020	1078370117	53	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	12	1020	1078370117	40	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	12	1020	1078370117	53	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	9	1070	20995593	40	2021-01-19	PEDREROS.VICKY
3	998	1111000222333	9	1070	20995593	53	2021-01-19	PEDREROS.VICKY
3	998	1111000222333	9	1070	20995593	40	2021-01-19	PEDREROS.VICKY
3	998	1111000222333	9	1070	20995593	53	2021-01-19	PEDREROS.VICKY
3	998	1111000222333	2	1000	20995883	1	2021-01-19	BELTRAN.ADRIANA
3	998	1111000222333	2	1000	20995883	53	2021-01-19	BELTRAN.ADRIANA
3	998	1111000222333	12	1020	1078370117	40	2021-01-19	PAOLA.RODRIGUEZ
1	998	1234567890	1	998	1234567890	40	2021-04-15	ADMON
1	998	1234567890	1	998	1234567890	53	2021-04-15	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-15	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-16	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-16	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-16	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-16	ADMON
1	998	1234567890	3	0998	1111000222333	1	2020-12-18	PASTOR.HERNAN
1	998	1234567890	3	0998	1111000222333	53	2020-12-18	PASTOR.HERNAN
1	998	1234567890	1	1021	1078370117	1	2020-12-21	PAOLA.RODRIGUEZ
1	998	1234567890	1	1021	1078370117	53	2020-12-21	PAOLA.RODRIGUEZ
1	998	1234567890	1	1021	1078370117	40	2020-12-21	PAOLA.RODRIGUEZ
1	998	1234567890	1	1021	1078370117	53	2020-12-21	PAOLA.RODRIGUEZ
1	998	1234567890	2	1021	20688375	1	2020-12-22	BERENICE.BELTRAN
1	998	1234567890	2	1021	20688375	53	2020-12-22	BERENICE.BELTRAN
1	998	1234567890	4	0998	1078368367	1	2020-12-22	ALBEIRO.PULIDO
1	998	1234567890	4	0998	1078368367	53	2020-12-22	ALBEIRO.PULIDO
1	998	1234567890	1	0998	1234567890	40	2020-12-22	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-22	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-22	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-22	ADMON
1	998	1234567890	1	0998	1234567890	40	2020-12-22	ADMON
1	998	1234567890	1	0998	1234567890	53	2020-12-22	ADMON
1	998	1234567890	3	1021	1078368367	3	2020-12-28	ALBEIRO.PULIDO
1	998	1234567890	3	1021	1078368367	40	2020-12-28	ALBEIRO.PULIDO
1	998	1234567890	3	1021	1078368367	53	2020-12-28	ALBEIRO.PULIDO
1	998	1234567890	3	1021	1078368367	40	2020-12-28	ALBEIRO.PULIDO
1	998	1234567890	3	1021	1078368367	53	2020-12-28	ALBEIRO.PULIDO
3	998	1111000222333	2	1020	1073506219	40	2021-01-04	ARDILA.NATALI
3	998	1111000222333	2	1020	1073506219	53	2021-01-04	ARDILA.NATALI
3	998	1111000222333	1	1021	1078370117	40	2021-01-04	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1021	1078370117	53	2021-01-04	PAOLA.RODRIGUEZ
3	998	1111000222333	4	1021	20995105	3	2021-01-04	HERNANDEZ.RUBY
3	998	1111000222333	4	1021	20995105	40	2021-01-04	HERNANDEZ.RUBY
3	998	1111000222333	4	1021	20995105	53	2021-01-04	HERNANDEZ.RUBY
3	998	1111000222333	8	1032	3230188	3	2021-01-04	CASAS.CAMILO
3	998	1111000222333	8	1032	3230188	40	2021-01-04	CASAS.CAMILO
3	998	1111000222333	8	1032	3230188	53	2021-01-04	CASAS.CAMILO
3	998	1111000222333	4	1032	51915315	40	2021-01-04	MUNOZ.ANA
3	998	1111000222333	4	1032	51915315	53	2021-01-04	MUNOZ.ANA
3	998	1111000222333	7	1010	1014202898	3	2021-01-04	SANDOVAL.JOHN
3	998	1111000222333	7	1010	1014202898	40	2021-01-04	SANDOVAL.JOHN
3	998	1111000222333	7	1010	1014202898	53	2021-01-04	SANDOVAL.JOHN
3	998	1111000222333	2	1050	52773181	1	2021-01-04	SAENZ.LILIA
3	998	1111000222333	2	1050	52773181	53	2021-01-04	SAENZ.LILIA
3	998	1111000222333	11	1070	37160095	3	2021-01-04	BUSTAMANTE.NADIA
3	998	1111000222333	11	1070	37160095	40	2021-01-04	BUSTAMANTE.NADIA
3	998	1111000222333	11	1070	37160095	53	2021-01-04	BUSTAMANTE.NADIA
3	998	1111000222333	1	1021	1078370117	40	2021-01-04	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1021	1078370117	53	2021-01-04	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1000	52153547	40	2021-01-05	GONZALEZ.SONIA
3	998	1111000222333	1	1000	52153547	53	2021-01-05	GONZALEZ.SONIA
3	998	1111000222333	1	1010	19472641	40	2021-01-05	LEON.FERNANDO
3	998	1111000222333	1	1010	19472641	53	2021-01-05	LEON.FERNANDO
3	998	1111000222333	1	1020	20994213	40	2021-01-05	GARCIA.CONSTANZA
3	998	1111000222333	1	1020	20994213	53	2021-01-05	GARCIA.CONSTANZA
3	998	1111000222333	1	1030	81745108	40	2021-01-05	CARDENAS.DANIEL
3	998	1111000222333	1	1030	81745108	53	2021-01-05	CARDENAS.DANIEL
3	998	1111000222333	2	1031	20995001	40	2021-01-05	GALVEZ.IVONNE
3	998	1111000222333	2	1031	20995001	53	2021-01-05	GALVEZ.IVONNE
3	998	1111000222333	2	1031	20995001	40	2021-01-05	GALVEZ.IVONNE
3	998	1111000222333	2	1031	20995001	53	2021-01-05	GALVEZ.IVONNE
3	998	1111000222333	1	1031	20995105	40	2021-01-05	HERNANDEZ.RUBY
3	998	1111000222333	1	1031	20995105	53	2021-01-05	HERNANDEZ.RUBY
3	998	1111000222333	4	1021	20995105	50	2021-01-05	HERNANDEZ.RUBY
3	998	1111000222333	4	1021	20995105	3	2021-01-05	HERNANDEZ.RUBY
3	998	1111000222333	4	1021	20995105	40	2021-01-05	HERNANDEZ.RUBY
3	998	1111000222333	4	1021	20995105	53	2021-01-05	HERNANDEZ.RUBY
3	998	1111000222333	6	1090	1078367544	40	2021-01-05	PINZON.JUDITH
3	998	1111000222333	6	1090	1078367544	53	2021-01-05	PINZON.JUDITH
3	998	1111000222333	1	1021	1078370117	40	2021-01-05	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1021	1078370117	53	2021-01-05	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1021	1078370117	40	2021-01-05	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1021	1078370117	53	2021-01-05	PAOLA.RODRIGUEZ
3	998	1111000222333	6	1060	79653907	3	2021-01-05	TOQUICA.DANILO
3	998	1111000222333	6	1060	79653907	40	2021-01-05	TOQUICA.DANILO
3	998	1111000222333	6	1060	79653907	53	2021-01-05	TOQUICA.DANILO
3	998	1111000222333	3	1021	1078368367	40	2021-01-05	ALBEIRO.PULIDO
3	998	1111000222333	3	1021	1078368367	53	2021-01-05	ALBEIRO.PULIDO
3	998	1111000222333	3	1060	1052396800	40	2021-01-05	CELY.KEILA
3	998	1111000222333	3	1060	1052396800	53	2021-01-05	CELY.KEILA
3	998	1111000222333	3	1021	1078368367	40	2021-01-05	ALBEIRO.PULIDO
3	998	1111000222333	3	1021	1078368367	53	2021-01-05	ALBEIRO.PULIDO
3	998	1111000222333	1	1021	1078370117	40	2021-01-05	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1021	1078370117	53	2021-01-05	PAOLA.RODRIGUEZ
3	998	1111000222333	3	1021	1078368367	40	2021-01-05	ALBEIRO.PULIDO
3	998	1111000222333	3	1021	1078368367	53	2021-01-05	ALBEIRO.PULIDO
3	998	1111000222333	1	1000	52153547	40	2021-01-06	GONZALEZ.SONIA
3	998	1111000222333	1	1000	52153547	53	2021-01-06	GONZALEZ.SONIA
3	998	1111000222333	1	1002	80010648	40	2021-01-06	RODRIGUEZ.DIEGO
3	998	1111000222333	1	1002	80010648	53	2021-01-06	RODRIGUEZ.DIEGO
3	998	1111000222333	1	1010	19472641	40	2021-01-06	LEON.FERNANDO
3	998	1111000222333	1	1010	19472641	53	2021-01-06	LEON.FERNANDO
3	998	1111000222333	5	1010	1073502330	40	2021-01-06	TACHACK.YENY
3	998	1111000222333	5	1010	1073502330	53	2021-01-06	TACHACK.YENY
3	998	1111000222333	1	1020	20994213	40	2021-01-06	GARCIA.CONSTANZA
3	998	1111000222333	1	1020	20994213	53	2021-01-06	GARCIA.CONSTANZA
3	998	1111000222333	10	1020	20995172	40	2021-01-06	SOCHE.MIREYA
3	998	1111000222333	10	1020	20995172	53	2021-01-06	SOCHE.MIREYA
3	998	1111000222333	2	1020	1073506219	40	2021-01-06	ARDILA.NATALI
3	998	1111000222333	2	1020	1073506219	53	2021-01-06	ARDILA.NATALI
3	998	1111000222333	1	1030	81745108	40	2021-01-06	CARDENAS.DANIEL
3	998	1111000222333	1	1030	81745108	53	2021-01-06	CARDENAS.DANIEL
3	998	1111000222333	4	1030	52779966	40	2021-01-06	GIRALDO.ADRIANA
3	998	1111000222333	4	1030	52779966	53	2021-01-06	GIRALDO.ADRIANA
3	998	1111000222333	2	1050	52773181	40	2021-01-06	SAENZ.LILIA
3	998	1111000222333	2	1050	52773181	53	2021-01-06	SAENZ.LILIA
3	998	1111000222333	8	1032	3230188	40	2021-01-07	CASAS.CAMILO
3	998	1111000222333	8	1032	3230188	53	2021-01-07	CASAS.CAMILO
3	998	1111000222333	3	1050	80912402	1	2021-01-07	AYALA.CESAR
3	998	1111000222333	3	1050	80912402	53	2021-01-07	AYALA.CESAR
3	998	1111000222333	4	1050	20994404	1	2021-01-07	CASTAÑEDA.NUBIA
3	998	1111000222333	4	1050	20994404	53	2021-01-07	CASTAÑEDA.NUBIA
3	998	1111000222333	5	1050	79781671	1	2021-01-07	TOVAR.EDUARDO
3	998	1111000222333	5	1050	79781671	53	2021-01-07	TOVAR.EDUARDO
3	998	1111000222333	6	1050	1078367049	1	2021-01-07	ZORNOSA.HERNAN
3	998	1111000222333	6	1050	1078367049	53	2021-01-07	ZORNOSA.HERNAN
3	998	1111000222333	1	1000	52153547	40	2021-01-08	GONZALEZ.SONIA
3	998	1111000222333	1	1000	52153547	53	2021-01-08	GONZALEZ.SONIA
3	998	1111000222333	2	1031	20995001	40	2021-01-08	GALVEZ.IVONNE
3	998	1111000222333	2	1031	20995001	53	2021-01-08	GALVEZ.IVONNE
3	998	1111000222333	3	1021	1078368367	40	2021-01-12	ALBEIRO.PULIDO
3	998	1111000222333	3	1021	1078368367	53	2021-01-12	ALBEIRO.PULIDO
3	998	1111000222333	2	1021	20688375	40	2021-01-12	BERENICE.BELTRAN
3	998	1111000222333	2	1021	20688375	53	2021-01-12	BERENICE.BELTRAN
3	998	1111000222333	2	1020	1073506219	40	2021-01-12	ARDILA.NATALI
3	998	1111000222333	2	1020	1073506219	53	2021-01-12	ARDILA.NATALI
3	998	1111000222333	2	1020	1073506219	40	2021-01-12	ARDILA.NATALI
3	998	1111000222333	2	1020	1073506219	53	2021-01-12	ARDILA.NATALI
3	998	1111000222333	2	1021	20688375	40	2021-01-12	BERENICE.BELTRAN
3	998	1111000222333	2	1021	20688375	53	2021-01-12	BERENICE.BELTRAN
2	998	1022982736	2	0998	1022982736	7	2021-01-13	JMGAMEZ
2	998	1022982736	2	0998	1022982736	39	2021-01-13	JMGAMEZ
2	998	1022982736	2	0998	1022982736	8	2021-01-13	JMGAMEZ
2	998	1022982736	2	0998	1022982736	40	2021-01-13	JMGAMEZ
2	998	1022982736	2	0998	1022982736	53	2021-01-13	JMGAMEZ
3	998	1111000222333	2	1031	20995001	40	2021-01-14	GALVEZ.IVONNE
3	998	1111000222333	2	1031	20995001	53	2021-01-14	GALVEZ.IVONNE
3	998	1111000222333	1	1030	81745108	40	2021-01-14	CARDENAS.DANIEL
3	998	1111000222333	1	1030	81745108	53	2021-01-14	CARDENAS.DANIEL
3	998	1111000222333	4	1030	52779966	40	2021-01-14	GIRALDO.ADRIANA
3	998	1111000222333	4	1030	52779966	53	2021-01-14	GIRALDO.ADRIANA
3	998	1111000222333	1	1000	52153547	40	2021-01-14	GONZALEZ.SONIA
3	998	1111000222333	1	1000	52153547	53	2021-01-14	GONZALEZ.SONIA
3	998	1111000222333	1	1001	51779363	40	2021-01-14	IMBACUAN.MARIA
3	998	1111000222333	1	1001	51779363	53	2021-01-14	IMBACUAN.MARIA
3	998	1111000222333	1	1010	19472641	40	2021-01-14	LEON.FERNANDO
3	998	1111000222333	1	1010	19472641	53	2021-01-14	LEON.FERNANDO
3	998	1111000222333	5	1010	1073502330	40	2021-01-14	TACHACK.YENY
3	998	1111000222333	5	1010	1073502330	53	2021-01-14	TACHACK.YENY
3	998	1111000222333	1	1020	20994213	40	2021-01-14	GARCIA.CONSTANZA
3	998	1111000222333	12	1020	1078370117	53	2021-01-19	PAOLA.RODRIGUEZ
3	998	1111000222333	1	1080	6761082	40	2021-01-20	RODRIGUEZ.COSME
3	998	1111000222333	1	1080	6761082	53	2021-01-20	RODRIGUEZ.COSME
3	998	1111000222333	8	1032	3230188	40	2021-01-20	CASAS.CAMILO
3	998	1111000222333	8	1032	3230188	53	2021-01-20	CASAS.CAMILO
3	998	1111000222333	1	1032	41633241	40	2021-01-20	CORTES.EDITH
3	998	1111000222333	1	1032	41633241	53	2021-01-20	CORTES.EDITH
3	998	1111000222333	2	1032	53139563	40	2021-01-20	GARCIA.TITA
3	998	1111000222333	2	1032	53139563	53	2021-01-20	GARCIA.TITA
3	998	1111000222333	3	1032	35424054	40	2021-01-20	HERNANDEZ.NIDIA
3	998	1111000222333	3	1032	35424054	53	2021-01-20	HERNANDEZ.NIDIA
3	998	1111000222333	5	1032	20983344	40	2021-01-20	RODRIGUEZ.NIDIA
3	998	1111000222333	5	1032	20983344	53	2021-01-20	RODRIGUEZ.NIDIA
3	998	1111000222333	6	1032	1070952561	40	2021-01-20	ROJAS.JENNIFER
3	998	1111000222333	6	1032	1070952561	53	2021-01-20	ROJAS.JENNIFER
3	998	1111000222333	7	1032	52863676	40	2021-01-20	TAMAYO.ANA
3	998	1111000222333	7	1032	52863676	53	2021-01-20	TAMAYO.ANA
3	998	1111000222333	5	1030	1078371179	1	2021-01-21	GOMEZ.SANDRA
3	998	1111000222333	5	1030	1078371179	53	2021-01-21	GOMEZ.SANDRA
3	998	1111000222333	6	1030	80240260	1	2021-01-21	CRUZ.OMAR
3	998	1111000222333	6	1030	80240260	53	2021-01-21	CRUZ.OMAR
3	998	1111000222333	7	1060	1078371056	1	2021-01-21	TORRES.SERGIO
3	998	1111000222333	7	1060	1078371056	53	2021-01-21	TORRES.SERGIO
3	998	1111000222333	2	1050	52773181	40	2021-01-21	SAENZ.LILIA
3	998	1111000222333	2	1050	52773181	53	2021-01-21	SAENZ.LILIA
3	998	1111000222333	3	1080	1078368051	40	2021-01-21	GONZALEZ.JUANITA
3	998	1111000222333	3	1080	1078368051	53	2021-01-21	GONZALEZ.JUANITA
3	998	1111000222333	2	1100	52273033	40	2021-01-25	AZA.GRACIELA
3	998	1111000222333	2	1100	52273033	53	2021-01-25	AZA.GRACIELA
3	998	1111000222333	4	1050	20994404	40	2021-01-25	CASTAÑEDA.NUBIA
3	998	1111000222333	4	1050	20994404	53	2021-01-25	CASTAÑEDA.NUBIA
3	998	1111000222333	3	0998	1111000222333	5	2021-01-25	PASTOR.HERNAN
3	998	1111000222333	3	0998	1111000222333	40	2021-01-25	PASTOR.HERNAN
3	998	1111000222333	3	0998	1111000222333	53	2021-01-25	PASTOR.HERNAN
3	998	1111000222333	4	1060	80409393	40	2021-01-25	LEGUIZAMON.JORGE
3	998	1111000222333	4	1060	80409393	53	2021-01-25	LEGUIZAMON.JORGE
3	998	1111000222333	2	1021	20688375	40	2021-01-25	BERENICE.BELTRAN
3	998	1111000222333	2	1021	20688375	53	2021-01-25	BERENICE.BELTRAN
3	998	1111000222333	2	1021	20688375	40	2021-01-25	BERENICE.BELTRAN
3	998	1111000222333	2	1021	20688375	53	2021-01-25	BERENICE.BELTRAN
3	998	1111000222333	3	0998	1111000222333	40	2021-01-25	PASTOR.HERNAN
3	998	1111000222333	3	0998	1111000222333	53	2021-01-25	PASTOR.HERNAN
3	998	1111000222333	3	0998	1111000222333	40	2021-01-26	PASTOR.HERNAN
3	998	1111000222333	3	0998	1111000222333	53	2021-01-26	PASTOR.HERNAN
3	998	1111000222333	6	1050	1078367049	40	2021-01-26	ZORNOSA.HERNAN
3	998	1111000222333	6	1050	1078367049	53	2021-01-26	ZORNOSA.HERNAN
3	998	1111000222333	7	1030	1076623571	1	2021-01-26	PINEDA.EDUARDO
3	998	1111000222333	7	1030	1076623571	53	2021-01-26	PINEDA.EDUARDO
3	998	1111000222333	4	0998	1078370594	1	2021-01-27	JOHAN.BULLA
3	998	1111000222333	4	0998	1078370594	53	2021-01-27	JOHAN.BULLA
3	998	1111000222333	4	1050	20994404	40	2021-01-27	CASTANEDA.NUBIA
3	998	1111000222333	4	1050	20994404	53	2021-01-27	CASTANEDA.NUBIA
3	998	1111000222333	4	1021	1078370594	3	2021-01-27	JOHAN.BULLA
3	998	1111000222333	4	1021	1078370594	40	2021-01-27	JOHAN.BULLA
3	998	1111000222333	4	1021	1078370594	53	2021-01-27	JOHAN.BULLA
3	998	1111000222333	4	1021	1078370594	40	2021-01-27	JOHAN.BULLA
3	998	1111000222333	4	1021	1078370594	53	2021-01-27	JOHAN.BULLA
3	998	1111000222333	3	1020	20994822	40	2021-01-27	ARIAS.ROSA
3	998	1111000222333	3	1020	20994822	53	2021-01-27	ARIAS.ROSA
3	998	1111000222333	3	1020	20994822	40	2021-01-27	ARIAS.ROSA
3	998	1111000222333	3	1020	20994822	53	2021-01-27	ARIAS.ROSA
3	998	1111000222333	4	1060	80409393	40	2021-01-27	LEGUIZAMON.JORGE
3	998	1111000222333	4	1060	80409393	53	2021-01-27	LEGUIZAMON.JORGE
3	998	1111000222333	8	1100	20994596	40	2021-01-28	PASTOR.NORA
3	998	1111000222333	8	1100	20994596	53	2021-01-28	PASTOR.NORA
3	998	1111000222333	13	1020	1077974909	1	2021-01-28	RODRIGUEZ.LEIDY
3	998	1111000222333	13	1020	1077974909	53	2021-01-28	RODRIGUEZ.LEIDY
3	998	1111000222333	1	1080	6761082	40	2021-01-28	RODRIGUEZ.COSME
3	998	1111000222333	1	1080	6761082	53	2021-01-28	RODRIGUEZ.COSME
3	998	1111000222333	6	1080	52020496	40	2021-01-28	RAMIREZ.VIVIANA
3	998	1111000222333	6	1080	52020496	53	2021-01-28	RAMIREZ.VIVIANA
3	998	1111000222333	1	1070	20994603	40	2021-01-29	ROMERO.DIANA
3	998	1111000222333	1	1070	20994603	53	2021-01-29	ROMERO.DIANA
1	998	1234567890	1	1070	20994603	40	2021-01-29	ROMERO.DIANA
1	998	1234567890	1	1070	20994603	53	2021-01-29	ROMERO.DIANA
1	998	1234567890	1	0998	1234567890	40	2021-02-01	ADMON
1	998	1234567890	1	0998	1234567890	53	2021-02-01	ADMON
3	998	1111000222333	1	1020	20994213	40	2021-02-09	GARCIA.CONSTANZA
3	998	1111000222333	1	1020	20994213	53	2021-02-09	GARCIA.CONSTANZA
3	998	1111000222333	7	1032	52863676	40	2021-02-11	TAMAYO.ANA
3	998	1111000222333	7	1032	52863676	53	2021-02-11	TAMAYO.ANA
1	998	1234567890	1	0998	1234567890	40	2021-02-17	ADMON
1	998	1234567890	1	0998	1234567890	53	2021-02-17	ADMON
1	998	1234567890	1	0998	1234567890	40	2021-02-17	ADMON
1	998	1234567890	1	0998	1234567890	53	2021-02-17	ADMON
3	998	1111000222333	1	1020	20994213	40	2021-02-17	GARCIA.CONSTANZA
3	998	1111000222333	1	1020	20994213	53	2021-02-17	GARCIA.CONSTANZA
1	998	1234567890	12	1020	1078370117	40	2021-02-22	PAOLA.RODRIGUEZ
1	998	1234567890	12	1020	1078370117	53	2021-02-22	PAOLA.RODRIGUEZ
\.


--
-- Data for Name: sgd_usm_usumodifica; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sgd_usm_usumodifica (sgd_usm_modcod, sgd_usm_moddescr) FROM stdin;
47	Quito permiso impresion
43	Otorgo permiso prestamo de documentos
44	Quito permiso prestamo de documentos
45	Otorgo permiso digitalizacion de documentos
46	Quito permiso digitalizacion de documentos
48	Otorgo permiso modificaciones
49	Quito permiso modificaciones
50	Cambio de perfil
1	Creacion de usuario
51	Otorgo permiso tablas retencion documental
52	Quito permiso tablas retencion documental
3	Cambio dependencia
4	Cambio cedula
5	Cambio nombre
7	Cambio ubicacion
8	Cambio piso
9	Cambio estado
10	Otorgo permiso radicacion entrada
11	Otorgo permisos radicacion de entrada
12	Quito permiso administracion sistema
13	Otorgo permiso administracion sistema
14	Quito permiso administracion archivo
15	Otorgo permiso administracion archivo
16	Habilitado como usuario nuevo
17	Habilitado como usuario antiguo con clave
18	Cambio nivel
19	Otorgo permiso radicacion salida
20	Otorgo permiso impresion
21	Otorgo permiso radicacion masiva
22	Quito permiso radicacion masiva
23	Quito permiso devoluciones de correo
24	Otorgo permiso devoluciones de correo
25	Otorgo permiso de solicitud de anulacion
26	Otorgo permiso de anulacion
27	Otorgo permiso de solicitud de anulacion y anulacion
28	Quito permiso radicacion memorandos
29	Otorgo permiso radicacion memorandos
30	Quito permiso radicacion resoluciones
31	Otorgo permiso radicacion resoluciones
33	Quito permiso envio de correo
34	Otorgo permiso envio de correo
35	Otorgo permiso radicacion de salida 
39	Cambio extension
40	Cambio email
41	Quito permisos radicacion entrada
42	Quito permisos de solicitud de anulacion y anulaciones
53	Cambio de rol
54	Se asigno rol
80	Otorgo permiso de firma qr
81	Quito permiso de firma qr
82	Se cambia los permisos del Rol
83	Otorgo permiso de descarga de archivos originales
84	Quito permiso de descarga de archivos originales
85	Otorgo permiso de transferencias documentales
87	Otorgo permiso de publicar documentos
88	Quito permiso de publicar documentos
86	Quito permiso de descarga de archivos originales
\.


--
-- Data for Name: sphinx_index_meta; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sphinx_index_meta (index_name, max_id, last_update) FROM stdin;
sph_idx_posts_main	1	2023-08-17 09:10:10.60358-05
\.


--
-- Data for Name: sphinx_index_remove; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.sphinx_index_remove (id, indice, estado, fecha_creacion, fecha_ejecucion, identificador) FROM stdin;
\.


--
-- Data for Name: tipo_doc_identificacion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.tipo_doc_identificacion (tdid_codi, tdid_desc) FROM stdin;
0	Cedula de Ciudadania
1	Tarjeta de Identidad
2	Cedula de Extranjería
3	Pasaporte
4	Nit
5	NUIR
\.


--
-- Data for Name: tipo_poblacion_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.tipo_poblacion_pqrs (id_tp_pqrs, tipo_p_pqrs) FROM stdin;
1	Adulto Mayor
2	Ciudadano Rural
3	Desplazado
5	Persona en condición de Discapacidad
6	Persona en situación de Pobreza
7	Victima de violencia
8	LGBTI
9	Madre cabeza de familia
10	Ninguna de las Anteriores
11	Negritud
12	Otros
13	Afrodecendiente
14	Veteranos de la Fuerza Pública
15	Adolescente
16	Mujer Gestante
4	Poblacion Indigena
\.


--
-- Data for Name: tipo_remitente; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.tipo_remitente (trte_codi, trte_desc, aplica_pqrs) FROM stdin;
1	Otras empresas	0
3	Predio	0
5	Otros	0
6	Funcionario	0
2	Persona natural	10
4	Persona Jurídica	10
\.


--
-- Data for Name: tipo_tratamiento_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.tipo_tratamiento_pqrs (id_tipo_t_pqrs, tipo_t_pqrs) FROM stdin;
1	Señor
2	Señora
3	Ingeniero
4	Ingeniera
\.


--
-- Data for Name: tipo_usuario_grupo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.tipo_usuario_grupo (id_grupo_tipo_usuario, nombre_tipo_usuario, estdo_tipo_usuario) FROM stdin;
1	Ciudadano	1
2	Entes de Control	1
\.


--
-- Data for Name: tipos_comunicaciones; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.tipos_comunicaciones (id_tipos_comunicaciones, nombre_tipos_comunicaciones) FROM stdin;
1	Enviadas
2	Recibidas Internas
3	Recibidas Externas
\.


--
-- Data for Name: ubicacion_fisica; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.ubicacion_fisica (ubic_depe_radi, ubic_depe_arch) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public."user" (id, username, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at, verification_token, security_questions) FROM stdin;
1	anonimo	TKx14J91w_WJ0h2rmeORsD9XqksqCMmf	$2y$13$p0MVeH7Q8b.nFv2fWWjGP.4NPv6SuCYEqCxZJwRMqkj4zsW97IV9i	\N	soporte@skinatech.com	10	1577449952	1577449952	WpKeD2Rw6-r7W9DWlrliYWMjbzvwtGkQ_1577449949	2
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.usuario (usua_codi, depe_codi, usua_login, usua_fech_crea, usua_pasw, usua_esta, usua_nomb, perm_radi, usua_admin, usua_nuevo, usua_doc, codi_nivel, usua_sesion, usua_fech_sesion, usua_ext, usua_nacim, usua_email, usua_at, usua_piso, perm_radi_sal, usua_admin_archivo, usua_masiva, usua_perm_dev, usua_perm_numera_res, usua_doc_suip, usua_perm_numeradoc, sgd_panu_codi, usua_prad_tp1, usua_prad_tp2, usua_perm_envios, usua_perm_modifica, usua_perm_impresion, sgd_aper_codigo, usu_telefono1, usua_encuesta, sgd_perm_estadistica, usua_perm_sancionados, usua_admin_sistema, usua_perm_trd, usua_perm_firma, usua_perm_prestamo, usuario_publico, usuario_reasignar, usua_perm_notifica, usua_perm_expediente, usua_login_externo, id_pais, id_cont, usua_auth_ldap, perm_archi, perm_vobo, perm_borrar_anexo, perm_tipif_anexo, usua_perm_adminflujos, usua_exp_trd, usua_perm_rademail, usua_perm_accesi, usua_perm_agrcontacto, usua_prad_tp4, usua_perm_preradicado, cod_rol, descargar_documentos, usua_perm_reasigna_masiva, usua_nivel_consulta, descarga_arc_original, firma_qr, per_transferencia_documental, usua_perm_grupo_usuarios_informados, usua_perm_doc_publico, usua_perm_consulta_rad, consulta_inv_documental, carga_inv_documental) FROM stdin;
1	100	RECEPCION.INVM	2021-02-24	02cb962ac59075b964b07152d2	1	USUARIO RECEPCIÓN INVIMA	0	0	1	1022982736	3	210301091020o1921688236RECEPC	2021-03-01	\N	\N	soporte@skinatech.com	Zona franca bodega 2	\N	2	0	0	0	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	1	\N	0	0	0	0	1	1	0	2	\N	170	1	0	1	1	\N	\N	0	0	1	0	0	0	0	3	1	0	2	1	0	0	\N	0	0	0	0
2	101	JMGAMEZ	2021-04-13	02cb962ac59075b964b07152d2	1	Maritza Gamez	0	0	1	1022982735	3	210413050722o1921688236JMGAME	2021-04-13	\N	\N	maritzagamez0106g@gmail.com	\N	\N	2	0	0	0	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	1	\N	0	0	0	0	1	1	0	2	\N	170	1	0	1	1	\N	\N	0	0	1	0	0	0	0	3	1	0	2	1	0	0	\N	0	0	0	0
1	999	DSALIDA	2019-11-05	02cb962ac59075b964b07152d2	1	Usuario de Archivo	1	1	1	12345678909	5	210413053258o1921688236DSALID	2021-04-13	\N	\N	jmgamez@sinatech.com	\N	\N	0	2	1	1	\N	\N	\N	3	3	3	1	1	2	\N	\N	\N	2	\N	1	2	0	1	1	1	0	2	--	170	1	0	1	1	0	1	0	0	1	0	1	3	0	2	1	1	3	1	1	0	0	0	1	0	0
1	101	RECEPCION.SKN	2021-02-24	123	1	USUARIO RECEPCIÓN SKN	0	0	0	1022982737	3	\N	\N	\N	\N	jmgamez@skinatech.com	\N	\N	2	1	0	0	\N	\N	\N	\N	3	0	0	0	0	\N	\N	\N	1	\N	0	2	0	1	1	1	0	2	\N	170	1	0	1	1	\N	\N	0	0	0	0	1	0	0	1	1	0	2	1	0	1	\N	0	1	0	0
1	998	ADMON	2019-11-05	1232f297a57a5a743894a0e4a8	1	Usuario de Soporte	1	1	1	1234567890	5	230816034449o127001ADMON	2023-08-16	\N	\N	soporte.skinatech@gmail.com	\N	\N	0	2	1	1	\N	1	\N	3	3	3	1	1	2	\N	\N	\N	2	\N	1	2	0	1	1	1	0	2	--	170	1	0	1	1	0	1	0	0	1	0	1	3	0	2	1	1	3	1	1	1	1	1	1	0	0
\.


--
-- Data for Name: usuarios_grupos_informados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

COPY public.usuarios_grupos_informados (id_usuarios_grupos_informados, id_grupos_informados, usua_login, usuario_grupo_activo) FROM stdin;
\.


--
-- Name: Preguntas_id_preguntas_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public."Preguntas_id_preguntas_seq"', 1, false);


--
-- Name: Respuestas_Usuario_id_Respuestas_Usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public."Respuestas_Usuario_id_Respuestas_Usuario_seq"', 1, false);


--
-- Name: carpeta_per_id_caperta_per_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.carpeta_per_id_caperta_per_seq', 2, true);


--
-- Name: configuracion_contrasena_idConfiguracionContracsena_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public."configuracion_contrasena_idConfiguracionContracsena_seq"', 5, true);


--
-- Name: configuracion_general_fondo_id_campo_configuracion_fondo_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.configuracion_general_fondo_id_campo_configuracion_fondo_seq', 143, true);


--
-- Name: contrasenas_guardadas_id_contrasena_guardada_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.contrasenas_guardadas_id_contrasena_guardada_seq', 124, true);


--
-- Name: datosocr_indice_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.datosocr_indice_seq', 1, false);


--
-- Name: dependencias; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.dependencias', 0, false);


--
-- Name: direccion_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.direccion_usuarios_id_seq', 1, false);


--
-- Name: estado_civil_pqrs_id_estado_civil_pqrs_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.estado_civil_pqrs_id_estado_civil_pqrs_seq', 1, false);


--
-- Name: fondo_acumulado_comunicaciones_id_fondo_acumulado_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.fondo_acumulado_comunicaciones_id_fondo_acumulado_seq', 127481, true);


--
-- Name: grupos_informados_id_grupos_informados_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.grupos_informados_id_grupos_informados_seq', 1, false);


--
-- Name: grupos_informados_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.grupos_informados_seq', 1, false);


--
-- Name: nivel_academico_pqrs_id_nivel_acad_pqrs_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.nivel_academico_pqrs_id_nivel_acad_pqrs_seq', 1, false);


--
-- Name: num_resol_dtc; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.num_resol_dtc', 24, false);


--
-- Name: num_resol_dtn; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.num_resol_dtn', 101, false);


--
-- Name: num_resol_dtoc; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.num_resol_dtoc', 21, false);


--
-- Name: num_resol_dtor; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.num_resol_dtor', 61, false);


--
-- Name: num_resol_dts; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.num_resol_dts', 61, false);


--
-- Name: num_resol_gral; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.num_resol_gral', 1, false);


--
-- Name: perfiles_codi_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.perfiles_codi_perfil_seq', 6, false);


--
-- Name: plsql_profiler_runnumeric; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.plsql_profiler_runnumeric', 1, false);


--
-- Name: pres_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.pres_seq', 30392, false);


--
-- Name: roles_cod_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.roles_cod_rol_seq', 6, false);


--
-- Name: sec_bodega_empresas; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_bodega_empresas', 1, false);


--
-- Name: sec_central; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_central', 1, false);


--
-- Name: sec_ciu_ciudadano; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_ciu_ciudadano', 2, false);


--
-- Name: sec_def_contactos; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_def_contactos', 1, false);


--
-- Name: sec_dir_direcciones; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_dir_direcciones', 43, true);


--
-- Name: sec_edificio; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_edificio', 5, true);


--
-- Name: sec_fondo; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_fondo', 1, false);


--
-- Name: sec_inv; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_inv', 1, false);


--
-- Name: sec_oem_empresas; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_oem_empresas', 1, false);


--
-- Name: sec_oem_oempresas; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_oem_oempresas', 1, true);


--
-- Name: sec_planilla; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_planilla', 8, true);


--
-- Name: sec_planilla_envio; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_planilla_envio', 4, true);


--
-- Name: sec_planilla_tx; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_planilla_tx', 1, false);


--
-- Name: sec_prestamo; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_prestamo', 1, false);


--
-- Name: sec_rol_tipos_doc; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_rol_tipos_doc', 6003, true);


--
-- Name: sec_sgd_hfld_histflujodoc; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sec_sgd_hfld_histflujodoc', 1, false);


--
-- Name: secr_subseries_id_tabla; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_subseries_id_tabla', 279, true);


--
-- Name: secr_tp1_; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp1_', 1, false);


--
-- Name: secr_tp1_998; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp1_998', 20, true);


--
-- Name: secr_tp1_999; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp1_999', 1, false);


--
-- Name: secr_tp2_; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp2_', 1, false);


--
-- Name: secr_tp2_998; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp2_998', 11, true);


--
-- Name: secr_tp2_999; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp2_999', 1, false);


--
-- Name: secr_tp4_; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp4_', 1, false);


--
-- Name: secr_tp4_998; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp4_998', 1, true);


--
-- Name: secr_tp4_999; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.secr_tp4_999', 1, false);


--
-- Name: seq_parexp_paramexpediente; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.seq_parexp_paramexpediente', 16, true);


--
-- Name: seq_sgd_mrd_codigo; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.seq_sgd_mrd_codigo', 2298, true);


--
-- Name: sgd_anar_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_anar_secue', 1, false);


--
-- Name: sgd_ciu_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_ciu_secue', 1, false);


--
-- Name: sgd_dir_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_dir_secue', 1, false);


--
-- Name: sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq', 343, true);


--
-- Name: sgd_ejes_tematicos_id_sgd_eje_tematico_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_ejes_tematicos_id_sgd_eje_tematico_seq', 284, true);


--
-- Name: sgd_exp_expediente_id_expediente_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_exp_expediente_id_expediente_seq', 14, true);


--
-- Name: sgd_hmtd_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_hmtd_secue', 1, false);


--
-- Name: sgd_info_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_info_secue', 1, false);


--
-- Name: sgd_mat_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_mat_secue', 1, false);


--
-- Name: sgd_oem_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_oem_secue', 18398, false);


--
-- Name: sgd_plg_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_plg_secue', 1, false);


--
-- Name: sgd_tvd_depe_id; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sgd_tvd_depe_id', 0, false);


--
-- Name: sphinx_index_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.sphinx_index_meta_id_seq', 11, true);


--
-- Name: tipo_poblacion_pqrs_id_tp_pqrs_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.tipo_poblacion_pqrs_id_tp_pqrs_seq', 6, true);


--
-- Name: tipo_tratamiento_pqrs_id_tipo_t_pqrs_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.tipo_tratamiento_pqrs_id_tipo_t_pqrs_seq', 1, false);


--
-- Name: tipo_usuario_grupo_id_grupo_tipo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.tipo_usuario_grupo_id_grupo_tipo_usuario_seq', 1, false);


--
-- Name: tipos_comunicaciones_id_tipos_comunicaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.tipos_comunicaciones_id_tipos_comunicaciones_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.user_id_seq', 2, false);


--
-- Name: usuarios_grupos_informados_id_usuarios_grupos_informados_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.usuarios_grupos_informados_id_usuarios_grupos_informados_seq', 1, false);


--
-- Name: usuarios_grupos_informados_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('public.usuarios_grupos_informados_seq', 45, true);


--
-- Name: sgd_arch_depe ID; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_arch_depe
    ADD CONSTRAINT "ID" PRIMARY KEY (sgd_arch_id);


--
-- Name: sgd_ttr_transaccion PK_SGD_TTR_TRANSACCION; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_ttr_transaccion
    ADD CONSTRAINT "PK_SGD_TTR_TRANSACCION" PRIMARY KEY (sgd_ttr_codigo);


--
-- Name: preguntas Preguntas_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT "Preguntas_pkey" PRIMARY KEY (id_preguntas);


--
-- Name: respuestas_usuario Respuestas_Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.respuestas_usuario
    ADD CONSTRAINT "Respuestas_Usuario_pkey" PRIMARY KEY ("id_Respuestas_Usuario");


--
-- Name: sgd_trad_tiporad SGD_TRAD_TIPORAD_CODIGO_INX; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_trad_tiporad
    ADD CONSTRAINT "SGD_TRAD_TIPORAD_CODIGO_INX" PRIMARY KEY (sgd_trad_codigo);


--
-- Name: bodega_empresas bodega_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.bodega_empresas
    ADD CONSTRAINT bodega_empresas_pkey PRIMARY KEY (identificador_empresa);


--
-- Name: configuracion_contrasena configuracion_contrasena_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.configuracion_contrasena
    ADD CONSTRAINT configuracion_contrasena_pkey PRIMARY KEY ("idConfiguracionContracsena");


--
-- Name: configuracion_general_fondo configuracion_general_fondo_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.configuracion_general_fondo
    ADD CONSTRAINT configuracion_general_fondo_pkey PRIMARY KEY (id_campo_configuracion_fondo);


--
-- Name: contrasenas_guardadas contrasenas_guardadas_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.contrasenas_guardadas
    ADD CONSTRAINT contrasenas_guardadas_pkey PRIMARY KEY (id_contrasena_guardada);


--
-- Name: datosocr datosocr_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.datosocr
    ADD CONSTRAINT datosocr_pkey PRIMARY KEY (indice);


--
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (dpto_codi, id_pais);


--
-- Name: direccion_usuarios direccion_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.direccion_usuarios
    ADD CONSTRAINT direccion_usuarios_pkey PRIMARY KEY (id);


--
-- Name: fondo_acumulado_comunicaciones fondo_acumulado_comunicaciones_pk; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.fondo_acumulado_comunicaciones
    ADD CONSTRAINT fondo_acumulado_comunicaciones_pk PRIMARY KEY (id_fondo_acumulado_comunicaciones);


--
-- Name: grupo_interes grupo_interes_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.grupo_interes
    ADD CONSTRAINT grupo_interes_pkey PRIMARY KEY (id_grupo_interes);


--
-- Name: grupos_informados grupos_informados_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.grupos_informados
    ADD CONSTRAINT grupos_informados_pkey PRIMARY KEY (id_grupos_informados);


--
-- Name: carpeta_per id_carpeta_per; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.carpeta_per
    ADD CONSTRAINT id_carpeta_per PRIMARY KEY (id_caperta_per);


--
-- Name: inventario_documental inventario_documental_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.inventario_documental
    ADD CONSTRAINT inventario_documental_pkey PRIMARY KEY (id_inv_documental);


--
-- Name: inventario_documentos inventario_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.inventario_documentos
    ADD CONSTRAINT inventario_documentos_pkey PRIMARY KEY (id_inv_documento);


--
-- Name: municipio municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (muni_codi, dpto_codi, id_pais);


--
-- Name: perfiles perfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT perfiles_pkey PRIMARY KEY (codi_perfil);


--
-- Name: anexos pk_anex_codigo; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.anexos
    ADD CONSTRAINT pk_anex_codigo PRIMARY KEY (anex_codigo);


--
-- Name: dependencia pk_depe_codi; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.dependencia
    ADD CONSTRAINT pk_depe_codi PRIMARY KEY (depe_codi);


--
-- Name: sgd_dt_radicado pk_dt_radicado; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_dt_radicado
    ADD CONSTRAINT pk_dt_radicado PRIMARY KEY (radi_nume_radi);


--
-- Name: sgd_parexp_paramexpediente pk_parexp_codigo; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_parexp_paramexpediente
    ADD CONSTRAINT pk_parexp_codigo UNIQUE (sgd_parexp_codigo);


--
-- Name: radicado pk_radicados; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.radicado
    ADD CONSTRAINT pk_radicados PRIMARY KEY (radi_nume_radi);


--
-- Name: sgd_dir_drecciones pk_sgd_dir_codigo; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_dir_drecciones
    ADD CONSTRAINT pk_sgd_dir_codigo PRIMARY KEY (sgd_dir_codigo);


--
-- Name: sgd_sexp_secexpedientes pk_sgd_sexp_secuencia; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_sexp_secexpedientes
    ADD CONSTRAINT pk_sgd_sexp_secuencia PRIMARY KEY (sgd_sexp_secuencia);


--
-- Name: pre_radicado pre_radicado_radi_nume_radi_key; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.pre_radicado
    ADD CONSTRAINT pre_radicado_radi_nume_radi_key UNIQUE (radi_nume_radi);


--
-- Name: sgd_dt_radicado radi_nume_radi; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_dt_radicado
    ADD CONSTRAINT radi_nume_radi UNIQUE (radi_nume_radi);


--
-- Name: rango_edades_pqrs rango_edades_pqrs_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.rango_edades_pqrs
    ADD CONSTRAINT rango_edades_pqrs_pkey PRIMARY KEY (id_rango_edades_pqrs);


--
-- Name: rol_tipos_doc rol_tipos_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.rol_tipos_doc
    ADD CONSTRAINT rol_tipos_doc_pkey PRIMARY KEY (cod_rol_tipos);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (cod_rol);


--
-- Name: sgd_sed_sede sede_codi; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_sed_sede
    ADD CONSTRAINT sede_codi UNIQUE (sgd_sed_codi);


--
-- Name: servicios_pqrs servicios_pqrs_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.servicios_pqrs
    ADD CONSTRAINT servicios_pqrs_pkey PRIMARY KEY (id_servicio_pqrs);


--
-- Name: sgd_archivo_central sgd_archivo_central2_pk; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_archivo_central
    ADD CONSTRAINT sgd_archivo_central2_pk PRIMARY KEY (sgd_archivo_id);


--
-- Name: sgd_ciu_ciudadano sgd_ciu_ciudadano_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_ciu_ciudadano
    ADD CONSTRAINT sgd_ciu_ciudadano_pkey PRIMARY KEY (sgd_ciu_codigo, id_users_pqrs);


--
-- Name: sgd_def_paises sgd_def_paises_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_def_paises
    ADD CONSTRAINT sgd_def_paises_pkey PRIMARY KEY (id_pais, id_cont);


--
-- Name: sgd_ejes_tematicos_dependencia sgd_ejes_tematicos_dependencia_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_ejes_tematicos_dependencia
    ADD CONSTRAINT sgd_ejes_tematicos_dependencia_pkey PRIMARY KEY (id_sgd_eje_tematico_dependencia);


--
-- Name: sgd_ejes_tematicos sgd_ejes_tematicos_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_ejes_tematicos
    ADD CONSTRAINT sgd_ejes_tematicos_pkey PRIMARY KEY (id_sgd_eje_tematico);


--
-- Name: sgd_fenv_frmenvio sgd_fenv_frmenvio_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_fenv_frmenvio
    ADD CONSTRAINT sgd_fenv_frmenvio_pkey PRIMARY KEY (sgd_fenv_codigo);


--
-- Name: sgd_tpr_tpdcumento sgd_tpr_codigo; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_tpr_tpdcumento
    ADD CONSTRAINT sgd_tpr_codigo UNIQUE (sgd_tpr_codigo);


--
-- Name: sgd_transfe_documentales sgd_transfe_documentales_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_transfe_documentales
    ADD CONSTRAINT sgd_transfe_documentales_pkey PRIMARY KEY (id_trans);


--
-- Name: sphinx_index_remove sphinx_index_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sphinx_index_remove
    ADD CONSTRAINT sphinx_index_meta_pkey PRIMARY KEY (id);


--
-- Name: sgd_sbrd_subserierd srd_sbrd_codigo; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_sbrd_subserierd
    ADD CONSTRAINT srd_sbrd_codigo UNIQUE (sgd_srd_codigo, sgd_sbrd_codigo);


--
-- Name: tipo_poblacion_pqrs tipo_poblacion_pqrs_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.tipo_poblacion_pqrs
    ADD CONSTRAINT tipo_poblacion_pqrs_pkey PRIMARY KEY (id_tp_pqrs);


--
-- Name: tipo_usuario_grupo tipo_usuario_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.tipo_usuario_grupo
    ADD CONSTRAINT tipo_usuario_grupo_pkey PRIMARY KEY (id_grupo_tipo_usuario);


--
-- Name: tipos_comunicaciones tipos_comunicaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.tipos_comunicaciones
    ADD CONSTRAINT tipos_comunicaciones_pkey PRIMARY KEY (id_tipos_comunicaciones);


--
-- Name: sgd_mrd_matrird trd_dependencia; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_mrd_matrird
    ADD CONSTRAINT trd_dependencia UNIQUE (depe_codi, sgd_srd_codigo, sgd_sbrd_codigo, sgd_tpr_codigo);


--
-- Name: carpeta_per unique_carpeta; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.carpeta_per
    ADD CONSTRAINT unique_carpeta UNIQUE (usua_codi, depe_codi, codi_carp);


--
-- Name: usuario unique_depe_usua; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT unique_depe_usua UNIQUE (usua_codi, depe_codi);


--
-- Name: sgd_exp_expediente unique_expediente_radicado; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_exp_expediente
    ADD CONSTRAINT unique_expediente_radicado UNIQUE (sgd_exp_numero, radi_nume_radi);


--
-- Name: sgd_parexp_paramexpediente unique_parexp; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_parexp_paramexpediente
    ADD CONSTRAINT unique_parexp UNIQUE (sgd_parexp_codigo, depe_codi);


--
-- Name: sgd_dir_drecciones unique_radicado; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_dir_drecciones
    ADD CONSTRAINT unique_radicado UNIQUE (radi_nume_radi);


--
-- Name: sgd_sexp_secexpedientes unique_secexpediente; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_sexp_secexpedientes
    ADD CONSTRAINT unique_secexpediente UNIQUE (sgd_exp_numero, sgd_sexp_parexp1);


--
-- Name: user user_password_reset_token_key; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_password_reset_token_key UNIQUE (password_reset_token);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: usuario usua_login; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usua_login UNIQUE (usua_login);


--
-- Name: usuarios_grupos_informados usuarios_grupos_informados_pkey; Type: CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.usuarios_grupos_informados
    ADD CONSTRAINT usuarios_grupos_informados_pkey PRIMARY KEY (id_usuarios_grupos_informados);


--
-- Name: fondo_acumulado_comunicaciones_index; Type: INDEX; Schema: public; Owner: orfeo_usr
--

CREATE UNIQUE INDEX fondo_acumulado_comunicaciones_index ON public.fondo_acumulado_comunicaciones USING btree (campo3, campo12);


--
-- Name: id_tabla; Type: INDEX; Schema: public; Owner: orfeo_usr
--

CREATE UNIQUE INDEX id_tabla ON public.sgd_sbrd_subserierd USING btree (id_tabla);


--
-- Name: sgd_ciu_ciudadano sgd_ciu_edad; Type: FK CONSTRAINT; Schema: public; Owner: orfeo_usr
--

ALTER TABLE ONLY public.sgd_ciu_ciudadano
    ADD CONSTRAINT sgd_ciu_edad FOREIGN KEY (sgd_ciu_edad) REFERENCES public.rango_edades_pqrs(id_rango_edades_pqrs);


--
-- Name: FUNCTION concat(text, text); Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON FUNCTION public.concat(text, text) TO postgres;


--
-- Name: TABLE usuario; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.usuario TO postgres;
GRANT ALL ON TABLE public.usuario TO PUBLIC;


--
-- Name: TABLE anexos; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.anexos TO postgres;
GRANT ALL ON TABLE public.anexos TO PUBLIC;


--
-- Name: TABLE anexos_historico; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.anexos_historico TO postgres;
GRANT ALL ON TABLE public.anexos_historico TO PUBLIC;


--
-- Name: TABLE anexos_tipo; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.anexos_tipo TO postgres;
GRANT ALL ON TABLE public.anexos_tipo TO PUBLIC;


--
-- Name: TABLE bodega_empresas; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.bodega_empresas TO postgres;
GRANT ALL ON TABLE public.bodega_empresas TO PUBLIC;


--
-- Name: TABLE borrar_carpeta_personalizada; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.borrar_carpeta_personalizada TO postgres;
GRANT ALL ON TABLE public.borrar_carpeta_personalizada TO PUBLIC;


--
-- Name: TABLE borrar_empresa_esp; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.borrar_empresa_esp TO postgres;
GRANT ALL ON TABLE public.borrar_empresa_esp TO PUBLIC;


--
-- Name: TABLE carpeta; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.carpeta TO postgres;
GRANT ALL ON TABLE public.carpeta TO PUBLIC;


--
-- Name: TABLE carpeta_per; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.carpeta_per TO postgres;
GRANT ALL ON TABLE public.carpeta_per TO PUBLIC;


--
-- Name: TABLE centro_poblado; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.centro_poblado TO postgres;
GRANT ALL ON TABLE public.centro_poblado TO PUBLIC;


--
-- Name: TABLE departamento; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.departamento TO postgres;
GRANT ALL ON TABLE public.departamento TO PUBLIC;


--
-- Name: TABLE dependencia; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.dependencia TO postgres;
GRANT ALL ON TABLE public.dependencia TO PUBLIC;


--
-- Name: TABLE dependencia_visibilidad; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.dependencia_visibilidad TO postgres;
GRANT ALL ON TABLE public.dependencia_visibilidad TO PUBLIC;


--
-- Name: TABLE estado; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.estado TO postgres;
GRANT ALL ON TABLE public.estado TO PUBLIC;


--
-- Name: TABLE fun_funcionario; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.fun_funcionario TO postgres;


--
-- Name: TABLE hist_eventos; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.hist_eventos TO postgres;
GRANT ALL ON TABLE public.hist_eventos TO PUBLIC;


--
-- Name: TABLE informados; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.informados TO postgres;
GRANT ALL ON TABLE public.informados TO PUBLIC;


--
-- Name: TABLE medio_recepcion; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.medio_recepcion TO postgres;
GRANT ALL ON TABLE public.medio_recepcion TO PUBLIC;


--
-- Name: TABLE municipio; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.municipio TO postgres;
GRANT ALL ON TABLE public.municipio TO PUBLIC;


--
-- Name: TABLE par_serv_servicios; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.par_serv_servicios TO postgres;
GRANT ALL ON TABLE public.par_serv_servicios TO PUBLIC;


--
-- Name: TABLE pl_generado_plg; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.pl_generado_plg TO postgres;
GRANT ALL ON TABLE public.pl_generado_plg TO PUBLIC;


--
-- Name: TABLE pl_tipo_plt; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.pl_tipo_plt TO postgres;
GRANT ALL ON TABLE public.pl_tipo_plt TO PUBLIC;


--
-- Name: TABLE plan_table; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.plan_table TO postgres;
GRANT ALL ON TABLE public.plan_table TO PUBLIC;


--
-- Name: TABLE plantilla_pl; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.plantilla_pl TO postgres;
GRANT ALL ON TABLE public.plantilla_pl TO PUBLIC;


--
-- Name: TABLE prestamo; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.prestamo TO postgres;
GRANT ALL ON TABLE public.prestamo TO PUBLIC;


--
-- Name: TABLE radicado; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.radicado TO postgres;
GRANT ALL ON TABLE public.radicado TO PUBLIC;


--
-- Name: TABLE sgd_agen_agendados; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_agen_agendados TO postgres;
GRANT ALL ON TABLE public.sgd_agen_agendados TO PUBLIC;


--
-- Name: TABLE sgd_anar_anexarg; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_anar_anexarg TO postgres;
GRANT ALL ON TABLE public.sgd_anar_anexarg TO PUBLIC;


--
-- Name: TABLE sgd_anu_anulados; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_anu_anulados TO postgres;
GRANT ALL ON TABLE public.sgd_anu_anulados TO PUBLIC;


--
-- Name: TABLE sgd_aper_adminperfiles; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_aper_adminperfiles TO postgres;
GRANT ALL ON TABLE public.sgd_aper_adminperfiles TO PUBLIC;


--
-- Name: TABLE sgd_apli_aplintegra; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_apli_aplintegra TO postgres;
GRANT ALL ON TABLE public.sgd_apli_aplintegra TO PUBLIC;


--
-- Name: TABLE sgd_aplmen_aplimens; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_aplmen_aplimens TO postgres;
GRANT ALL ON TABLE public.sgd_aplmen_aplimens TO PUBLIC;


--
-- Name: TABLE sgd_aplus_plicusua; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_aplus_plicusua TO postgres;
GRANT ALL ON TABLE public.sgd_aplus_plicusua TO PUBLIC;


--
-- Name: TABLE sgd_archivo_central; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_archivo_central TO postgres;
GRANT ALL ON TABLE public.sgd_archivo_central TO PUBLIC;


--
-- Name: TABLE sgd_archivo_hist; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_archivo_hist TO postgres;
GRANT ALL ON TABLE public.sgd_archivo_hist TO PUBLIC;


--
-- Name: TABLE sgd_argd_argdoc; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_argd_argdoc TO postgres;
GRANT ALL ON TABLE public.sgd_argd_argdoc TO PUBLIC;


--
-- Name: TABLE sgd_argup_argudoctop; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_argup_argudoctop TO postgres;
GRANT ALL ON TABLE public.sgd_argup_argudoctop TO PUBLIC;


--
-- Name: TABLE sgd_camexp_campoexpediente; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_camexp_campoexpediente TO postgres;
GRANT ALL ON TABLE public.sgd_camexp_campoexpediente TO PUBLIC;


--
-- Name: TABLE sgd_carp_descripcion; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_carp_descripcion TO postgres;
GRANT ALL ON TABLE public.sgd_carp_descripcion TO PUBLIC;


--
-- Name: TABLE sgd_cau_causal; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_cau_causal TO postgres;
GRANT ALL ON TABLE public.sgd_cau_causal TO PUBLIC;


--
-- Name: TABLE sgd_caux_causales; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_caux_causales TO postgres;
GRANT ALL ON TABLE public.sgd_caux_causales TO PUBLIC;


--
-- Name: TABLE sgd_clta_clstarif; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_clta_clstarif TO postgres;
GRANT ALL ON TABLE public.sgd_clta_clstarif TO PUBLIC;


--
-- Name: TABLE sgd_cob_campobliga; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_cob_campobliga TO postgres;
GRANT ALL ON TABLE public.sgd_cob_campobliga TO PUBLIC;


--
-- Name: TABLE sgd_dcau_causal; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_dcau_causal TO postgres;
GRANT ALL ON TABLE public.sgd_dcau_causal TO PUBLIC;


--
-- Name: TABLE sgd_ddca_ddsgrgdo; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_ddca_ddsgrgdo TO postgres;
GRANT ALL ON TABLE public.sgd_ddca_ddsgrgdo TO PUBLIC;


--
-- Name: TABLE sgd_def_contactos; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_def_contactos TO postgres;
GRANT ALL ON TABLE public.sgd_def_contactos TO PUBLIC;


--
-- Name: TABLE sgd_def_continentes; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_def_continentes TO postgres;
GRANT ALL ON TABLE public.sgd_def_continentes TO PUBLIC;


--
-- Name: TABLE sgd_def_paises; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_def_paises TO postgres;
GRANT ALL ON TABLE public.sgd_def_paises TO PUBLIC;


--
-- Name: TABLE sgd_deve_dev_envio; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_deve_dev_envio TO postgres;
GRANT ALL ON TABLE public.sgd_deve_dev_envio TO PUBLIC;


--
-- Name: TABLE sgd_dir_drecciones; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_dir_drecciones TO postgres;
GRANT ALL ON TABLE public.sgd_dir_drecciones TO PUBLIC;


--
-- Name: TABLE sgd_dnufe_docnufe; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_dnufe_docnufe TO postgres;
GRANT ALL ON TABLE public.sgd_dnufe_docnufe TO PUBLIC;


--
-- Name: TABLE sgd_eanu_estanulacion; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_eanu_estanulacion TO postgres;
GRANT ALL ON TABLE public.sgd_eanu_estanulacion TO PUBLIC;


--
-- Name: TABLE sgd_einv_inventario; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_einv_inventario TO postgres;
GRANT ALL ON TABLE public.sgd_einv_inventario TO PUBLIC;


--
-- Name: TABLE sgd_eit_items; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_eit_items TO postgres;
GRANT ALL ON TABLE public.sgd_eit_items TO PUBLIC;


--
-- Name: TABLE sgd_ent_entidades; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_ent_entidades TO postgres;
GRANT ALL ON TABLE public.sgd_ent_entidades TO PUBLIC;


--
-- Name: TABLE sgd_enve_envioespecial; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_enve_envioespecial TO postgres;
GRANT ALL ON TABLE public.sgd_enve_envioespecial TO PUBLIC;


--
-- Name: TABLE sgd_estc_estconsolid; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_estc_estconsolid TO postgres;
GRANT ALL ON TABLE public.sgd_estc_estconsolid TO PUBLIC;


--
-- Name: TABLE sgd_estinst_estadoinstancia; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_estinst_estadoinstancia TO postgres;
GRANT ALL ON TABLE public.sgd_estinst_estadoinstancia TO PUBLIC;


--
-- Name: TABLE sgd_exp_expediente; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_exp_expediente TO postgres;
GRANT ALL ON TABLE public.sgd_exp_expediente TO PUBLIC;


--
-- Name: TABLE sgd_fars_faristas; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_fars_faristas TO postgres;
GRANT ALL ON TABLE public.sgd_fars_faristas TO PUBLIC;


--
-- Name: TABLE sgd_fenv_frmenvio; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_fenv_frmenvio TO postgres;
GRANT ALL ON TABLE public.sgd_fenv_frmenvio TO PUBLIC;


--
-- Name: TABLE sgd_fexp_flujoexpedientes; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_fexp_flujoexpedientes TO postgres;
GRANT ALL ON TABLE public.sgd_fexp_flujoexpedientes TO PUBLIC;


--
-- Name: TABLE sgd_firrad_firmarads; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_firrad_firmarads TO postgres;
GRANT ALL ON TABLE public.sgd_firrad_firmarads TO PUBLIC;


--
-- Name: TABLE sgd_fld_flujodoc; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_fld_flujodoc TO postgres;
GRANT ALL ON TABLE public.sgd_fld_flujodoc TO PUBLIC;


--
-- Name: TABLE sgd_fun_funciones; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_fun_funciones TO postgres;
GRANT ALL ON TABLE public.sgd_fun_funciones TO PUBLIC;


--
-- Name: TABLE sgd_hfld_histflujodoc; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_hfld_histflujodoc TO postgres;
GRANT ALL ON TABLE public.sgd_hfld_histflujodoc TO PUBLIC;


--
-- Name: TABLE sgd_hmtd_hismatdoc; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_hmtd_hismatdoc TO postgres;
GRANT ALL ON TABLE public.sgd_hmtd_hismatdoc TO PUBLIC;


--
-- Name: TABLE sgd_instorf_instanciasorfeo; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_instorf_instanciasorfeo TO postgres;
GRANT ALL ON TABLE public.sgd_instorf_instanciasorfeo TO PUBLIC;


--
-- Name: TABLE sgd_lip_linkip; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_lip_linkip TO postgres;
GRANT ALL ON TABLE public.sgd_lip_linkip TO PUBLIC;


--
-- Name: TABLE sgd_mat_matriz; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_mat_matriz TO postgres;
GRANT ALL ON TABLE public.sgd_mat_matriz TO PUBLIC;


--
-- Name: TABLE sgd_mpes_mddpeso; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_mpes_mddpeso TO postgres;
GRANT ALL ON TABLE public.sgd_mpes_mddpeso TO PUBLIC;


--
-- Name: TABLE sgd_mrd_matrird; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_mrd_matrird TO postgres;
GRANT ALL ON TABLE public.sgd_mrd_matrird TO PUBLIC;


--
-- Name: TABLE sgd_msdep_msgdep; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_msdep_msgdep TO postgres;
GRANT ALL ON TABLE public.sgd_msdep_msgdep TO PUBLIC;


--
-- Name: TABLE sgd_msg_mensaje; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_msg_mensaje TO postgres;
GRANT ALL ON TABLE public.sgd_msg_mensaje TO PUBLIC;


--
-- Name: TABLE sgd_mtd_matriz_doc; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_mtd_matriz_doc TO postgres;
GRANT ALL ON TABLE public.sgd_mtd_matriz_doc TO PUBLIC;


--
-- Name: TABLE sgd_noh_nohabiles; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_noh_nohabiles TO postgres;
GRANT ALL ON TABLE public.sgd_noh_nohabiles TO PUBLIC;


--
-- Name: TABLE sgd_not_notificacion; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_not_notificacion TO postgres;
GRANT ALL ON TABLE public.sgd_not_notificacion TO PUBLIC;


--
-- Name: TABLE sgd_ntrd_notifrad; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_ntrd_notifrad TO postgres;
GRANT ALL ON TABLE public.sgd_ntrd_notifrad TO PUBLIC;


--
-- Name: TABLE sgd_oem_oempresas; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_oem_oempresas TO postgres;
GRANT ALL ON TABLE public.sgd_oem_oempresas TO PUBLIC;


--
-- Name: TABLE sgd_panu_peranulados; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_panu_peranulados TO postgres;
GRANT ALL ON TABLE public.sgd_panu_peranulados TO PUBLIC;


--
-- Name: TABLE sgd_parametro; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_parametro TO postgres;
GRANT ALL ON TABLE public.sgd_parametro TO PUBLIC;


--
-- Name: TABLE sgd_parexp_paramexpediente; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_parexp_paramexpediente TO postgres;
GRANT ALL ON TABLE public.sgd_parexp_paramexpediente TO PUBLIC;


--
-- Name: TABLE sgd_pexp_procexpedientes; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_pexp_procexpedientes TO postgres;
GRANT ALL ON TABLE public.sgd_pexp_procexpedientes TO PUBLIC;


--
-- Name: TABLE sgd_pnufe_procnumfe; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_pnufe_procnumfe TO postgres;
GRANT ALL ON TABLE public.sgd_pnufe_procnumfe TO PUBLIC;


--
-- Name: TABLE sgd_pnun_procenum; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_pnun_procenum TO postgres;
GRANT ALL ON TABLE public.sgd_pnun_procenum TO PUBLIC;


--
-- Name: TABLE sgd_prc_proceso; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_prc_proceso TO postgres;
GRANT ALL ON TABLE public.sgd_prc_proceso TO PUBLIC;


--
-- Name: TABLE sgd_prd_prcdmentos; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_prd_prcdmentos TO postgres;
GRANT ALL ON TABLE public.sgd_prd_prcdmentos TO PUBLIC;


--
-- Name: TABLE sgd_rda_retdoca; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_rda_retdoca TO postgres;
GRANT ALL ON TABLE public.sgd_rda_retdoca TO PUBLIC;


--
-- Name: TABLE sgd_rdf_retdocf; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_rdf_retdocf TO postgres;
GRANT ALL ON TABLE public.sgd_rdf_retdocf TO PUBLIC;


--
-- Name: TABLE sgd_renv_regenvio; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_renv_regenvio TO postgres;
GRANT ALL ON TABLE public.sgd_renv_regenvio TO PUBLIC;


--
-- Name: TABLE sgd_rmr_radmasivre; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_rmr_radmasivre TO postgres;
GRANT ALL ON TABLE public.sgd_rmr_radmasivre TO PUBLIC;


--
-- Name: TABLE sgd_sbrd_subserierd; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_sbrd_subserierd TO postgres;
GRANT ALL ON TABLE public.sgd_sbrd_subserierd TO PUBLIC;


--
-- Name: TABLE sgd_sed_sede; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_sed_sede TO postgres;
GRANT ALL ON TABLE public.sgd_sed_sede TO PUBLIC;


--
-- Name: TABLE sgd_senuf_secnumfe; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_senuf_secnumfe TO postgres;
GRANT ALL ON TABLE public.sgd_senuf_secnumfe TO PUBLIC;


--
-- Name: TABLE sgd_sexp_secexpedientes; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_sexp_secexpedientes TO postgres;
GRANT ALL ON TABLE public.sgd_sexp_secexpedientes TO PUBLIC;


--
-- Name: TABLE sgd_srd_seriesrd; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_srd_seriesrd TO postgres;
GRANT ALL ON TABLE public.sgd_srd_seriesrd TO PUBLIC;


--
-- Name: TABLE sgd_tar_tarifas; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_tar_tarifas TO postgres;
GRANT ALL ON TABLE public.sgd_tar_tarifas TO PUBLIC;


--
-- Name: TABLE sgd_tdec_tipodecision; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_tdec_tipodecision TO postgres;
GRANT ALL ON TABLE public.sgd_tdec_tipodecision TO PUBLIC;


--
-- Name: TABLE sgd_tid_tipdecision; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_tid_tipdecision TO postgres;
GRANT ALL ON TABLE public.sgd_tid_tipdecision TO PUBLIC;


--
-- Name: TABLE sgd_tidm_tidocmasiva; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_tidm_tidocmasiva TO postgres;
GRANT ALL ON TABLE public.sgd_tidm_tidocmasiva TO PUBLIC;


--
-- Name: TABLE sgd_tip3_tipotercero; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_tip3_tipotercero TO postgres;
GRANT ALL ON TABLE public.sgd_tip3_tipotercero TO PUBLIC;


--
-- Name: TABLE sgd_tma_temas; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_tma_temas TO postgres;
GRANT ALL ON TABLE public.sgd_tma_temas TO PUBLIC;


--
-- Name: TABLE sgd_tme_tipmen; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_tme_tipmen TO postgres;
GRANT ALL ON TABLE public.sgd_tme_tipmen TO PUBLIC;


--
-- Name: TABLE sgd_tpr_tpdcumento; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_tpr_tpdcumento TO postgres;
GRANT ALL ON TABLE public.sgd_tpr_tpdcumento TO PUBLIC;


--
-- Name: TABLE sgd_trad_tiporad; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_trad_tiporad TO postgres;
GRANT ALL ON TABLE public.sgd_trad_tiporad TO PUBLIC;


--
-- Name: TABLE sgd_ttr_transaccion; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_ttr_transaccion TO postgres;
GRANT ALL ON TABLE public.sgd_ttr_transaccion TO PUBLIC;


--
-- Name: TABLE sgd_ush_usuhistorico; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_ush_usuhistorico TO postgres;
GRANT ALL ON TABLE public.sgd_ush_usuhistorico TO PUBLIC;


--
-- Name: TABLE sgd_usm_usumodifica; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.sgd_usm_usumodifica TO postgres;
GRANT ALL ON TABLE public.sgd_usm_usumodifica TO PUBLIC;


--
-- Name: TABLE tipo_doc_identificacion; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.tipo_doc_identificacion TO postgres;
GRANT ALL ON TABLE public.tipo_doc_identificacion TO PUBLIC;


--
-- Name: TABLE tipo_remitente; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.tipo_remitente TO postgres;
GRANT ALL ON TABLE public.tipo_remitente TO PUBLIC;


--
-- Name: TABLE ubicacion_fisica; Type: ACL; Schema: public; Owner: orfeo_usr
--

GRANT ALL ON TABLE public.ubicacion_fisica TO postgres;
GRANT ALL ON TABLE public.ubicacion_fisica TO PUBLIC;


--
-- PostgreSQL database dump complete
--

