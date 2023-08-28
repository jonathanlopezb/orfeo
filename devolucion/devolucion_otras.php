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
$ruta_raiz = "..";

/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */

if (!isset($_SESSION['dependencia']))
    include "$ruta_raiz/rec_session.php";
include_once($ruta_raiz . '/config.php');
if (!is_object($db)) {
    include_once($ruta_raiz . '/include/db/ConnectionHandler.php');
    $db = new ConnectionHandler("$ruta_raiz");
    //$db->conn->debug=true;
}
$dependencia = $_SESSION["dependencia"];
$usua_doc = $_SESSION["usua_doc"];
$codusuario = $_SESSION["codusuario"];
$usua_nomb = $_SESSION['usua_nomb'];
$depe_nomb = $_SESSION['depe_nomb'];

//Modificado Idr 29-abr-2008
//$formatfecha = "'". date('d-m-Y H:i:s')."' ,'dd-mm-yyyy hh24:mi:ss'";
$formatfecha = "'" . date('d-m-Y H:i:s') . "'";
$proc = "";
$procusfin = "";
$procusini = "";
$proccarp = "";
$procradi = "";
$nivus = "";
$check = 1;
$numeroa = 0;
$numero = 0;
$numeros = 0;
$numerot = 0;
$numerop = 0;
$numeroh = 0;
$checkValue = $_POST['checkValue'];

$encabezado = "" . session_name() . "=" . session_id() . "&krd=$krd&estado_sal=$estado_sal&filtroSelect=$filtroSelect&accion_sal=$accion_sal&dependencia=$dependencia&devolucion=$devolucion&orderTipo=$orderTipo&orderNo=";
if (isset($_POST['checkValue'])) {
    $hay_seleccionados = true;
    $num = count($checkValue);
    $i = 0;
    while ($i < $num) {
        $record_id = trim(key($checkValue));
        $radicados_dev .= $record_id . ",";
        $radicado_mat = preg_split("-", $record_id, 2);
        $radicados .= $radicado_mat[0] . ",";
        $tmp_hlp .= '(radi_nume_sal=\'' . $radicado_mat[0] . '\' and sgd_renv_codigo=' . $radicado_mat[1] . ') or ';
        next($checkValue);
        $i++;
    }
    reset($checkValue);
    unset($radicado_mat);
    $tmp_hlp = substr($tmp_hlp, 0, strlen($tmp_hlp) - 3);
    $radicados_dev = substr($radicados_dev, 0, strlen($radicados_dev) - 1);
} else
    $hay_seleccionados = false;
