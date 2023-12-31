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
define('ADODB_ASSOC_CASE', 2);
/**
  * Se añadio compatibilidad con variables globales en Off
  * @autor Infometrika 2009-05
  * @licencia GNU/GPl V3
  */
$krd = $_SESSION["krd"];
$dependencia = $_SESSION["dependencia"];
$usua_doc = $_SESSION["usua_doc"];
$codusuario = $_SESSION["codusuario"];
 
if($_GET["borrcarpeta"]) $borrcarpeta=$_GET["borrcarpeta"];
if($_GET["BorrarCarp"]) $BorrarCarp=$_GET["BorrarCarp"];

$ruta_raiz = ".";

if(!$_SESSION['dependencia']) include "$ruta_raiz/rec_session.php";
$verrad = "";
include_once "$ruta_raiz/include/db/ConnectionHandler.php";
$db = new ConnectionHandler($ruta_raiz);

$descripcionSql = $db->conn->concat('NOMB_CARP',"' - '", 'DESC_CARP');
$isql ="select $descripcionSql , CODI_CARP from carpeta_per 
		where usua_codi=$codusuario and depe_codi='$dependencia' order by codi_carp  ";
$rs = $db->conn->Execute($isql);
?>
<html>
<head>
<title>Eliminar Carpetas</title>
<link rel="stylesheet" href="estilos/orfeo.css">
</head>
<body>
<center>
<table  width="98%" border="0" cellpadding="0" cellspacing="5" class="borde_tab">
<tr>
	<TD width='97%' class="titulos4" align="center">
	ELIMINAR CARPETAS PERSONALES
	</td>
</tr>
</table>
<BR>
<form name='form1' method='GET' action='eliminar_carpeta.php?=<?=session_name?>=<?=session_id?>'>
<?php 
	if($BorrarCarp)
		{
			$isql=	"select count(*) AS Num from radicado
					where carp_per=1 and carp_codi=$borrcarpeta and
						radi_depe_actu='$dependencia' and radi_usua_actu=$codusuario ";
		//$db->conn->debug = true;
		$rs=$db->conn->Execute($isql);
		$numerot = $rs->fields[0];
		if($rs == '1') die("<center>No se han encontrado carpetas vacias <br> ");
				if($numerot == 0)
					{
					$isql = "delete from  carpeta_per where depe_codi='$dependencia' and usua_codi=$codusuario and codi_carp=$borrcarpeta ";
					$rs=$db->conn->query($isql);
						if($rs=='1') die("<p align='center' class='alarmas'><center>No se ha podido Borrar la carpeta,<br>");
							?>
								<span align='center' class='info'>Se ha borrado la Carpeta con &eacute;xito</span>
							<?
					}else
					{
							?>
								<br><span class='alarmas'>La carpeta no se ha podido borrar por que contiene <?=$numerot?> documentos,<br> La carpeta debe estar vacia para poder ser borrada </span>
							<?
					}
		}
?>
<table width="98%" border="0" cellpadding="0" cellspacing="5" class="borde_tab">
<tr>
	<TD width='97%' class="listado2_center"> 
		<p align='center' class='etextomenu'>Solo se pueden eliminar las carpertas que se encuentren vacias</p>
		<p align='center' class='etextomenu'>
		Usted tiene estas carpetas vacias:
		</p>
	</TD>
</tr>
</table>
<?
$isql ="select $descripcionSql , CODI_CARP from carpeta_per 
		where usua_codi=$codusuario and depe_codi='$dependencia' order by codi_carp  ";
	$rs = $db->conn->Execute($isql);
	print $rs->GetMenu2("borrcarpeta", "$borrcarpeta", "0:-- Seleccione la carpeta Personal--", false,"","onChange='procEst(formulario,18,$i )' class='select'"); 
	$row = array();
?>
	<br><br><input type=submit name='BorrarCarp' Value= 'Borrar Carpeta' class='botones'>
	<p>&nbsp;</p>
</form>
</body>
</html>
