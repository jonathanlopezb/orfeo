--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: Preguntas_id_preguntas_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('"Preguntas_id_preguntas_seq"', 1, false);


--
-- Name: Respuestas_Usuario_id_Respuestas_Usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('"Respuestas_Usuario_id_Respuestas_Usuario_seq"', 1, false);






--
-- Data for Name: carpeta; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO carpeta VALUES (0, 'Entrada', 1);
INSERT INTO carpeta VALUES (1, 'Salida', 1);
INSERT INTO carpeta VALUES (12, 'Devueltos', 1);
INSERT INTO carpeta VALUES (11, 'Vo.Bo.', 1);
INSERT INTO carpeta VALUES (14, 'Reasignación Masiva', 1);
INSERT INTO carpeta VALUES (4, 'Pqrsd', 1);


--
-- Data for Name: carpeta_per; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO carpeta_per VALUES (1, '999', 'Masiva', 'Radicacion Masiva', 99, 1);
INSERT INTO carpeta_per VALUES (1, '998', 'Masiva', 'Radicacion Masiva', 99, 2);


--
-- Name: carpeta_per_id_caperta_per_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('carpeta_per_id_caperta_per_seq', 2, true);


--
-- Data for Name: centro_poblado; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: configuracion_contrasena; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO configuracion_contrasena VALUES (4, 3, 'month', 3, false, '2020');
INSERT INTO configuracion_contrasena VALUES (3, 3, 'month', 3, false, '2020');
INSERT INTO configuracion_contrasena VALUES (1, 3, 'month', 3, false, '2020');
INSERT INTO configuracion_contrasena VALUES (2, 4, 'month', 3, false, '2020');
INSERT INTO configuracion_contrasena VALUES (5, 3, 'month', 1, true, '2020');


--
-- Name: configuracion_contrasena_idConfiguracionContracsena_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('"configuracion_contrasena_idConfiguracionContracsena_seq"', 5, true);


--
-- Data for Name: configuracion_general_fondo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: configuracion_general_fondo_id_campo_configuracion_fondo_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('configuracion_general_fondo_id_campo_configuracion_fondo_seq', 143, true);



--
-- Name: contrasenas_guardadas_id_contrasena_guardada_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('contrasenas_guardadas_id_contrasena_guardada_seq', 124, true);


--
-- Data for Name: datosocr; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: datosocr_indice_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('datosocr_indice_seq', 1, false);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO departamento VALUES (1, 'TODOS', 1, 170);
INSERT INTO departamento VALUES (5, 'ANTIOQUÍA', 1, 170);
INSERT INTO departamento VALUES (8, 'ATLÁNTICO', 1, 170);
INSERT INTO departamento VALUES (13, 'BOLÍVAR', 1, 170);
INSERT INTO departamento VALUES (15, 'BOYACÁ', 1, 170);
INSERT INTO departamento VALUES (17, 'CALDAS', 1, 170);
INSERT INTO departamento VALUES (19, 'CAUCA', 1, 170);
INSERT INTO departamento VALUES (20, 'CESAR', 1, 170);
INSERT INTO departamento VALUES (23, 'CÓRDOBA', 1, 170);
INSERT INTO departamento VALUES (25, 'CUNDINAMARCA', 1, 170);
INSERT INTO departamento VALUES (27, 'CHOCO', 1, 170);
INSERT INTO departamento VALUES (41, 'HUILA', 1, 170);
INSERT INTO departamento VALUES (44, 'LA GUAJIRA', 1, 170);
INSERT INTO departamento VALUES (47, 'MAGDALENA', 1, 170);
INSERT INTO departamento VALUES (50, 'META', 1, 170);
INSERT INTO departamento VALUES (52, 'NARIÑO', 1, 170);
INSERT INTO departamento VALUES (54, 'NORTE DE SANTANDER', 1, 170);
INSERT INTO departamento VALUES (63, 'QUINDÍO', 1, 170);
INSERT INTO departamento VALUES (66, 'RISARALDA', 1, 170);
INSERT INTO departamento VALUES (68, 'SANTANDER', 1, 170);
INSERT INTO departamento VALUES (70, 'SUCRE', 1, 170);
INSERT INTO departamento VALUES (73, 'TOLIMA', 1, 170);
INSERT INTO departamento VALUES (76, 'VALLE DEL CAUCA', 1, 170);
INSERT INTO departamento VALUES (81, 'ARAUCA', 1, 170);
INSERT INTO departamento VALUES (85, 'CASANARE', 1, 170);
INSERT INTO departamento VALUES (86, 'PUTUMAYO', 1, 170);
INSERT INTO departamento VALUES (88, 'SAN ANDRÉS', 1, 170);
INSERT INTO departamento VALUES (91, 'AMAZONAS', 1, 170);
INSERT INTO departamento VALUES (94, 'GUAINÍA', 1, 170);
INSERT INTO departamento VALUES (95, 'GUAVIARE', 1, 170);
INSERT INTO departamento VALUES (97, 'VAUPÉS', 1, 170);
INSERT INTO departamento VALUES (99, 'VICHADA', 1, 170);
INSERT INTO departamento VALUES (11, 'D.C.', 1, 170);
INSERT INTO departamento VALUES (18, 'CAQUETÁ', 1, 170);


--
-- Data for Name: dependencia; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO dependencia VALUES ('998', 'Comisión Colombiana del Océano', 11, '998', 1, '998', 'CCO', 1, 'Carrera 37 No. 53-50', NULL, NULL, '998', '998', 1, 170, 1, NULL, '998');
INSERT INTO dependencia VALUES ('999', 'Dependencia Administración Archivo', 11, '999', 1, '999', 'DAA', 1, 'Carrera 37 No. 53-50', NULL, NULL, '999', '999', 1, 170, 1, NULL, '999');
INSERT INTO dependencia VALUES ('997', 'Área de Direccionamiento Estratégico', 11, '997', 1, '997', 'ARDIE', 1, 'Carrera 37 No. 53-50', NULL, NULL, '999', '999', 1, 170, 1, NULL, '997');


--
-- Data for Name: dependencia_visibilidad; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO dependencia_visibilidad VALUES (1, '1021', '1020');


--
-- Name: dependencias; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('dependencias', 0, false);


--
-- Data for Name: direccion_usuarios; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: direccion_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('direccion_usuarios_id_seq', 1, false);


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO estado VALUES (9, 'Documento Orfeo', NULL);
INSERT INTO estado VALUES (2, 'Asignado', 4);
INSERT INTO estado VALUES (3, 'En tramite', 4);
INSERT INTO estado VALUES (4, 'Finalizado', 4);
INSERT INTO estado VALUES (5, 'Con Respuesta', 4);
INSERT INTO estado VALUES (1, 'Nueva', 4);


--
-- Data for Name: estado_civil_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO estado_civil_pqrs VALUES (1, 'Soltero(a)');
INSERT INTO estado_civil_pqrs VALUES (2, 'Casado(a)');
INSERT INTO estado_civil_pqrs VALUES (3, 'Viudo(a)');
INSERT INTO estado_civil_pqrs VALUES (4, 'Unión Libre ');
INSERT INTO estado_civil_pqrs VALUES (5, 'Divorciado');


--
-- Name: estado_civil_pqrs_id_estado_civil_pqrs_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('estado_civil_pqrs_id_estado_civil_pqrs_seq', 1, false);


--
-- Data for Name: fondo_acumulado_comunicaciones; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: fondo_acumulado_comunicaciones_id_fondo_acumulado_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('fondo_acumulado_comunicaciones_id_fondo_acumulado_seq', 127481, true);


--
-- Data for Name: fun_funcionario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: genero_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO genero_pqrs VALUES (1, 'Masculino');
INSERT INTO genero_pqrs VALUES (2, 'Femenino');
INSERT INTO genero_pqrs VALUES (3, 'Otro');


