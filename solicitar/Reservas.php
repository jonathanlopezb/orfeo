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

        /*---------------------------------------------------------+
        |                     INCLUDES                             |
        +---------------------------------------------------------*/


        /*---------------------------------------------------------+
        |                    DEFINICIONES                          |
        +---------------------------------------------------------*/


        /*---------------------------------------------------------+
        |                       MAIN                               |
        +---------------------------------------------------------*/


session_start();
// Modificado Junio 2009
/**
  * Original en la SSPD en el anio 2003
  * 
  * Se anadio compatibilidad con variables globales en Off
  * @autor Jairo Losada 2009-05
  * @licencia GNU/GPL
  */


foreach ($_GET as $key => $valor)   ${$key} = $valor;
foreach ($_POST as $key => $valor)   ${$key} = $valor;

define('ADODB_ASSOC_CASE', 1);

$krd = $_SESSION["krd"];
$dependencia = $_SESSION["dependencia"];
$usua_doc = $_SESSION["usua_doc"];
$codusuario = $_SESSION["codusuario"];
$tip3Nombre=$_SESSION["tip3Nombre"];
$tip3desc = $_SESSION["tip3desc"];
$tip3img =$_SESSION["tip3img"];   $verrad = "";
$ruta_raiz = "..";
   include_once "$ruta_raiz/include/db/ConnectionHandler.php";
   $db = new ConnectionHandler($ruta_raiz);	 


/*********************************************************************************
 *       Filename: Reservas.php
 *       Modificado: 
 *          1/3/2006  IIAC  Llama la pagina para que el usuario pueda consultar
 *                          el estado de sus solicitudes.
 *********************************************************************************/ 

// Reservar CustomIncludes begin
   include "common.php";
// Save Page and File Name available into variables
   $sFileName = "Reservas.php";
// Begin   
   echo "..";    
   echo "<form method=\"post\" action=\"".$ruta_raiz."/prestamo/prestamo.php\" name=\"reservas\">
            <input type=\"hidden\" name=\"opcionMenu\" value=\"4\">      
            <input type=\"hidden\" name=\"sFileName\" value=\"<?=$sFileName?>\">  
            <input type=\"hidden\" value=\"\" name=\"radicado\">  
         </form>";								
   echo "<script> document.reservas.submit(); </script>";   
   
   