?>
<html>
    <head>
        <title>Enviar Datos</title>
        <link href="<?= $ruta_raiz . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<?= $ruta_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
    </head>
    <body>
        <table width=100% cellpadding="0" cellspacing="5" border="0">
            <tr>
                <td width=100%>
                    <br>
                    <?php
                    error_reporting(7);
                    if ($hay_seleccionados) {
                        ?>
                        <form name=formEnviar action='devolucion_otras.php?<?= session_name() . "=" . session_id() . "&krd=$krd" ?>' method='post'>
                            <?php
                            if (isset($_POST['enviardoc'])) {
                                /*
                                  Borra documentos Informados
                                 */
                                include "$ruta_raiz/include/query/devolucion/querydev_corresp_otras.php";
                                $isql = 'update sgd_renv_regenvio set sgd_renv_estado=9 where ' . $condicion;
                                $rs = $db->query($isql);

                                /*
                                  Inicio de Reasignacion de Documento
                                 */
                                if ($rad_recuperar) {
                                    $observa = devolver_rad($rad_recuperar, $krd) . " - " . $observa;
                                }
                                $proccarp = "Cerrado el Envio.";
                                $observa = $proccarp . " - " . $observa;
                                $proccarp = $observa;
                                /*
                                  Se construye el arreglo con los radicados seleccionados
                                 */
                                $num = count($checkValue);
                                $i = 0;
                                while ($i < $num) {
                                    $record_id = key($checkValue);
                                    $radicado_mat = preg_split("/[\s-]+/", $record_id);
                                    $record_id = $radicado_mat[0];
                                    $radicados_sel = $record_id;
                                    $chkt = $radicados_sel;

                                    //Modificado Idrd 29-abr-2008
                                    //$fecha_ini = mktime(00,00,00,substr($formatfecha,4,2),substr($formatfecha,1,2),substr($formatfecha,7,4));
                                    $record['HIST_FECH'] = $formatfecha;


                                    $record['DEPE_CODI'] = $dependencia;
                                    $record['USUA_CODI'] = $codusuario;
                                    $record['RADI_NUME_RADI'] = $chkt;
                                    $record['HIST_OBSE'] = "'" . $observa . "'";
                                    if ($codusdp)
                                        $record['USUA_CODI_DEST'] = $codusdp;
                                    $record['USUA_DOC'] = $usua_doc;
                                    $record['SGD_TTR_CODIGO'] = 8;

                                    if ($enviara == 21) {
                                        $us_ant_nombre = "<br>($chkt)" . devolver_rad($chkt, $krd);
                                    }
                                    $rs = $db->conn->Replace('hist_eventos', $record, array('RADI_NUME_RADI', 'HIST_FECH'), false);
                                    if ($rad_recuperar) {
                                        $record['RADI_NUME_RADI'] = $rad_recuperar;
                                        $rs = $db->conn->Replace('hist_eventos', $record, array('RADI_NUME_RADI', 'HIST_FECH'), false);
                                    }
                                    $radicado_mat = preg_split("-", $record_id, 2);
                                    $radicadosSel .= $radicado_mat[0] . ",";

                                    next($checkValue);
                                    $i++;
                                }
                                ?><br>

                                <?php
                                $nomostrar = "jhlc";
                            } else
                                include "../devolucion/paRealizar.php";
                            $sqlFecha = $db->conn->SQLDate("d-m-Y H:i A", "a.SGD_DEVE_FECH");
                            $iusuario = " and us_usuario='$krd'";
                            include $ruta_raiz . '/include/query/devolucion/querydev_corresp_otras.php';

                            //Modificado IDRD 29-abr-2008
                            $isql = 'select ' .
                                    $nombre . ' 	 	as  "DAT_Numero Radicado",
				    	' . $sqlFecha . '  	as "FECHA ENVIO",
				    	a.sgd_renv_observa 	as "OBSERVACIONES",
				    	a.sgd_renv_NOMBRE  	as "NOMBRE",
				    	a.sgd_renv_codigo   	as "HID_sgd_renv_codigo", ' .
                                    $nombre2 . ' 		as "CHK_CHKANULAR", ' .
                                    $nombre . ' 		as "HID_CHK_CHKANULAR"
				    from SGD_RENV_REGENVIO a
				    where
					' . $condicion . '';

                            $db->query($isql);
                            $imagen = "img_flecha_sort.gif";
                            $row = array();
                            if ($nomostrar != "jhlc") {
                                echo "<input type=hidden name=carpeta value=$carpeta>";
                                echo "<input type=hidden name=carpper value=$carpper>";
                                $ref = "cuerpo.php?carpeta=$carpeta&usua=$krde&order=";
                                ?>
                                <br>
                                <table border=0 width=100% class=t_bordeGris>
                                    <tr>
                                        <td bgcolor="White">
                                            <?php
                                            $db->conn->debug = false;
                                            $pager = new ADODB_Pager($db, $isql, 'adodb', true, $orderNo, $orderTipo, '..');
                                            $pager->toRefLinks = $linkPagina;
                                            $pager->toRefVars = $encabezado;
                                            $pager->checkAll = true;
                                            $pager->checkTitulo = false;
                                            $pager->Render($rows_per_page = 15, $linkPagina, $checkbox = chkEnviar);
                                            ?>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <?php
                            echo "<br/><span class=vinculos><center><a href='cuerpoDevCorreo.php?" . session_name() . "=" . session_id() . "&" . $encabezado . "'>Devolver a Listado</a></center></span>";
                        } else {
                            $procard = str_replace("999999999999999", "", $radicadosSel);
                            $procard = str_replace(",", "<br>", $procard);
                            ?>

                    <center>
                        <div id="titulo" style="width: 50%;" align="center">Acci&oacute;n requerida completada</div>
                        <table cellspacing="5" class="borde_tab" width="50%" border="1">
                            <TR><TD class=titulos2>Acci&oacute;n requerida</TD>
                                <TD class=listado2>
                                    <span class=leidos>
                                        <?php
                                        if ($enviara == 21) {
                                            echo "Devoluci&oacute;n";
                                        } else {
                                            echo "$proccarp";
                                        }
                                        ?>
                                    </span>
                                </TD></tr>
                            <tr><TD class=titulos2>Radicados involucrados</TD>
                                <TD class=listado2><span class=leidos><?= $procard ?></span>
                                </TD></tr>
                            <TR><TD class=titulos2>
                                    <?php
                                    $fecha = Date("Y-m-d") . "  " . Date("H:m:s");
                                    ?>
                                    Fecha y hora
                                </TD><TD class=listado2>
                                    <span class=leidos>
                                        <?= $fecha ?>
                                    </span>
                                </TD></TR>
                            <TR>
                                <TD width=30% class="titulos2">Usuario origen</td><td class="listado2" width="70%"><span class=leidos><?= $usua_nomb ?></span></TD>
                            </TR><tr><TD  width='30%' class="titulos2">Dependencia origen</td><td class="listado2"><span class=leidos><?= $depe_nomb ?></span></TD>
                            </TR>
                        </table>
                    </center>
                    <?php
                }
            } else {
                echo "No seleccion&oacute; registros.";
                echo "<br/><span class=vinculos><center><a href='cuerpoDevCorreo.php?" . session_name() . "=" . session_id() . "&" . $encabezado . "'>Devolver a Listado</a></center></span>";
            }
            ?>
    </body>
</html>
