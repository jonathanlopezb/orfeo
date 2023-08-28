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
session_start();
error_reporting(7);
$url_raiz="..";
$dir_raiz=$_SESSION['dir_raiz'];
$ESTILOS_PATH2 =$_SESSION['ESTILOS_PATH2'];

        /*---------------------------------------------------------+
        |                       MAIN                               |
        +---------------------------------------------------------*/


if (!$dir_raiz)
	$dir_raiz = "..";
if (!$dependencia)   include "$dir_raiz/rec_session.php";
?>
<html>
<head>
<title>Editar Firmantes</title>
<link rel="stylesheet" href="<?=$url_raiz?>/estilos/orfeo.css">
</head>
<body bgcolor="#FFFFFF" topmargin="0" onLoad="window_onload();">
<div id="spiffycalendar" class="text"></div>
<link rel="stylesheet" type="text/css" href="js/spiffyCal/spiffyCal_v2_1.css">
<?
 
 include_once "$dir_raiz/include/db/ConnectionHandler.php";
 $db = new ConnectionHandler("$dir_raiz");	 
 //$db->conn->debug = true;
 $accion_sal = "Borrar Solicitud de Firma";
 $nomcarpeta = "Firmas solicitadas para el radicado $radicado";
 $pagina_sig = "editarFirmatesRegistro.php";
 $filtroSelect = " and RADI_NUME_RADI = $radicado";

 
 
 
 if ($orden_cambio==1)  {
 	if (!$orderTipo)  {
	   $orderTipo=" DESC";
	}else  {
	   $orderTipo="";
	}
 }
 
 	if (!$orderNo)  {
	   		$orderNo=0;
			$orderTipo=" desc ";
	}

 $encabezado = "".session_name()."=".session_id()."&dir_raiz=$dir_raiz&krd=$krd&filtroSelect=$filtroSelect&tpAnulacion=$tpAnulacion&orderTipo=$orderTipo&radicado=$radicado&orderNo=";
 $linkPagina = "$PHP_SELF?$encabezado&orderTipo=$orderTipo&orderNo=$orderNo";
 $carpeta = "nada";
 include "../envios/paEncabeza.php";
 $pagina_actual = $PHP_SELF;
 //include "../envios/paBuscar.php"; 


 
 include "../envios/paOpciones.php";   

	/*  GENERACION LISTADO DE RADICADOS
	 *  Aqui utilizamos la clase adodb para generar el listado de los radicados
	 *  Esta clase cuenta con una adaptacion a las clases utiilzadas de orfeo.
	 *  el archivo original es adodb-pager.inc.php la modificada es adodb-paginacion.inc.php
	 */

?>
  <form name=formEnviar action='../firma/<?=$pagina_sig?>?<?=$encabezado?>' method=post>
  
 <?


	include "$dir_raiz/include/query/firma/queryEditarFirmates.php";
	//print ($query);
	$rs=$db->conn->Execute($query);
	
	if (!$rs->EOF)  {
		$pager = new ADODB_Pager($db,$query,'adodb', true,$orderNo,$orderTipo,"..");
		$pager->checkTitulo = true; 
		$pager->toRefLinks = $linkPagina;
		$pager->toRefVars = $encabezado;
		$pager->Render($rows_per_page=20,$linkPagina,$checkbox=chkEnviar);		
	} 
	else{
		echo "<hr><center><b>NO se encontro nada con el criterio de busqueda</center></b></hr>";	
	}
	
 ?>
  </form>

</body>

</html>

