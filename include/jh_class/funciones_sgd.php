<?php

/**
 * En este frame se van cargado cada una de las funcionalidades del sistema
 *
 * Descripcion Larga
 *
 * @category
 * @package      SGD Orfeo
 * @subpackage   Main
 * @author       Community
 * @author       Skina Technologies SAS (http://cco.gov.co)
 * @license      GNU/GPL <http://www.gnu.org/licenses/gpl-2.0.html>
 * @link         http://www.orfeolibre.org
 * @version      SVN: $Id$
 * @since
 */
/* ---------------------------------------------------------+
  |                     INCLUDES                             |
  +--------------------------------------------------------- */


/* ---------------------------------------------------------+
  |                    DEFINICIONES                          |
  +--------------------------------------------------------- */
session_start();
error_reporting(7);
$url_raiz = $_SESSION['url_raiz'];
$dir_raiz = $_SESSION['dir_raiz'];
$ESTILOS_PATH2 = $_SESSION['ESTILOS_PATH2'];
/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */



// Modificado SGD 20-Septiembre-2007
/**
 * Paggina Cuerpo.php que muestra el contenido de las Carpetas
 * Creado en la SSPD en el año 2003
 * 
 * Se añadio compatibilidad con variables globales en Off
 * @autor Jairo Losada 2009-05
 * @licencia GNU/GPL V 3
 */
$k_localizacion++;
if ($k_localizacion == 1) {

    /**
     * Se envian 3 variables: C�d Dpto, C�d Mcpio y Variable de Conexi�n a la BD.
     *
     * @param  char [$codigo_dep] C�digo departamento, formato 'ppp-ddd'.
     * @param  char [$codigo_mun] C�digo municipio, formato 'ppp-ddd-mmm'.
     * @param  ???? [$db] Variable de conexi�n a la BD.
     * @return char Nombre del Departamento.
     * @return char Nombre del Municipio.

     */
    class LOCALIZACION {

        var $municipio;
        var $departamento;
        var $pais;
        var $continente;
//Maneja la conexi�n con la base de datos
        var $db;

        function mb_ucfirst($str, $encoding = "UTF-8", $lower_str_end = false) {
            $first_letter = mb_strtoupper(mb_substr($str, 0, 1, $encoding), $encoding);
            $str_end = "";
            if ($lower_str_end) {
                $str_end = mb_strtolower(mb_substr($str, 1, mb_strlen($str, $encoding), $encoding), $encoding);
            } else {
                $str_end = mb_substr($str, 1, mb_strlen($str, $encoding), $encoding);
            }
            $str = $first_letter . $str_end;
            return $str;
        }

        function LOCALIZACION($codigo_dep, $codigo_mun, $db) {
            if ($codigo_dep) {
                if (strpos($codigo_dep, '-')) {
                    $codigo_dep = explode('-', $codigo_dep);
                    $codigo_pai = $codigo_dep[0];
                    $codigo_dep = $codigo_dep[1];
                    $isql = "SELECT DPTO_NOMB FROM DEPARTAMENTO,SGD_DEF_PAISES WHERE DEPARTAMENTO.id_pais = SGD_DEF_PAISES.ID_PAIS AND " .
                            "DEPARTAMENTO.DPTO_CODI= $codigo_dep AND DEPARTAMENTO.ID_PAIS=$codigo_pai";
                } else {
                    $isql = "SELECT DPTO_NOMB FROM DEPARTAMENTO where DPTO_CODI=$codigo_dep";
                }
                $rs1 = $db->query($isql);
                $depto = $rs1->fields["DPTO_NOMB"];
                $this->departamento = ( $depto === 'D.C.' ? $depto : $this->mb_ucfirst(mb_strtolower(trim($depto), 'UTF-8')) );
            } else {
                $this->departamento = "";
            }
            if ($codigo_mun) {
                if (strpos($codigo_mun, '-')) {
                    $codigo_mun = explode('-', $codigo_mun);
                    $codigo_pai = $codigo_mun[0];
                    $codigo_dep = $codigo_mun[1];
                    $codigo_mun = $codigo_mun[2];
                    $isql = "SELECT MUNI_CODI,MUNI_NOMB FROM MUNICIPIO where " .
                            "id_pais=$codigo_pai AND DPTO_CODI=$codigo_dep AND MUNI_CODI=$codigo_mun";
                } else {
                    $isql = "SELECT MUNI_CODI,MUNI_NOMB FROM MUNICIPIO where DPTO_CODI=$codigo_dep AND MUNI_CODI=$codigo_mun";
                }
                $flag_d = 0;
                $rs1 = $db->query($isql);
                $this->municipio = $this->mb_ucfirst(mb_strtolower(trim($rs1->fields["MUNI_NOMB"]), 'UTF-8'));
            } else {
                $this->municipio = "";
            }

            if (isset($codigo_mun))
                unset($codigo_mun);
            if (isset($codigo_dep))
                unset($codigo_dep);
            if (isset($codigo_pai))
                unset($codigo_pai);
        }

        /** 	Recibe el codigo del continente y la variable de conexion retornando el nombre.
         * @param  ???? [$db] Variable de conexi�n a la BD.
         * @return char Nombre del Continente.
         */
        function GET_NOMBRE_CONT($codigo, $db) {
            if (!($codigo or $db)) {
                $this->continente = "";
            } else {
                $isql = "SELECT NOMBRE_CONT FROM SGD_DEF_CONTINENTES WHERE SGD_DEF_CONTINENTES.ID_CONT=" . $codigo;
                $rs1 = $db->query($isql);
                $this->continente = trim($rs1->fields["NOMBRE_CONT"]);
                unset($rs1);
            }
            return $this->continente;
        }

        /** 	Recibe el codigo del pais y la variable de conexion retornando el nombre.
         * @param  int [$codigo] c�digo del pais.
         * @param  ??? [$db] variable de conexi�n a la BD.
         * @return char Nombre del Pais.
         */
        function GET_NOMBRE_PAIS($codigo, $db) {
            if (!($codigo or $db)) {
                $this->pais = "";
            } else {
                $isql = "SELECT NOMBRE_PAIS FROM SGD_DEF_PAISES WHERE ID_PAIS=" . $codigo;
                $rs1 = $db->query($isql);
                $this->pais = trim($rs1->fields["NOMBRE_PAIS"]);
                unset($rs1);
            }
            return $this->pais;
        }

    }

}
?>