--
-- Data for Name: grupo_interes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO grupo_interes VALUES (1, 'Ninguno');
INSERT INTO grupo_interes VALUES (2, 'Sindicato del Sector Publico');
INSERT INTO grupo_interes VALUES (3, 'Veeduría Ciudadana');
INSERT INTO grupo_interes VALUES (4, 'Representante de Asociación de
Usuario');
INSERT INTO grupo_interes VALUES (5, 'Representante EPS');
INSERT INTO grupo_interes VALUES (6, 'Integrante Junta Directiva');


--
-- Data for Name: grupos_informados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO grupos_informados VALUES (8, 'Equipo Tecnico de Gestión Documental', 'Integrantes Del Comité De Archivo', 1);


--
-- Name: grupos_informados_id_grupos_informados_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('grupos_informados_id_grupos_informados_seq', 1, false);


--
-- Name: grupos_informados_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('grupos_informados_seq', 1, false);


--
-- Data for Name: inventario_documental; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO inventario_documental VALUES (66, 'Dependencia', '998', '0001', 'CENTRAL', '0001-998', 'SERIE', 'SUBSERIE', '2020-12-01', '2020-12-31', 500, 500, 500, '', 500, 500, 500, 3, 'NOTAS', 'SOPORTE');
INSERT INTO inventario_documental VALUES (68, 'ua', 'op', 'no', 'ob', 'co', 'no', 'sub', '2020-12-09', '2020-12-25', 1, 2, 3, '4', 5, 6, 7, 2, 'Prueba de carga', '8');


--
-- Data for Name: medio_recepcion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO medio_recepcion VALUES (1, 'Mensajeria');
INSERT INTO medio_recepcion VALUES (6, 'Telefono');
INSERT INTO medio_recepcion VALUES (3, 'Correo electrónico');
INSERT INTO medio_recepcion VALUES (4, 'Personal');
INSERT INTO medio_recepcion VALUES (5, 'Pagina web');


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO municipio VALUES (1, 10, 'NEW YORK', 1, 249, '0', NULL, 1);
INSERT INTO municipio VALUES (8, 9, 'BARCELONA', 2, 724, '0', NULL, 1);
INSERT INTO municipio VALUES (1, 16, 'GINEBRA', 2, 767, '0', NULL, 1);
INSERT INTO municipio VALUES (16, 9, 'CUENCA', 2, 724, '0', NULL, 1);
INSERT INTO municipio VALUES (1, 5, 'MEDELLIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (2, 5, 'ABEJORRAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (4, 5, 'ABRIAQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (21, 5, 'ALEJANDRIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (30, 5, 'AMAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (31, 5, 'AMALFI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (34, 5, 'ANDES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (36, 5, 'ANGELOPOLIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (38, 5, 'ANGOSTURA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (40, 5, 'ANORI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (42, 5, 'SANTA FE DE ANTIOQUIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (44, 5, 'ANZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 5, 'ARBOLETES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (55, 5, 'ARGELIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (59, 5, 'ARMENIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (79, 5, 'BARBOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (86, 5, 'BELMIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (88, 5, 'BELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (91, 5, 'BETANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (93, 5, 'BETULIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (101, 5, 'CIUDAD BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (107, 5, 'BRICEÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (113, 5, 'BURITICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (120, 5, 'CACERES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (125, 5, 'CAICEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (129, 5, 'CALDAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (134, 5, 'CAMPAMENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (138, 5, 'CAÑASGORDAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (142, 5, 'CARACOLI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (145, 5, 'CARAMANTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (147, 5, 'CAREPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (148, 5, 'EL CARMEN DE VIBORAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (150, 5, 'CAROLINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (154, 5, 'CAUCASIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (172, 5, 'CHIGORODO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (190, 5, 'CISNEROS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (197, 5, 'COCORNA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (206, 5, 'CONCEPCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (209, 5, 'CONCORDIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 5, 'COPACABANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (234, 5, 'DABEIBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (237, 5, 'DON MATIAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (240, 5, 'EBEJICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 5, 'EL BAGRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (264, 5, 'ENTRERRIOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (266, 5, 'ENVIGADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (282, 5, 'FREDONIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (284, 5, 'FRONTINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (306, 5, 'GIRALDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (308, 5, 'GIRARDOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (310, 5, 'GOMEZ PLATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (313, 5, 'GRANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (315, 5, 'GUADALUPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 5, 'GUARNE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (321, 5, 'GUATAPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (347, 5, 'HELICONIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (353, 5, 'HISPANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (360, 5, 'ITAGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (361, 5, 'ITUANGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (364, 5, 'JARDIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (368, 5, 'JERICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (376, 5, 'LA CEJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (380, 5, 'LA ESTRELLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (390, 5, 'LA PINTADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 5, 'LA UNION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (411, 5, 'LIBORINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (425, 5, 'MACEO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (440, 5, 'MARINILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (467, 5, 'MONTEBELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (475, 5, 'MURINDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (480, 5, 'MUTATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (483, 5, 'NARIÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (490, 5, 'NECOCLI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (495, 5, 'NECHI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (501, 5, 'OLAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (541, 5, 'PEÑOL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (543, 5, 'PEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (576, 5, 'PUEBLORRICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (585, 5, 'PUERTO NARE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (591, 5, 'PUERTO TRIUNFO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (604, 5, 'REMEDIOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (607, 5, 'RETIRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (615, 5, 'RIONEGRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (628, 5, 'SABANALARGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (631, 5, 'SABANETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (642, 5, 'SALGAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (647, 5, 'SAN ANDRES DE CUERQUIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (649, 5, 'SAN CARLOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (652, 5, 'SAN FRANCISCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (656, 5, 'SAN JERONIMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (658, 5, 'SAN JOSE DE LA MONTAÑA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (659, 5, 'SAN JUAN DE URABA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 5, 'SAN LUIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (664, 5, 'SAN PEDRO DE LOS MILAGROS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (665, 5, 'SAN PEDRO DE URABA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (667, 5, 'SAN RAFAEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 5, 'SAN ROQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (674, 5, 'SAN VICENTE FERRER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (679, 5, 'SANTA BARBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 5, 'SANTA ROSA DE OSOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (690, 5, 'SANTO DOMINGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (697, 5, 'EL SANTUARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (736, 5, 'SEGOVIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (756, 5, 'SONSON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (761, 5, 'SOPETRAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (789, 5, 'TAMESIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (790, 5, 'TARAZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (792, 5, 'TARSO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (809, 5, 'TITIRIBI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (819, 5, 'TOLEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (837, 5, 'TURBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (842, 5, 'URAMITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (847, 5, 'URRAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (854, 5, 'VALDIVIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (856, 5, 'VALPARAISO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (858, 5, 'VEGACHI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (861, 5, 'VENECIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 5, 'VIGIA DEL FUERTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 5, 'YALI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (887, 5, 'YARUMAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (890, 5, 'YOLOMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (893, 5, 'YONDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (895, 5, 'ZARAGOZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 8, 'BARRANQUILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (78, 8, 'BARANOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (137, 8, 'CAMPO DE LA CRUZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (141, 8, 'CANDELARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (296, 8, 'GALAPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (372, 8, 'JUAN DE ACOSTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (421, 8, 'LURUACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (433, 8, 'MALAMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (436, 8, 'MANATI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 8, 'PALMAR DE VARELA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (549, 8, 'PIOJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (558, 8, 'POLONUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (560, 8, 'PONEDERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 8, 'PUERTO COLOMBIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (606, 8, 'REPELON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (634, 8, 'SABANAGRANDE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (638, 8, 'SABANALARGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (675, 8, 'SANTA LUCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (685, 8, 'SANTO TOMAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (758, 8, 'SOLEDAD', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 8, 'SUAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (832, 8, 'TUBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (849, 8, 'USIACURI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 13, 'CARTAGENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (6, 13, 'ACHI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (30, 13, 'ALTOS DEL ROSARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (42, 13, 'ARENAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (52, 13, 'ARJONA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (62, 13, 'ARROYOHONDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (74, 13, 'BARRANCO DE LOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (140, 13, 'CALAMAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (160, 13, 'CANTAGALLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (188, 13, 'CICUCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 13, 'CORDOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (222, 13, 'CLEMENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (244, 13, 'EL CARMEN DE BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (248, 13, 'EL GUAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (268, 13, 'EL PEÑON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 13, 'HATILLO DE LOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 13, 'MAGANGUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (433, 13, 'MAHATES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (440, 13, 'MARGARITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (442, 13, 'MARIA LA BAJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (458, 13, 'MONTECRISTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (468, 13, 'MOMPOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 13, 'MORALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (490, 13, 'NOROSI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (549, 13, 'PINILLOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 13, 'REGIDOR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (600, 13, 'RIO VIEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (620, 13, 'SAN CRISTOBAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (647, 13, 'SAN ESTANISLAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (650, 13, 'SAN FERNANDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (654, 13, 'SAN JACINTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (655, 13, 'SAN JACINTO DEL CAUCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (657, 13, 'SAN JUAN NEPOMUCENO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (667, 13, 'SAN MARTIN DE LOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 13, 'SAN PABLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (673, 13, 'SANTA CATALINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (683, 13, 'SANTA ROSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (688, 13, 'SANTA ROSA DEL SUR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (744, 13, 'SIMITI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (760, 13, 'SOPLAVIENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (780, 13, 'TALAIGUA NUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (810, 13, 'TIQUISIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (836, 13, 'TURBACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (838, 13, 'TURBANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 13, 'VILLANUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (894, 13, 'ZAMBRANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 15, 'TUNJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (22, 15, 'ALMEIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (47, 15, 'AQUITANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 15, 'ARCABUCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (87, 15, 'BELEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (90, 15, 'BERBEO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (92, 15, 'BETEITIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (97, 15, 'BOAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (104, 15, 'BOYACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (106, 15, 'BRICEÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (109, 15, 'BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (114, 15, 'BUSBANZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (131, 15, 'CALDAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (135, 15, 'CAMPOHERMOSO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (162, 15, 'CERINZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (172, 15, 'CHINAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (176, 15, 'CHIQUINQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (180, 15, 'CHISCAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (183, 15, 'CHITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (185, 15, 'CHITARAQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (187, 15, 'CHIVATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (189, 15, 'CIENEGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (204, 15, 'COMBITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 15, 'COPER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (215, 15, 'CORRALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (218, 15, 'COVARACHIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (223, 15, 'CUBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (224, 15, 'CUCAITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (226, 15, 'CUITIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (232, 15, 'CHIQUIZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (236, 15, 'CHIVOR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (238, 15, 'DUITAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (244, 15, 'EL COCUY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (248, 15, 'EL ESPINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (272, 15, 'FIRAVITOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (276, 15, 'FLORESTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (293, 15, 'GACHANTIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (296, 15, 'GAMEZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (299, 15, 'GARAGOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (317, 15, 'GUACAMAYAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (322, 15, 'GUATEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (325, 15, 'GUAYATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (332, 15, 'GUICAN DE LA SIERRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (362, 15, 'IZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (367, 15, 'JENESANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (368, 15, 'JERICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 15, 'LABRANZAGRANDE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (380, 15, 'LA CAPILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (401, 15, 'LA VICTORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (403, 15, 'LA UVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (407, 15, 'VILLA DE LEYVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (425, 15, 'MACANAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (442, 15, 'MARIPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (455, 15, 'MIRAFLORES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (464, 15, 'MONGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (466, 15, 'MONGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (469, 15, 'MONIQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (476, 15, 'MOTAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (480, 15, 'MUZO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (491, 15, 'NOBSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (494, 15, 'NUEVO COLON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (500, 15, 'OICATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (507, 15, 'OTANCHE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (511, 15, 'PACHAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (514, 15, 'PAEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (516, 15, 'PAIPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (518, 15, 'PAJARITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (522, 15, 'PANQUEBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (531, 15, 'PAUNA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (533, 15, 'PAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (537, 15, 'PAZ DE RIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (542, 15, 'PESCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (550, 15, 'PISBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (572, 15, 'PUERTO BOYACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 15, 'QUIPAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (599, 15, 'RAMIRIQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (600, 15, 'RAQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (621, 15, 'RONDON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (632, 15, 'SABOYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (638, 15, 'SACHICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (646, 15, 'SAMACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 15, 'SAN EDUARDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (664, 15, 'SAN JOSE DE PARE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (667, 15, 'SAN LUIS DE GACENO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (673, 15, 'SAN MATEO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (676, 15, 'SAN MIGUEL DE SEMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (681, 15, 'SAN PABLO DE BORBUR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 15, 'SANTANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (690, 15, 'SANTA MARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (693, 15, 'SANTA ROSA DE VITERBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (696, 15, 'SANTA SOFIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 15, 'SATIVANORTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (723, 15, 'SATIVASUR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (740, 15, 'SIACHOQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (753, 15, 'SOATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (755, 15, 'SOCOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (757, 15, 'SOCHA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (759, 15, 'SOGAMOSO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (761, 15, 'SOMONDOCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (762, 15, 'SORA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (763, 15, 'SOTAQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (764, 15, 'SORACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (774, 15, 'SUSACON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (776, 15, 'SUTAMARCHAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (778, 15, 'SUTATENZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (790, 15, 'TASCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (798, 15, 'TENZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (804, 15, 'TIBANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (806, 15, 'TIBASOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (808, 15, 'TINJACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (810, 15, 'TIPACOQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (814, 15, 'TOCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (816, 15, 'TOGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (820, 15, 'TOPAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (822, 15, 'TOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (832, 15, 'TUNUNGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (835, 15, 'TURMEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (837, 15, 'TUTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (839, 15, 'TUTAZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (842, 15, 'UMBITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (861, 15, 'VENTAQUEMADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (879, 15, 'VIRACACHA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (897, 15, 'ZETAQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 17, 'MANIZALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (13, 17, 'AGUADAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (42, 17, 'ANSERMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (50, 17, 'ARANZAZU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (88, 17, 'BELALCAZAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (174, 17, 'CHINCHINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (272, 17, 'FILADELFIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (380, 17, 'LA DORADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (388, 17, 'LA MERCED', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (433, 17, 'MANZANARES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (442, 17, 'MARMATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (444, 17, 'MARQUETALIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (446, 17, 'MARULANDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (486, 17, 'NEIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (495, 17, 'NORCASIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (513, 17, 'PACORA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 17, 'PALESTINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (541, 17, 'PENSILVANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (614, 17, 'RIOSUCIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (616, 17, 'RISARALDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (653, 17, 'SALAMINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (662, 17, 'SAMANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (665, 17, 'SAN JOSE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (777, 17, 'SUPIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (867, 17, 'VICTORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 17, 'VILLAMARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (877, 17, 'VITERBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 19, 'POPAYAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (22, 19, 'ALMAGUER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (50, 19, 'ARGELIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (75, 19, 'BALBOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (100, 19, 'BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 19, 'BUENOS AIRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (130, 19, 'CAJIBIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (137, 19, 'CALDONO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (142, 19, 'CALOTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 19, 'CORINTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (256, 19, 'EL TAMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (290, 19, 'FLORENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 19, 'GUACHENE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 19, 'GUAPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (355, 19, 'INZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (364, 19, 'JAMBALO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (392, 19, 'LA SIERRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (397, 19, 'LA VEGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 19, 'LOPEZ DE MICAY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (450, 19, 'MERCADERES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (455, 19, 'MIRANDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 19, 'MORALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (513, 19, 'PADILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (517, 19, 'PAEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (532, 19, 'PATIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (533, 19, 'PIAMONTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (548, 19, 'PIENDAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 19, 'PUERTO TEJADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (585, 19, 'PURACE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (622, 19, 'ROSAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (693, 19, 'SAN SEBASTIAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (698, 19, 'SANTANDER DE QUILICHAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (701, 19, 'SANTA ROSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (743, 19, 'SILVIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (760, 19, 'SOTARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (780, 19, 'SUAREZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (785, 19, 'SUCRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (807, 19, 'TIMBIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (809, 19, 'TIMBIQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (821, 19, 'TORIBIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (824, 19, 'TOTORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (845, 19, 'VILLA RICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 20, 'VALLEDUPAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (13, 20, 'AGUSTIN CODAZZI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (32, 20, 'ASTREA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (45, 20, 'BECERRIL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (60, 20, 'BOSCONIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (175, 20, 'CHIMICHAGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (178, 20, 'CHIRIGUANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (228, 20, 'CURUMANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (238, 20, 'EL COPEY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 20, 'EL PASO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (295, 20, 'GAMARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (310, 20, 'GONZALEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (383, 20, 'LA GLORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 20, 'LA JAGUA DE IBIRICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (443, 20, 'MANAURE BALCON DEL CESAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (517, 20, 'PAILITAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (550, 20, 'PELAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (570, 20, 'PUEBLO BELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (614, 20, 'RIO DE ORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (621, 20, 'LA PAZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (710, 20, 'SAN ALBERTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (750, 20, 'SAN DIEGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 20, 'SAN MARTIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (787, 20, 'TAMALAMEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 23, 'MONTERIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (68, 23, 'AYAPEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (79, 23, 'BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (90, 23, 'CANALETE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (162, 23, 'CERETE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (168, 23, 'CHIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (182, 23, 'CHINU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (189, 23, 'CIENAGA DE ORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 23, 'COTORRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (350, 23, 'LA APARTADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (417, 23, 'LORICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (419, 23, 'LOS CORDOBAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (464, 23, 'MOMIL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (466, 23, 'MONTELIBANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (500, 23, 'MOÑITOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (555, 23, 'PLANETA RICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (570, 23, 'PUEBLO NUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (574, 23, 'PUERTO ESCONDIDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 23, 'PUERTO LIBERTADOR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (586, 23, 'PURISIMA DE LA CONCEPCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 23, 'SAHAGUN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 23, 'SAN ANDRES DE SOTAVENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (672, 23, 'SAN ANTERO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (675, 23, 'SAN BERNARDO DEL VIENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (678, 23, 'SAN CARLOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (682, 23, 'SAN JOSE DE URE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 23, 'SAN PELAYO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (807, 23, 'TIERRALTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (815, 23, 'TUCHIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (855, 23, 'VALENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 25, 'AGUA DE DIOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (19, 25, 'ALBAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (35, 25, 'ANAPOIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (40, 25, 'ANOLAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (53, 25, 'ARBELAEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (86, 25, 'BELTRAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (95, 25, 'BITUIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (99, 25, 'BOJACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (120, 25, 'CABRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (123, 25, 'CACHIPAY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (126, 25, 'CAJICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (148, 25, 'CAPARRAPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (151, 25, 'CAQUEZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (154, 25, 'CARMEN DE CARUPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (168, 25, 'CHAGUANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (175, 25, 'CHIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (178, 25, 'CHIPAQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (181, 25, 'CHOACHI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (183, 25, 'CHOCONTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (200, 25, 'COGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (214, 25, 'COTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (224, 25, 'CUCUNUBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 25, 'EL COLEGIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (258, 25, 'EL PEÑON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (260, 25, 'EL ROSAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (269, 25, 'FACATATIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (279, 25, 'FOMEQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (281, 25, 'FOSCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (286, 25, 'FUNZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (288, 25, 'FUQUENE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (290, 25, 'FUSAGASUGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (293, 25, 'GACHALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (295, 25, 'GACHANCIPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (297, 25, 'GACHETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (299, 25, 'GAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (307, 25, 'GIRARDOT', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (312, 25, 'GRANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (317, 25, 'GUACHETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (320, 25, 'GUADUAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (322, 25, 'GUASCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (324, 25, 'GUATAQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (326, 25, 'GUATAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (328, 25, 'GUAYABAL DE SIQUIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (335, 25, 'GUAYABETAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (339, 25, 'GUTIERREZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (368, 25, 'JERUSALEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (372, 25, 'JUNIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 25, 'LA CALERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (386, 25, 'LA MESA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (394, 25, 'LA PALMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (398, 25, 'LA PEÑA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (402, 25, 'LA VEGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (407, 25, 'LENGUAZAQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (426, 25, 'MACHETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 25, 'MADRID', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (436, 25, 'MANTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (438, 25, 'MEDINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 25, 'MOSQUERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (483, 25, 'NARIÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (486, 25, 'NEMOCON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (488, 25, 'NILO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (489, 25, 'NIMAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (491, 25, 'NOCAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (506, 25, 'VENECIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (513, 25, 'PACHO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (518, 25, 'PAIME', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 25, 'PANDI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (530, 25, 'PARATEBUENO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (535, 25, 'PASCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (572, 25, 'PUERTO SALGAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 25, 'PULI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (592, 25, 'QUEBRADANEGRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (594, 25, 'QUETAME', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (596, 25, 'QUIPILE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (599, 25, 'APULO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (612, 25, 'RICAURTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (645, 25, 'SAN ANTONIO DEL TEQUENDAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (649, 25, 'SAN BERNARDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (653, 25, 'SAN CAYETANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (658, 25, 'SAN FRANCISCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (662, 25, 'SAN JUAN DE RIOSECO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (718, 25, 'SASAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (736, 25, 'SESQUILE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (740, 25, 'SIBATE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (743, 25, 'SILVANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (745, 25, 'SIMIJACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (754, 25, 'SOACHA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (758, 25, 'SOPO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (769, 25, 'SUBACHOQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (772, 25, 'SUESCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (777, 25, 'SUPATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (779, 25, 'SUSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (781, 25, 'SUTATAUSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (785, 25, 'TABIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (793, 25, 'TAUSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (797, 25, 'TENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (799, 25, 'TENJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (805, 25, 'TIBACUY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (807, 25, 'TIBIRITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (815, 25, 'TOCAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (817, 25, 'TOCANCIPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (823, 25, 'TOPAIPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (839, 25, 'UBALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (841, 25, 'UBAQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (843, 25, 'VILLA DE SAN DIEGO DE UBATE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (845, 25, 'UNE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (851, 25, 'UTICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (862, 25, 'VERGARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (867, 25, 'VIANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (871, 25, 'VILLAGOMEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 25, 'VILLAPINZON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (875, 25, 'VILLETA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (878, 25, 'VIOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 25, 'YACOPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (898, 25, 'ZIPACON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (899, 25, 'ZIPAQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 27, 'QUIBDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (6, 27, 'ACANDI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (25, 27, 'ALTO BAUDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (50, 27, 'ATRATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (73, 27, 'BAGADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (75, 27, 'BAHIA SOLANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (77, 27, 'BAJO BAUDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (99, 27, 'BOJAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (135, 27, 'EL CANTON DEL SAN PABLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (150, 27, 'CARMEN DEL DARIEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (160, 27, 'CERTEGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (205, 27, 'CONDOTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 27, 'EL CARMEN DE ATRATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 27, 'EL LITORAL DEL SAN JUAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (361, 27, 'ISTMINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (372, 27, 'JURADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (413, 27, 'LLORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (425, 27, 'MEDIO ATRATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 27, 'MEDIO BAUDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (450, 27, 'MEDIO SAN JUAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (491, 27, 'NOVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (495, 27, 'NUQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (580, 27, 'RIO IRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (600, 27, 'RIO QUITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (615, 27, 'RIOSUCIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 27, 'SAN JOSE DEL PALMAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (745, 27, 'SIPI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (787, 27, 'TADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (800, 27, 'UNGUIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (810, 27, 'UNION PANAMERICANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 41, 'NEIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (6, 41, 'ACEVEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (13, 41, 'AGRADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (16, 41, 'AIPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (20, 41, 'ALGECIRAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (26, 41, 'ALTAMIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (78, 41, 'BARAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (132, 41, 'CAMPOALEGRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (206, 41, 'COLOMBIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (244, 41, 'ELIAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (298, 41, 'GARZON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (306, 41, 'GIGANTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (319, 41, 'GUADALUPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (349, 41, 'HOBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (357, 41, 'IQUIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (359, 41, 'ISNOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (378, 41, 'LA ARGENTINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (396, 41, 'LA PLATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (483, 41, 'NATAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (503, 41, 'OPORAPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (518, 41, 'PAICOL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 41, 'PALERMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (530, 41, 'PALESTINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (548, 41, 'PITAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (551, 41, 'PITALITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (615, 41, 'RIVERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 41, 'SALADOBLANCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (668, 41, 'SAN AGUSTIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (676, 41, 'SANTA MARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 41, 'SUAZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (791, 41, 'TARQUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (797, 41, 'TESALIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (799, 41, 'TELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (801, 41, 'TERUEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (807, 41, 'TIMANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (872, 41, 'VILLAVIEJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 41, 'YAGUARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 44, 'RIOHACHA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (35, 44, 'ALBANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (78, 44, 'BARRANCAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (90, 44, 'DIBULLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (98, 44, 'DISTRACCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 44, 'EL MOLINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (279, 44, 'FONSECA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (378, 44, 'HATONUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (420, 44, 'LA JAGUA DEL PILAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 44, 'MAICAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (560, 44, 'MANAURE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (650, 44, 'SAN JUAN DEL CESAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (847, 44, 'URIBIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (855, 44, 'URUMITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (874, 44, 'VILLANUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 47, 'SANTA MARTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (30, 47, 'ALGARROBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (53, 47, 'ARACATACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (58, 47, 'ARIGUANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (161, 47, 'CERRO DE SAN ANTONIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (170, 47, 'CHIVOLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (189, 47, 'CIENAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (205, 47, 'CONCORDIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 47, 'EL BANCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (258, 47, 'EL PIÑON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (268, 47, 'EL RETEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (288, 47, 'FUNDACION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 47, 'GUAMAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (460, 47, 'NUEVA GRANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (541, 47, 'PEDRAZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (545, 47, 'PIJIÑO DEL CARMEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (551, 47, 'PIVIJAY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (555, 47, 'PLATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (570, 47, 'PUEBLOVIEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (605, 47, 'REMOLINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 47, 'SABANAS DE SAN ANGEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (675, 47, 'SALAMINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (692, 47, 'SAN SEBASTIAN DE BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (703, 47, 'SAN ZENON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (707, 47, 'SANTA ANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 47, 'SANTA BARBARA DE PINTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (745, 47, 'SITIONUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (798, 47, 'TENERIFE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (960, 47, 'ZAPAYAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (980, 47, 'ZONA BANANERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 50, 'VILLAVICENCIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (6, 50, 'ACACIAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 50, 'BARRANCA DE UPIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (124, 50, 'CABUYARO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (150, 50, 'CASTILLA LA NUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (223, 50, 'CUBARRAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (226, 50, 'CUMARAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 50, 'EL CALVARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (251, 50, 'EL CASTILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (270, 50, 'EL DORADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (287, 50, 'FUENTE DE ORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (313, 50, 'GRANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 50, 'GUAMAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (325, 50, 'MAPIRIPAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (330, 50, 'MESETAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (350, 50, 'LA MACARENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (370, 50, 'URIBE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 50, 'LEJANIAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (450, 50, 'PUERTO CONCORDIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (568, 50, 'PUERTO GAITAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 50, 'PUERTO LOPEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (577, 50, 'PUERTO LLERAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (590, 50, 'PUERTO RICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (606, 50, 'RESTREPO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (680, 50, 'SAN CARLOS DE GUAROA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (683, 50, 'SAN JUAN DE ARAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 50, 'SAN JUANITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (689, 50, 'SAN MARTIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (711, 50, 'VISTAHERMOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 52, 'PASTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (19, 52, 'ALBAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (22, 52, 'ALDANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (36, 52, 'ANCUYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 52, 'ARBOLEDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (79, 52, 'BARBACOAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (83, 52, 'BELEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 52, 'BUESACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (203, 52, 'COLON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (207, 52, 'CONSACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (210, 52, 'CONTADERO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (215, 52, 'CORDOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (224, 52, 'CUASPUD', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (227, 52, 'CUMBAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (233, 52, 'CUMBITARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (240, 52, 'CHACHAGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 52, 'EL CHARCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (254, 52, 'EL PEÑOL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (256, 52, 'EL ROSARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (258, 52, 'EL TABLON DE GOMEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (260, 52, 'EL TAMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (287, 52, 'FUNES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (317, 52, 'GUACHUCAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (320, 52, 'GUAITARILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (323, 52, 'GUALMATAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (352, 52, 'ILES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (354, 52, 'IMUES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (356, 52, 'IPIALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (378, 52, 'LA CRUZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (381, 52, 'LA FLORIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (385, 52, 'LA LLANADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (390, 52, 'LA TOLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (399, 52, 'LA UNION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (405, 52, 'LEIVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (411, 52, 'LINARES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 52, 'LOS ANDES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (427, 52, 'MAGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (435, 52, 'MALLAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 52, 'MOSQUERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (480, 52, 'NARIÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (490, 52, 'OLAYA HERRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (506, 52, 'OSPINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 52, 'FRANCISCO PIZARRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (540, 52, 'POLICARPA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (560, 52, 'POTOSI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (565, 52, 'PROVIDENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 52, 'PUERRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (585, 52, 'PUPIALES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (612, 52, 'RICAURTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (621, 52, 'ROBERTO PAYAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (678, 52, 'SAMANIEGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (683, 52, 'SANDONA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (685, 52, 'SAN BERNARDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (687, 52, 'SAN LORENZO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (693, 52, 'SAN PABLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (694, 52, 'SAN PEDRO DE CARTAGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (696, 52, 'SANTA BARBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (699, 52, 'SANTACRUZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 52, 'SAPUYES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (786, 52, 'TAMINANGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (788, 52, 'TANGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (835, 52, 'SAN ANDRES DE TUMACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (838, 52, 'TUQUERRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 52, 'YACUANQUER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 54, 'CUCUTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (3, 54, 'ABREGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 54, 'ARBOLEDAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (99, 54, 'BOCHALEMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (109, 54, 'BUCARASICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (125, 54, 'CACOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (128, 54, 'CACHIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (172, 54, 'CHINACOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (174, 54, 'CHITAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (206, 54, 'CONVENCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (223, 54, 'CUCUTILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (239, 54, 'DURANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 54, 'EL CARMEN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 54, 'EL TARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (261, 54, 'EL ZULIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (313, 54, 'GRAMALOTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (344, 54, 'HACARI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (347, 54, 'HERRAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 54, 'LABATECA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (385, 54, 'LA ESPERANZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (398, 54, 'LA PLAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (405, 54, 'LOS PATIOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 54, 'LOURDES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (480, 54, 'MUTISCUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (498, 54, 'OCAÑA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (518, 54, 'PAMPLONA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 54, 'PAMPLONITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (553, 54, 'PUERTO SANTANDER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (599, 54, 'RAGONVALIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (660, 54, 'SALAZAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 54, 'SAN CALIXTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (673, 54, 'SAN CAYETANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (680, 54, 'SANTIAGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 54, 'SARDINATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (743, 54, 'SILOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (800, 54, 'TEORAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (810, 54, 'TIBU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (820, 54, 'TOLEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (871, 54, 'VILLA CARO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (874, 54, 'VILLA DEL ROSARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 63, 'ARMENIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (111, 63, 'BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (130, 63, 'CALARCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (190, 63, 'CIRCASIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (212, 63, 'CORDOBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (272, 63, 'FILANDIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (302, 63, 'GENOVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (401, 63, 'LA TEBAIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (470, 63, 'MONTENEGRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (548, 63, 'PIJAO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (594, 63, 'QUIMBAYA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (690, 63, 'SALENTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 66, 'PEREIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (45, 66, 'APIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (75, 66, 'BALBOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (88, 66, 'BELEN DE UMBRIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (170, 66, 'DOSQUEBRADAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 66, 'GUATICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (383, 66, 'LA CELIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 66, 'LA VIRGINIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (440, 66, 'MARSELLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (456, 66, 'MISTRATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (572, 66, 'PUEBLO RICO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (594, 66, 'QUINCHIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (682, 66, 'SANTA ROSA DE CABAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (687, 66, 'SANTUARIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 68, 'BUCARAMANGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (13, 68, 'AGUADA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (20, 68, 'ALBANIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (51, 68, 'ARATOCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (77, 68, 'BARBOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (79, 68, 'BARICHARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (81, 68, 'BARRANCABERMEJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (92, 68, 'BETULIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (101, 68, 'BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (121, 68, 'CABRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (132, 68, 'CALIFORNIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (147, 68, 'CAPITANEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (152, 68, 'CARCASI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (160, 68, 'CEPITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (162, 68, 'CERRITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (167, 68, 'CHARALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (169, 68, 'CHARTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (176, 68, 'CHIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (179, 68, 'CHIPATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (190, 68, 'CIMITARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (207, 68, 'CONCEPCION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (209, 68, 'CONFINES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (211, 68, 'CONTRATACION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (217, 68, 'COROMORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (229, 68, 'CURITI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (235, 68, 'EL CARMEN DE CHUCURI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (245, 68, 'EL GUACAMAYO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 68, 'EL PEÑON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (255, 68, 'EL PLAYON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (264, 68, 'ENCINO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (266, 68, 'ENCISO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (271, 68, 'FLORIAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (276, 68, 'FLORIDABLANCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (296, 68, 'GALAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (298, 68, 'GAMBITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (307, 68, 'GIRON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 68, 'GUACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (320, 68, 'GUADALUPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (322, 68, 'GUAPOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (324, 68, 'GUAVATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (327, 68, 'GUEPSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (344, 68, 'HATO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (368, 68, 'JESUS MARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (370, 68, 'JORDAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 68, 'LA BELLEZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (385, 68, 'LANDAZURI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (397, 68, 'LA PAZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (406, 68, 'LEBRIJA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 68, 'LOS SANTOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (425, 68, 'MACARAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (432, 68, 'MALAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (444, 68, 'MATANZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (464, 68, 'MOGOTES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (468, 68, 'MOLAGAVITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (498, 68, 'OCAMONTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (500, 68, 'OIBA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (502, 68, 'ONZAGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (522, 68, 'PALMAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 68, 'PALMAS DEL SOCORRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (533, 68, 'PARAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (547, 68, 'PIEDECUESTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (549, 68, 'PINCHOTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (572, 68, 'PUENTE NACIONAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 68, 'PUERTO PARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (575, 68, 'PUERTO WILCHES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (615, 68, 'RIONEGRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (655, 68, 'SABANA DE TORRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (669, 68, 'SAN ANDRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (673, 68, 'SAN BENITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (679, 68, 'SAN GIL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (682, 68, 'SAN JOAQUIN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (684, 68, 'SAN JOSE DE MIRANDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 68, 'SAN MIGUEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (689, 68, 'SAN VICENTE DE CHUCURI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (705, 68, 'SANTA BARBARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (720, 68, 'SANTA HELENA DEL OPON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (745, 68, 'SIMACOTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (755, 68, 'SOCORRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 68, 'SUAITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (773, 68, 'SUCRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (780, 68, 'SURATA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (820, 68, 'TONA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (855, 68, 'VALLE DE SAN JOSE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (861, 68, 'VELEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (867, 68, 'VETAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (872, 68, 'VILLANUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (895, 68, 'ZAPATOCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 70, 'SINCELEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (110, 70, 'BUENAVISTA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (124, 70, 'CAIMITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (204, 70, 'COLOSO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (215, 70, 'COROZAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (221, 70, 'COVEÑAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (230, 70, 'CHALAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (233, 70, 'EL ROBLE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (235, 70, 'GALERAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (265, 70, 'GUARANDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 70, 'LA UNION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (418, 70, 'LOS PALMITOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (429, 70, 'MAJAGUAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (473, 70, 'MORROA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (508, 70, 'OVEJAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (523, 70, 'PALMITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 70, 'SAMPUES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (678, 70, 'SAN BENITO ABAD', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (702, 70, 'SAN JUAN DE BETULIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (708, 70, 'SAN MARCOS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (713, 70, 'SAN ONOFRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (717, 70, 'SAN PEDRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (742, 70, 'SAN LUIS DE SINCE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (771, 70, 'SUCRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (820, 70, 'SANTIAGO DE TOLU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (823, 70, 'TOLU VIEJO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 73, 'IBAGUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (24, 73, 'ALPUJARRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (26, 73, 'ALVARADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (30, 73, 'AMBALEMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (43, 73, 'ANZOATEGUI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (55, 73, 'ARMERO GUAYABAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (67, 73, 'ATACO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (124, 73, 'CAJAMARCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (148, 73, 'CARMEN DE APICALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (152, 73, 'CASABIANCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (168, 73, 'CHAPARRAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (200, 73, 'COELLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (217, 73, 'COYAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (226, 73, 'CUNDAY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (236, 73, 'DOLORES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (268, 73, 'ESPINAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (270, 73, 'FALAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (275, 73, 'FLANDES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (283, 73, 'FRESNO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (319, 73, 'GUAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (347, 73, 'HERVEO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (349, 73, 'HONDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (352, 73, 'ICONONZO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (408, 73, 'LERIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (411, 73, 'LIBANO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (443, 73, 'SAN SEBASTIAN DE MARIQUITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (449, 73, 'MELGAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (461, 73, 'MURILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (483, 73, 'NATAGAIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (504, 73, 'ORTEGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 73, 'PALOCABILDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (547, 73, 'PIEDRAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (555, 73, 'PLANADAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (563, 73, 'PRADO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (585, 73, 'PURIFICACION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (616, 73, 'RIOBLANCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (622, 73, 'RONCESVALLES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (624, 73, 'ROVIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (671, 73, 'SALDAÑA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (675, 73, 'SAN ANTONIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (678, 73, 'SAN LUIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (686, 73, 'SANTA ISABEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (770, 73, 'SUAREZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (854, 73, 'VALLE DE SAN JUAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (861, 73, 'VENADILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (870, 73, 'VILLAHERMOSA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (873, 73, 'VILLARRICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 76, 'CALI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (20, 76, 'ALCALA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (36, 76, 'ANDALUCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (41, 76, 'ANSERMANUEVO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (54, 76, 'ARGELIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (100, 76, 'BOLIVAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (109, 76, 'BUENAVENTURA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (111, 76, 'GUADALAJARA DE BUGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (113, 76, 'BUGALAGRANDE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (122, 76, 'CAICEDONIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (126, 76, 'CALIMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (130, 76, 'CANDELARIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (147, 76, 'CARTAGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (233, 76, 'DAGUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (243, 76, 'EL AGUILA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (246, 76, 'EL CAIRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (248, 76, 'EL CERRITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 76, 'EL DOVIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (275, 76, 'FLORIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (306, 76, 'GINEBRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (318, 76, 'GUACARI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (364, 76, 'JAMUNDI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (377, 76, 'LA CUMBRE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 76, 'LA UNION', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (403, 76, 'LA VICTORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (497, 76, 'OBANDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (520, 76, 'PALMIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (563, 76, 'PRADERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (606, 76, 'RESTREPO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (616, 76, 'RIOFRIO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (622, 76, 'ROLDANILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (670, 76, 'SAN PEDRO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (736, 76, 'SEVILLA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (823, 76, 'TORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (828, 76, 'TRUJILLO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (834, 76, 'TULUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (845, 76, 'ULLOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (863, 76, 'VERSALLES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (869, 76, 'VIJES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (890, 76, 'YOTOCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (892, 76, 'YUMBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (895, 76, 'ZARZAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 81, 'ARAUCA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (65, 81, 'ARAUQUITA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (220, 81, 'CRAVO NORTE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 81, 'FORTUL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (591, 81, 'PUERTO RONDON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (736, 81, 'SARAVENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (794, 81, 'TAME', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 85, 'YOPAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (10, 85, 'AGUAZUL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (15, 85, 'CHAMEZA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (125, 85, 'HATO COROZAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (136, 85, 'LA SALINA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (139, 85, 'MANI', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (230, 85, 'OROCUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (250, 85, 'PAZ DE ARIPORO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (263, 85, 'PORE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (279, 85, 'RECETOR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (300, 85, 'SABANALARGA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (315, 85, 'SACAMA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (325, 85, 'SAN LUIS DE PALENQUE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (400, 85, 'TAMARA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (410, 85, 'TAURAMENA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 85, 'TRINIDAD', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (440, 85, 'VILLANUEVA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 86, 'MOCOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (219, 86, 'COLON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (320, 86, 'ORITO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (568, 86, 'PUERTO ASIS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (569, 86, 'PUERTO CAICEDO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (571, 86, 'PUERTO GUZMAN', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (573, 86, 'PUERTO LEGUIZAMO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (749, 86, 'SIBUNDOY', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (755, 86, 'SAN FRANCISCO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (757, 86, 'SAN MIGUEL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (760, 86, 'SANTIAGO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (865, 86, 'VALLE DEL GUAMUEZ', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 86, 'VILLAGARZON', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 88, 'SAN ANDRES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (564, 88, 'PROVIDENCIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 91, 'LETICIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (263, 91, 'EL ENCANTO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (405, 91, 'LA CHORRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (407, 91, 'LA PEDRERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (430, 91, 'LA VICTORIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (460, 91, 'MIRITI - PARANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (530, 91, 'PUERTO ALEGRIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (536, 91, 'PUERTO ARICA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (540, 91, 'PUERTO NARIÑO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (669, 91, 'PUERTO SANTANDER', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (798, 91, 'TARAPACA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 94, 'INIRIDA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (343, 94, 'BARRANCO MINAS', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (663, 94, 'MAPIRIPANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (883, 94, 'SAN FELIPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (884, 94, 'PUERTO COLOMBIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (885, 94, 'LA GUADALUPE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (886, 94, 'CACAHUAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (887, 94, 'PANA PANA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (888, 94, 'MORICHAL', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 95, 'SAN JOSE DEL GUAVIARE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (15, 95, 'CALAMAR', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (25, 95, 'EL RETORNO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (200, 95, 'MIRAFLORES', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (1, 97, 'MITU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (161, 97, 'CARURU', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (511, 97, 'PACOA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (666, 97, 'TARAIRA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (777, 97, 'PAPUNAUA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (889, 97, 'YAVARATE', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (524, 99, 'LA PRIMAVERA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (624, 99, 'SANTA ROSALIA', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (773, 99, 'CUMARIBO', 1, 170, NULL, NULL, 1);
INSERT INTO municipio VALUES (579, 5, 'Puerto Berrio', 1, 170, '0', NULL, 1);
INSERT INTO municipio VALUES (1, 11, 'BOGOTA', 1, 170, '1', '1-170-11-1', 1);
INSERT INTO municipio VALUES (225, 85, 'NUNCHIA', 1, 170, '1', '0-', 1);
INSERT INTO municipio VALUES (11, 20, 'AGUACHICA', 1, 170, '1', '0-', 1);
INSERT INTO municipio VALUES (162, 85, 'MONTERREY', 1, 170, '1', '1-170-25-123', 1);
INSERT INTO municipio VALUES (45, 5, 'APARTADÓ', 1, 170, '0', NULL, 1);


--
-- Data for Name: nivel_academico_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO nivel_academico_pqrs VALUES (1, 'Educación Básica Primaria');
INSERT INTO nivel_academico_pqrs VALUES (2, 'Educación Básica Secundaria');
INSERT INTO nivel_academico_pqrs VALUES (3, 'Técnico/Tecnologo');
INSERT INTO nivel_academico_pqrs VALUES (4, 'Profesional');
INSERT INTO nivel_academico_pqrs VALUES (5, 'Especializacion');
INSERT INTO nivel_academico_pqrs VALUES (6, 'Maestría');


--
-- Name: nivel_academico_pqrs_id_nivel_acad_pqrs_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('nivel_academico_pqrs_id_nivel_acad_pqrs_seq', 1, false);


--
-- Name: num_resol_dtc; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('num_resol_dtc', 24, false);


--
-- Name: num_resol_dtn; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('num_resol_dtn', 101, false);


--
-- Name: num_resol_dtoc; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('num_resol_dtoc', 21, false);


--
-- Name: num_resol_dtor; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('num_resol_dtor', 61, false);


--
-- Name: num_resol_dts; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('num_resol_dts', 61, false);


--
-- Name: num_resol_gral; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('num_resol_gral', 1, false);


--
-- Data for Name: par_serv_servicios; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO perfiles VALUES (2, 'ADMINISTRADOR DEL SISTEMA', '1', '1', '1', '1', 5, 1, 2, 1, 1, '0', 0, 3, 3, 3, 3, 1, 1, 2, 0, 2, 1, 2, 0, 1, 1, 1, 0, 2, 0, '1', '1', 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 3, 1, 1, 1, NULL, 0, 1, 1, 1);
INSERT INTO perfiles VALUES (1, 'ADMINISTRADOR TABLAS DE RETENCIÓN DOCUMENTAL', '1', '0', '1', '1', 3, 0, 2, 0, 0, '0', 0, 3, 3, 0, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 1, 1, 0, 2, 0, '1', '1', 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 2, 1, 0, 1, NULL, 0, 1, 0, 0);
INSERT INTO perfiles VALUES (3, 'FUNCIONARIO', '1', '0', '1', '1', 3, 0, 0, 0, 0, '0', 0, 1, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 2, 0, '1', '1', 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 2, 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO perfiles VALUES (4, 'JEFE', '1', '0', '1', '1', 3, 0, 0, 0, 0, '0', 0, 1, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 2, 0, '1', '1', 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO perfiles VALUES (5, 'VENTANILLA DE RADICACIÓN', '1', '1', '1', '1', 3, 1, 0, 0, 1, '0', 0, 1, 3, 3, 3, 1, 1, 2, 0, 0, 0, 0, 0, 0, 1, 1, 0, 2, 0, '1', '1', 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 2, 1, 0, 0, NULL, 0, 0, 0, 0);


--
-- Name: perfiles_codi_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('perfiles_codi_perfil_seq', 6, false);


--
-- Data for Name: pl_generado_plg; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: pl_tipo_plt; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: plan_table; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: plantilla_pl; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: plsql_profiler_runnumeric; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('plsql_profiler_runnumeric', 1, false);


--
-- Data for Name: pre_radicado; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: preguntas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO preguntas VALUES (1, '¿Cual era el nombre de tu primera mascota ?');
INSERT INTO preguntas VALUES (2, '¿Cual es el nombre de la ciudad en la que naciste?');
INSERT INTO preguntas VALUES (3, '¿Cual era el apodo de tu infancia?');
INSERT INTO preguntas VALUES (4, '¿Cual es el nombre de tu Abuelo?');
INSERT INTO preguntas VALUES (5, '¿Como se llama la primera escuela a la que asististe?');


--
-- Name: pres_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('pres_seq', 30392, false);


--
-- Data for Name: prestamo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: rango_edades_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO rango_edades_pqrs VALUES (1, 'Menores a 18');
INSERT INTO rango_edades_pqrs VALUES (2, 'Entre 18 a 28');
INSERT INTO rango_edades_pqrs VALUES (3, 'Entre 29 a 59');
INSERT INTO rango_edades_pqrs VALUES (4, 'Mayores 60');


--
-- Data for Name: respuestas_usuario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO roles VALUES (1, 'ADMINISTRADOR TABLAS DE RETENCIÓN DOCUMENTAL', '2018-08-08', 1);
INSERT INTO roles VALUES (3, 'FUNCIONARIO', '2018-08-08', 1);
INSERT INTO roles VALUES (5, 'VENTANILLA DE RADICACIÓN', '2018-08-08', 1);
INSERT INTO roles VALUES (2, 'ADMINISTRADOR DEL SISTEMA', '2018-08-08', 1);
INSERT INTO roles VALUES (4, 'JEFE', '2018-08-08', 1);


--
-- Name: roles_cod_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('roles_cod_rol_seq', 6, false);


--
-- Name: sec_bodega_empresas; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_bodega_empresas', 1, false);


--
-- Name: sec_central; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_central', 1, false);


--
-- Name: sec_ciu_ciudadano; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_ciu_ciudadano', 2, false);


--
-- Name: sec_def_contactos; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_def_contactos', 1, false);


--
-- Name: sec_dir_direcciones; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_dir_direcciones', 43, true);


--
-- Name: sec_edificio; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_edificio', 5, true);


--
-- Name: sec_fondo; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_fondo', 1, false);


--
-- Name: sec_inv; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_inv', 1, false);


--
-- Name: sec_oem_empresas; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_oem_empresas', 1, false);


--
-- Name: sec_oem_oempresas; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_oem_oempresas', 1, true);


--
-- Name: sec_planilla; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_planilla', 8, true);


--
-- Name: sec_planilla_envio; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_planilla_envio', 4, true);


--
-- Name: sec_planilla_tx; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_planilla_tx', 1, false);


--
-- Name: sec_prestamo; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_prestamo', 1, false);


--
-- Name: sec_rol_tipos_doc; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_rol_tipos_doc', 6003, true);


--
-- Name: sec_sgd_hfld_histflujodoc; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sec_sgd_hfld_histflujodoc', 1, false);


--
-- Name: secr_subseries_id_tabla; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_subseries_id_tabla', 279, true);


--
-- Name: secr_tp1_; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp1_', 1, false);


--
-- Name: secr_tp1_998; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp1_998', 20, true);


--
-- Name: secr_tp1_999; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp1_999', 1, false);


--
-- Name: secr_tp2_; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp2_', 1, false);


--
-- Name: secr_tp2_998; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp2_998', 11, true);


--
-- Name: secr_tp2_999; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp2_999', 1, false);


--
-- Name: secr_tp4_; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp4_', 1, false);


--
-- Name: secr_tp4_998; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp4_998', 1, true);


--
-- Name: secr_tp4_999; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('secr_tp4_999', 1, false);


--
-- Name: seq_parexp_paramexpediente; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('seq_parexp_paramexpediente', 16, true);


--
-- Name: seq_sgd_mrd_codigo; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('seq_sgd_mrd_codigo', 2298, true);


--
-- Data for Name: servicios_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO servicios_pqrs VALUES (1, 'General');
INSERT INTO servicios_pqrs VALUES (2, 'Urgencias');
INSERT INTO servicios_pqrs VALUES (3, 'Consulta Externa');
INSERT INTO servicios_pqrs VALUES (4, 'Hospitalización');
INSERT INTO servicios_pqrs VALUES (5, 'Laboratorio Clínico');
INSERT INTO servicios_pqrs VALUES (6, 'Imageniología');
INSERT INTO servicios_pqrs VALUES (7, 'Oficina de Talento Humano');
INSERT INTO servicios_pqrs VALUES (8, 'Oficina de Subsidios');
INSERT INTO servicios_pqrs VALUES (9, 'Coordinación Administrativa');
INSERT INTO servicios_pqrs VALUES (10, 'Coordinación Asistencial');
INSERT INTO servicios_pqrs VALUES (11, 'Albergues');
INSERT INTO servicios_pqrs VALUES (12, 'Gerencia');
INSERT INTO servicios_pqrs VALUES (13, 'Pagaduría');


--
-- Data for Name: sgd_agen_agendados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_anar_anexarg; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: sgd_anar_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_anar_secue', 1, false);


--
-- Data for Name: sgd_anu_anulados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_aper_adminperfiles; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_apli_aplintegra; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_apli_aplintegra VALUES (0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: sgd_aplmen_aplimens; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_aplus_plicusua; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_arch_depe; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_archivo_central; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_archivo_fondo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_archivo_hist; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_argd_argdoc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_argup_argudoctop; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_auditoria; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_camexp_campoexpediente; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_carp_descripcion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_carp_descripcion VALUES ('900', 1, 'Oficio');


--
-- Data for Name: sgd_cau_causal; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_caux_causales; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_ciu_ciudadano; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: sgd_ciu_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_ciu_secue', 1, false);


--
-- Data for Name: sgd_clta_clstarif; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_clta_clstarif VALUES (1, 1, 1, 'ENVIÓ MENSAJERO PERSONAL', 1, 1);


--
-- Data for Name: sgd_cob_campobliga; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_cob_campobliga VALUES (1, 'PAIS_NOMBRE', 'PAIS_NOMBRE', 2);
INSERT INTO sgd_cob_campobliga VALUES (2, 'NOMBRE', 'NOMBRE', 1);
INSERT INTO sgd_cob_campobliga VALUES (3, 'MUNI_NOMBRE', 'MUNI_NOMBRE', 1);
INSERT INTO sgd_cob_campobliga VALUES (4, 'DEPTO_NOMBRE', 'DEPTO_NOMBRE', 1);
INSERT INTO sgd_cob_campobliga VALUES (5, 'F_RAD_S', 'F_RAD_S', 1);
INSERT INTO sgd_cob_campobliga VALUES (6, 'TIPO', 'TIPO', 2);
INSERT INTO sgd_cob_campobliga VALUES (7, 'NOMBRE', 'NOMBRE', 2);
INSERT INTO sgd_cob_campobliga VALUES (8, 'MUNI_NOMBRE', 'MUNI_NOMBRE', 2);
INSERT INTO sgd_cob_campobliga VALUES (9, 'DEPTO_NOMBRE', 'DEPTO_NOMBRE', 2);
INSERT INTO sgd_cob_campobliga VALUES (10, 'DIR', 'DIR', 2);


--
-- Data for Name: sgd_dcau_causal; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_ddca_ddsgrgdo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_def_contactos; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_def_continentes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_def_continentes VALUES (1, 'AMERICA');
INSERT INTO sgd_def_continentes VALUES (2, 'EUROPA');
INSERT INTO sgd_def_continentes VALUES (3, 'ASIA');
INSERT INTO sgd_def_continentes VALUES (4, 'AFRICA');
INSERT INTO sgd_def_continentes VALUES (5, 'OCEANIA');
INSERT INTO sgd_def_continentes VALUES (6, 'ANTARTIDA');


--
-- Data for Name: sgd_def_paises; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_def_paises VALUES (170, 1, 'COLOMBIA');
INSERT INTO sgd_def_paises VALUES (862, 1, 'VENEZUELA');
INSERT INTO sgd_def_paises VALUES (214, 1, 'REPUBLICA DOMINICANA');
INSERT INTO sgd_def_paises VALUES (32, 1, 'ARGENTINA');
INSERT INTO sgd_def_paises VALUES (591, 1, 'PANAMA');
INSERT INTO sgd_def_paises VALUES (249, 1, 'ESTADOS UNIDOS');
INSERT INTO sgd_def_paises VALUES (276, 2, 'ALEMANIA');
INSERT INTO sgd_def_paises VALUES (55, 1, 'BRASIL');
INSERT INTO sgd_def_paises VALUES (244, 4, 'ANGOLA');
INSERT INTO sgd_def_paises VALUES (724, 2, 'ESPAÑA');
INSERT INTO sgd_def_paises VALUES (767, 2, 'SUIZA');
INSERT INTO sgd_def_paises VALUES (604, 1, 'PERU');
INSERT INTO sgd_def_paises VALUES (724, 1, 'ESPAÑA');


--
-- Data for Name: sgd_deve_dev_envio; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_deve_dev_envio VALUES (1, 'CASA DESOCUPADA');
INSERT INTO sgd_deve_dev_envio VALUES (2, 'CAMBIO DE DOMICILIO USUARIO');
INSERT INTO sgd_deve_dev_envio VALUES (3, 'CERRADO');
INSERT INTO sgd_deve_dev_envio VALUES (4, 'DEVUELTO DE PORTERIA');
INSERT INTO sgd_deve_dev_envio VALUES (5, 'DIRECCION DEFICIENTE');
INSERT INTO sgd_deve_dev_envio VALUES (6, 'FALLECIDO');
INSERT INTO sgd_deve_dev_envio VALUES (7, 'NO EXISTE NUMERO');
INSERT INTO sgd_deve_dev_envio VALUES (8, 'NO RESIDE');
INSERT INTO sgd_deve_dev_envio VALUES (9, 'NO RECLAMADO');
INSERT INTO sgd_deve_dev_envio VALUES (10, 'NO EXISTE EMPRESA');
INSERT INTO sgd_deve_dev_envio VALUES (11, 'ZONA DE ALTO RIESGO');
INSERT INTO sgd_deve_dev_envio VALUES (12, 'SOBRE DESOCUPADO');
INSERT INTO sgd_deve_dev_envio VALUES (13, 'FUERA PERIMETRO URBANO');
INSERT INTO sgd_deve_dev_envio VALUES (14, 'ENVIADO A ADPOSTAL, CONTROL DE CALIDAD');
INSERT INTO sgd_deve_dev_envio VALUES (15, 'SIN SELLO');
INSERT INTO sgd_deve_dev_envio VALUES (16, 'DOCUMENTO MAL RADICADO');
INSERT INTO sgd_deve_dev_envio VALUES (17, 'SOBREPASO TIEMPO DE ESPERA');
INSERT INTO sgd_deve_dev_envio VALUES (18, 'SE TRASLADO');


--
-- Name: sgd_dir_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_dir_secue', 1, false);


--
-- Data for Name: sgd_dnufe_docnufe; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_eanu_estanulacion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_eanu_estanulacion VALUES ('RADICADO EN SOLICITUD DE ANULACION', 1);
INSERT INTO sgd_eanu_estanulacion VALUES ('RADICADO ANULADO', 2);
INSERT INTO sgd_eanu_estanulacion VALUES ('RADICADO EN SOLICITUD DE REVIVIR', 3);
INSERT INTO sgd_eanu_estanulacion VALUES ('RADICADO IMPOSIBLE DE ANULAR', 9);


--
-- Data for Name: sgd_einv_inventario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--




--
-- Name: sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_ejes_tematicos_dependenci_id_sgd_eje_tematico_dependenc_seq', 343, true);


--
-- Data for Name: sgd_ejes_tematicos_dependencia; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: sgd_ejes_tematicos_id_sgd_eje_tematico_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_ejes_tematicos_id_sgd_eje_tematico_seq', 284, true);


--
-- Data for Name: sgd_empus_empusuario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_ent_entidades; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_enve_envioespecial; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_estc_estconsolid; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_estinst_estadoinstancia; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--


--
-- Name: sgd_exp_expediente_id_expediente_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_exp_expediente_id_expediente_seq', 14, true);


--
-- Data for Name: sgd_fars_faristas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_fenv_frmenvio; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_fenv_frmenvio VALUES (1, 'MENSAJERO PERSONAL', 1, 1);


--
-- Data for Name: sgd_fexp_flujoexpedientes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_fexp_flujoexpedientes VALUES (0, 0, 0, 0, '', '');


--
-- Data for Name: sgd_firmas_qr; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_firmas_qr VALUES ('20219980000031', 'ADMON', 'Usuario de Soporte', '1234567890', '998', '2021-02-23 14:58:52.691107', 1, 1);


--
-- Data for Name: sgd_firrad_firmarads; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_fld_flujodoc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_fun_funciones; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_hmtd_hismatdoc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: sgd_hmtd_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_hmtd_secue', 1, false);


--
-- Name: sgd_info_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_info_secue', 1, false);


--
-- Data for Name: sgd_instorf_instanciasorfeo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_lip_linkip; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_mat_matriz; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: sgd_mat_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_mat_secue', 1, false);


--
-- Data for Name: sgd_mpes_mddpeso; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_msdep_msgdep; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_msg_mensaje; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_mtd_matriz_doc; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--


--
-- Data for Name: sgd_not_notificacion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_ntrd_notifrad; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_oem_oempresas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_oem_oempresas VALUES (1, 4, 'SKINA TECHNOLOGIES SAS', '--', '8002509887', '', 1, 11, 'Carrera 37 No. 53-50', '6431582', 1, 170, 'soporte@skinatech.com');


--
-- Name: sgd_oem_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_oem_secue', 18398, false);


--
-- Data for Name: sgd_panu_peranulados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--


-
-- Data for Name: sgd_parexp_paramexpediente; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_parexp_paramexpediente VALUES (1, '998', '', 'Nombre de Carpeta', 1, 1);
INSERT INTO sgd_parexp_paramexpediente VALUES (2, '999', '', 'Nombre de Carpeta', 1, 1);


--
-- Data for Name: sgd_pen_pensionados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_pexp_procexpedientes; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_pexp_procexpedientes VALUES (0, NULL, 0, NULL, NULL, 1, 0);


--
-- Name: sgd_plg_secue; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_plg_secue', 1, false);


--
-- Data for Name: sgd_pnufe_procnumfe; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_pnun_procenum; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_prc_proceso; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_prd_prcdmentos; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_rda_retdoca; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--




--
-- Data for Name: sgd_rmr_radmasivre; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--




--
-- Data for Name: sgd_sed_sede; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_senuf_secnumfe; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--


--
-- Data for Name: sgd_tdec_tipodecision; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_tid_tipdecision; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_tidm_tidocmasiva; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_tidm_tidocmasiva VALUES (1, 'PLANTILLA');
INSERT INTO sgd_tidm_tidocmasiva VALUES (2, 'CSV');


--
-- Data for Name: sgd_tip3_tipotercero; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_tip3_tipotercero VALUES (1, NULL, NULL, NULL, NULL, 0, 0, 1);


--
-- Data for Name: sgd_tma_temas; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_tme_tipmen; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: sgd_tpr_tpdcumento; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_tpr_tpdcumento VALUES (29, 'Actas de Justicia Transicional', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (111, 'Certificaciones de devolución', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (112, 'Certificaciones de estudio', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (499, 'Felicitaciones', 0, NULL, NULL, '1', 0, 1, 1, NULL, 1, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (18, 'Acta de terminación', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (113, 'Certificaciones de estudios académicos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (114, 'Certificaciones de experiencia de trabajo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (501, 'respuesta', 45, NULL, NULL, '0', 1, 0, 1, NULL, 0, NULL, 0);
INSERT INTO sgd_tpr_tpdcumento VALUES (115, 'Certificaciones De Uso Del Suelo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (116, 'Certificaciones De Viabilidad Del Uso Del Suelo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (117, 'Certificaciones Demarcaciones Del Inmueble', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (118, 'Certificado de afiliación a la ARL', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (92, 'Avisos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (120, 'Certificado de antecedentes fiscales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (121, 'Certificado de antecedentes judiciales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (122, 'Certificado de aportes a parafiscales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (123, 'Certificado de aportes a seguridad social', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (146, 'Citaciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (502, 'Traslado por competencia ', 5, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (124, 'Certificado de aportes parafiscales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (238, 'Estudios de Suelos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (125, 'Certificado de aptitud laboral (examen médico de ingreso)', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (126, 'Certificado de Calibración', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (127, 'Certificado de Disponibilidad Presupuestal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (128, 'Certificado de disponibilidad presupuestal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (129, 'Certificado de existencia y representación legal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (130, 'Certificado de existencia y representación legal (personas Juridicas)', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (131, 'Certificado de inscripción ante el RUNT Seguro Obligatorio-SOAT', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (132, 'Certificado de insuficiencia o inexistencia de personal en planta', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (133, 'Certificado de la Revisión Tecnicomecánica y de Emisiones Contaminantes', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (134, 'Certificado de presentación del informe ejecutivo anual de evaluación al Sistema de Control Interno', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (135, 'Certificado de registro presupuestal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (136, 'Certificado de tradición y libertad de inmueble', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (137, 'Certificado del SISBEN', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (138, 'Certificado finaciero de deuda cancelada', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (139, 'Certificado registro presupuestal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (140, 'Certificados de antecedentes fiscales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (141, 'Certificados de Disponibilidad Presupuestal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (142, 'Certificados de registro presupuestal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (143, 'Certificados de Residencia', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (144, 'Certificados de responsabilidad estructural', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (145, 'Circulares', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (147, 'Comparendos fisicos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (148, 'Comprobante contable de egresos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (149, 'Comprobante contable de Ingreso', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (150, 'Comprobante de Baja de bienes de almacén', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (151, 'Comprobante de ingreso de bienes a almacén', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (152, 'Comprobantes de contabilidad', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (153, 'Compromisos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (154, 'Comunicaciones con otras entidades', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (155, 'Comunicaciones oficiales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (156, 'Comunicaciones oficiales consecutivo PQRS', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (157, 'Concepto de viabilidad', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (158, 'Concepto del bien', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (159, 'Concepto jurídico', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (160, 'Conceptos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (161, 'Conceptos De Normas Urbanísticas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (162, 'Conceptos De Reparaciones Locativas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (163, 'Conceptos Técnicos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (164, 'Conceptos Técnicos Agropecuarios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (165, 'Conceptos Técnicos Ambientales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (166, 'Conciliación Bancaria', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (167, 'Constancia ejecutoria', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (168, 'Construcción adecuación y manetenimiento de andenes senderos peatonales y ciclorutas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (169, 'Construcción ampliación y mantenimiento   Infraestructura Fisica Educativa', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (170, 'Construcción ampliación y mantenimiento  Infraestructura  Alumbrado Público', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (171, 'Construcción ampliación y mantenimiento Infraestructura Adulto Mayor', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (172, 'Construcción ampliación y mantenimiento Infraestructura Fisica Cultural', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (173, 'Construcción ampliación y mantenimiento Infraestructura Fisica Deportiva', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (174, 'Construcción ampliación y mantenimiento Infraestructura Personas Diversamente Hábiles', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (251, 'Fallos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (474, 'Solicitud de información', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (497, 'Tutelas', 1, NULL, NULL, '1', 0, 1, 1, 1, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (175, 'Construcción ampliación y mantenimiento Infraestructura Primera Infancia', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (176, 'Contenido de la publicidad', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (177, 'Contestación de la demanda', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (178, 'Contestación del recurso', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (179, 'Convocatorias de Emprendimiento', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (180, 'Convocatorias públicas', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (181, 'Copia certificado de libertad', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (182, 'Copia de facturas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (183, 'Copia recibo del impuesto predial cancelado', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (184, 'Copias documentos de identidad', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (185, 'Cronogramas de actividades', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (186, 'Cuadros de clasificación documental', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (187, 'Cuenta de cobro', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (188, 'Datos de hogares Sisbenizados (software SISBEN III)', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (189, 'Declaración de Bienes y Rentas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (190, 'Declaraciones por Recaudo de Impuesto Aportes y participaciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (193, 'Declaraciones por Recaudo de Impuesto de Industria y Comercio', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (194, 'Declaraciones por Recaudo de Impuesto de Multas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (195, 'Declaraciones por Recaudo de Impuesto de Rentas contractuales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (196, 'Declaraciones por Recaudo de Impuesto de Sobretasa a la Gasolina', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (197, 'Declaraciones por Recaudo de Impuesto de Tasas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (198, 'Declaraciones por Recaudo de Impuesto Predial', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (199, 'Declaraciones por Recaudo de Impuesto Rifas Municipales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (200, 'Decretos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (202, 'Demarcación del predio', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (205, 'Desarrollo de eventos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (206, 'Designación de comité evaluador', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (207, 'Despachos comisorios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (208, 'Diagnostico', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (209, 'Diagnóstico de las necesidades de aprendizaje', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (210, 'Diagnóstico de necesidades', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (211, 'Diagnostico documental', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (212, 'Dictamen técnico del Consejo Consultivo de Ordenamiento Territorial en el que se conceptúa favorablemente respecto a la revisión', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (213, 'Diseño geometrico de via', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (214, 'Diseño y Contrucción Sistema Aprovechamiento de   Plantas de Tratamiento de agua', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (215, 'Disponibilidad inmediata de servicios públicos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (216, 'Documento Técnico de Soporte de la revisión que explica las decisiones adoptadas en el proyecto de acuerdo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (217, 'Documentos requisitos postulante', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (218, 'Dotación de unidades sanitarias', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (219, 'Emplazamientom para decalrar y para corregir', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (220, 'Entrega de Insumos agropecuariso', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (221, 'Escrito de recurso', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (222, 'Escrito descargos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (223, 'Escrito recurso de apelación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (224, 'Escritura Pública', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (225, 'Especificaciones técnicas del producto o servicio', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (226, 'Estado de Cambios en el Patrimonio', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (227, 'Estado de Cambios en la Situación Financiera', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (228, 'Estado de Flujos de Efectivo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (229, 'Estado de Inventarios', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (230, 'Estado de Resultados', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (231, 'Estados de Costos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (232, 'Estados de Liquidación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (233, 'Estados Financieros Consolidados', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (234, 'Estados Financieros de Períodos Intermedios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (235, 'Estados Financieros Extraordinarios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (294, 'Inventario documental archivo de gestión', 30, NULL, NULL, '1', 0, 0, 1, 30, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (236, 'Estudio de conveniencia y oportunidad', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (68, 'Auto de archivo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (491, 'Sugerencias', 30, NULL, NULL, '1', 0, 1, 1, 30, 1, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (204, 'Derecho de petición', 30, NULL, NULL, '1', 0, 1, 1, 30, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (203, 'Denuncia', 30, NULL, NULL, '1', 1, 1, 1, NULL, 1, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (420, 'Queja', 30, NULL, NULL, '1', 0, 1, 1, 30, 1, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (347, 'Petición', 30, NULL, NULL, '1', 0, 1, 0, 30, 1, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (283, 'Informe', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (237, 'Estudios de evaluación de factores de selección', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (239, 'Estudios de viabilidad', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (240, 'Estudios jurídicos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (241, 'Estudios previos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (242, 'Estudios técnicos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (243, 'Estudios técnicos de soporte sobre los hechos condiciones o circunstancias que dan lugar a la revisión según sea el caso', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (244, 'Evaluación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (245, 'Evaluación inicial del sistema de seguridad y salud en el trabajo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (246, 'Examen médico pre-ocupacional', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (247, 'Extractos bancarios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (248, 'Factura', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (249, 'Fallo de primera instancia', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (250, 'Fallo segunda instancia', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (252, 'Feria Dominical', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (253, 'Ficha MGA', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (254, 'Ficha Técnica', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (255, 'Fichas de eventos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (256, 'Fichas del SISBEN', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (257, 'Formacion para el Emprendimiento', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (258, 'Formato de Solicitud de Autorizaciones Eventos y Espectáculos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (259, 'Formulario de cancelación de registro de contribuyentes del impuesto de industria y comercio', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (260, 'Formulario unico nacional', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (261, 'Fotocopia de la factura de servicios públicos domiciliarios de la vivienda', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (262, 'Garantías', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (263, 'Garantía única y/o de responsabilidad civil extracontractual', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (264, 'Hoja de vida de la Función Pública para oferentes personas naturales y personas jurídicas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (201, 'Demanda', 10, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (266, 'Incautaciones o embargos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (267, 'Indicadores', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (268, 'Informe de adjudicación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (269, 'Informe de auditoría del Sistema de Gestión de Calidad', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (270, 'Informe de Ejecución', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (271, 'Informe de ejecución presupuestal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (272, 'Informe de inconsistencias encontradas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (273, 'Informe de interventoría', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (274, 'Informe de supervisión de contrato', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (275, 'Informe del plan', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (276, 'Informe del plan Agropecuario Municipal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (277, 'Informe ejecutivo anual de evaluación al Sistema de Control Interno', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (278, 'Informe final de evaluación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (279, 'Informe final de verificación del comité y calificación final', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (280, 'Informe pasivo pensional', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (281, 'Informe pormenorizado del estado de Control Interno', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (282, 'Informe preliminar de evaluación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (288, 'Inscripciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (289, 'Instructivos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (290, 'Instrumento de control del mantenimiento preventivo y correctivo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (291, 'Intervención Metros Lineales de Alcantarillado', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (292, 'Inventario de elementos devolutivos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (293, 'Inventarios documentales- Transferencias', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (295, 'Inventarios de Bienes Generales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (296, 'Inventarios de Bienes Individuales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (297, 'Invitación pública', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (298, 'Justificación de contratación directa', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (299, 'Justificación del Anteproyecto', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (300, 'Libros Auxiliares de Bancos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (301, 'Libros Auxiliares de Caja', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (302, 'Libros de Registro de Apropiaciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (303, 'Libros de registros de cuentas por pagar', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (304, 'Libros de registros de ingresos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (305, 'Libros de Registros de Reservas Presupuestales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (306, 'Libros de Registros de Vigencias Futuras', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (307, 'Libros Diarios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (308, 'Libros Mayores y de Balances', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (309, 'Licencia de Construcción', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (286, 'Informes de Gestión', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (310, 'Licencias de exhumación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (311, 'Licencias de Inhumación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (312, 'Licencias de Transporte de Semovientes', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (284, 'Informes de Seguimiento', 0, NULL, NULL, '0', 0, 0, 1, 0, 0, NULL, 0);
INSERT INTO sgd_tpr_tpdcumento VALUES (285, 'Informes de valoración psicológica', 0, NULL, NULL, '0', 0, 0, 1, 0, 0, NULL, 0);
INSERT INTO sgd_tpr_tpdcumento VALUES (287, 'Informes Sistema de Salud Pública -SIVIGILA', 0, NULL, NULL, '0', 0, 0, 1, 0, 0, NULL, 0);
INSERT INTO sgd_tpr_tpdcumento VALUES (500, 'OTRO', 0, NULL, NULL, '0', 0, 0, 1, 0, 0, NULL, 0);
INSERT INTO sgd_tpr_tpdcumento VALUES (346, 'Permisos Laborales', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 0);
INSERT INTO sgd_tpr_tpdcumento VALUES (313, 'Lista de oferentes habilitados para participar en la subasta', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (314, 'Listado de números radicados anulados', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (315, 'Listado maestro de documentos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (316, 'Listados de Asistencia', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (317, 'Mantenimiento Red Vial Urbana', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (318, 'Mantenimiento Vías Terciarias', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (319, 'Manual de Funciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (320, 'Manual de procesos y procedimientos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (321, 'Matriz de Ruta Integral de atención', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (322, 'Memoria justificativa', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (323, 'Memorias de ayudas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (324, 'Memorias de Calculo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (325, 'Minuta contractual', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (326, 'Minuta de contrato o convenio', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (327, 'Modificaciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (328, 'Nómina', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (329, 'Notas internas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (330, 'Novedades', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (331, 'Obligaciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (332, 'Obras de Mitigación del Riesgo de Desastres', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (333, 'Observaciones al proyecto pliego de condiciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (334, 'Observaciones de los oferentes sobre las calificaciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (335, 'Oficios remisiorios', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (336, 'Orden de compra', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (337, 'Orden de pago', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (338, 'Pago Impuesto', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (339, 'Pagos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (340, 'Participacion en eventos empresariales', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (341, 'Pasado Judicial - Certificado de Antecedentes Penales', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (342, 'Pavimentación y Construcción de Vías', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (344, 'Permiso tala de Arboles', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (345, 'Permisos de Tránsito vehícullos de más de 2 ejes', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (349, 'Plan  de capacitación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (350, 'Plan Agropecuario Municipal', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (351, 'Plan anual de incentivos institucional', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (352, 'Plan de acción', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (353, 'Plan de Asistencia Técnica', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (354, 'Plan de atención de emergencias ambientales', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (355, 'Plan de Bienestar Social y Estimulo Laboral', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (356, 'Plan de contigencia', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (357, 'Plan de Desarrollo de Ecoturismo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (358, 'Plan de manejo ambiental', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (359, 'Plan de Manejo de Tráfico', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (360, 'Plan de trabajo anual del Sistema De Seguridad y Salud en el Trabajo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (361, 'Plan de Turismo Municipal', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (362, 'Plan de Vacaciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (363, 'Plan de Vivienda de Interés Social', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (364, 'Plan indicativo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (365, 'Plan Institucional de Archivos - PINAR', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (366, '"Plan Institucional de Gestión Ambiental ""PIGA"""', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (367, 'Plan Local de Salud', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (368, 'Plan Municipal de Juventud', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (369, 'Plan operativo anual de inversión', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (370, 'Plan Operativo Anual de Salud Pública', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (371, 'Plan Salud Pública de Intervenciones Colectivas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (372, 'Planes Anuales de Adquisiciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (373, 'Planillas de control de comunicaciones oficiales', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (374, 'Plano topografico', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (375, 'Planos arquitectonicos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (376, 'Planos de evacuación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (377, 'Planos estructurales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (378, 'Planos hidraulicos sanitarios y electricos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (379, 'Planos hidraulicos sanitarios y electricos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (380, 'Pliego de condiciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (381, 'Plusvalia', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (382, 'Poder autenticado (apoderado)', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (383, 'Póliza', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (384, 'Práctica de pruebas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (385, 'Presentación del proyecto a la autoridad ambiental', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (386, 'Prestamo maquinaria y equipo agropecuario', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (387, 'Presupuesto Municipal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (388, 'Proceso de Exclusión', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (389, 'Procesos civiles en contra de la entidad', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (390, 'Procesos civiles iniciados por la entidad', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (391, 'Procesos contencioso administrativo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (392, 'Procesos Laborales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (455, 'Respuesta', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (393, 'Procesos Ordinarios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (394, 'Procesos Penales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (395, 'Programa', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (396, 'Programa anual de auditoria', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (397, 'Programa Anual Mensualizado de Caja – PAC', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (398, 'Programa de capacitación agropecuaria', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (399, 'Programa de Gestión del Riesgo de Desastres', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (400, 'Programa de Gobierno', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (401, 'Programa de Infraestructura  Gas natural', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (402, 'Programa de Infraestructura  Red Vial', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (403, 'Programa de primera Infancia', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (404, 'Programa de Salud Ocupacional', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (405, 'Programa Mantenimiento Edificios Públicos Municipales', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (406, 'Programa Mejoramiento Habitat', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (407, 'Programa Sostenibilidad Ambiental -GIRS', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (408, 'Programas Anuales Mensualizados de Caja PAC', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (409, 'Programas de gestión documental', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (410, 'Programas de Infraestructura Agua Potable y Saneamiento basico', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (411, 'Programas de infraestructura Redes Eléctricas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (412, 'Programas de infraestructura Telefonía y Datos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (413, 'Propuestas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (414, 'Propuestas no seleccionadas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (415, 'Proyecto', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (416, 'Proyecto Parcelas Demostrativas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (417, 'Proyectos de Mantenimiento de Bienes Muebles', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (418, 'Pruebas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (419, 'Publicacion en pagina web', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (421, 'Radicado de Solicitud', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (422, 'Ratificación y ampliación de queja Pruebas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (423, 'Recibo a satisfacción', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (424, 'Recibo de pago de impuesto', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (425, 'Recibos Universales', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (428, 'Registro de acuerdos comerciales', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (429, 'Registro de asistencia', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (430, 'Registro de Clasificación económica de los gastos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (431, 'Registro de Modificaciones del PAC', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (432, 'Registro de novedades de nómina', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (433, 'Registro de Pagos programados de deuda pública', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (434, 'Registro de Proyección de Planta de personal del año próximo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (436, 'Registro de publicación en página web', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (437, 'Registro publicación en el SECOP', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (438, 'Registro Único Tributario', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (439, 'Registro y Control del PAC', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (440, 'Registros de Cálculo de los ingresos corrientes por producto', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (441, 'Relación de bienes a dar baja', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (442, 'Relación de descuentos de salud pensión parafiscales y cesantías', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (443, 'Remisión de informe a la entidad correspondiente', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (444, 'Reporte de comparendos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (445, 'Reporte de incidentes', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (446, 'Reporte SIIF', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (447, 'Requerimiento Especial', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (448, 'Requerimiento ordinario', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (449, 'Resolución de apertura licitación o concurso', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (450, 'Resolución de justificación de la contratación directa', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (451, 'Resolución Declaratoria desierta', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (452, 'Resolución para dar de baja los bienes', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (453, 'Resoluciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (454, 'Resoluciones definitivas de medidas de protección', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (456, 'Respuesta a observaciones al pliego de condiciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (457, 'Respuesta Derecho de Petición', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (458, 'Saneamiento y Manejo de Vertimientos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (459, 'Seguimiento', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (460, 'Seguimiento y Evaluación del POT vigente', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (461, 'Serivicio de consulta asistencia', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (462, 'Servicio de consulta agricola', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (463, 'Servicio de consulta veterinaria', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (465, 'Solicitud al Consultorio Jurídico de un defensor de oficio', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (466, 'Solicitud al ordenador del gasto sobre adjudicación del proceso', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (467, 'Solicitud de adición o prórroga', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (67, 'Auto de admisión de recurso', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (57, 'Análisis del sector económico y de los oferentes', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (435, 'Registro de publicación en el SECOP', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (59, 'Antecedentes propios de tipo contractualInforme de Evaluación contemplando en observaciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (60, 'Anteproyecto del presupuesto de gastos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (61, 'Anteproyecto del presupuesto de ingresos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (62, 'Apoyo y Fortalecimiento Empresarial', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (63, 'Auto apertura de investigación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (64, 'Auto concediendo recurso de queja', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (65, 'Auto corriendo traslado para alegar de conclusión', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (66, 'Auto de admisión', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (478, 'Solicitud de personal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (69, 'Auto de cierre de investigación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (70, 'Auto de conociemiento', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (71, 'Auto de incorporación y/o acumulación de expedientes', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (72, 'Auto de indagación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (73, 'Auto de investigación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (74, 'Auto de Mandamiento de pago', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (75, 'Auto de obedézcase y cúmplase lo resuelto por la segunda instancia', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (14, 'Acta de presentación personal del defensor de oficio', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (20, 'Actas  Comité de Participación Local de Salud (COPACO)', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (22, 'Actas Consejo de Política Social', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (23, 'Actas Consejo Fondo de Vivienda de Interés Social (FOVIS)', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (24, 'Actas Consejo Territorial de Planeación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (26, 'Actas de finalización del convenio', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (27, 'Actas de Incautación de Mercancia', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (28, 'Actas de Incautación de Sustancias Psicoactivas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (76, 'Auto de pliego de cargos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (77, 'Auto de prorroga en proceso de investigación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (78, 'Auto de pruebas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (79, 'Auto de resolución de recurso', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (80, 'Auto decretando pruebas', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (81, 'Auto inhibitorio', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (82, 'Auto nombrando un defensor de oficio', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (83, 'Auto que resuelve recursos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (84, 'Auto resolviendo nulidad', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (85, 'Auto resolviendo pruebas en descargos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (86, 'Autorización Cambio de IPS', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (87, 'Autorización de baja de bienes', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (88, 'Autorizaciones de Modificación de Planos Urbanísticos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (89, 'Autorizaciones de Movimiento de Tierras', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (90, 'Autorizaciones de Propiedad Horizontal y sus Modificaciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (91, 'Avaluo y/o peritaje', 30, NULL, NULL, '1', 1, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (93, 'Avisos de prensa', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (94, 'Balance General', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (95, 'Balance Inicial', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (96, 'Banco de Proyectos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (97, 'Banco Terminológico de series y subseries documentales', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (98, 'Boleta citación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (99, 'Boletin Epidemiológico Municipal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (100, 'Cartografía oficial', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (101, 'Ceriticaciones de Retiro de EPS', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (102, 'Certificación bancaria', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (103, 'Certificación de la vigencia de la tarjeta profesional de todos los profesionales responsables del proyecto', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (104, 'Certificacion de retiro de SISBEN', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (105, 'Certificación de supervisión', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (106, 'Certificación de supervisión para trámite de pago de contrato de compraventa', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (107, 'Certificación del nuevo del SISBEN', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (58, 'Anexos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (343, 'Peritaje técnico', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (6, 'Acta de Comité', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (3, 'Acta de adjudicación o Remate', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (4, 'Acta de aprobación', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (5, 'Acta de audiencia', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (7, 'Acta de Conciliación', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (8, 'Acta de Consejo', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (9, 'Acta de entrega de inmueble entregado en arrendamiento', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (10, 'Acta de inicio', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (11, 'Acta de liquidación', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (12, 'Acta de Obra', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (13, 'Acta de posesión', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (15, 'Acta de recibido', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (17, 'Acta de reunión', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (16, 'Acta de Reconocimiento Voluntario de Paternidad', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (21, 'Actas Consejo de Política Económica y Social (COMPES)', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (25, 'Actas de finalización', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (2, 'Acta', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (19, 'Acta Equipo Operativo MIPG', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (30, 'Actas de manifestación de interés para participar en el proceso', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (32, 'Acto administrativo de adjudicación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (33, 'Acto administrativo de adopción', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (34, 'Acto administrativo de apertura del proceso de contratación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (35, 'Acto administrativo de aprobación', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (36, 'Acto administrativo de establecimiento del convenio', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (37, 'Acto Administrativo de liquidacion oficial', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (38, 'Acto administrativo de nombramiento o contrato de trabajo  Oficio de notificación del nombramiento o contrato de trabajo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (39, 'Acto administrativo de retiro o desvinculación del servidor de la entidad donde consten las razones del mismo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (40, 'Acto administrativo de secuestre', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (41, 'Acto administrativo donde se notifica declaratoria de desierta', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (42, 'Acto administrativo por el cual se adopta el Plan  de vacaciones', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (43, 'Acto administrativo por el cual se adopta el Plan de Bienestar Social y Estimulo Laboral', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (44, 'Acto administrativo por el cual se adopta el plan de trabajo anual del sistema de seguridad y salud en el trabajo', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (45, 'Acto administrativo por el cual se adopta el Programa de Salud Ocupacional', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (47, 'Actos administrativos de avaluos y soportes', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (50, 'Acuerdo del Concejo municipal o Decreto municipal de adopción del Plan Documento de remisión a entes interesados', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (53, 'Adendas a los términos de referencia', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (54, 'Adición de afiliados o retiro cuando aplique', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (55, 'Afiliaciones a: Régimen de salud (EPS) pensión cesantías caja de compensación etc', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (56, 'Análisis de riesgos previsible en el proceso', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (119, 'Certificado de antecedentes disciplinarios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (191, 'Declaraciones por Recaudo de Impuesto de Aviso y Tableros', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (192, 'Declaraciones por Recaudo de Impuesto de Espectáculos Públicos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (265, 'Hoja de vida de la Función Pública para personas naturales o personas jurídicas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (108, 'Certificación individual de aduana para vehículos automotores', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (109, 'Certificaciones', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (110, 'Certificaciones de compensación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (31, 'Acta de visita', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (46, 'Actos administrativos', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (48, 'Actualización Escolar', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (49, 'Acuerdo de pago', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (51, 'Acuerdos de Confidencialidad', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (52, 'Adendas', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (348, 'Plan', 0, NULL, NULL, '1', 1, 1, 1, 0, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (468, 'Solicitud de adición o prórroga del convenio', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (469, 'Solicitud de bienes y servicios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (470, 'Solicitud de certificado de disponibilidad presupuestal', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (471, 'Solicitud de contratación con lista de chequeo', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (473, 'Solicitud de fotocopias del expediente', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (475, 'Solicitud de ingreso de los bienes a almacén', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (476, 'Solicitud de la Proyección de Ingresos y/o Marco Fiscal Actualizado', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (477, 'Solicitud de permiso para tala de Arboles', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (479, 'Solicitud de Presentación de Proyectos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (480, 'Solicitud de reposición y/o apelación', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (481, 'Solicitud de suministros', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (482, 'Solicitud del PAC', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (483, 'Solicitud elaboración de contrato', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (484, 'Solicitud Salidas Turisticas', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (485, 'Solución a agua potable y alcantarillado', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (486, 'Solución a residuos liquidos', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (487, 'Soportes contables', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (488, 'Soportes de pago', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (489, 'Soportes de remates', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (490, 'Soportes documentales de estudios', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (492, 'Suspendidos', 30, NULL, NULL, '1', 0, 0, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (493, 'Tabla de control de acceso', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (494, 'Tablas de retención documental', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (495, 'Tablas de valoración documental', 30, NULL, NULL, '1', 1, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (496, 'Tarjeta de Propiedad', 30, NULL, NULL, '1', 0, 1, 1, NULL, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (427, 'Recurso de Consideración', 30, NULL, NULL, '1', 0, 1, 1, 30, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (498, 'Verificaciones', 30, NULL, NULL, '1', 0, 0, 1, 30, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (426, 'reclamo', 30, NULL, NULL, '1', 0, 1, 1, 30, 1, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (1, 'Acciones populares', 10, NULL, NULL, '1', 1, 1, 1, 10, 0, NULL, 1);
INSERT INTO sgd_tpr_tpdcumento VALUES (464, 'Solicitud Interna', 15, NULL, NULL, '1', 1, 1, 1, 15, 0, NULL, 0);
INSERT INTO sgd_tpr_tpdcumento VALUES (472, 'Solicitud de disponibilidad presupuestal', 0, NULL, NULL, '1', 0, 0, 1, 0, 0, NULL, 0);
INSERT INTO sgd_tpr_tpdcumento VALUES (503, 'Solicitud de permiso ambiental', 10, NULL, NULL, '0', 0, 1, 1, NULL, 0, NULL, 0);


--
-- Data for Name: sgd_trad_tiporad; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_trad_tiporad VALUES (2, 'Entrada', NULL, 1, NULL, 1, 1);
INSERT INTO sgd_trad_tiporad VALUES (1, 'Salida', NULL, 1, NULL, 0, 1);
INSERT INTO sgd_trad_tiporad VALUES (4, 'Pqrsd', NULL, 1, NULL, 1, 1);


--
-- Data for Name: sgd_transfe_documentales; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_transfe_documentales VALUES (1, '20219981120000003E', 11, 2, 248, '20219980000092', '2021-04-15 10:13:58.192931-05', '998', 1, '2021-04-15 11:18:37.386882-05', '998', 1, 'transferencia_998_20210415111837.pdf');
INSERT INTO sgd_transfe_documentales VALUES (2, '20219981120000003E', 11, 2, 155, '20219980000102', '2021-04-15 14:42:11.633787-05', '998', 1, '2021-04-15 14:43:09.848611-05', '998', 1, 'transferencia_998_20210415144309.pdf');
INSERT INTO sgd_transfe_documentales VALUES (3, '20219981120000003E', 11, 2, 2, '20219980000191', '2021-04-15 15:08:31.100841-05', '998', 1, '2021-04-15 15:16:55.310281-05', '998', 1, 'transferencia_998_20210415151655.pdf');


--
-- Data for Name: sgd_ttr_transaccion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_ttr_transaccion VALUES (40, 'Firma Digital de Documento');
INSERT INTO sgd_ttr_transaccion VALUES (41, 'Eliminacion solicitud de Firma Digital');
INSERT INTO sgd_ttr_transaccion VALUES (50, 'Cambio de Estado Expediente');
INSERT INTO sgd_ttr_transaccion VALUES (51, 'Creacion Expediente');
INSERT INTO sgd_ttr_transaccion VALUES (1, 'Recuperacion Radicado');
INSERT INTO sgd_ttr_transaccion VALUES (9, 'Reasignacion');
INSERT INTO sgd_ttr_transaccion VALUES (8, 'Informar');
INSERT INTO sgd_ttr_transaccion VALUES (19, 'Cambiar Tipo de Documento');
INSERT INTO sgd_ttr_transaccion VALUES (20, 'Crear Registro');
INSERT INTO sgd_ttr_transaccion VALUES (21, 'Editar Registro');
INSERT INTO sgd_ttr_transaccion VALUES (10, 'Movimiento entre Carpetas');
INSERT INTO sgd_ttr_transaccion VALUES (11, 'Modificacion Radicado');
INSERT INTO sgd_ttr_transaccion VALUES (7, 'Borrar Informado');
INSERT INTO sgd_ttr_transaccion VALUES (12, 'Devuelto-Reasignar');
INSERT INTO sgd_ttr_transaccion VALUES (13, 'Archivar');
INSERT INTO sgd_ttr_transaccion VALUES (14, 'Agendar');
INSERT INTO sgd_ttr_transaccion VALUES (15, 'Sacar de la agenda');
INSERT INTO sgd_ttr_transaccion VALUES (0, '--');
INSERT INTO sgd_ttr_transaccion VALUES (16, 'Reasignar para Vo.Bo.');
INSERT INTO sgd_ttr_transaccion VALUES (2, 'Radicacion');
INSERT INTO sgd_ttr_transaccion VALUES (22, 'Digitalizacion de Radicado');
INSERT INTO sgd_ttr_transaccion VALUES (23, 'Digitalizacion - Modificacion');
INSERT INTO sgd_ttr_transaccion VALUES (24, 'Asociacion Imagen fax');
INSERT INTO sgd_ttr_transaccion VALUES (30, 'Radicacion Masiva');
INSERT INTO sgd_ttr_transaccion VALUES (17, 'Modificacion de Causal');
INSERT INTO sgd_ttr_transaccion VALUES (18, 'Modificacion del Sector');
INSERT INTO sgd_ttr_transaccion VALUES (25, 'Solicitud de Anulacion');
INSERT INTO sgd_ttr_transaccion VALUES (26, 'Anulacion Rad');
INSERT INTO sgd_ttr_transaccion VALUES (27, 'Rechazo de Anulacion');
INSERT INTO sgd_ttr_transaccion VALUES (37, 'Cambio de Estado del Documento');
INSERT INTO sgd_ttr_transaccion VALUES (28, 'Devolucion de correo');
INSERT INTO sgd_ttr_transaccion VALUES (29, 'Digitalizacion de Anexo');
INSERT INTO sgd_ttr_transaccion VALUES (31, 'Borrado de Anexo a radicado');
INSERT INTO sgd_ttr_transaccion VALUES (32, 'Asignacion TRD');
INSERT INTO sgd_ttr_transaccion VALUES (33, 'Eliminar TRD');
INSERT INTO sgd_ttr_transaccion VALUES (35, 'Tipificacion de la decision');
INSERT INTO sgd_ttr_transaccion VALUES (36, 'Cambio en la Notificacion');
INSERT INTO sgd_ttr_transaccion VALUES (38, 'Cambio Vinculacion Documento');
INSERT INTO sgd_ttr_transaccion VALUES (39, 'Solicitud de Firma');
INSERT INTO sgd_ttr_transaccion VALUES (42, 'Digitalizacion Radicado(Asoc. Imagen Web)');
INSERT INTO sgd_ttr_transaccion VALUES (52, 'Excluir radicado de expediente');
INSERT INTO sgd_ttr_transaccion VALUES (53, 'Incluir radicado en expediente');
INSERT INTO sgd_ttr_transaccion VALUES (54, 'Cambio Seguridad del Documento');
INSERT INTO sgd_ttr_transaccion VALUES (57, 'Ingreso al Archivo Fisico');
INSERT INTO sgd_ttr_transaccion VALUES (55, 'Creación Subexpediente');
INSERT INTO sgd_ttr_transaccion VALUES (56, 'Cambio de Responsable');
INSERT INTO sgd_ttr_transaccion VALUES (58, 'Expediente Cerrado');
INSERT INTO sgd_ttr_transaccion VALUES (59, 'Expediente Reabierto');
INSERT INTO sgd_ttr_transaccion VALUES (61, 'Asignar TRD Multiple');
INSERT INTO sgd_ttr_transaccion VALUES (62, 'Insercion Expediente Multiple');
INSERT INTO sgd_ttr_transaccion VALUES (65, 'Archivado NRR');
INSERT INTO sgd_ttr_transaccion VALUES (66, 'Reasignación masiva');
INSERT INTO sgd_ttr_transaccion VALUES (67, 'Se firma el documento radicado');
INSERT INTO sgd_ttr_transaccion VALUES (68, 'Transferencia documental');
INSERT INTO sgd_ttr_transaccion VALUES (69, 'Cambio de Estado');
INSERT INTO sgd_ttr_transaccion VALUES (70, 'Publicar Documento');
INSERT INTO sgd_ttr_transaccion VALUES (71, 'Notificación de Correo');
INSERT INTO sgd_ttr_transaccion VALUES (72, 'Cambió el estado del anexo publico');


--
-- Name: sgd_tvd_depe_id; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sgd_tvd_depe_id', 0, false);


--
-- Data for Name: sphinx_index_meta; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sphinx_index_meta VALUES ('sph_idx_posts_main', 1, '2021-01-29 12:10:01.196636-05');


--
-- Name: sphinx_index_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('sphinx_index_meta_id_seq', 11, true);


--
-- Data for Name: sphinx_index_remove; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Data for Name: tipo_doc_identificacion; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO tipo_doc_identificacion VALUES (0, 'Cedula de Ciudadania');
INSERT INTO tipo_doc_identificacion VALUES (1, 'Tarjeta de Identidad');
INSERT INTO tipo_doc_identificacion VALUES (2, 'Cedula de Extranjería');
INSERT INTO tipo_doc_identificacion VALUES (3, 'Pasaporte');
INSERT INTO tipo_doc_identificacion VALUES (4, 'Nit');
INSERT INTO tipo_doc_identificacion VALUES (5, 'NUIR');


--
-- Data for Name: tipo_poblacion_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO tipo_poblacion_pqrs VALUES (1, 'Adulto Mayor');
INSERT INTO tipo_poblacion_pqrs VALUES (2, 'Ciudadano Rural');
INSERT INTO tipo_poblacion_pqrs VALUES (3, 'Desplazado');
INSERT INTO tipo_poblacion_pqrs VALUES (5, 'Persona en condición de Discapacidad');
INSERT INTO tipo_poblacion_pqrs VALUES (6, 'Persona en situación de Pobreza');
INSERT INTO tipo_poblacion_pqrs VALUES (7, 'Victima de violencia');
INSERT INTO tipo_poblacion_pqrs VALUES (8, 'LGBTI');
INSERT INTO tipo_poblacion_pqrs VALUES (9, 'Madre cabeza de familia');
INSERT INTO tipo_poblacion_pqrs VALUES (10, 'Ninguna de las Anteriores');
INSERT INTO tipo_poblacion_pqrs VALUES (11, 'Negritud');
INSERT INTO tipo_poblacion_pqrs VALUES (12, 'Otros');
INSERT INTO tipo_poblacion_pqrs VALUES (13, 'Afrodecendiente');
INSERT INTO tipo_poblacion_pqrs VALUES (14, 'Veteranos de la Fuerza Pública');
INSERT INTO tipo_poblacion_pqrs VALUES (15, 'Adolescente');
INSERT INTO tipo_poblacion_pqrs VALUES (16, 'Mujer Gestante');
INSERT INTO tipo_poblacion_pqrs VALUES (4, 'Poblacion Indigena');


--
-- Name: tipo_poblacion_pqrs_id_tp_pqrs_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('tipo_poblacion_pqrs_id_tp_pqrs_seq', 6, true);


--
-- Data for Name: tipo_remitente; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO tipo_remitente VALUES (1, 'Otras empresas', 0);
INSERT INTO tipo_remitente VALUES (3, 'Predio', 0);
INSERT INTO tipo_remitente VALUES (5, 'Otros', 0);
INSERT INTO tipo_remitente VALUES (6, 'Funcionario', 0);
INSERT INTO tipo_remitente VALUES (2, 'Persona natural', 10);
INSERT INTO tipo_remitente VALUES (4, 'Persona Jurídica', 10);


--
-- Data for Name: tipo_tratamiento_pqrs; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO tipo_tratamiento_pqrs VALUES (1, 'Señor');
INSERT INTO tipo_tratamiento_pqrs VALUES (2, 'Señora');
INSERT INTO tipo_tratamiento_pqrs VALUES (3, 'Ingeniero');
INSERT INTO tipo_tratamiento_pqrs VALUES (4, 'Ingeniera');


--
-- Name: tipo_tratamiento_pqrs_id_tipo_t_pqrs_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('tipo_tratamiento_pqrs_id_tipo_t_pqrs_seq', 1, false);


--
-- Data for Name: tipo_usuario_grupo; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO tipo_usuario_grupo VALUES (1, 'Ciudadano', 1);
INSERT INTO tipo_usuario_grupo VALUES (2, 'Entes de Control', 1);


--
-- Name: tipo_usuario_grupo_id_grupo_tipo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('tipo_usuario_grupo_id_grupo_tipo_usuario_seq', 1, false);


--
-- Data for Name: tipos_comunicaciones; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO tipos_comunicaciones VALUES (1, 'Enviadas');
INSERT INTO tipos_comunicaciones VALUES (2, 'Recibidas Internas');
INSERT INTO tipos_comunicaciones VALUES (3, 'Recibidas Externas');


--
-- Name: tipos_comunicaciones_id_tipos_comunicaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('tipos_comunicaciones_id_tipos_comunicaciones_seq', 1, false);


--
-- Data for Name: sgd_ciu_ciudadano; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO sgd_ciu_ciudadano VALUES (0, 1, 'ANONIMO', 'Carrera 1 # 1 1 Sur', 'ANONIMO', NULL, '1111111111', NULL, 1, 11, '11111111111', 1, 170, 1, 1, 1, 1, 1, 3, 10, 1);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO "user" VALUES (1, 'anonimo', 'TKx14J91w_WJ0h2rmeORsD9XqksqCMmf', '$2y$13$p0MVeH7Q8b.nFv2fWWjGP.4NPv6SuCYEqCxZJwRMqkj4zsW97IV9i', NULL, 'soporte@skinatech.com', 10, 1577449952, 1577449952, 'WpKeD2Rw6-r7W9DWlrliYWMjbzvwtGkQ_1577449949', 2);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('user_id_seq', 2, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--

INSERT INTO usuario VALUES (1, '998', 'ADMON', '2019-11-05', '1232f297a57a5a743894a0e4a8', '1', 'Usuario de Soporte', '1', '1', '1', '1234567890', 5, '210428075608o1921688236ADMON', '2021-04-28', NULL, NULL, 'soporte.skinatech@gmail.com', NULL, NULL, 0, 2, 1, 1, NULL, '1', NULL, 3, 3, 3, 1, 1, 2, NULL, NULL, NULL, 2, NULL, 1, 2, 0, 1, 1, 1, 0, 2, '--', 170, 1, 0, '1', '1', 0, 1, 0, 0, 1, 0, 1, 3, 0, 2, 1, 1, 3, 1, 1, 1, 1, 1, 1, 0, 0);


--
-- Data for Name: usuarios_grupos_informados; Type: TABLE DATA; Schema: public; Owner: orfeo_usr
--



--
-- Name: usuarios_grupos_informados_id_usuarios_grupos_informados_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('usuarios_grupos_informados_id_usuarios_grupos_informados_seq', 1, false);


--
-- Name: usuarios_grupos_informados_seq; Type: SEQUENCE SET; Schema: public; Owner: orfeo_usr
--

SELECT pg_catalog.setval('usuarios_grupos_informados_seq', 45, true);


--
-- PostgreSQL database dump complete
--
